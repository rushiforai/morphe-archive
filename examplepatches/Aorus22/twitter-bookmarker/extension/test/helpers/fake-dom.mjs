// A tiny, dependency-free DOM stand-in for the Phase 3 content-script tests.
//
// It implements exactly the surface the content modules use: element trees,
// attributes, text/`innerText`, inline styles, a small CSS-selector engine
// (tag / [attr] / [attr="v"] / [attr*="v"] / [attr^="v"] / [attr$="v"] /
// .class, with descendant and `>` combinators), bubbling + capturing events,
// and a `getComputedStyle` that reports `position: static` by default.
//
// It is intentionally NOT a browser: no layout, no sanitisation, no real
// NodeList identity. That is enough to exercise route/extractor/injector logic
// deterministically under `node --test`.

const ELEMENT_NODE = 1;
const TEXT_NODE = 3;
const DOCUMENT_NODE = 9;

const COMPOUND_RE = /([a-zA-Z][\w-]*)|\[([\w-]+)(?:(\*|\^|\$)?="([^"]*)")?\]|\.([\w-]+)/g;

function createStyle() {
  const store = Object.create(null);
  return new Proxy(store, {
    get(target, property) {
      if (property === "setProperty") {
        return (name, value) => {
          target[name] = String(value);
        };
      }
      if (property === "getPropertyValue") {
        return (name) => (name in target ? target[name] : "");
      }
      if (property === "removeProperty") {
        return (name) => {
          delete target[name];
        };
      }
      if (property === "cssText") {
        return Object.entries(target)
          .map(([name, value]) => `${name}: ${value}`)
          .join("; ");
      }
      return property in target ? target[property] : "";
    },
    set(target, property, value) {
      target[property] = String(value);
      return true;
    },
  });
}

class FakeTextNode {
  constructor(text) {
    this.nodeType = TEXT_NODE;
    this.nodeName = "#text";
    this._text = String(text);
    this.parentNode = null;
  }

  get textContent() {
    return this._text;
  }

  set textContent(value) {
    this._text = String(value);
  }

  get parentElement() {
    const parent = this.parentNode;
    return parent && parent.nodeType === ELEMENT_NODE ? parent : null;
  }

  get isConnected() {
    let node = this;
    while (node.parentNode) node = node.parentNode;
    return node.nodeType === DOCUMENT_NODE;
  }

  remove() {
    if (this.parentNode) this.parentNode.removeChild(this);
  }
}

/** One parsed compound selector (`tag[attr="v"].class`). */
function matchesCompound(element, selector) {
  if (element.nodeType !== ELEMENT_NODE) return false;

  let matched = false;
  COMPOUND_RE.lastIndex = 0;
  let match;
  while ((match = COMPOUND_RE.exec(selector)) !== null) {
    matched = true;

    if (match[1]) {
      if (element.tagName.toLowerCase() !== match[1].toLowerCase()) return false;
    } else if (match[2]) {
      const name = match[2].toLowerCase();
      if (!element.hasAttribute(name)) return false;
      const expected = match[4];
      if (expected !== undefined) {
        const actual = element.getAttribute(name) ?? "";
        const operator = match[3] ?? "=";
        if (operator === "=" && actual !== expected) return false;
        if (operator === "*" && !actual.includes(expected)) return false;
        if (operator === "^" && !actual.startsWith(expected)) return false;
        if (operator === "$" && !actual.endsWith(expected)) return false;
      }
    } else if (match[5]) {
      const classes = (element.getAttribute("class") ?? "").split(/\s+/);
      if (!classes.includes(match[5])) return false;
    }
  }
  return matched;
}

function tokenizeGroup(group) {
  const tokens = [];
  const re = /\s*(>)?\s*([^\s>]+)/g;
  let match;
  while ((match = re.exec(group)) !== null) {
    const selector = match[2];
    if (!selector) continue;
    const combinator = match[1] === ">" ? "child" : tokens.length === 0 ? "root" : "descendant";
    tokens.push({ combinator, selector });
  }
  return tokens;
}

function matchGroup(element, group) {
  const tokens = tokenizeGroup(group);
  if (tokens.length === 0) return false;

  let index = tokens.length - 1;
  if (!matchesCompound(element, tokens[index].selector)) return false;

  let current = element;
  index -= 1;
  while (index >= 0) {
    const combinator = tokens[index + 1].combinator;
    if (combinator === "child") {
      current = current.parentElement;
      if (!current || !matchesCompound(current, tokens[index].selector)) return false;
    } else {
      let ancestor = current.parentElement;
      while (ancestor && !matchesCompound(ancestor, tokens[index].selector)) ancestor = ancestor.parentElement;
      if (!ancestor) return false;
      current = ancestor;
    }
    index -= 1;
  }
  return true;
}

