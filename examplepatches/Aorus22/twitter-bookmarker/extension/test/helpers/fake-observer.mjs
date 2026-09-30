// A structural `MutationObserver` stand-in for the Phase 5 tests.
//
// The fake DOM has no `MutationObserver`, and the real one would couple the
// tests to real mutation timing. This factory records the registered callback
// and every observed target, and lets a test trigger verification on demand.

/**
 * @returns {{
 *   create: (callback: () => void) => object,
 *   observers: object[],
 *   triggerAll: () => void,
 * }}
 */
export function createFakeObserverFactory() {
  const observers = [];

  function create(callback) {
    const observer = {
      callback,
      observes: [],
      disconnected: false,
      observe(target, options) {
        this.observes.push([target, options]);
      },
      disconnect() {
        this.disconnected = true;
      },
      trigger() {
        if (!this.disconnected) callback();
      },
    };
    observers.push(observer);
    return observer;
  }

  function triggerAll() {
    for (const observer of observers) observer.trigger();
  }

  return { create, observers, triggerAll };
}
