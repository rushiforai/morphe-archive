"use strict";

const React = require("react");
const RN = require("react-native");
const Auth = require("auth").default;
const Storage = require("storage").RRStorage;
const useThemeStore = require("theme").useThemeStore;
const LOGIN_PATH = "/api/v5/auth/email/login/code";
const REQUEST_TIMEOUT_MS = 15000;
const ARROW_IMAGE = { uri: LOCAL_SERVER_ARROW };
let savedSettings;

function settingsStore() {
  if (!savedSettings) savedSettings = new Storage("roborock_local_server_patch");
  return savedSettings;
}

function normalizeServerUrl(value) {
  const text = value.trim();
  const match = /^https:\/\/(\[[0-9a-fA-F:]+\]|[a-zA-Z0-9](?:[a-zA-Z0-9.-]*[a-zA-Z0-9])?)(?::([0-9]{1,5}))?\/?$/.exec(text);
  if (!match || (match[2] && (+match[2] < 1 || +match[2] > 65535))) {
    throw new Error("Enter an HTTPS server address, for example https://roborock.example.com:555. Do not include a path.");
  }
  return text.replace(/\/$/, "");
}

function normalizeUserData(data) {
  if (!data || typeof data !== "object") throw new Error("The server returned no account data.");
  if (!Number.isSafeInteger(data.uid) || data.uid <= 0) throw new Error("The server returned an invalid user ID.");
  const user = {};
  for (const key of ["rruid", "token"]) {
    if (typeof data[key] !== "string" || !data[key]) throw new Error("The server returned incomplete account data.");
    user[key] = data[key];
  }
  const iot = data.rriot;
  if (!iot || typeof iot !== "object") throw new Error("The server returned no IoT credentials.");
  const rriot = {};
  for (const key of ["u", "s", "h", "k"]) {
    if (typeof iot[key] !== "string" || !iot[key]) throw new Error("The server returned incomplete IoT credentials.");
    rriot[key] = iot[key];
  }
  const endpoints = iot.r;
  if (!endpoints || typeof endpoints !== "object") throw new Error("The server returned no device endpoints.");
  rriot.r = {};
  for (const key of ["r", "a", "m", "l"]) {
    if (typeof endpoints[key] !== "string" || !endpoints[key]) throw new Error("The server returned incomplete device endpoints.");
    rriot.r[key] = endpoints[key];
  }
  user.uid = data.uid;
  user.rriot = rriot;
  user.avatarUrl = typeof data.avatarUrl === "string" ? data.avatarUrl : "";
  user.nickname = typeof data.nickname === "string" ? data.nickname : "Local User";
  user.country = typeof data.country === "string" ? data.country : endpoints.r;
  user.countrycode = typeof data.countrycode === "string" ? data.countrycode : "";
  user.region = typeof data.region === "string" ? data.region : endpoints.r;
  return user;
}

async function login(serverInput, emailInput, pin, onAuthenticated) {
  const server = normalizeServerUrl(serverInput);
  const email = emailInput.trim();
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) throw new Error("Enter the email configured on your local server.");
  if (!/^[0-9]{6}$/.test(pin)) throw new Error("Enter your local server's six-digit PIN.");
  if (!Auth || typeof Auth.loginSuccess !== "function") throw new Error("This app does not expose the supported login bridge.");

  const controller = new AbortController();
  const timer = setTimeout(function () { controller.abort(); }, REQUEST_TIMEOUT_MS);
  let response;
  let body;
  try {
    response = await fetch(server + LOGIN_PATH, {
      method: "POST",
      headers: { "Content-Type": "application/json", Accept: "application/json" },
      body: JSON.stringify({ email: email, code: pin }),
      signal: controller.signal,
      redirect: "error",
    });
    body = await response.json();
  } catch (error) {
    if (error.name === "AbortError") throw new Error("The server did not respond within 15 seconds.");
    throw new Error("Could not read the local server response. Check Wi-Fi/VPN, the HTTPS port, and the server's trusted TLS certificate.");
  } finally {
    clearTimeout(timer);
  }
  if (!response.ok || !body || body.code !== 200) {
    const reason = body && body.data && body.data.reason;
    if (reason === "invalid_login_pin" || reason === "invalid_login_email") {
      throw new Error("The local server rejected the email or PIN.");
    }
    throw new Error("Local login was rejected (HTTP " + response.status + "). Check local protocol login and new connections in the server settings.");
  }
  const user = normalizeUserData(body.data);
  onAuthenticated();
  try {
    await Auth.loginSuccess(JSON.stringify(user), server);
  } catch (error) {
    throw new Error("The server accepted login, but Roborock could not finish opening the account. Check server logs for unsupported account or device requests.");
  }
  return { server: server, email: email };
}