function matchesSelector(element, selector) {
  if (typeof selector !== "string" || selector.trim().length === 0) return false;
  return selector
    .split(",")
    .map((group) => group.trim())
    .filter(Boolean)
    .some((group) => matchGroup(element, group));
}

/** Build a minimal bubbling/capturing event. */
export function createEvent(type, properties = {}) {
  const event = {
    type,
    target: null,
    currentTarget: null,
    defaultPrevented: false,
    _stopped: false,
    _stoppedImmediate: false,
    ...properties,
  };
  event.preventDefault = () => {
    event.defaultPrevented = true;
  };
  event.stopPropagation = () => {
    event._stopped = true;
  };
  event.stopImmediatePropagation = () => {
    event._stopped = true;
    event._stoppedImmediate = true;
  };
  return event;
}

export class FakeElement {
  constructor(tagName, ownerDocument = null) {
    this.nodeType = ELEMENT_NODE;
    this.tagName = String(tagName).toUpperCase();
    this.nodeName = this.tagName;
    this.ownerDocument = ownerDocument;
    this.parentNode = null;
    this.childNodes = [];
    this._attributes = new Map();
    this._listeners = new Map();
    this._style = createStyle();
    this._innerText = null;
    this.hidden = false;
    this.disabled = false;
  }

  get parentElement() {
    const parent = this.parentNode;
    return parent && parent.nodeType === ELEMENT_NODE ? parent : null;
  }

  get children() {
    return this.childNodes.filter((node) => node.nodeType === ELEMENT_NODE);
  }

  get firstChild() {
    return this.childNodes[0] ?? null;
  }

  get nextElementSibling() {
    const parent = this.parentNode;
    if (!parent) return null;
    const siblings = parent.children;
    const index = siblings.indexOf(this);
    if (index < 0) return null;
    return siblings[index + 1] ?? null;
  }

  get previousElementSibling() {
    const parent = this.parentNode;
    if (!parent) return null;
    const siblings = parent.children;
    const index = siblings.indexOf(this);
    if (index <= 0) return null;
    return siblings[index - 1] ?? null;
  }

  get isConnected() {
    let node = this;
    while (node.parentNode) node = node.parentNode;
    return node === this.ownerDocument;
  }

  get id() {
    return this.getAttribute("id") ?? "";
  }

  set id(value) {
    this.setAttribute("id", String(value));
  }

  get className() {
    return this.getAttribute("class") ?? "";
  }

  set className(value) {
    this.setAttribute("class", String(value));
  }

  get style() {
    return this._style;
  }

  /* Attributes ------------------------------------------------------------ */

  setAttribute(name, value) {
    this._attributes.set(String(name).toLowerCase(), String(value));
  }

  getAttribute(name) {
    const value = this._attributes.get(String(name).toLowerCase());
    return value === undefined ? null : value;
  }

  hasAttribute(name) {
    return this._attributes.has(String(name).toLowerCase());
  }

  removeAttribute(name) {
    this._attributes.delete(String(name).toLowerCase());
  }

  getAttributeNames() {
    return [...this._attributes.keys()];
  }

  /* Text ------------------------------------------------------------------ */

  get textContent() {
    return this.childNodes.map((node) => node.textContent).join("");
  }

  set textContent(value) {
    this.replaceChildren();
    this._innerText = null;
    if (value !== null && value !== undefined && String(value) !== "") {
      this.appendChild(new FakeTextNode(value));
    }
  }

  get innerText() {
    return this._innerText !== null ? this._innerText : this.textContent;
  }

  set innerText(value) {
    this._innerText = String(value);
  }

  /* Tree ------------------------------------------------------------------ */

  appendChild(node) {
    if (!node) throw new TypeError("appendChild requires a node");
    if (node.parentNode) node.parentNode.removeChild(node);
    node.parentNode = this;
    this.childNodes.push(node);
    return node;
  }

  append(...nodes) {
    for (const node of nodes) {
      this.appendChild(typeof node === "string" ? new FakeTextNode(node) : node);
    }
  }

  insertBefore(node, reference) {
    if (node.parentNode) node.parentNode.removeChild(node);
    node.parentNode = this;
    const index = reference ? this.childNodes.indexOf(reference) : -1;
    if (index >= 0) this.childNodes.splice(index, 0, node);
    else this.childNodes.push(node);
    return node;
  }

