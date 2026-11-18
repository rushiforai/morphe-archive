const assert = require("node:assert/strict");
const { readFileSync } = require("node:fs");
const test = require("node:test");
const vm = require("node:vm");
const { execFileSync } = require("node:child_process");
const { createHash } = require("node:crypto");

let bundledAuth;
let bundledStorage;
if (process.env.ORIGINAL_APK) {
  const bundle = execFileSync("python3", ["-c",
    "import sys,zipfile; sys.stdout.buffer.write(zipfile.ZipFile(sys.argv[1]).read('assets/plugin/features/feature_login_page/feature_login_page/index.android.bundle'))",
    process.env.ORIGINAL_APK], { maxBuffer: 8 * 1024 * 1024 }).toString();
  const profiles = {
    "5b0b4f7c18a015ed3b1926b141d637f611a33ee4d56e51395b90dee064facef2": [628, 556],
  };
  const profile = profiles[createHash("sha256").update(bundle).digest("hex")];
  assert.ok(profile, "Tests require an original fingerprinted login bundle");
  const registrations = new Map();
  for (const [line] of bundle.matchAll(/^__d\(function[\s\S]*?(?=^__d\(function|^__r\(48\);)/gm)) {
    vm.runInNewContext(line, { __d(factory, id, dependencies) {
      assert.equal(registrations.has(id), false, "Metro module IDs must be unique");
      registrations.set(id, { factory, dependencies, source: line });
    } });
  }
  assert.equal((bundle.match(/o\.AppRegistry\.registerComponent\('LoginPage',function\(\)\{return t\}\)/g) || []).length, 1);
  assert.equal(bundle.split("__r(48);\n__r(0);").length, 2);
  assert.equal(registrations.has(90001), false);
  assert.match(registrations.get(152).source, /m\.exports=r\(d\[0\]\)/);
  assert.match(registrations.get(1).source, /get View\(\)/);
  bundledAuth = registrations.get(profile[0]);
  bundledStorage = registrations.get(profile[1]);
  assert.ok(bundledAuth && bundledStorage);
  assert.match(bundledStorage.source, /e\.RRStorage=/);
  assert.match(bundledStorage.source, /getItemAsync/);
  assert.match(bundledStorage.source, /setItemAsync/);
}

function authFromBundle(nativeAuth) {
  if (!bundledAuth) return { default: nativeAuth };
  const exports = {};
  bundledAuth.factory(null, (id) => {
    assert.equal(id, 1);
    return { TurboModuleRegistry: { get(name) {
      assert.equal(name, "RRAuthTurboModule");
      return nativeAuth;
    } } };
  }, null, null, { exports }, exports, bundledAuth.dependencies);
  assert.equal(exports.default, nativeAuth);
  return exports;
}


function account() {
  return {
    uid: 123456789,
    rruid: "rrls-0123456789abcdef0123",
    token: "rr0123456789abcdef0123456789abcdef",
    country: "NO",
    countrycode: "47",
    rriot: {
      u: "0123456789abcdef012345",
      s: "0123456789ab",
      h: "0123456789abcdef0123456789abcdef",
      k: "abcdef0123456789abcdef0123456789",
      r: { r: "EU", a: "https://robot.example.com:555", m: "ssl://robot.example.com:8881", l: "https://robot.example.com:555" },
    },
  };
}

function harness(overrides = {}) {
  const handoffs = [];
  const stored = [];
  const requests = [];
  const states = [];
  let hook = 0;
  const React = {
    Fragment: "Fragment",
    createElement(type, props, ...children) { return { type, props: props || {}, children }; },
    useState(initial) {
      const index = hook++;
      states[index] = overrides.state ? overrides.state[index] : initial;
      return [states[index], (value) => { states[index] = value; }];
    },
    useEffect() {},
    useRef(value) { return { current: value }; },
  };
  const RN = Object.fromEntries(["View", "Text", "Image", "TextInput", "TouchableOpacity", "Modal", "KeyboardAvoidingView", "ScrollView"].map((name) => [name, name]));
  RN.StyleSheet = { create: (styles) => styles };
  RN.Keyboard = { dismiss() {} };
  RN.Alert = { alert() {} };
  const Auth = {
    async loginSuccess(user, server) {
      handoffs.push({ user: JSON.parse(user), server });
      if (overrides.nativeFailure) throw new Error("native failure");
    },
  };
  const storage = {
    async setItemAsync(key, value) { stored.push({ key, value: JSON.parse(value) }); },
  };
  const modules = {
    react: React, "react-native": RN, auth: authFromBundle(Auth),
    theme: { useThemeStore: (select) => select({ theme: { colors: { text: { level1: "#fff", level2: "#eee", level3: "#999", level4: "#444" }, system: { basic: { primary: "#0A84FF", error: "#FF453A" }, background: { modal: "#1E1E1E" } } }, textStyle: { contentMedium: {}, titleLevel2: {} } } }) },
    storage: { RRStorage: function () { return storage; } },
  };
  const sandbox = {
    module: { exports: {} }, require: (name) => modules[name],
    setTimeout: overrides.setTimeout || setTimeout, clearTimeout,
    AbortController,
    fetch: async (url, options) => {
      requests.push({ url, options });
      if (overrides.fetch) return overrides.fetch(url, options);
      return { ok: true, status: 200, json: async () => ({ code: 200, data: account() }) };
    },
  };
  vm.runInNewContext(readFileSync("patches/build/generated-resources/local-server.runtime.js", "utf8"), sandbox);
  return { api: sandbox.module.exports, handoffs, requests, stored, states };
}

test("a local session is submitted once and handed to the native bridge with protocol field names", async () => {
  const h = harness();
  let pinCleared = false;
  await h.api.login(" https://robot.example.com:555/ ", " local@example.com ", "123456", () => { pinCleared = true; });
  assert.equal(h.requests.length, 1);
  assert.equal(h.requests[0].url, "https://robot.example.com:555/api/v5/auth/email/login/code");
  assert.deepEqual(JSON.parse(h.requests[0].options.body), { email: "local@example.com", code: "123456" });
  assert.equal(h.handoffs.length, 1);
  assert.equal(h.handoffs[0].server, "https://robot.example.com:555");
  assert.equal(h.handoffs[0].user.country, "NO");
  assert.equal(h.handoffs[0].user.countrycode, "47");
  assert.equal(h.handoffs[0].user.region, "EU");
  assert.deepEqual(h.handoffs[0].user.rriot, account().rriot);
  assert.equal(pinCleared, true);
});

test("invalid addresses and credentials are rejected before sending the PIN", async () => {
  const h = harness();
  for (const server of ["http://robot.example.com", "https://user:password@robot.example.com", "https://robot.example.com/path", "https://robot.example.com?token=123", "https://robot.example.com:0", "https://robot.example.com:65536"]) {
    await assert.rejects(h.api.login(server, "local@example.com", "123456", () => {}), /HTTPS server address/);
  }
  await assert.rejects(h.api.login("https://robot.example.com", "invalid", "123456", () => {}), /email configured/);
  await assert.rejects(h.api.login("https://robot.example.com", "local@example.com", "12345", () => {}), /six-digit PIN/);
  assert.equal(h.requests.length, 0);
  assert.equal(h.handoffs.length, 0);
});

test("a rejected PIN is shown as a login error and never reaches native account storage", async () => {
  const h = harness({ fetch: async () => ({ ok: false, status: 401, json: async () => ({ code: 401, data: { reason: "invalid_login_pin" } }) }) });
  await assert.rejects(h.api.login("https://robot.example.com", "local@example.com", "123456", () => {}), /rejected the email or PIN/);
  assert.equal(h.handoffs.length, 0);
});

test("an incomplete session is rejected before the native handoff", async () => {
  const data = account();
  delete data.rriot.k;
  const h = harness({ fetch: async () => ({ ok: true, status: 200, json: async () => ({ code: 200, data }) }) });
  await assert.rejects(h.api.login("https://robot.example.com", "local@example.com", "123456", () => {}), /incomplete IoT credentials/);
  assert.equal(h.handoffs.length, 0);
});

test("unreadable or null responses produce useful errors", async () => {
  for (const body of [null, "not JSON"]) {
    const h = harness({ fetch: async () => ({ ok: true, status: 200, json: async () => {
      if (body === "not JSON") throw new SyntaxError("invalid JSON");
      return body;
    } }) });
    await assert.rejects(h.api.login("https://robot.example.com", "local@example.com", "123456", () => {}), /local server response|login was rejected/);
    assert.equal(h.handoffs.length, 0);
  }
});

test("a stalled server request is aborted with a timeout message", async () => {
  const h = harness({
    setTimeout(callback) { return setTimeout(callback, 1); },
    fetch: (_url, options) => new Promise((_resolve, reject) => {
      options.signal.addEventListener("abort", () => { const error = new Error("aborted"); error.name = "AbortError"; reject(error); });
    }),
  });
  await assert.rejects(h.api.login("https://robot.example.com", "local@example.com", "123456", () => {}), /within 15 seconds/);
});

test("native post-login failure is reported after the server accepts the session", async () => {
  const h = harness({ nativeFailure: true });
  await assert.rejects(h.api.login("https://robot.example.com", "local@example.com", "123456", () => {}), /could not finish opening the account/);
});

function descendants(node) {
  if (!node || typeof node !== "object") return [];
  return [node, ...node.children.flat(Infinity).flatMap(descendants)];
}

test("the dialog connects and remembers only the address and email", async () => {
  const h = harness({ state: [true, "https://robot.example.com:555", "local@example.com", "123456", false, ""] });
  const tree = h.api.Button({});
  const nodes = descendants(tree);
  assert.ok(nodes.find((node) => node.props.accessibilityLabel === "Local server"));
  const pin = nodes.find((node) => node.type === "TextInput" && node.props.accessibilityLabel === "Local PIN");
  assert.equal(pin.props.secureTextEntry, true);
  const submit = nodes.find((node) => node.type === "TouchableOpacity" && node.children.some((child) => child && child.children && child.children.includes("Connect")));
  await submit.props.onPress();
  assert.deepEqual(h.stored, [{ key: "connection", value: { server: "https://robot.example.com:555", email: "local@example.com" } }]);
  assert.equal(h.states[3], "");
  assert.equal(h.states[0], false);
  assert.equal(h.states[4], false);
  assert.equal(h.states[5], "");
});

test("the selected app bundle exposes the auth and storage dependencies used by the patch", { skip: !process.env.ORIGINAL_APK }, () => {
  assert.ok(bundledAuth);
  assert.ok(bundledStorage);
  const bridge = { loginSuccess() {} };
  assert.equal(authFromBundle(bridge).default, bridge);
});
