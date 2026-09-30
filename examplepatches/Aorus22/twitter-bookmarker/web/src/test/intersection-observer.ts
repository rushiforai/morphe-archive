/**
 * Controllable `IntersectionObserver` stub for jsdom (Phase 7).
 *
 * jsdom has no layout engine and no `IntersectionObserver`, so infinite scroll
 * cannot be exercised without one. This stub records every observer, tracks the
 * targets it was asked to observe, exposes the resolved `rootMargin`, and lets a
 * test fire a synthetic intersection through {@link MockIntersectionObserver.emit}.
 *
 * It is installed globally by `src/test/setup.ts` (unconditionally, so the suite
 * is deterministic even if a future jsdom ships a real implementation) and its
 * registry is reset between tests. This module is *not* a test file —
 * `vitest.config.ts` only collects `src/**\/*.test.{ts,tsx}`.
 */

type ObserverCallback = (
  entries: IntersectionObserverEntry[],
  observer: IntersectionObserver
) => void

function makeEntry(
  target: Element,
  isIntersecting: boolean
): IntersectionObserverEntry {
  const rect = target.getBoundingClientRect()
  return {
    target,
    isIntersecting,
    intersectionRatio: isIntersecting ? 1 : 0,
    boundingClientRect: rect,
    intersectionRect: rect,
    rootBounds: null,
    time: 0,
  } as IntersectionObserverEntry
}

export class MockIntersectionObserver {
  /** Every observer constructed since the last {@link reset}. */
  static instances: MockIntersectionObserver[] = []

  /** The most recently constructed observer (what the current sentinel owns). */
  static latest(): MockIntersectionObserver | undefined {
    return MockIntersectionObserver.instances.at(-1)
  }

  /** Drop the registry so one test's observers cannot leak into the next. */
  static reset(): void {
    MockIntersectionObserver.instances = []
  }

  readonly root: Element | Document | null
  readonly rootMargin: string
  readonly thresholds: ReadonlyArray<number>
  private readonly callback: ObserverCallback
  private readonly targets = new Set<Element>()

  constructor(callback: ObserverCallback, options?: IntersectionObserverInit) {
    this.callback = callback
    this.root = options?.root ?? null
    this.rootMargin = options?.rootMargin ?? "0px"
    this.thresholds = options?.threshold
      ? Array.isArray(options.threshold)
        ? options.threshold
        : [options.threshold]
      : [0]
    MockIntersectionObserver.instances.push(this)
  }

  observe(target: Element): void {
    this.targets.add(target)
  }

  unobserve(target: Element): void {
    this.targets.delete(target)
  }

  disconnect(): void {
    this.targets.clear()
  }

  takeRecords(): IntersectionObserverEntry[] {
    return []
  }

  /** How many targets are currently observed (0 after a disconnect). */
  get observedCount(): number {
    return this.targets.size
  }

  /**
   * Test-only: deliver a synthetic intersection for every observed target.
   * No-op when nothing is observed, mirroring a disconnected observer.
   */
  emit(isIntersecting = true): void {
    const entries = [...this.targets].map((target) =>
      makeEntry(target, isIntersecting)
    )
    if (entries.length === 0) {
      return
    }
    this.callback(entries, this as unknown as IntersectionObserver)
  }
}

/** Install the stub as the global `IntersectionObserver`. */
export function installIntersectionObserver(): void {
  globalThis.IntersectionObserver =
    MockIntersectionObserver as unknown as typeof IntersectionObserver
}

/** Clear the observer registry between tests. */
export function resetIntersectionObservers(): void {
  MockIntersectionObserver.reset()
}
