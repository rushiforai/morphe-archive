/**
 * Hardening guards for the bookmarks-page lifecycle (PRD §64, §54; TEST-05).
 *
 * Phase 3–5 already contain the load-bearing behavior (one observer, marker
 * before injection, debounced sweep, per-article try/catch). This module adds
 * only the guarantees those paths still lacked:
 *
 *  1. {@link createResilientObserver} — wraps the single page
 *     `MutationObserver` so a throw inside the callback cannot permanently kill
 *     observation: the throw is contained, the observed targets are re-armed,
 *     and a reschedule hook re-examines the DOM for mutations that were in
 *     flight when the callback aborted.
 *  2. {@link createSavedIndexRefresher} — fetches the derived saved index at
 *     most once per "backend became available" transition. A failed entry
 *     fetch leaves the index *stale*, so a later retry (route re-entry or the
 *     first confirmed save after a backend restart) re-fetches exactly once
 *     instead of issuing a `GET /v1/index` per tweet (PRD §54).
 *  3. {@link runBoundedCleanup} — the route-leave teardown: one synchronous
 *     pass that attempts *every* step (observer disconnect, timer cancel, root
 *     removal, toast dismissal) and reports per-step failures instead of
 *     aborting on the first throw.
 *
 * Everything here is dependency-injected and dependency-free, so the fake DOM
 * under `node --test` exercises the exact code the browser runs.
 */

/** Minimal observer surface shared with the page lifecycle. */
export interface ObserverLike {
  /** Start watching `target` for `options`. */
  observe(target: Node, options: MutationObserverInit): void;
  /** Stop watching every target. */
  disconnect(): void;
}

/** Receives a contained error. Must never throw. */
export type ErrorSink = (error: unknown) => void;

/** Report `error` to `sink`, swallowing any throw from the sink itself. */
function report(error: unknown, sink: ErrorSink | undefined): void {
  if (sink === undefined) return;
  try {
    sink(error);
  } catch {
    /* An error sink must never throw back into the guarded path. */
  }
}

/* -------------------------------------------------------------------------- */
/* 1. Resilient mutation observation                                           */
/* -------------------------------------------------------------------------- */

/** Options for {@link createResilientMutationCallback}. */
export interface ResilientMutationOptions {
  /** Receives any error the mutation callback throws. */
  onError?: ErrorSink;
  /**
   * Invoked after a contained throw, so the lifecycle can re-sweep the DOM for
   * mutations that arrived while the callback was aborting.
   */
  onReschedule?: () => void;
}

/**
 * Wrap a mutation callback so it can never throw to the platform. On a throw,
 * `onError` receives the error and `onReschedule` is invoked once, which lets
 * the page re-scan instead of silently dropping the record set.
 */
export function createResilientMutationCallback(
  handler: (records: MutationRecord[]) => void,
  options: ResilientMutationOptions = {},
): (records: MutationRecord[]) => void {
  return (records: MutationRecord[]): void => {
    try {
      handler(records);
    } catch (error) {
      report(error, options.onError);
      try {
        options.onReschedule?.();
      } catch (rescheduleError) {
        report(rescheduleError, options.onError);
      }
    }
  };
}

/** Dependencies for {@link createResilientObserver}. */
export interface ResilientObserverDeps {
  /** Builds the platform observer around the already-guarded callback. */
  createObserver: (callback: (records: MutationRecord[]) => void) => ObserverLike;
  /** The real per-mutation handler. */
  handler: (records: MutationRecord[]) => void;
  /** Receives callback failures and re-arm failures. */
  onError?: ErrorSink;
  /** Called after every contained callback failure, to reschedule a sweep. */
  onReschedule?: () => void;
}

/** A {@link ObserverLike} that survives a throwing callback. */
export interface ResilientObserver extends ObserverLike {
  /** Disconnect and re-observe every recorded target (called after a throw). */
  rearm(): void;
  /** True once at least one callback throw has been contained. */
  hasFailed(): boolean;
}

/**
 * Build the single page observer with observation-preserving error handling.
 *
 * Targets are remembered so {@link ResilientObserver.rearm} can restore
 * observation after a callback throw, and the reschedule hook re-sweeps the DOM
 * to cover the record set the aborted callback did not finish.
 */