const styles = RN.StyleSheet.create({
  entry: { width: 40, height: 40, position: "relative" },
  open: { width: 40, height: 40, borderRadius: 20, alignItems: "center", justifyContent: "center", borderWidth: 0.3 },
  serverRack: { width: 18, height: 7, borderRadius: 2, backgroundColor: "#d5364c", marginVertical: 1, justifyContent: "center", paddingLeft: 3 },
  serverLight: { width: 2, height: 2, borderRadius: 1, backgroundColor: "#fff" },
  callout: { position: "absolute", bottom: 44, right: 4, width: 210, height: 128 },
  calloutText: { position: "absolute", right: 48, top: 0, fontSize: 21, fontWeight: "600", letterSpacing: -0.3, lineHeight: 25 },
  arrow: { position: "absolute", right: -23, top: 18, width: 64, height: 114 },
  white: { color: "#fff", fontSize: 16, fontWeight: "600" },
  backdrop: { flex: 1, backgroundColor: "rgba(0,0,0,0.55)", justifyContent: "center", padding: 24 },
  card: { borderRadius: 24, padding: 24, maxWidth: 480, width: "100%", alignSelf: "center" },
  title: { marginBottom: 8 },
  text: { marginBottom: 28 },
  label: { marginBottom: 8, marginLeft: 16 },
  input: { borderWidth: 0.5, borderRadius: 24, paddingHorizontal: 20, paddingVertical: 14, fontSize: 16, minHeight: 48, marginBottom: 20 },
  error: { marginBottom: 16, lineHeight: 20 },
  row: { flexDirection: "column-reverse", alignItems: "stretch", marginTop: 8 },
  cancel: { padding: 14, alignItems: "center", marginTop: 4 },
  cancelText: { fontSize: 16 },
  submit: { borderRadius: 24, padding: 14, minHeight: 48, alignItems: "center", justifyContent: "center" },
  disabled: { opacity: 0.5 },
});

