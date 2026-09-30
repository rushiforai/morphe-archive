// Toast system tests (SAVE-07, PRD §42).
//
// The presenter is driven against the fake DOM with fake timers so stacking,
// auto-dismiss, click-dismiss, and the pointer-events/aria contract are provable.

import test from "node:test";
import assert from "node:assert/strict";

import {
  TOAST_ATTRIBUTE,
  TOAST_DISMISS_MS,
  TOAST_KIND_ATTRIBUTE,
  TOAST_ROOT_ATTRIBUTE,
  TOAST_STATES,
  TOAST_STATE_ATTRIBUTE,
  createToastPresenter,
  showToast,
  toastStateFor,
} from "../src/content/toast.ts";
import { createDocument } from "./helpers/fake-dom.mjs";

function createTimers() {
  let nextId = 1;
  const pending = new Map();
  return {
    setTimeout(handler, timeout) {
      const id = nextId;
      nextId += 1;
      pending.set(id, { handler, timeout });
      return id;
    },
    clearTimeout(id) {
      pending.delete(id);
    },
    count: () => pending.size,
    fireAll() {
      const entries = [...pending.values()];
      pending.clear();
      for (const entry of entries) entry.handler();
    },
    timeouts: () => [...pending.values()].map((entry) => entry.timeout),
  };
}

function harness() {
  const doc = createDocument();
  const timers = createTimers();
  const presenter = createToastPresenter({
    document: doc,
    setTimeout: timers.setTimeout,
    clearTimeout: timers.clearTimeout,
  });
  return { doc, timers, presenter };
}

const toastsIn = (scope) => scope.querySelectorAll(`[${TOAST_ATTRIBUTE}]`);

test("every kind maps to a distinct, complete state (SAVE-07)", () => {
  const kinds = ["success", "error", "warning", "info"];
  assert.deepEqual(Object.keys(TOAST_STATES).sort(), [...kinds].sort());

  const borders = new Set();
  for (const kind of kinds) {
    const state = toastStateFor(kind);
    assert.equal(state.state, kind, "the logical state mirrors the kind");
    assert.ok(state.role.length > 0, "each state has an accessible role");
    assert.match(state.border, /^#[0-9a-f]{6}$/i);
    borders.add(state.border);
  }
  assert.equal(borders.size, kinds.length, "each kind has a distinct accent colour");
});

test("a shown toast carries the kind/state attributes, message, and styling (SAVE-07)", () => {
  const { doc, presenter } = harness();
  const element = presenter.show("success", "Saved to Linux");

  assert.ok(element);
  const root = doc.body.querySelector(`[${TOAST_ROOT_ATTRIBUTE}]`);
  assert.ok(root, "the fixed container is mounted on body");
  assert.equal(root.getAttribute("aria-live"), "polite");
  assert.equal(root.style.position, "fixed");
  assert.equal(root.style.zIndex, "2147483647");
  assert.equal(root.style.pointerEvents, "none", "the container never captures page clicks");

  assert.equal(element.getAttribute(TOAST_KIND_ATTRIBUTE), "success");
  assert.equal(element.getAttribute(TOAST_STATE_ATTRIBUTE), "success");
  assert.equal(element.getAttribute("role"), "status");
  assert.equal(element.textContent, "Saved to Linux");
  assert.equal(element.style.pointerEvents, "auto", "only the toast itself is clickable");
});

test("each kind renders its mapped state", () => {
  const { doc, presenter } = harness();
  presenter.show("success", "s");
  presenter.show("error", "e");
  presenter.show("warning", "w");
  presenter.show("info", "i");

  const states = toastsIn(doc).map((toast) => toast.getAttribute(TOAST_STATE_ATTRIBUTE));
  assert.deepEqual(states, ["success", "error", "warning", "info"]);
  assert.equal(toastsIn(doc).length, 4, "toasts stack");
});

test("toasts auto-dismiss after ~3.5s and the container is removed with the last one", () => {
  const { doc, timers, presenter } = harness();
  assert.ok(TOAST_DISMISS_MS >= 3000 && TOAST_DISMISS_MS <= 4000, "a few seconds, not milliseconds");

  presenter.show("info", "one");
  presenter.show("info", "two");
  assert.deepEqual(timers.timeouts(), [TOAST_DISMISS_MS, TOAST_DISMISS_MS]);

  timers.fireAll();
  assert.equal(toastsIn(doc).length, 0);
  assert.equal(doc.body.querySelector(`[${TOAST_ROOT_ATTRIBUTE}]`), null);
});

test("a click dismisses a toast immediately and cancels its auto-dismiss timer", () => {
  const { doc, timers, presenter } = harness();
  const element = presenter.show("error", "Backend unavailable");
  assert.equal(timers.count(), 1);

  element.click();

  assert.equal(toastsIn(doc).length, 0);
  assert.equal(timers.count(), 0, "no timer is left behind");
  assert.equal(doc.body.querySelector(`[${TOAST_ROOT_ATTRIBUTE}]`), null);
});

test("dismissing one toast keeps the others", () => {
  const { doc, presenter } = harness();
  const first = presenter.show("warning", "warn");
  const second = presenter.show("success", "Saved to Linux");

  first.click();

  assert.deepEqual(toastsIn(doc), [second]);
  assert.equal(second.textContent, "Saved to Linux");
});

test("dismissAll clears every toast", () => {
  const { doc, presenter } = harness();
  presenter.show("success", "a");
  presenter.show("error", "b");
  presenter.dismissAll();

  assert.equal(toastsIn(doc).length, 0);
  assert.equal(doc.body.querySelector(`[${TOAST_ROOT_ATTRIBUTE}]`), null);
});

test("showToast is a safe no-op when there is no DOM (module-level default presenter)", () => {
  assert.equal(typeof globalThis.document, "undefined");
  assert.equal(showToast("info", "nothing to mount into"), null);
});