export function createResilientObserver(deps: ResilientObserverDeps): ResilientObserver {
  const targets = new Map<Node, MutationObserverInit>();
  let observer: ObserverLike | null = null;
  let failed = false;
  let stopped = false;

  const observeAll = (): void => {
    if (observer === null) return;
    for (const [target, options] of targets) observer.observe(target, options);
  };

  const rearm = (): void => {
    if (stopped || observer === null) return;
    // A disconnect/re-observe cycle guarantees a registration even if the
    // platform dropped it when the callback threw; the reschedule sweep below
    // compensates for any record lost in the gap.
    try {
      observer.disconnect();
    } catch (error) {
      report(error, deps.onError);
    }
    try {
      observeAll();
    } catch (error) {
      report(error, deps.onError);
    }
  };

  const callback = createResilientMutationCallback((records) => deps.handler(records), {
    onError: (error) => {
      failed = true;
      report(error, deps.onError);
    },
    onReschedule: () => {
      rearm();
      try {
        deps.onReschedule?.();
      } catch (error) {
        report(error, deps.onError);
      }
    },
  });

  observer = deps.createObserver(callback);

  return {
    observe(target: Node, options: MutationObserverInit): void {
      targets.set(target, options);
      if (observer === null) return;
      try {
        observer.observe(target, options);
      } catch (error) {
        report(error, deps.onError);
      }
    },
    disconnect(): void {
      stopped = true;
      if (observer === null) return;
      try {
        observer.disconnect();
      } catch (error) {
        report(error, deps.onError);
      }
    },
    rearm,
    hasFailed: () => failed,
  };
}

/* -------------------------------------------------------------------------- */
/* 2. Saved-index refresh                                                      */
/* -------------------------------------------------------------------------- */

/** Options for {@link createSavedIndexRefresher}. */
export interface SavedIndexRefresherOptions {
  /**
   * Performs the one index fetch. It must **reject** when the index is
   * unavailable; that is what keeps the refresher stale for a later retry.
   */
  load: () => Promise<ReadonlySet<string>>;
  /** Applies a successfully fetched index to the live page state. */
  apply: (savedIds: ReadonlySet<string>) => void;
  /** Receives fetch/apply failures. */
  onError?: ErrorSink;
}

/** A once-per-transition saved-index fetch. */
export interface SavedIndexRefresher {
  /**
   * Fetch + apply unless the index is already fresh or a fetch is in flight
   * (concurrent callers share one request). Resolves `true` when a fetch ran.
   */
  refreshIfStale(): Promise<boolean>;
  /** Mark the cached index stale; the next {@link refreshIfStale} re-fetches. */
  markStale(): void;
  /** True while no fetch has succeeded for the current page entry. */
  isStale(): boolean;
  /** True while a fetch is in flight. */
  isRefreshing(): boolean;
}

/**
 * Build a coalescing saved-index refresher. The index starts stale, so a route
 * entry fetches once; a failed fetch leaves it stale, so the next explicit
 * retry (backend confirmed available) fetches again — never per tweet.
 */
export function createSavedIndexRefresher(options: SavedIndexRefresherOptions): SavedIndexRefresher {
  let stale = true;
  let inFlight: Promise<boolean> | null = null;

  const fetchOnce = async (): Promise<boolean> => {
    try {
      const savedIds = await options.load();
      options.apply(savedIds);
      stale = false;
      return true;
    } catch (error) {
      stale = true;
      report(error, options.onError);
      return false;
    } finally {
      inFlight = null;
    }
  };

  return {
    refreshIfStale(): Promise<boolean> {
      if (!stale) return Promise.resolve(false);
      if (inFlight !== null) return inFlight;
      const request = fetchOnce();
      inFlight = request;
      return request;
    },
    markStale(): void {
      stale = true;
    },
    isStale: () => stale,
    isRefreshing: () => inFlight !== null,
  };
}

/* -------------------------------------------------------------------------- */
/* 3. Bounded route-leave cleanup                                              */
/* -------------------------------------------------------------------------- */

/** One named teardown action. */
export interface CleanupStep {
  /** Stable name used in the report and in warning logs. */
  name: string;
  /** The teardown action; may throw. */
  run: () => void;
}

/** Outcome of one {@link runBoundedCleanup} pass. */
export interface CleanupReport {
  /** Every step name, in execution order (each one was attempted). */
  attempted: string[];
  /** Steps whose action threw. */
  failures: Array<{ name: string; error: unknown }>;
}

/**
 * Run every cleanup step in order, exactly once, in a single synchronous pass.
 *
 * A throwing step is recorded and skipped — it never prevents the remaining
 * steps from running, so the observer, timers, injected roots and toasts are
 * all guaranteed a removal attempt on route leave.
 */
export function runBoundedCleanup(steps: readonly CleanupStep[], onError?: ErrorSink): CleanupReport {
  const attempted: string[] = [];
  const failures: Array<{ name: string; error: unknown }> = [];

  for (const step of steps) {
    attempted.push(step.name);
    try {
      step.run();
    } catch (error) {
      failures.push({ name: step.name, error });
      report(error, onError);
    }
  }

  return { attempted, failures };
}