  removeChild(node) {
    const index = this.childNodes.indexOf(node);
    if (index >= 0) {
      this.childNodes.splice(index, 1);
      node.parentNode = null;
    }
    return node;
  }

  remove() {
    if (this.parentNode) this.parentNode.removeChild(this);
  }

  replaceChildren(...nodes) {
    for (const child of [...this.childNodes]) this.removeChild(child);
    this.append(...nodes);
  }

  /* Queries --------------------------------------------------------------- */

  matches(selector) {
    return matchesSelector(this, selector);
  }

  closest(selector) {
    let node = this;
    while (node && node.nodeType === ELEMENT_NODE) {
      if (matchesSelector(node, selector)) return node;
      node = node.parentElement;
    }
    return null;
  }

  contains(node) {
    let current = node;
    while (current) {
      if (current === this) return true;
      current = current.parentNode;
    }
    return false;
  }

  querySelector(selector) {
    return this.querySelectorAll(selector)[0] ?? null;
  }

  querySelectorAll(selector) {
    const out = [];
    const visit = (node) => {
      for (const child of node.childNodes) {
        if (child.nodeType !== ELEMENT_NODE) continue;
        if (matchesSelector(child, selector)) out.push(child);
        visit(child);
      }
    };
    visit(this);
    return out;
  }

  /* Events ---------------------------------------------------------------- */

  addEventListener(type, listener, options) {
    if (typeof listener !== "function") return;
    const capture = options === true || (options && options.capture === true);
    let entry = this._listeners.get(type);
    if (!entry) {
      entry = { capture: [], bubble: [] };
      this._listeners.set(type, entry);
    }
    const bucket = capture ? entry.capture : entry.bubble;
    if (!bucket.includes(listener)) bucket.push(listener);
  }

  removeEventListener(type, listener, options) {
    const capture = options === true || (options && options.capture === true);
    const entry = this._listeners.get(type);
    if (!entry) return;
    const bucket = capture ? entry.capture : entry.bubble;
    const index = bucket.indexOf(listener);
    if (index >= 0) bucket.splice(index, 1);
  }

  listenerCount(type, capture = false) {
    const entry = this._listeners.get(type);
    if (!entry) return 0;
    return (capture ? entry.capture : entry.bubble).length;
  }

  _invoke(type, event, capture) {
    const entry = this._listeners.get(type);
    if (!entry) return;
    const bucket = capture ? entry.capture : entry.bubble;
    for (const listener of [...bucket]) {
      if (event._stoppedImmediate) break;
      event.currentTarget = this;
      listener.call(this, event);
    }
  }

  dispatchEvent(event) {
    if (!event || typeof event.type !== "string") {
      throw new TypeError("dispatchEvent requires an event with a type");
    }

    event.target = this;
    const path = [];
    let node = this;
    while (node) {
      path.push(node);
      node = node.parentNode;
    }
    if (this.ownerDocument && !path.includes(this.ownerDocument)) path.push(this.ownerDocument);

    for (const current of [...path].reverse()) {
      if (event._stopped) break;
      current._invoke?.(event.type, event, true);
    }
    if (!event._stopped) {
      for (const current of path) {
        if (event._stopped) break;
        current._invoke?.(event.type, event, false);
      }
    }
    return !event.defaultPrevented;
  }

  click() {
    return this.dispatchEvent(createEvent("click"));
  }
}

export class FakeDocument extends FakeElement {
  constructor() {
    super("#document", null);
    this.nodeType = DOCUMENT_NODE;
    this.tagName = "#DOCUMENT";
    this.nodeName = "#DOCUMENT";
    this.ownerDocument = this;

    this.documentElement = new FakeElement("html", this);
    this.body = new FakeElement("body", this);
    this.documentElement.appendChild(this.body);
    this.appendChild(this.documentElement);

    this._view = {
      getComputedStyle: (element) => ({
        position: element?._style?.position || "static",
      }),
      setTimeout: (handler, timeout) => globalThis.setTimeout(handler, timeout),
      clearTimeout: (id) => globalThis.clearTimeout(id),
    };
  }

  get defaultView() {
    return this._view;
  }

  createElement(tagName) {
    return new FakeElement(tagName, this);
  }

  createTextNode(text) {
    return new FakeTextNode(text);
  }
}

/** Create an empty document with `html > body`. */
export function createDocument() {
  return new FakeDocument();
}

export { ELEMENT_NODE, TEXT_NODE, DOCUMENT_NODE };
