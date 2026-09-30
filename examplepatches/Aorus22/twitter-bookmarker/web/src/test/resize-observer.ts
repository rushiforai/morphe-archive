/**
 * Controllable `ResizeObserver` stub for jsdom.
 *
 * jsdom has no layout engine, so it never fires a real `ResizeObserver` — which
 * means a hook whose whole job is to *re-measure on resize* cannot be tested at
 * all against the inert stub that used to live in `setup.ts`. This one records
 * every observer and the targets it observes, and lets a test fire a synthetic
 * resize through {@link MockResizeObserver.emit} after changing a mocked
 * `clientWidth`.
 *
 * That is how the responsive-masonry regression is pinned: the observed element
 * must be one whose width actually changes when the layout grows.
 *
 * Installed globally by `src/test/setup.ts` and reset between tests. This module
 * is *not* a test file — `vitest.config.ts` only collects `src/**\/*.test.{ts,tsx}`.
 */

type ResizeCallback = (
  entries: ResizeObserverEntry[],
  observer: ResizeObserver
) => void

function makeEntry(target: Element): ResizeObserverEntry {
  const rect = target.getBoundingClientRect()
  return {
    target,
    contentRect: rect,
    borderBoxSize: [{ inlineSize: rect.width, blockSize: rect.height }],
    contentBoxSize: [{ inlineSize: rect.width, blockSize: rect.height }],
    devicePixelContentBoxSize: [
      { inlineSize: rect.width, blockSize: rect.height },
    ],
  } as unknown as ResizeObserverEntry
}

export class MockResizeObserver {
  /** Every observer constructed since the last reset. */
  static instances: MockResizeObserver[] = []

  /** The most recently constructed observer (what the mounted hook owns). */
  static latest(): MockResizeObserver | undefined {
    return MockResizeObserver.instances.at(-1)
  }

  /** Drop the registry so one test's observers cannot leak into the next. */
  static reset(): void {
    MockResizeObserver.instances = []
  }

  private readonly callback: ResizeCallback
  private readonly targets = new Set<Element>()

  constructor(callback: ResizeCallback) {
    this.callback = callback
    MockResizeObserver.instances.push(this)
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

  takeRecords(): ResizeObserverEntry[] {
    return []
  }

  /** The elements this observer is watching (empty after a disconnect). */
  get observedTargets(): Element[] {
    return [...this.targets]
  }

  /**
   * Test-only: deliver a synthetic resize for every observed target. A no-op
   * when nothing is observed, mirroring a disconnected observer.
   */
  emit(): void {
    const entries = [...this.targets].map(makeEntry)
    if (entries.length === 0) {
      return
    }
    this.callback(entries, this as unknown as ResizeObserver)
  }
}

/** Install the stub as the global `ResizeObserver`. */
export function installResizeObserver(): void {
  globalThis.ResizeObserver =
    MockResizeObserver as unknown as typeof ResizeObserver
}

/** Clear the observer registry between tests. */
export function resetResizeObservers(): void {
  MockResizeObserver.reset()
}