function LocalServerLogin(props) {
  const theme = useThemeStore(function (state) { return state.theme; });
  const colors = theme.colors;
  const primary = colors.system.basic.primary;
  const [visible, setVisible] = React.useState(false);
  const [server, setServer] = React.useState("");
  const [email, setEmail] = React.useState("");
  const [pin, setPin] = React.useState("");
  const [busy, setBusy] = React.useState(false);
  const [error, setError] = React.useState("");
  const submitting = React.useRef(false);

  React.useEffect(function () {
    let mounted = true;
    settingsStore().getItemAsync("connection").then(function (raw) {
      if (!raw || !mounted) return;
      const settings = JSON.parse(raw);
      if (typeof settings.server === "string") setServer(settings.server);
      if (typeof settings.email === "string") setEmail(settings.email);
    }).catch(function () {
      if (mounted) setError("Saved connection settings could not be loaded. Enter them again.");
    });
    return function () { mounted = false; };
  }, []);

  function close() {
    if (submitting.current) return;
    setPin("");
    setVisible(false);
  }

  async function submit() {
    if (submitting.current) return;
    submitting.current = true;
    setBusy(true);
    setError("");
    RN.Keyboard.dismiss();
    try {
      await login(server, email, pin, function () { setPin(""); });
      setVisible(false);
      try {
        await settingsStore().setItemAsync("connection", JSON.stringify({ server: normalizeServerUrl(server), email: email.trim() }));
      } catch (storageError) {
        RN.Alert.alert("Connected", "The address could not be saved. You may need to enter it again after logging out.");
      }
    } catch (loginError) {
      setError(loginError.message);
    } finally {
      submitting.current = false;
      setBusy(false);
    }
  }

  const h = React.createElement;
  function input(label, value, setter, options) {
    return h(React.Fragment, { key: label },
      h(RN.Text, { style: [styles.label, theme.textStyle.contentMedium, { color: colors.text.level2 }] }, label),
      h(RN.TextInput, Object.assign({
        style: [styles.input, { color: colors.text.level1, borderColor: colors.text.level4 }], value: value, onChangeText: setter,
        accessibilityLabel: label, autoCapitalize: "none", autoCorrect: false,
        editable: !busy, placeholderTextColor: colors.text.level3, selectionColor: primary,
      }, options)));
  }
  return h(RN.View, { style: [styles.entry, props.style] },
    h(RN.View, { style: styles.callout, pointerEvents: "none", accessible: false, accessibilityElementsHidden: true, importantForAccessibility: "no-hide-descendants" },
      h(RN.Text, { style: [styles.calloutText, { color: primary }] }, "Local\nserver"),
      h(RN.Image, { style: [styles.arrow, { tintColor: primary }], source: ARROW_IMAGE, resizeMode: "contain" })),
    h(RN.TouchableOpacity, { style: [styles.open, { borderColor: colors.text.level4 }], accessibilityRole: "button", accessibilityLabel: "Local server", onPress: function () { setVisible(true); } },
      h(RN.View, { accessible: false },
        h(RN.View, { style: styles.serverRack }, h(RN.View, { style: styles.serverLight })),
        h(RN.View, { style: styles.serverRack }, h(RN.View, { style: styles.serverLight })))),
    h(RN.Modal, { visible: visible, transparent: true, animationType: "fade", onRequestClose: close },
      h(RN.KeyboardAvoidingView, { style: styles.backdrop, behavior: "height" },
        h(RN.ScrollView, { keyboardShouldPersistTaps: "handled", contentContainerStyle: { flexGrow: 1, justifyContent: "center" } },
          h(RN.View, { style: [styles.card, { backgroundColor: colors.system.background.modal }] },
            h(RN.Text, { style: [styles.title, theme.textStyle.titleLevel2, { color: colors.text.level1 }], accessibilityRole: "header" }, "Local server"),
            h(RN.Text, { style: [styles.text, theme.textStyle.contentMedium, { color: colors.text.level2 }] }, "Sign in with the email and six-digit PIN configured on your server."),
            input("Server URL", server, setServer, { placeholder: "https://roborock.example.com:555", keyboardType: "url", autoComplete: "off" }),
            input("Local login email", email, setEmail, { keyboardType: "email-address", autoComplete: "email" }),
            input("Local PIN", pin, setPin, { keyboardType: "number-pad", secureTextEntry: true, maxLength: 6, autoComplete: "off", textContentType: "none", onSubmitEditing: submit }),
            error ? h(RN.Text, { style: [styles.error, { color: colors.system.basic.error }], accessibilityRole: "alert", accessibilityLiveRegion: "polite" }, error) : null,
            h(RN.View, { style: styles.row },
              h(RN.TouchableOpacity, { style: styles.cancel, disabled: busy, accessibilityRole: "button", onPress: close }, h(RN.Text, { style: [styles.cancelText, { color: primary }] }, "Cancel")),
              h(RN.TouchableOpacity, { style: [styles.submit, { backgroundColor: primary }, busy && styles.disabled], disabled: busy, accessibilityRole: "button", onPress: submit },
                h(RN.Text, { style: styles.white }, busy ? "Connecting…" : "Connect"))))))));
}

module.exports = { Button: LocalServerLogin, login: login, normalizeServerUrl: normalizeServerUrl, normalizeUserData: normalizeUserData };
