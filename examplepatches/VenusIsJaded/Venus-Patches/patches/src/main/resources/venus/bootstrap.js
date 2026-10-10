/* Venus Patches: bundled, offline runtime. No remote code or full client mod required. */
(function (global) {
    "use strict";
    if (global.__venusPatches) return;
    const features = /*__FEATURES__*/;
    // Inspected Metro IDs for the SHA-256-pinned 348.10 bundle; never scan or eagerly require modules.
    const targetModules = new Set([17, 19, 1163, 10874, 14130, 14236]);
    function selectModules(ids) { ids.forEach(id => targetModules.add(id)); }
    if (features.picker) selectModules([414]);
    if (features.voice) selectModules([1283, 5440, 5442]);
    if (features.copyBios) selectModules([10742]);
    if (features.dashless) selectModules([4990]);
    if (features.favouriteAnything) selectModules([12524, 9861, 9864]);
    if (features.freeNitro) selectModules([1378, 2051, 5772, 5815, 4491, 13528, 6756, 6880]);
    if (features.noTyping) selectModules([11348]);
    if (features.quickDelete) selectModules([5205, 1127]);
    if (features.noDelete) selectModules([585, 5057, 5059, 1378, 6880, 7378]);
    if (features.jumpToTop) selectModules([11642, 11643, 11644, 8838, 9804, 10418, 15746, 6880, 2051]);
    if (features.hiddenChannels) selectModules([1086, 1097, 1113, 2051, 4470, 6952, 4472, 4990, 6880, 585, 1378, 15859, 5410]);
    if (features.pastelize) selectModules([7378, 1252, 2111]);
    if (features.platformIndicators) selectModules([4877, 4855, 1378, 2051, 10603, 10371, 12845, 15667, 9108, 13649, 12602]);
    if (features.reviewDB) selectModules([12627, 13521, 13987, 8510, 5997, 6621, 1378, 585]);
    if (features.readAll) selectModules([15929]);
    if (features.quests) selectModules([585, 7120]);
    const revision = "1.4.4";
    // Module 120 owns setUpDefaltReactNativeEnvironment in this exact asset.
    // Defer every feature hook until that initializer returns successfully.
    let environmentReady = false;
    const deferred = new Map();
    const settings = { picker: true, voice: false, copyBios: true, dashless: true, favouriteAnything: true, emojis: true, stickers: true, hyperlinks: true, forceLinks: false,
        noTyping: true, quickDelete: false, quickDeleteEmbeds: false, noDelete: false, noDeleteSave: false, noDeleteLimit: 512,
        jumpToTop: true, hiddenChannels: false, pastelize:true, pastelAll:false, pastelWebhookName:true, pastelContent:false, platformIndicators:true, piDmHeader:true, piUserList:true, piProfile:true, piHideMobile:true, reviewDB:false, reviewThemedSend:true, reviewWarning:true, readAll:true, readAllMode:"guilds",
        quests:true, questsVideo:true, questsPlay:true, questsActivity:true, questsEnroll:true };
    const status = { picker: false, attachment: false, request: false, menu: false, conversion: false, audioError: "", storage: "waiting" };
    const listeners = new Set();
    const dirty = new Set();
    const sizeCache = new Map();
    const sizeQueue = [];
    const pendingVoice = new Map();
    const markedPayloads = new WeakMap();
    const wrapped = new WeakMap();
    // React Native installs Promise during its polyfill phase; no Promise use in this prelude.
    let React, RN, files, activeReads = 0, writePending = false, nextSave;
    const conversions = new WeakMap();
    const readyUploads = new WeakMap();
    const activeJobs = new Map();
    let jobCounter = 0;
    const PREFS = "venus-patches.json";
    const MAX_DELETED = 5000, ARCHIVE_BYTES = 32 * 1024 * 1024;
    // What the Read all button clears: servers, DMs, or both.
    const READ_ALL_MODES = ["guilds", "dms", "both"];
    // A sub-option (piProfile, reviewWarning, pastelAll...) must also wake components that
    // subscribed to its plugin: those pages and badges read several of its settings at once.
    const notify = key => {
        const owner = key && key !== "*" ? featureFor(key) : null;
        listeners.forEach(entry => {
            if (!entry.key || key === "*" || entry.key === key || owner && entry.key === owner) entry.fn();
        });
    };
    const data = (obj, key) => {
        const descriptor = obj && Object.getOwnPropertyDescriptor(obj, key);
        return descriptor && "value" in descriptor ? descriptor.value : undefined;
    };
    const owns = (obj, key) => obj != null && Object.prototype.hasOwnProperty.call(obj, key);
    // enabled() runs inside nearly every hook: resolve setting -> feature once, not per call.
    const featureTable = new Map();
    const enabled = key => {
        let feature = featureTable.get(key);
        if (feature === undefined) featureTable.set(key, feature = featureFor(key));
        return features[feature] && settings[key];
    };

    function save() {
        if (!files || status.storage === "loading") return;
        // Keep only the newest waiting snapshot, not one Promise/string per toggle.
        nextSave = JSON.stringify(features.reviewDB && reviewToken && reviewAccount ? Object.assign({}, settings, {reviewAuth:{account:reviewAccount, token:reviewToken}}) : settings);
        if (writePending) return;
        writePending = true;
        function persist() {
            const snapshot = nextSave;
            nextSave = undefined;
            return Promise.resolve().then(() => files.writeFile("documents", PREFS, snapshot, "utf8")).then(() => {
                status.storage = "saved";
            }, () => { status.storage = "save failed (session only)"; }).then(() => {
                notify();
                if (nextSave !== undefined && nextSave !== snapshot) return persist();
                nextSave = undefined;
                writePending = false;
            });
        }
        Promise.resolve().then(persist);
    }
    function deleteLimit(value) { const n = Math.floor(Number(value)); return Number.isFinite(n) && n > 0 ? Math.min(MAX_DELETED, n) : 512; }
    function setSetting(key, value) {
        if (!owns(settings, key) || !features[featureFor(key)]) return false;
        if (key === "readAllMode") {
            if (!READ_ALL_MODES.includes(value)) return false;
            if (settings.readAllMode === value && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.readAllMode = value; dirty.add(key); save(); notify(key); return true;
        }
        if (key === "noDeleteLimit") {
            const limit = deleteLimit(value);
            // Leaving the box without changing it no longer rewrites your settings.
            if (limit === settings.noDeleteLimit && status.storage !== "loading" && status.storage !== "waiting") return true;
            settings.noDeleteLimit = limit; dirty.add(key); trimDeleted(); save(); notify(key); return true;
        }
        if (settings[key] === !!value && status.storage !== "loading" && status.storage !== "waiting") return true;
        value = !!value;
        if (key === "reviewDB" && !value) { reviewAuthAttempt++; reviewCache.clear(); }
        if (key === "voice" && !value) activeJobs.forEach(job => {
            job.cancelled = true;
            nativeVoice("cancel", job.id).catch(() => {});
        });
        // Switching NoDelete off hides kept messages but must not erase the saved archive:
        // it used to write an empty file, so turning it back on lost every saved message.
        if (key === "noDelete" && !value) { clearDeleted(true, settings.noDeleteSave); archiveRestored = false; }
        if (key === "hiddenChannels") {hiddenViews.clear();}
        settings[key] = value;
        if (key === "noDeleteSave") { if (value) restoreDeleted(); else archiveRestored = false; persistDeleted(); }
        if (key === "noDelete" && value) restoreDeleted();
        dirty.add(key);
        if (key === "picker" && !value) {
            clearSizes();
        }
        if (features.quests && featureFor(key) === "quests") questsSettingChanged(key, value);
        save();
        notify(key);
        return true;
    }
    function initFiles(module) {
        if (files) return;
        files = module;
        status.storage = "loading";
        // Size metadata does not depend on the preferences directory being available.
        drainSizes();
        let constants;
        try { constants = typeof files.getConstants === "function" ? files.getConstants() : files; }
        catch (_) { constants = {}; }
        const directory = constants && constants.DocumentsDirPath;
        if (typeof directory !== "string") { status.storage = "unavailable (session only)"; notify(); return; }
        const path = directory.replace(/\/$/, "") + "/" + PREFS;
        Promise.resolve().then(() => files.fileExists(path)).then(exists =>
            exists ? files.readFile(path, "utf8") : null
        ).then(text => {
            if (text) {
                const loaded = JSON.parse(text);
                if (!loaded || typeof loaded !== "object" || Array.isArray(loaded)) throw new Error("Invalid preferences");
                for (const key of Object.keys(settings))
                    if (!dirty.has(key) && typeof loaded[key] === typeof settings[key] && (key !== "readAllMode" || READ_ALL_MODES.includes(loaded[key])))
                        settings[key] = key === "noDeleteLimit" ? deleteLimit(loaded[key]) : loaded[key];
                const auth = loaded.reviewAuth;
                // Restore a saved ReviewDB sign-in (a ReviewDB token, never the Discord token).
                if (features.reviewDB && !reviewToken && auth && typeof auth.token === "string" && auth.token.length <= 8192 &&
                    typeof auth.account === "string" && /^\d{17,20}$/.test(auth.account)) { reviewToken = auth.token; reviewAccount = auth.account; }
            }
            status.storage = "ready";
            if (!enabled("picker")) clearSizes();
            // Persist edits made while the asynchronous restore was in flight.
            if (dirty.size) save();
            restoreDeleted();
            if (features.quests && !enabled("quests")) questsStop();
            notify("*");
        }).catch(() => { status.storage = "read failed (defaults)"; if (dirty.size) save(); notify("*"); });
    }

    function formatSize(bytes) {
        if (!Number.isFinite(bytes) || bytes < 0) return "";
        if (bytes === 0) return "0 B";
        // Binary units, labelled the way Android and Discord show them. Promote a value that
        // would round to "1024 KB" (log rounding just below a boundary) to "1 MB".
        const units = ["B", "KB", "MB", "GB", "TB"];
        let unit = Math.max(0, Math.min(Math.floor(Math.log(bytes) / Math.log(1024)), units.length - 1));
        let value = Number((bytes / Math.pow(1024, unit)).toFixed(unit ? 2 : 0));
        if (value >= 1024 && unit < units.length - 1) { unit++; value = Number((bytes / Math.pow(1024, unit)).toFixed(2)); }
        return value + " " + units[unit];
    }
    // Hermes's native eval configuration can lower loop-local const/let to var.
    // Give asynchronous callbacks an invocation scope, not a loop capture.
    function readSize(entry) {
        activeReads++;
        Promise.resolve().then(() => files.getSize(entry.uri)).then(value => {
            const bytes = typeof value === "number" || typeof value === "string" && value.trim() ? Number(value) : NaN;
            entry.value = Number.isSafeInteger(bytes) && bytes >= 0 ? bytes : null;
        }, () => { entry.value = null; }).then(() => {
            entry.expires = Date.now() + (entry.value === null ? 30000 : 300000);
            entry.done = true;
            entry.resolve(entry.value);
            activeReads--;
            drainSizes();
        });
    }
    function clearSizes() {
        sizeCache.clear();
        sizeQueue.splice(0).forEach(entry => entry.resolve(null));
    }
    function drainSizes() {
        if (!files || !enabled("picker")) return;
        while (activeReads < 4 && sizeQueue.length) readSize(sizeQueue.shift());
    }
    function getSize(uri) {
        if (!enabled("picker") || typeof uri !== "string" || !/^(content|file):\/\//.test(uri))
            return Promise.resolve(null);
        const existing = sizeCache.get(uri);
        if (existing && (!existing.done || existing.expires > Date.now())) {
            if (existing.done) { sizeCache.delete(uri); sizeCache.set(uri, existing); }
            return existing.promise;
        }
        if (existing) sizeCache.delete(uri);
        if (sizeCache.size >= 256) {
            let removable;
            for (const [key, cached] of sizeCache) if (cached.done) { removable = key; break; }
            if (removable === undefined) return Promise.resolve(null);
            sizeCache.delete(removable);
        }
        const entry = { uri, done: false };
        entry.promise = new Promise(resolve => { entry.resolve = resolve; });
        sizeCache.set(uri, entry);
        sizeQueue.push(entry);
        drainSizes();
        return entry.promise;
    }
    function el() { return React.createElement.apply(React,arguments); }
    function useSettings(key) {
        const [, update] = React.useState(0);
        React.useEffect(() => {
            const entry = {key, fn: () => update(n => n + 1)};
            listeners.add(entry);
            return () => listeners.delete(entry);
        }, [key]);
    }
    function SizeBadge(props) {
        useSettings("picker");
        const [bytes, update] = React.useState(null);
        React.useEffect(() => {
            let live = true;
            update(null);
            if (enabled("picker")) getSize(props.uri).then(value => { if (live) update(value); });
            return () => { live = false; };
        }, [props.uri, settings.picker]);
        if (!enabled("picker") || bytes === null || !RN) return null;
        return el(RN.View, {
            pointerEvents: "none",
            style: { position: "absolute", top: 3, left: 3, borderRadius: 4,
                backgroundColor: "#17181ccc", paddingHorizontal: 4, paddingVertical: 2 }
        }, el(RN.Text, {
            style: { color: "white", fontSize: 10, fontWeight: "700", includeFontPadding: false }
        }, formatSize(bytes)));
    }
    function pickerProps(props) {
        if (!enabled("picker") || !React || !RN || !props) return props;
        const first = Array.isArray(props.children) ? props.children[0] : props.children;
        const uri = first && first.props && first.props.localImageSource && first.props.localImageSource.uri;
        if (typeof uri !== "string") return props;
        return Object.assign({}, props, { children: el(RN.View, {
            style: { position: "relative" }, pointerEvents: "box-none"
        }, props.children, el(SizeBadge, { uri })) });
    }
    function pickerComponent(component) {
        if (!component || wrapped.has(component)) return wrapped.get(component) || component;
        if (typeof component === "function" && (component.displayName || component.name) === "Pressable") {
            const orig = component;
            const result = function () {
                const args = Array.from(arguments);
                args[0] = pickerProps(args[0]);
                return orig.apply(this, args);
            };
            result.displayName = "Pressable";
            wrapped.set(component, result);
            status.picker = true;
            return result;
        }
        if (typeof component === "object") {
            for (const key of ["type", "render"]) {
                const orig = data(component, key);
                if (!orig) continue;
                const patched = pickerComponent(orig);
                if (patched !== orig) {
                    const result = cloneWith(component, key, patched);
                    wrapped.set(component, result);
                    return result;
                }
            }
        }
        return component;
    }

    function nativeVoice(action, id, uri) {
        if (!files) return Promise.reject(new Error("Discord file bridge has not loaded"));
        return files.getSize("venus-voice-v1:" + JSON.stringify({ action, id, uri }));
    }
    // Decoded byte count of a validated base64 string; Discord accepts at most 256 waveform levels.
    function waveformLength(text) { return text.length / 4 * 3 - (text.endsWith("==") ? 2 : text.endsWith("=") ? 1 : 0); }
    const audioName = /\.(mp3|mp2|mpga|m4a|m4b|aac|wav|wave|flac|ogg|oga|opus|amr|awb|3ga|3gp|3gpp|aif|aiff|aifc|wma|ac3|eac3|caf|weba|alac)$/i;
    // Audio-only extensions: some providers label these voice notes video/mp4, video/3gpp or video/webm.
    const audioOnlyName = /\.(mp3|m4a|m4b|aac|wav|flac|oga|opus|amr|awb|3ga|weba|aif|aiff|aifc|caf)$/i;
    function isAudio(upload) {
        if (!upload || upload.spoiler) return false;
        const item = upload.item || {};
        const mime = String(upload.mimeType || item.mimeType || "").toLowerCase().split(";")[0].trim();
        const name = String(upload.filename || item.filename || "");
        if (mime.startsWith("audio/") || ["application/ogg","application/x-ogg","application/x-flac","application/x-wav","application/x-opus"].includes(mime)) return true;
        if (mime.startsWith("video/")) return audioOnlyName.test(name);
        if (mime && mime !== "application/octet-stream" && mime !== "binary/octet-stream") return false;
        return audioName.test(name);
    }
    function prepareUpload(orig, upload, args) {
        if (!enabled("voice") || !isAudio(upload)) return orig.apply(upload, args);
        const old = conversions.get(upload);
        if (old) return old.promise;
        const item = upload.item || {};
        const uri = item.uri || upload.uri;
        if (typeof uri !== "string" || !/^(content|file):\/\//.test(uri)) return orig.apply(upload, args);
        const job = { id: Date.now().toString(36) + "-" + (++jobCounter), cancelled: false };
        activeJobs.set(upload, job);
        const promise = Promise.resolve().then(() => {
            if (job.cancelled || !enabled("voice") || typeof upload.isCancelled === "function" && upload.isCancelled())
                throw new Error("Audio upload cancelled before conversion");
            return nativeVoice("prepare", job.id, uri);
        }).then(text => {
            const result = JSON.parse(text);
            if (!result || typeof result.uri !== "string" || !result.uri.startsWith("file://") ||
                result.mimeType !== "audio/ogg" || !Number.isFinite(result.durationSecs) || !(result.durationSecs > 0) || result.durationSecs > 1200 ||
                !Number.isSafeInteger(result.size) || !(result.size > 0) || typeof result.waveform !== "string" || !/^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(result.waveform) || !result.waveform || waveformLength(result.waveform) > 256)
                throw new Error("Native audio conversion returned invalid metadata");
            if (job.cancelled || !enabled("voice") || (typeof upload.isCancelled === "function" && upload.isCancelled())) {
                nativeVoice("release", job.id).catch(() => {});
                if (typeof upload.isCancelled === "function" && upload.isCancelled()) throw new Error("Audio upload cancelled");
                return orig.apply(upload, args);
            }
            // This async pre-upload boundary is awaited by CloudUpload.upload in the inspected build.
            // Both native upload paths consume item.uri; no Blob/base64 full-file buffering in JS.
            upload.item = Object.assign({}, item, result);
            upload.uri = result.uri;
            upload.mimeType = result.mimeType;
            upload.filename = result.filename;
            upload.currentSize = result.size;
            upload.durationSecs = result.durationSecs;
            upload.waveform = result.waveform;
            upload.reactNativeFilePrepped = true;
            readyUploads.set(upload, result);
            status.audioError = "";
            notify();
            return upload;
        }).catch(error => {
            if (typeof upload.isCancelled === "function" && upload.isCancelled()) throw error;
            // Unsupported codecs/devices remain ordinary orig attachments, never spoofed voice files.
            status.audioError = String(error && error.message || error);
            notify();
            if (!job.cancelled && RN && RN.Alert) RN.Alert.alert("Couldn't make a voice message",
                status.audioError + "\n\nIt will be sent as a normal file instead.");
            return orig.apply(upload, args);
        }).finally(() => { activeJobs.delete(upload); });
        job.promise = promise;
        conversions.set(upload, job);
        return promise;
    }
    function instrumentCloudUpload(CloudUpload) {
        if (!features.voice || typeof CloudUpload !== "function" || !CloudUpload.prototype) return;
        const prototype = CloudUpload.prototype;
        const orig = prototype.reactNativeCompressAndExtractData;
        if (typeof orig !== "function" || wrapped.has(orig)) return;
        const patched = function () { return prepareUpload(orig, this, arguments); };
        prototype.reactNativeCompressAndExtractData = patched;
        wrapped.set(orig, patched);
        wrapped.set(patched, patched);
        for (const key of ["cancel", "delete"]) {
            const method = prototype[key];
            if (typeof method !== "function") continue;
            prototype[key] = function () {
                const job = conversions.get(this);
                if (job) {
                    job.cancelled = true;
                    nativeVoice("cancel", job.id).catch(() => {});
                }
                return method.apply(this, arguments);
            };
        }
        status.conversion = true;
    }
    function attachmentPayload(orig, self, args) {
        const result = orig.apply(self, args);
        const metadata = readyUploads.get(args[0]);
        if (!enabled("voice") || !metadata || !result || typeof result !== "object") return result;
        const payload = Object.assign({}, result, { duration_secs: metadata.durationSecs, waveform: metadata.waveform });
        // These fields are real, but still belong only to custom voice conversion when the flag is off.
        const marker = { duration: true, waveform: true };
        markedPayloads.set(payload, marker);
        if (typeof payload.uploaded_filename === "string") {
            if (pendingVoice.size >= 128) pendingVoice.delete(pendingVoice.keys().next().value);
            pendingVoice.set(payload.uploaded_filename, marker);
        }
        return payload;
    }
    function postRequest(orig, self, args) {
        const request = args[0];
        // Fast path for all other API traffic; no fetch/XMLHttpRequest interception.
        if (!request || typeof request.url !== "string" || !/^\/channels\/\d+\/messages$/.test(request.url))
            return orig.apply(self, args);
        const body = request.body;
        if (!body || !Array.isArray(body.attachments) || ((Number(body.flags) || 0) & 8192))
            return orig.apply(self, args);
        const markers = body.attachments.map(attachment => attachment &&
            (markedPayloads.get(attachment) || pendingVoice.get(attachment.uploaded_filename)));
        if (!markers.some(Boolean)) return orig.apply(self, args);
        const eligible = enabled("voice") && body.attachments.length === 1 && markers[0] &&
            !body.content && !(body.sticker_ids && body.sticker_ids.length) &&
            !(body.embeds && body.embeds.length) && !body.poll;
        const nextBody = Object.assign({}, body);
        if (eligible) nextBody.flags = ((Number(body.flags) || 0) | 8192) >>> 0;
        else nextBody.attachments = body.attachments.map((attachment, index) => {
            if (!markers[index]) return attachment;
            const clean = Object.assign({}, attachment);
            if (markers[index].duration) delete clean.duration_secs;
            if (markers[index].waveform) delete clean.waveform;
            return clean;
        });
        const nextArgs = Array.from(args);
        nextArgs[0] = Object.assign({}, request, { body: nextBody });
        return orig.apply(self, nextArgs);
    }

    // Native setting nodes use Discord's own themed rows, navigation and back stack.
    let SettingsList;
    const featureFor = key => key === "reviewThemedSend" || key === "reviewWarning" ? "reviewDB" : key === "emojis" || key === "stickers" || key === "hyperlinks" || key === "forceLinks" ? "freeNitro" : key === "quickDeleteEmbeds" ? "quickDelete" : key === "noDeleteSave" || key === "noDeleteLimit" ? "noDelete" : /^pi[A-Z]/.test(key) ? "platformIndicators" : ["pastelAll","pastelWebhookName","pastelContent"].includes(key) ? "pastelize" : key === "readAllMode" ? "readAll" : /^quests[A-Z]/.test(key) ? "quests" : key;
    function section(label, keys) { return { label, settings: keys }; }
    // Plain-language status for General -> About; the raw values stay in status for diagnostics.
    function aboutText() {
        const storage = status.storage;
        const lines = [storage === "ready" || storage === "saved" ? "Your settings are saved on this phone." :
            storage === "waiting" || storage === "loading" ? "Loading your settings..." :
            /^read failed/.test(storage) ? "Your saved settings couldn't be read, so the defaults are in use." :
            "Your settings can't be saved right now. Changes last until Discord restarts."];
        const archive = {"saved locally":"Kept deleted messages are saved on this phone.", "save failed":"Kept deleted messages couldn't be saved.",
            "restore failed":"Saved deleted messages couldn't be loaded."}[status.archive];
        if (archive) lines.push(archive);
        if (status.audioError) lines.push("Last problem: " + status.audioError);
        return lines.join("\n");
    }
    function settingsPage(sections) {
        const node = { type: "list", sections };
        return function VenusSettingsPage() {
            return React && SettingsList ? el(SettingsList, { node }) : null;
        };
    }
    function settingNode(key, title, description, parent) {
        return { type: "toggle", parent, useTitle: () => title, useDescription: () => description,
            useValue: function () { useSettings(key); return settings[key]; },
            onValueChange: value => setSetting(key, value) };
    }
    function nativeRegistry(registry) {
        if (!registry || !registry.ACCOUNT || registry.VENUS_GENERAL) return registry;
        const next = Object.assign({}, registry);
        const icon = registry.ACCOUNT.IconComponent;
        function route(key, title, sections, parent) {
            const page = settingsPage(sections);
            next[key] = { type: "route", parent, useTitle: () => title, IconComponent: icon,
                screen: { route: key, getComponent: () => page } };
        }
        next.VENUS_VERSION = { type: "static", parent: "VENUS_GENERAL", useTitle: () => "Venus Patches " + revision,
            useDescription: function () { useSettings(); return aboutText(); } };
        route("VENUS_GENERAL", "General", [section("About", ["VENUS_VERSION"])]);
        // Listed alphabetically, like Discord's own settings. Plugins with several
        // options open their own page; simple ones are a single switch.
        const plugins = [];
        function plugin(key, title, hint) {
            if (!features[key]) return;
            const id = "VENUS_" + key.toUpperCase(); plugins.push(id);
            next[id] = settingNode(key, title, hint, "VENUS_PLUGINS");
        }
        plugin("copyBios", "CopyBios", "Select and copy text in profile bios.");
        plugin("voice", "Custom voice messages", "Send an audio file on its own as a real voice message. Needs Android 10 or newer.");
        plugin("dashless", "Dashless", "Show spaces instead of dashes in channel names.");
        plugin("favouriteAnything", "FavouriteAnything", "Favourite any image or video from the media viewer.");
        plugin("picker", "File size on picker", "Show each file's size on photos and videos when you attach them.");
        if (features.freeNitro) {
            plugins.push("VENUS_FREENITRO");
            route("VENUS_FREENITRO", "FreeNitro", [section("Sharing", ["VENUS_EMOJIS", "VENUS_STICKERS"]),
                section("Options", ["VENUS_HYPERLINKS", "VENUS_FORCELINKS"])], "VENUS_PLUGINS");
            next.VENUS_EMOJIS = settingNode("emojis", "Free emojis", "Send emojis you can't use as image links.", "VENUS_FREENITRO");
            next.VENUS_STICKERS = settingNode("stickers", "Free stickers", "Send stickers you can't use as image links. Animated stickers may not move.", "VENUS_FREENITRO");
            next.VENUS_HYPERLINKS = settingNode("hyperlinks", "Short links", "Show the emoji or sticker name instead of the full link.", "VENUS_FREENITRO");
            next.VENUS_FORCELINKS = settingNode("forceLinks", "Always send links", "Use links even for emojis and stickers you can already use.", "VENUS_FREENITRO");
        }
        plugin("hiddenChannels", "Hidden Channels", "Show channels you can't open, with a lock. You still can't read them or join locked voice channels.");
        plugin("jumpToTop", "JumpToTop", "Add a button to jump to the first message in a chat.");
        plugin("noTyping", "No typing", "Hide that you're typing. You still see when others type.");
        if (features.noDelete) {
            plugins.push("VENUS_NODELETE");
            route("VENUS_NODELETE", "NoDelete", [section("NoDelete", [])], "VENUS_PLUGINS");
            next.VENUS_NODELETE.screen.getComponent = () => NoDeleteSettings;
        }
        if (features.pastelize) {
            const P = "VENUS_PASTELIZE"; plugins.push(P);
            route(P, "Pastelize", [section("Pastelize", ["VENUS_PASTEL_ENABLED"]),
                section("Options", ["VENUS_PASTELALL", "VENUS_PASTELWEBHOOKNAME", "VENUS_PASTELCONTENT"])], "VENUS_PLUGINS");
            next.VENUS_PASTEL_ENABLED = settingNode("pastelize", "Enable Pastelize", "Give names and mentions without a role color a soft pastel color.", P);
            next.VENUS_PASTELALL = settingNode("pastelAll", "Color every name", "Use pastel colors even for people with a role color.", P);
            next.VENUS_PASTELWEBHOOKNAME = settingNode("pastelWebhookName", "Color webhooks by name", "Webhooks with the same name share a color.", P);
            next.VENUS_PASTELCONTENT = settingNode("pastelContent", "Color message text", "Color the message as well as the name.", P);
        }
        if (features.platformIndicators) {
            const P = "VENUS_PLATFORMINDICATORS"; plugins.push(P);
            route(P, "PlatformIndicators", [section("PlatformIndicators", ["VENUS_PI_ENABLED"]),
                section("Show icons", ["VENUS_PI_DM", "VENUS_PI_LIST", "VENUS_PI_PROFILE"]), section("Options", ["VENUS_PI_MOBILE"])], "VENUS_PLUGINS");
            next.VENUS_PI_ENABLED = settingNode("platformIndicators", "Enable PlatformIndicators", "Show whether people are on desktop, mobile, web, console or VR.", P);
            next.VENUS_PI_DM = settingNode("piDmHeader", "On the DM top bar", "Next to the name at the top of a DM.", P);
            next.VENUS_PI_LIST = settingNode("piUserList", "In lists", "Members, friends, DMs and people in voice.", P);
            next.VENUS_PI_PROFILE = settingNode("piProfile", "On profiles", "Next to the name on a profile.", P);
            next.VENUS_PI_MOBILE = settingNode("piHideMobile", "Plain status dot on avatars", "Hide Discord's phone badge, since the icons already show mobile.", P);
        }
        if (features.readAll) {
            plugins.push("VENUS_READALL");
            route("VENUS_READALL", "Read All", [section("Read All", [])], "VENUS_PLUGINS");
            next.VENUS_READALL.screen.getComponent = () => ReadAllSettings;
        }
        if (features.quickDelete) {
            plugins.push("VENUS_QUICKDELETE");
            route("VENUS_QUICKDELETE", "QuickDelete", [section("Skip confirmation", ["VENUS_QUICKDELETE_MESSAGES", "VENUS_QUICKDELETE_EMBEDS"])], "VENUS_PLUGINS");
            next.VENUS_QUICKDELETE_MESSAGES = settingNode("quickDelete", "Delete messages instantly", "Skip \"are you sure?\" when deleting a message. This can't be undone.", "VENUS_QUICKDELETE");
            next.VENUS_QUICKDELETE_EMBEDS = settingNode("quickDeleteEmbeds", "Remove embeds instantly", "Skip \"are you sure?\" when removing a link preview.", "VENUS_QUICKDELETE");
        }
        if (features.quests) {
            plugins.push("VENUS_QUESTS");
            route("VENUS_QUESTS", "Quest Completer", [section("Quest Completer", [])], "VENUS_PLUGINS");
            next.VENUS_QUESTS.screen.getComponent = () => QuestSettings;
        }
        if (features.reviewDB) {
            plugins.push("VENUS_REVIEWDB");
            route("VENUS_REVIEWDB", "ReviewDB", [section("ReviewDB", ["VENUS_REVIEWDB_ENABLED"])], "VENUS_PLUGINS");
            next.VENUS_REVIEWDB_ENABLED = settingNode("reviewDB", "Enable ReviewDB", "Read and write reviews of users and servers.", "VENUS_REVIEWDB");
            next.VENUS_REVIEWDB.screen.getComponent = () => ReviewSettings;
        }
        // Sorted by the title people see, so the list stays alphabetical as plugins are added.
        plugins.sort((a, b) => next[a].useTitle().toLowerCase().localeCompare(next[b].useTitle().toLowerCase()));
        route("VENUS_PLUGINS", "Plugins", [section("Plugins", plugins)]);
        status.menu = true;
        return next;
    }
    function settingsSections(orig, self, args) {
        const config = args[0];
        if (!status.menu || !config || !Array.isArray(config.sections)) return orig.apply(self, args);
        const index = config.sections.findIndex(s => s && Array.isArray(s.settings) && s.settings.includes("ACCOUNT"));
        if (index < 0 || config.sections.some(s => s && s.label === "Venus")) return orig.apply(self, args);
        const sections = config.sections.slice();
        sections.splice(index + 1, 0, section("Venus", ["VENUS_GENERAL", "VENUS_PLUGINS"]));
        const next = Array.from(args); next[0] = Object.assign({}, config, { sections });
        return orig.apply(self, next);
    }

    function cloneTree(node, change, depth) {
        if (!node || typeof node !== "object" || depth > 24) return node;
        if (Array.isArray(node)) {
            let children = node;
            for (let i = 0; i < node.length; i++) {
                const child = cloneTree(node[i], change, depth + 1);
                if (child !== node[i]) {
                    if (children === node) children = node.slice();
                    children[i] = child;
                }
            }
            return children;
        }
        if (!node.props) return node;
        const children = cloneTree(node.props.children, change, depth + 1);
        let props = children !== node.props.children ? Object.assign({}, node.props, { children }) : node.props;
        props = change(node, props);
        return props === node.props ? node : React.cloneElement(node, props);
    }
    function copyBio(orig, self, args) {
        const result = orig.apply(self, args);
        if (!enabled("copyBios") || !React || !RN) return result;
        return cloneTree(result, function (node, props) {
            // Preserve clickable links and handlers, never mutate React's frozen elements.
            if (node !== result && node.type !== RN.Text && typeof props.children !== "string") return props;
            return props.selectable === true ? props : Object.assign({}, props, { selectable: true });
        }, 0);
    }
    function channelLabel(orig, self, args) {
        const channel=args[0];
        let next=args;
        if (hiddenMetadata(channel)) {
            // Formatter-only facade avoids Discord's OBFUSCATED label branch while
            // preserving its escaping, category casing and the real model/flags.
            next=Array.from(args);
            next[0]=cloneWith(cloneWith(channel,"name",hiddenName(channel)),"isObfuscated",()=>false);
        }
        const name=orig.apply(self,next);
        return enabled("dashless") && channel && [0, 5, 15, 16].includes(channel.type) && typeof name === "string" ? name.replace(/-/g, " ") : name;
    }
    const videoPattern = /\.(mp4|webm|mov|avi|mkv|flv|wmv|m4v|gifv)(?:[?#]|$)/i;
    const video = uri => typeof uri === "string" && videoPattern.test(uri);
    function thumbnail(uri) {
        if (typeof uri !== "string" || !/^https:\/\/(?:cdn\.discordapp\.com|media\.discordapp\.net|images-ext-\d+\.discordapp\.net)\//i.test(uri)) return uri;
        let result = uri.replace(/^https:\/\/cdn\.discordapp\.com\//i, "https://media.discordapp.net/");
        const hash = result.indexOf("#"), suffix = hash < 0 ? "" : result.slice(hash);
        if (hash >= 0) result = result.slice(0, hash);
        result = /[?&]format=/.test(result) ? result.replace(/([?&])format=[^&]*/g, "$1format=jpeg") : result + (result.includes("?") ? "&" : "?") + "format=jpeg";
        return result + suffix;
    }
    function favouriteButton(orig, self, args) {
        const props = args[0], source = props && props.source;
        if (!enabled("favouriteAnything") || !source || source.isGIFV || typeof source.uri !== "string" || !/^https?:\/\//i.test(source.uri)) return orig.apply(self, args);
        const next = Array.from(args);
        next[0] = Object.assign({}, props, { source: Object.assign({}, source, { isGIFV: true,
            embedURI: source.embedURI || source.sourceURI || source.uri, videoURI: source.videoURI || source.uri,
            embedProviderName: source.embedProviderName || "" }) });
        return orig.apply(self, next);
    }
    function favouriteAdd(orig, self, args) {
        const item = args[0];
        if (!enabled("favouriteAnything") || !item || typeof item !== "object") return orig.apply(self, args);
        const isVideo = video(item.url) || video(item.gifSrc);
        const isImage = typeof item.url === "string" && /\.(png|jpe?g|gif|webp|avif|heic|heif)(?:[?#]|$)/i.test(item.url);
        // Preserve native formats for opaque provider URLs instead of misclassifying videos as images.
        if (!isVideo && !isImage) return orig.apply(self, args);
        const format = isVideo ? 2 : 1;
        if (item.format === format) return orig.apply(self, args);
        const next = Array.from(args); next[0] = Object.assign({}, item, { format });
        return orig.apply(self, next);
    }
    const favouriteViews = new WeakMap();
    function favouriteList(orig, self, args) {
        const result = orig.apply(self, args);
        if (!enabled("favouriteAnything") || !result || !Array.isArray(result.favorites)) return result;
        let favorites = favouriteViews.get(result.favorites);
        if (!favorites) {
            let changed = false;
            favorites = result.favorites.map(item => {
                if (!item || !video(item.url) && !video(item.gifSrc)) return item;
                const src = thumbnail(item.src || item.url);
                if (src === item.src) return item;
                changed = true; return Object.assign({}, item, { src });
            });
            if (!changed) favorites = result.favorites;
            favouriteViews.set(result.favorites, favorites);
        }
        if (favorites === result.favorites) return result;
        const category = result.favoritesCategory && favorites[0] ? Object.assign({}, result.favoritesCategory, { src: favorites[0].src }) : result.favoritesCategory;
        return Object.assign({}, result, { favorites, favoritesCategory: category });
    }

    let userStore, channelStore, emojiStore, stickerStore, stickerRules, emojiCatalog;
    const premiumOriginal = {};
    function currentUser() { return userStore && userStore.getCurrentUser(); }
    let nativeCapabilities = 0;
    function capability(key, user) {
        // The orig capability delegates to canUserUse. Conversion must see real
        // eligibility, not the picker override, or a non-Nitro send stays an invalid token.
        nativeCapabilities++;
        try { return typeof premiumOriginal[key] === "function" && premiumOriginal[key](user); }
        finally { nativeCapabilities--; }
    }
    function catalogEligibility(orig, self, args) {
        const user = currentUser(), feature = args[0];
        if (!nativeCapabilities && enabled("emojis") && user && args[1] && args[1].id === user.id &&
            (feature === emojiCatalog.EMOJIS_EVERYWHERE || feature === emojiCatalog.ANIMATED_EMOJIS)) return true;
        return orig.apply(self, args);
    }
    function premiumOverride(key, setting) {
        return function (orig, self, args) {
            const user = currentUser();
            return enabled(setting) && user && args[0] && args[0].id === user.id ? true : orig.apply(self, args);
        };
    }
    function shareLink(name, uri) {
        // Escape Markdown without permitting forged mentions or link syntax in sticker names.
        return settings.hyperlinks && name ? "[" + String(name).replace(/([\\\[\]()*_`<>@])/g, "\\$1").replace(/[\r\n]/g, " ") + "](" + uri + ")" : uri;
    }
    function emojiMessage(message, channelId) {
        if (!enabled("emojis") || !message || typeof message.content !== "string" || !message.content.includes("<") || !emojiStore || !channelStore) return message;
        const user = currentUser(), channel = channelStore.getChannel(channelId);
        if (!user || !channel) return message;
        const everywhere = capability("canUseEmojisEverywhere", user), animated = capability("canUseAnimatedEmojis", user);
        const converted = new Set();
        // Do not rewrite code blocks, inline code, escaped tokens or Markdown link targets.
        const content = message.content.replace(/```[\s\S]*?(?:```|$)|``[^\n]*?(?:``|$)|`[^`\n]*(?:`|$)|\\[\s\S]|\]\([^\n)]*\)|<(a?):([\w]+):(\d+)>/g, function (match, animation, name, id) {
            if (!id) return match;
            const emoji = emojiStore.getCustomEmojiById(id);
            if (!emoji || emoji.available === false || !emoji.guildId) return match;
            if (!settings.forceLinks && (everywhere || emoji.guildId === channel.guild_id) && (!(animation || emoji.animated) || animated)) return match;
            converted.add(id);
            const uri = "https://cdn.discordapp.com/emojis/" + id + (animation || emoji.animated ? ".gif" : ".webp") + "?size=48&quality=lossless";
            return shareLink(name, uri);
        });
        if (!converted.size || content.length > (user.premiumType === 2 ? 4000 : 2000)) return message;
        const next = Object.assign({}, message, { content });
        // Keep unrelated invalid emoji diagnostics intact.
        for (const key of ["invalidEmojis", "validNonShortcutEmojis"]) if (Array.isArray(message[key]))
            next[key] = message[key].filter(item => !converted.has(typeof item === "string" ? item : item && item.id));
        return next;
    }
    function sendMessage(orig, self, args) {
        const message = emojiMessage(args[1], args[0]);
        if (message === args[1]) return orig.apply(self, args);
        const next = Array.from(args); next[1] = message;
        return orig.apply(self, next);
    }
    function stickerLink(sticker) {
        if (!sticker || sticker.available === false || !/^\d+$/.test(sticker.id)) return null;
        if (![1, 2, 4].includes(sticker.format_type)) return null; // No broken Lottie URLs or third-party conversion service.
        return shareLink(sticker.name, "https://media.discordapp.net/stickers/" + sticker.id + (sticker.format_type === 4 ? ".gif" : ".png") + "?size=160");
    }
    function nativeSticker(sticker, channel, user) {
        return !settings.forceLinks && sticker && sticker.available !== false &&
            (!sticker.guild_id || sticker.guild_id === channel.guild_id || capability("canUseCustomStickersEverywhere", user));
    }
    function sendStickers(orig, self, args) {
        if (!enabled("stickers") || !Array.isArray(args[1]) || !args[1].length || !stickerStore || !channelStore) return orig.apply(self, args);
        const user = currentUser(), channel = channelStore.getChannel(args[0]);
        if (!user || !channel) return orig.apply(self, args);
        const keep = [], links = [];
        for (const id of args[1]) {
            const sticker = stickerStore.getStickerById(id);
            if (!sticker) return orig.apply(self, args);
            if (nativeSticker(sticker, channel, user)) { keep.push(id); continue; }
            const link = stickerLink(sticker);
            // Fail closed as a whole: never drop an unknown/unsupported sticker from a mixed send.
            if (!link) return orig.apply(self, args);
            links.push(link);
        }
        if (!links.length) return orig.apply(self, args);
        const message = args[2], content = typeof message === "string" ? message : message && message.content || "";
        const combined = (content ? content + "\n" : "") + links.join("\n");
        if (combined.length > (user.premiumType === 2 ? 4000 : 2000)) return orig.apply(self, args);
        const next = Array.from(args); next[1] = keep;
        next[2] = emojiMessage(Object.assign({}, typeof message === "object" ? message : null, { content: combined }), args[0]);
        // Original sendStickers preserves replies, TTS, nonce, permissions and native stickers in one message.
        return orig.apply(self, next);
    }
    function sendability(orig, self, args) {
        const result = orig.apply(self, args), sticker = args[0];
        return enabled("stickers") && stickerRules && result === stickerRules.StickerSendability.SENDABLE_WITH_PREMIUM && stickerLink(sticker) ? stickerRules.StickerSendability.SENDABLE : result;
    }
    function sendableSticker(orig, self, args) {
        const result = orig.apply(self, args);
        if (result || !enabled("stickers") || !stickerRules) return result;
        const code = stickerRules.getStickerSendability.apply(stickerRules, args);
        return code === stickerRules.StickerSendability.SENDABLE;
    }
    let msgStore, msgActions, permissions, viewPermission, locale, dispatcher, messageRecords, chatHeight, jumpPill, jumpIcon;
    let permissionsCanOrig = null;
    let deletedRevision = 0, archiveRestored = false, archiveLoading = false, archiveWriting = false, archivePending;
    const deletedViews = new Map();
    const ARCHIVE = "venus-deleted-messages.json";
    const deleted = new Map(), deletedByChannel = new Map();
    let archiveTimer;
    const hiddenViews = new Map(), hiddenNames = new Map();
    let hiddenAccount;
    function receivedName(channel) {
        if (!channel || typeof channel.name !== "string") return null;
        const trimmed = channel.name.trim();
        if (!trimmed) return null;
        // Server redactions: "hidden", "__hidden__", "_hidden" and underscore variants (HBC string 34016).
        // Strip surrounding underscores and compare case-insensitively so redacted stubs never pollute the cache.
        if (trimmed.replace(/^_+|_+$/g, "").toLowerCase() === "hidden") return null;
        // Never cache our own unavailable facades as if they were real names.
        if (trimmed === "Hidden channel (name unavailable)" || trimmed === "Hidden category (name unavailable)") return null;
        return channel.name;
    }
    function rememberChannelName(channel, accountId, knownName) {
        // Directory scans pass the account once; don't ask UserStore again for every channel.
        let owner = accountId;
        if (typeof owner !== "string") { const current = userStore && userStore.getCurrentUser(); owner = current && current.id; }
        if (hiddenAccount !== owner) {hiddenNames.clear();hiddenAccount = owner;}
        const name = knownName || receivedName(channel);
        if (!channel || !channel.guild_id || !channel.id || !name) return;
        const known = hiddenNames.get(channel.id);
        // READY replays thousands of unchanged names: don't churn the cache for them.
        if (known && known.guild === channel.guild_id && known.name === name) return;
        if (hiddenNames.size >= 4096 && !known) hiddenNames.delete(hiddenNames.keys().next().value);
        hiddenNames.set(channel.id,{guild:channel.guild_id,name});
    }
    function hiddenName(channel) {
        // Basic records can retain names absent from full/obfuscated records. Never
        // fetch an inaccessible channel, guess a name, or change its permissions/flags.
        const current = userStore && userStore.getCurrentUser();
        if (hiddenAccount !== (current && current.id)) {hiddenNames.clear();hiddenAccount = current && current.id;}
        const basic = channelStore && typeof channelStore.getBasicChannel === "function" && channelStore.getBasicChannel(channel.id);
        const full = channelStore && typeof channelStore.getChannel === "function" && channelStore.getChannel(channel.id);
        const name = receivedName(channel) || (basic && basic.guild_id === channel.guild_id && receivedName(basic)) ||
            (full && full.guild_id === channel.guild_id && receivedName(full));
        if (name) {rememberChannelName(channel,hiddenAccount,name);return name;}
        const cached = hiddenNames.get(channel.id);
        return cached && cached.guild === channel.guild_id ? cached.name : channel.type === 4 ? "Hidden category (name unavailable)" : "Hidden channel (name unavailable)";
    }
    const CHANNEL_EVENTS = new Set(["CHANNEL_CREATE","CHANNEL_UPDATE"]), GUILD_EVENTS = new Set(["GUILD_CREATE","GUILD_UPDATE"]);
    const READY_EVENTS = new Set(["CONNECTION_OPEN","CONNECTION_OPEN_SUPPLEMENTAL"]), BATCH_EVENTS = new Set(["CHANNEL_UPDATES","THREAD_LIST_SYNC"]);
    const MESSAGE_EVENTS = new Set(["MESSAGE_CREATE","MESSAGE_UPDATE"]), RESTORE_EVENTS = new Set(["CONNECTION_OPEN","CACHE_LOADED"]);
    // Every Flux event passes through here: leave typing, presence, voice and the rest alone.
    const HIDDEN_EVENTS = new Set(["LOGOUT","CHANNEL_DELETE","GUILD_DELETE",...CHANNEL_EVENTS,...GUILD_EVENTS,...READY_EVENTS,...BATCH_EVENTS,...MESSAGE_EVENTS]);
    function channelMetadataEvent(event) {
        if (!HIDDEN_EVENTS.has(event.type)) return;
        // Most messages mention no channels; skip the account lookup for them.
        if (MESSAGE_EVENTS.has(event.type)) {
            const msg = event.message || event;
            if (!msg || !Array.isArray(msg.mention_channels) || !msg.mention_channels.length) return;
        }
        const current = userStore && userStore.getCurrentUser();
        // This hook runs BEFORE UserStore handles READY. Scope its metadata to
        // the incoming user, otherwise the first post-READY lookup erases it.
        const owner = event.type === "CONNECTION_OPEN" && event.user && event.user.id || current && current.id;
        if (event.type === "LOGOUT" || hiddenAccount !== owner) {
            hiddenNames.clear();hiddenViews.clear();hiddenAccount = owner;
            try { hiddenConfirmed.clear(); hiddenPrompts.clear(); } catch (_) {}
        }
        if (event.type === "CHANNEL_DELETE") hiddenNames.delete(event.channel && event.channel.id || event.channelId || event.id);
        if (event.type === "GUILD_DELETE") {
            const guild = event.guild && event.guild.id || event.guildId;
            for (const [id,entry] of hiddenNames) if (entry.guild === guild) hiddenNames.delete(id);
        }
        if (!features.hiddenChannels) return;
        // Cache even while the toggle is off so enabling later still has READY names.
        if (CHANNEL_EVENTS.has(event.type)) rememberChannelName(event.channel,owner);
        function rememberGuild(guild) {
            if (!guild || !guild.id) return;
            for (const key of ["channels","threads"]) if (Array.isArray(guild[key]))
                guild[key].forEach(channel => rememberChannelName(Object.assign({guild_id:guild.id},channel),owner));
        }
        if (GUILD_EVENTS.has(event.type)) rememberGuild(event.guild);
        if (READY_EVENTS.has(event.type) && Array.isArray(event.guilds)) event.guilds.forEach(rememberGuild);
        if (BATCH_EVENTS.has(event.type)) {
            for (const key of ["channels","threads"]) if (Array.isArray(event[key]))
                event[key].forEach(channel => rememberChannelName(Object.assign({guild_id:event.guildId},channel),owner));
        }
        // Real unobfuscated names arrive inside message mention_channels (fn34524/fn35281):
        // harvest them so mentioned hidden channels resolve even when stores are redacted.
        if (MESSAGE_EVENTS.has(event.type)) {
            const msg = event.message || event;
            const mentions = msg && Array.isArray(msg.mention_channels) && msg.mention_channels;
            if (mentions) mentions.forEach(channel => rememberChannelName(channel, owner));
        }
    }
    function typing(orig, self, args) {
        return enabled("noTyping") ? undefined : orig.apply(self, args);
    }
    function quickConfirm(orig, self, args) {
        const popup = args[0];
        if (!popup || typeof popup.onConfirm !== "function" || !locale || !locale.intl || !locale.t)
            return orig.apply(self, args);
        const title = popup.children && popup.children.props && popup.children.props.title;
        const texts = [title, popup.body].filter(text => typeof text === "string");
        // Localized, exact confirmation strings. No generic 'delete' matching, and
        // no interception of leave-server, ban, channel or account confirmations.
        function matches(key) {
            const token = locale.t[key];
            const label = token && locale.intl.string(token);
            return typeof label === "string" && label.length > 3 && texts.some(text => text === label);
        }
        if (enabled("quickDelete") && matches("AMvpS4") || enabled("quickDeleteEmbeds") && matches("vXZ+Fo"))
            return popup.onConfirm();
        return orig.apply(self, args);
    }
    function deletedKey(channelId, id) { return channelId + ":" + id; }
    function invalidateDeleted() { deletedRevision++; deletedViews.clear(); }
    function keepDeleted(key, entry) {
        deleted.set(key, entry);
        let bucket = deletedByChannel.get(entry.channelId);
        if (!bucket) deletedByChannel.set(entry.channelId, bucket = new Map());
        bucket.set(key, entry);
    }
    function dropDeleted(key) {
        const entry = deleted.get(key);
        if (!entry) return null;
        deleted.delete(key);
        const bucket = deletedByChannel.get(entry.channelId);
        if (bucket) { bucket.delete(key); if (!bucket.size) deletedByChannel.delete(entry.channelId); }
        return entry;
    }
    function retainable(message, event) {
        // Only messages someone else removed from the server. Your own deletions, unsent or
        // failed local messages and dismissed ephemeral ("Only you can see this") messages
        // must disappear exactly like stock Discord.
        // Your own sent messages are kept too (red outline), as intended: every deletion is kept.
        if (!message) return false;
        if (message.state != null && message.state !== "SENT") return false;
        return !((Number(message.flags) || 0) & 64);
    }
    function persistDeleted() {
        // Coalesce bursts (raids, purges) into one archive write instead of one full
        // serialization per deleted message.
        // Once the archive is erased there is nothing on disk to update: don't rewrite the
        // same empty file for every later deletion while saving is off.
        if (!files || status.storage === "loading" ||
            !(settings.noDeleteSave || archiveRestored || status.archive && status.archive !== "erased")) return;
        if (archiveTimer !== undefined) return;
        archiveTimer = later(() => { archiveTimer = undefined; writeArchive(); }, 750);
    }
    function writeArchive() {
        if (!files || status.storage === "loading") return;
        const user = userStore && userStore.getCurrentUser && userStore.getCurrentUser();
        if (settings.noDeleteSave && (!user || !archiveRestored)) return;
        try {
            archivePending = JSON.stringify({version:1, accountId:settings.noDeleteSave && user ? user.id : null,
                messages:settings.noDeleteSave ? Array.from(deleted.values(), archiveEntry).filter(Boolean) : []});
            if (archivePending.length > ARCHIVE_BYTES) throw new Error("Deleted message archive exceeds 32 MB");
        } catch (_) { status.archive = "save failed"; notify(); return; }
        if (archiveWriting) return;
        archiveWriting = true;
        function write() {
            const snapshot = archivePending; archivePending = undefined;
            return Promise.resolve().then(() => files.writeFile("documents", ARCHIVE, snapshot, "utf8"))
                .then(() => {status.archive = settings.noDeleteSave ? "saved locally" : "erased";}, () => {status.archive = "save failed";})
                .then(() => {notify(); if (archivePending !== undefined) return write(); archiveWriting = false;});
        }
        Promise.resolve().then(write);
    }
    function restoreDeleted() {
        if (!enabled("noDelete") || !enabled("noDeleteSave") || !files || !messageRecords || archiveRestored || archiveLoading || status.storage === "loading") return;
        const user = userStore && userStore.getCurrentUser && userStore.getCurrentUser();
        const constants = files.getConstants && files.getConstants();
        if (!user || !constants || typeof constants.DocumentsDirPath !== "string") return;
        const accountId = user.id, path = constants.DocumentsDirPath.replace(/\/$/, "") + "/" + ARCHIVE;
        archiveLoading = true;
        Promise.resolve().then(() => files.fileExists(path)).then(exists => exists ? files.readFile(path,"utf8") : null).then(text => {
            const current = userStore.getCurrentUser();
            if (!enabled("noDelete") || !enabled("noDeleteSave") || !current || current.id !== accountId) return;
            // Messages kept before the archive loaded, or saved ones that didn't all fit, mean the file needs updating.
            // Otherwise it already says exactly this, and opening Discord no longer rewrites it every time.
            let restored = 0, changed = deleted.size > 0 || !text;
            if (text) {
                if (text.length > ARCHIVE_BYTES) throw new Error("Archive too large");
                const saved = JSON.parse(text);
                if (saved.version !== 1 || !Array.isArray(saved.messages) || saved.messages.length > MAX_DELETED) throw new Error("Invalid archive");
                if (saved.accountId !== accountId) changed = true;
                else saved.messages.forEach(entry => {
                    if (!entry || typeof entry.id !== "string" || typeof entry.channelId !== "string" || !entry.message || entry.message.id !== entry.id || entry.message.channel_id !== entry.channelId || !entry.message.author) { changed = true; return; }
                    const key = deletedKey(entry.channelId,entry.id);
                    if (deleted.size < settings.noDeleteLimit && !deleted.has(key)) {
                        try { entry.message = Object.assign({},entry.message); keepDeleted(key,{type:"MESSAGE_DELETE",channelId:entry.channelId,id:entry.id,raw:entry.message,message:markDeleted(messageRecords.createMessageRecord(entry.message))}); restored++; }
                        catch (_) { changed = true; /* Invalid individual records do not poison the archive. */ }
                    } else changed = true;
                });
            }
            archiveRestored = true; invalidateDeleted();
            if (changed) persistDeleted(); else status.archive = "saved locally";
            if (!restored && !changed) return;
            if (msgStore && typeof msgStore.emitChange === "function") msgStore.emitChange();
        }).catch(() => {status.archive = "restore failed"; notify();}).finally(() => {archiveLoading = false;});
    }
    function markDeleted(message) {
        // Identity refresh only. Deletion styling belongs to row presentation, never
        // content: copying, replies, mentions, links and archives retain the original.
        const copy = Object.create(Object.getPrototypeOf(message),Object.getOwnPropertyDescriptors(message));
        // ChatManager.determineChangeType (HBC fn54452) deep-compares old and new records with
        // objEquiv (enumerable keys) and returns NOOP for equal ones, so an identical copy never
        // re-rendered the row until the chat was reopened. One enumerable marker key makes the
        // retained record differ and the red outline appear immediately; content is untouched.
        try { Object.defineProperty(copy,"venusDeleted",{value:true,enumerable:true,configurable:true}); } catch (_) {}
        return copy;
    }
    // Built on first save, not on every deletion: most people never turn saving on.
    function archiveEntry(entry) {
        if (entry.raw === undefined) { try { entry.raw = rawDeleted(entry.message, entry); } catch (_) { entry.raw = null; } }
        return entry.raw ? {channelId:entry.channelId,id:entry.id,message:entry.raw} : null;
    }
    function rawDeleted(message, event) {
        // Retain content/metadata only; no tokens, downloaded attachments or remote fetches.
        const raw = {id:event.id,channel_id:event.channelId,content:message.content || "",author:message.author,
            timestamp:message.timestamp && typeof message.timestamp.toISOString === "function" ? message.timestamp.toISOString() : message.timestamp,
            type:message.type || 0,flags:message.flags || 0,attachments:message.attachments || [],embeds:message.embeds || [],
            mentions:message.mentions || [],mention_roles:message.mentionRoles || [],referenced_message:null};
        return JSON.parse(JSON.stringify(raw));
    }
    // One Flux removal per channel instead of one dispatch (and store emit) per message.
    function dispatchRemovals(entries) {
        if (!dispatcher || !entries.length) return;
        const byChannel = new Map();
        entries.forEach(entry => { const ids = byChannel.get(entry.channelId); if (ids) ids.push(entry.id); else byChannel.set(entry.channelId, [entry.id]); });
        byChannel.forEach((ids, channelId) => dispatcher(ids.length === 1 ? {type:"MESSAGE_DELETE",channelId,id:ids[0]} : {type:"MESSAGE_DELETE_BULK",channelId,ids}));
    }
    function trimDeleted() {
        // Lowering the maximum from 5000 to 1 used to send up to 4999 separate deletes.
        const removed = [];
        while (deleted.size > settings.noDeleteLimit) {
            const pending = dropDeleted(deleted.keys().next().value);
            if (!pending) break;
            removed.push(pending);
        }
        if (!removed.length) return;
        invalidateDeleted(); persistDeleted(); dispatchRemovals(removed);
    }
    function clearDeleted(remove, keepArchive) {
        const events = Array.from(deleted.values());
        deleted.clear(); deletedByChannel.clear(); invalidateDeleted();
        if (remove) dispatchRemovals(events);
        if (remove && !keepArchive) persistDeleted();
    }
    function retainedMessage(orig, self, args) {
        // Hot path (every row render): skip the key build while nothing is kept in this channel.
        const bucket = deleted.size && enabled("noDelete") && deletedByChannel.get(args[0]);
        const entry = bucket && bucket.get(deletedKey(args[0],args[1]));
        return entry ? entry.message : orig.apply(self,args);
    }
    function retainedMessages(orig, self, args) {
        const result = orig.apply(self,args), channelId = args[0];
        if (!enabled("noDelete") || !result) return result;
        const bucket = deletedByChannel.get(channelId);
        if (!bucket || typeof result.merge !== "function") return result;
        const cached = deletedViews.get(channelId);
        if (cached && cached.orig === result && cached.revision === deletedRevision) return cached.value;
        const array = Array.isArray(result._array) ? result._array : null;
        const first = array && array.length ? String(array[0].id) : null, last = array && array.length ? String(array[array.length - 1].id) : null;
        const older = (a, b) => a.length - b.length || (a === b ? 0 : a < b ? -1 : 1);
        // Never paste a retained message into a window that doesn't contain its position;
        // that produced out-of-place rows above unloaded history or below an older jump.
        const records = [];
        bucket.forEach(entry => {
            const id = String(entry.id);
            if (first !== null && /^\d+$/.test(id) && /^\d+$/.test(first)) {
                if (older(id, first) < 0 && result.hasMoreBefore === true) return;
                if (older(id, last) > 0 && result.hasMoreAfter === true) return;
            }
            records.push(entry.message);
        });
        if (!records.length) { deletedViews.set(channelId,{orig:result,revision:deletedRevision,value:result}); return result; }
        // Discord's ChannelMessages has immutable merge()/mutate(), NOT clone().
        // clone() exists only on its internal before/after caches. Never mutate the store.
        let value = typeof result.clone === "function" ? result.clone().merge(records) : result.merge(records);
        // Native merge appends cache-missing records without sorting. Re-sort only
        // our private view's array, via native immutable mutate, never the live store.
        if (typeof value.mutate === "function" && Array.isArray(value._array)) value = value.mutate(copy => {
            // Check each id once instead of running two regexes per comparison.
            const ids = new Map();
            const idOf = message => {
                let id = ids.get(message);
                if (id === undefined) { const text = String(message.id); id = /^\d+$/.test(text) ? text : null; ids.set(message, id); }
                return id;
            };
            copy._array.sort((a,b) => {
                const left = idOf(a), right = idOf(b);
                if (left === null || right === null) return 0;
                return left.length - right.length || (left === right ? 0 : left < right ? -1 : 1);
            });
        },true);
        if (deletedViews.size >= 16) deletedViews.delete(deletedViews.keys().next().value);
        deletedViews.set(channelId,{orig:result,revision:deletedRevision,value});
        return value;
    }
    function rememberDeleted(event, orig, self) {
        const key = deletedKey(event.channelId, event.id);
        if (deleted.has(key)) return true;
        const message = msgStore && msgStore.getMessage(event.channelId,event.id);
        if (!retainable(message, event)) return false;
        while (deleted.size >= settings.noDeleteLimit) {
            const pending = dropDeleted(deleted.keys().next().value);
            if (!pending) break;
            orig.call(self,{type:"MESSAGE_DELETE",channelId:pending.channelId,id:pending.id});
        }
        keepDeleted(key,{type:"MESSAGE_DELETE",channelId:event.channelId,id:event.id,message:markDeleted(message),raw:undefined});
        invalidateDeleted(); persistDeleted();
        // Update the underlying collection too: native row diffing compares record identity.
        // The retained view supplies a new record; do not corrupt content to force a diff.
        // The store's own MESSAGE_UPDATE change re-renders; never emitChange mid-dispatch.
        return orig.call(self,{type:"MESSAGE_UPDATE",message:{id:event.id,channel_id:event.channelId,content:message.content || ""}}) || true;
    }
    function dispatchEvent(orig, self, args) {
        const event = args[0];
        if (!event) return orig.apply(self, args);
        if (features.hiddenChannels) channelMetadataEvent(event);
        if (event.type === "LOGOUT") { clearDeleted(false); archiveRestored = false; clearReviewAuth(); }
        if (features.noDelete && RESTORE_EVENTS.has(event.type)) Promise.resolve().then(restoreDeleted);
        // Views are keyed by the store's own ChannelMessages identity, so unrelated events
        // (typing, presence, reactions) no longer force a re-merge and re-sort of every chat.
        if (event.type === "CHANNEL_DELETE") {
            const id = event.channel && event.channel.id || event.channelId || event.id, bucket = deletedByChannel.get(id);
            if (bucket) { Array.from(bucket.keys()).forEach(dropDeleted); invalidateDeleted(); persistDeleted(); }
        }
        if (!enabled("noDelete")) return orig.apply(self, args);
        if (event.type === "MESSAGE_DELETE" && event.channelId && event.id) {
            // Your own deletion of a message we were already showing: remove it for real.
            const kept = rememberDeleted(event, orig, self);
            // Discord's deleteMessage chains .then() on dispatch(); always hand back a thenable.
            if (kept) return kept === true ? Promise.resolve() : kept;
        }
        if (event.type === "MESSAGE_DELETE_BULK" && event.channelId && Array.isArray(event.ids)) {
            const remaining = event.ids.filter(id => !rememberDeleted({channelId:event.channelId,id}, orig, self));
            if (!remaining.length) return Promise.resolve();
            const next = Array.from(args); next[0] = Object.assign({}, event, {ids:remaining});
            return orig.apply(self, next);
        }
        return orig.apply(self, args);
    }
    function deleteMessage(orig, self, args) {
        const key = deletedKey(args[0], args[1]), event = deleted.get(key);
        if (event && dispatcher) {
            dropDeleted(key); invalidateDeleted(); persistDeleted(); dispatcher({type:"MESSAGE_DELETE",channelId:event.channelId,id:event.id});
            return Promise.resolve(); // Dismiss locally; never DELETE an already-deleted message on the server.
        }
        // Your own deletions are kept like anyone else's, so there is nothing to track here.
        return orig.apply(self, args);
    }
    function jumpButton(orig, self, args) {
        if (React) useSettings("jumpToTop");
        const props = args[0], screenIndex = props && props.screenIndex;
        // Same native hooks as JumpToPresent; respects composer resizing and suggestion bars.
        const inputHeight = chatHeight && chatHeight.useChatInputContainerHeight(screenIndex);
        const suggestionHeight = chatHeight && chatHeight.useSmallSuggestionBarHeight(screenIndex);
        const result = orig.apply(self, args);
        if (!enabled("jumpToTop") || !React || !RN || !props || !props.channelId || !msgActions) return result;
        const channelId = props.channelId;
        if (hiddenChannel(channelId)) return result;
        const onPress = () => msgActions.jumpToMessage({channelId, messageId:channelId, flash:true, jumpType:"ANIMATED"});
        const child = result && result.props && result.props.children;
        if (child && child.props && typeof child.props.onPress === "function") {
            const top = React.cloneElement(child, {key:"venus-jump-top", onPress, accessibilityLabel:"Jump to top"});
            return React.cloneElement(result, {children:el(RN.View, {style:{gap:8}},
                el(RN.View, {style:{transform:[{scaleY:-1}]}}, top), child)});
        }
        if (result || !jumpPill || !jumpIcon) return result;
        // Never render bare black text over chat/media. Use Discord's themed native pill.
        const bottom = Math.max(0,Number.isFinite(inputHeight) ? inputHeight : 64) + Math.max(0,Number(suggestionHeight) || 0) + 12;
        return el(RN.View, {pointerEvents:"box-none", style:{position:"absolute",bottom,right:16}},
            el(RN.View,{style:{transform:[{scaleY:-1}]}},
                el(jumpPill,{icon:jumpIcon,onPress,accessibilityLabel:"Jump to top"})));
    }
    function hiddenCan(orig, self, args) {
        // One real permission check per call. The old path ran it twice for every visible
        // channel, and re-checked canBasicChannel with the full can(), which reads a
        // different record shape (348.10 PermissionStore: basicPermissions).
        const real = orig.apply(self, args);
        if (real || !enabled("hiddenChannels")) return real;
        const bit = args[0], channel = args[1];
        // Escape hatch: a channel with realCheck asks for the true permission result.
        // Loose equality: VIEW_CHANNEL can be BigInt/object across module copies.
        return !!(channel && !channel.realCheck && viewPermission != null && bit == viewPermission &&
            channel.guild_id && channel.type !== 1 && channel.type !== 3) || real;
    }
    // The mobile list has a second VIEW_CHANNEL filter. Give ONLY that factory a
    // metadata-list facade; the real permission store and all other callers stay stock.
    function listImport(importer) {
        if (typeof importer !== "function") return importer;
        return function () {
            const result = importer.apply(this,arguments);
            if (!result || ![2051,4472].includes(arguments[0])) return result;
            const real = result.default || result;
            if (arguments[0] === 2051) {
                const methods=new Map();
                const facade=new Proxy(real,{get(target,key) {
                    const value=Reflect.get(target,key,target);
                    if (typeof value!=="function") return value;
                    const old=methods.get(key);
                    if (old && old.original===value) return old.bound;
                    const lookup=["getChannel","getBasicChannel"].includes(key);
                    const bound=function () {
                        const channel=value.apply(real,arguments);
                        return lookup && channel && enabled("hiddenChannels") ? displayChannel(channel) : channel;
                    };
                    methods.set(key,{original:value,bound});return bound;
                }});
                return result.default ? cloneWith(result,"default",facade) : facade;
            }
            if (typeof real.can !== "function") return result;
            const facade = Object.create(real);
            facade.can = function (bit, channel) {
                // Loose equality like hiddenCan: VIEW_CHANNEL can be a BigInt or number across module copies.
                if (viewPermission != null && bit == viewPermission && hiddenMetadata(channel)) return true;
                return real.can.apply(real,arguments);
            };
            return result.default ? cloneWith(result,"default",facade) : facade;
        };
    }
    function receivedChannel(id) {
        if (!channelStore || !id) return null;
        return channelStore.getChannel(id) || typeof channelStore.getBasicChannel === "function" && channelStore.getBasicChannel(id);
    }
    function realCan(bit, channel) {
        // Real permission result, bypassing our own global facade.
        // Honours the realCheck escape hatch.
        if (channel && channel.realCheck) { channel = Object.assign({}, channel); delete channel.realCheck; }
        // permissionsCanOrig is always set before permissions, so no second path is needed.
        try { return !!permissionsCanOrig && permissionsCanOrig(bit, channel); } catch (_) { return false; }
    }
    function hiddenMetadata(value) {
        if (!enabled("hiddenChannels")) return false;
        const channel = typeof value === "string" ? receivedChannel(value) : value;
        return !!(channel && channel.guild_id && channel.type !== 1 && channel.type !== 3 &&
            permissions && viewPermission != null && !realCan(viewPermission, channel));
    }
    function hiddenChannel(value) {
        const channel = typeof value === "string" ? receivedChannel(value) : value;
        return !!(channel && channel.type !== 4 && hiddenMetadata(channel));
    }
    function displayChannel(channel) {
        if (!hiddenMetadata(channel)) return channel;
        const name = hiddenName(channel);
        return name === channel.name ? channel : cloneWith(channel,"name",name);
    }
    function hiddenDirectory(orig, self, args) {
        const result = orig.apply(self, args), guild = args[0];
        // Always cache names from the current store even while the toggle is off,
        // so enabling later still resolves. This read-only scan never changes permissions.
        // One read of both caches per lookup; the remembered names are reused below.
        let full, basic, source;
        // Resolve the account once per lookup, not once per channel, and walk basic then full
        // records: the same final cache as walking the merged map, without visiting basic twice.
        function remember() {
            const current = userStore && userStore.getCurrentUser(), owner = current && current.id;
            const keep = channel => rememberChannelName(channel, owner);
            if (basic) Object.values(basic).forEach(keep);
            Object.values(full).forEach(keep);
        }
        function read() {
            full = channelStore.getMutableGuildChannelsForGuild(guild);
            if (!full) return;
            basic = typeof channelStore.getMutableBasicGuildChannelsForGuild === "function" && channelStore.getMutableBasicGuildChannelsForGuild(guild);
            // Native lazy caching keeps basic metadata for channels with no full record.
            // Merge by ID, with full records retaining their richer native prototype.
            source = basic ? Object.assign({},basic,full) : full;
            remember();
        }
        const readable = guild && channelStore && typeof channelStore.getMutableGuildChannelsForGuild === "function";
        try { if (readable) read(); } catch (_) { source = undefined; }
        if (!enabled("hiddenChannels") || !result || !readable || !permissions) return result;
        // The read above threw part-way: retry once, letting a real error surface as before.
        if (!source) { read(); if (!source) return result; }
        const extra = Object.values(source).filter(channel => hiddenMetadata(channel));
        // Recheck permissions and metadata on each directory lookup; retain stable
        // array identity for unchanged inputs and bound the cache to 16 guilds.
        const names = new Map(extra.map(c => [c, hiddenName(c)]));
        const signature = extra.map(c => [c.id,c.position,c.type,c.parent_id,names.get(c)].join(":")).join("|");
        const references = extra.concat(extra.map(c => source[c.parent_id]).filter(Boolean));
        const cached = hiddenViews.get(guild);
        if (cached && cached.orig === result && cached.source === full && cached.basic === basic && cached.signature === signature &&
            references.length === cached.references.length && references.every((c,i) => c === cached.references[i])) return cached.value;
        let next = result;
        function append(key, channels) {
            if (!Array.isArray(next[key])) return;
            const original = next[key];
            const existing = original.map(entry => {
                if (!entry.channel) return entry;
                const channel = displayChannel(entry.channel);
                return channel === entry.channel ? entry : Object.assign({},entry,{channel});
            });
            const renamed = existing.some((entry,index) => entry !== original[index]);
            const ids = new Set(existing.map(entry => entry.channel && entry.channel.id));
            const added = [];
            channels.forEach(channel => {
                if (ids.has(channel.id)) return;
                ids.add(channel.id);
                const name = names.get(channel);
                // Hidden names were resolved for the signature above; reuse them instead of asking again.
                const shown = name === undefined ? displayChannel(channel) : name === channel.name ? channel : cloneWith(channel,"name",name);
                added.push({channel:shown,comparator:channel.position || 0});
            });
            if (!added.length && !renamed) return;
            if (next === result) next = Object.assign({}, result);
            next[key] = existing.concat(added).sort((a,b) => a.comparator - b.comparator);
        }
        for (const type of [0,2,4,5,10,11,12,13,15,16]) append(type, extra.filter(c => c.type === type));
        append("SELECTABLE", extra.filter(c => ![2,4,13].includes(c.type)));
        append("VOCAL", extra.filter(c => [2,13].includes(c.type)));
        append(4, extra.map(c => source[c.parent_id]).filter(c => c && c.type === 4));
        if (hiddenViews.size >= 16 && !hiddenViews.has(guild)) hiddenViews.delete(hiddenViews.keys().next().value);
        hiddenViews.set(guild, {orig:result,source:full,basic,signature,references,value:next});
        return next;
    }
    const hiddenConfirmed = new Set();
    function hiddenFetch(orig, self, args) {
        const channelId = typeof args[0] === "string" ? args[0] : args[0] && args[0].channelId;
        if (!hiddenChannel(channelId) || hiddenConfirmed.has(channelId)) return orig.apply(self, args);
        const channel = receivedChannel(channelId);
        showHidden(channel, () => { hiddenConfirmed.add(channelId); return orig.apply(self, args); });
        return Promise.resolve();
    }
    function preciseAgo(ms) {
        // Precise relative durations:
        // "8 days, 7 hours and 7 minutes ago". Three largest nonzero units.
        if (!Number.isFinite(ms)) return null;
        let diff = Date.now() - ms;
        if (diff < 0) diff = 0;
        const minute = 60000, hour = 60 * minute, day = 24 * hour, month = 30 * day, year = 365 * day;
        const parts = [];
        function take(unit, singular, plural) {
            const value = Math.floor(diff / unit);
            if (value > 0) { parts.push(value + " " + (value === 1 ? singular : plural)); diff -= value * unit; }
        }
        if (diff < 45 * 1000) {
            const secs = Math.floor(diff / 1000);
            return secs <= 5 ? "just now" : secs + " seconds ago";
        }
        take(year, "year", "years"); take(month, "month", "months"); take(day, "day", "days");
        take(hour, "hour", "hours"); take(minute, "minute", "minutes");
        const shown = parts.slice(0, 3);
        if (!shown.length) return "just now";
        if (shown.length === 1) return shown[0] + " ago";
        return shown.slice(0, -1).join(", ") + " and " + shown[shown.length - 1] + " ago";
    }
    function snowflakeMs(id) {
        if (typeof id !== "string" || !/^\d{17,20}$/.test(id)) return NaN;
        try { return Number(BigInt(id) >> BigInt(22)) + 1420070400000; }
        catch (_) { return NaN; }
    }
    function hiddenStamp(value, fallback) {
        // {relative, absolute} for a snowflake, Date or ISO timestamp.
        let ms = NaN;
        if (typeof value === "string" && /^\d{17,20}$/.test(value)) ms = snowflakeMs(value);
        else if (value instanceof Date) ms = value.getTime();
        else if (value != null && value !== "") {
            const parsed = new Date(value);
            if (Number.isFinite(parsed.getTime())) ms = parsed.getTime();
        }
        const relative = preciseAgo(ms);
        if (relative === null) return {relative:fallback, absolute:null};
        let absolute = null;
        try { absolute = new Date(ms).toLocaleString(); } catch (_) {}
        return {relative, absolute};
    }
    function hiddenDetails(channel) {
        const pin = channel.lastPinTimestamp || channel.last_pin_timestamp;
        const last = channel.lastMessageId || channel.last_message_id;
        return [
            ["Created", hiddenStamp(channel.id, "Unavailable")],
            ["Last message", last ? hiddenStamp(last, "No messages yet") : {relative:"No messages yet", absolute:null}],
            ["Last pin", pin ? hiddenStamp(pin, "No pins yet") : {relative:"No pins yet", absolute:null}]
        ];
    }
    function HiddenDetails(props) {
        // Rendered inside Discord's own AlertModal (HBC98 module 5210) as extraContent:
        // native Text tokens follow the active theme; no hardcoded colors or backdrop.
        const Text = props.Text;
        return el(RN.View, {style:{gap:14}}, props.rows.map(([label, stamp]) =>
            el(RN.View, {key:label, style:{gap:2}},
                el(Text, {variant:"text-xs/semibold", color:"text-muted"}, label.toUpperCase()),
                el(Text, {variant:"text-md/medium", color:"text-default", selectable:true}, stamp.relative),
                stamp.absolute ? el(Text, {variant:"text-sm/medium", color:"text-muted", selectable:true}, stamp.absolute) : null)));
    }
    // One prompt per channel at a time: a navigation guard and a fetch guard can
    // fire for the same tap, which used to stack duplicate dialogs. Native
    // backdrop dismissal calls onCancel (HBC98 closure #80886), so every close
    // path releases the guard; 30 s is only a safety net.
    const hiddenPrompts = new Map();
    function showHidden(channel, onViewAnyway) {
        if (!channel || !RN) return;
        const now = Date.now(), open = hiddenPrompts.get(channel.id);
        if (open && now - open.at < 30000) return;
        const prompt = {at:now};
        hiddenPrompts.set(channel.id, prompt);
        const settle = () => { if (hiddenPrompts.get(channel.id) === prompt) hiddenPrompts.delete(channel.id); };
        const confirm = () => { settle(); if (typeof onViewAnyway === "function") onViewAnyway(); };
        const rows = hiddenDetails(channel);
        const title = channel.type === 2 || channel.type === 13 ? "Locked voice channel" : "Locked channel";
        const body = "You don't have permission to view this channel. These details come from what Discord already sent your client.";
        // Discord's native alert (the "Delete Message" dialog): blurred backdrop,
        // themed card, Discord buttons. String title/body/confirmText + children
        // selects the modern AlertModal path in AlertActionCreators.show (module 5205).
        // Demand-loaded at tap time: no extra Metro factories are wrapped at startup.
        const alerts = inspectedExport(5205, "default");
        const Text = inspectedExport(4833, "Text");
        if (React && alerts && typeof alerts.show === "function" && Text) {
            try {
                alerts.show({title, body, children:el(HiddenDetails, {rows, Text}),
                    confirmText:"View Anyway", cancelText:"Cancel", onConfirm:confirm, onCancel:settle});
                return;
            } catch (_) { /* fall through to the platform alert */ }
        }
        if (!RN.Alert) {settle();return;}
        const message = rows.map(([label, stamp]) => label + ": " + stamp.relative + (stamp.absolute ? " (" + stamp.absolute + ")" : "")).join("\n");
        try {
            RN.Alert.alert(title, message, [
                {text:"Cancel", style:"cancel", onPress:settle},
                {text:"View Anyway", onPress:confirm}
            ], {cancelable:true, onDismiss:settle});
        } catch (_) { settle(); }
    }
    function hiddenNavigation(orig, self, args) {
        const route = args[0];
        const match = typeof route === "string" && /^\/channels\/(?:@me|[^/]+)\/([^/?#]+)(?:[/?#]|$)/.exec(route);
        if (!match || !hiddenChannel(match[1]) || hiddenConfirmed.has(match[1])) return orig.apply(self, args);
        const id = match[1];
        showHidden(receivedChannel(id), () => { hiddenConfirmed.add(id); return orig.apply(self, args); });
        return; // Wait for user choice; View Anyway then navigates.
    }
    function hiddenGuildNavigation(orig, self, args) {
        if (!hiddenChannel(args[1]) || hiddenConfirmed.has(args[1])) return orig.apply(self, args);
        const id = args[1];
        showHidden(receivedChannel(id), () => { hiddenConfirmed.add(id); return orig.apply(self, args); });
    }
    // One cached wrapper per sheet component. A new type on every render made React
    // unmount and remount the whole sheet (losing its state) each time it re-rendered.
    // The channel and close handler travel in one private prop, removed before Discord sees it.
    const JUMP_PROP = "__venusJumpSheet";
    const sheetTypes = new WeakMap();
    function sheetComponent(component) {
        if (!component || !React || (typeof component !== "function" && typeof component !== "object")) return component;
        if (sheetTypes.has(component)) return sheetTypes.get(component);
        let result = component;
        if (typeof component === "function") result = function (props) {
            const jump = props && props[JUMP_PROP];
            if (!jump) return component.apply(this, arguments);
            const next = Array.from(arguments), clean = Object.assign({}, props);
            delete clean[JUMP_PROP]; next[0] = clean;
            return addJumpRow(component.apply(this, next), jump.channel, jump.onClose);
        };
        else if (component.$$typeof) {
            const key = component.type ? "type" : "render";
            const child = sheetComponent(component[key]);
            if (child !== component[key]) result = cloneWith(component, key, child);
        }
        sheetTypes.set(component, result);
        return result;
    }
    function addJumpRow(tree, channel, onClose) {
        let added = false;
        return cloneTree(tree, function (node, props) {
            if (added || !Array.isArray(props.children)) return props;
            const template = props.children.find(child => child && child.props && typeof child.props.label === "string" && typeof child.props.onPress === "function");
            if (!template || props.children.some(child => child && child.key === "venus-jump-top")) return props;
            added = true;
            const row = React.cloneElement(template, {key:"venus-jump-top",label:"Jump to top",icon:undefined,
                onPress:function () {
                    if (typeof onClose === "function") onClose();
                    msgActions.jumpToMessage({channelId:channel.id,messageId:channel.id,flash:true,jumpType:"ANIMATED"});
                }});
            return Object.assign({}, props, {children:[row].concat(props.children)});
        }, 0);
    }
    function jumpSheet(orig, self, args) {
        const tree = orig.apply(self, args), props = args[0];
        if (!enabled("jumpToTop") || !React || !tree || !props || !msgActions) return tree;
        const channel = props.thread || props.channel || channelStore && channelStore.getChannel(props.channelId);
        if (!channel || ![0,1,3,5,10,11,12].includes(channel.type) || hiddenChannel(channel)) return tree;
        // ChannelLongPressActionSheet returns a connected component. Preserve its
        // React tags and patch its render, not the exports object or frozen element.
        const transformed = addJumpRow(tree, channel, props.onClose);
        if (transformed !== tree) return transformed;
        const type = sheetComponent(tree.type);
        if (type === tree.type) return tree;
        return el(type, Object.assign({}, tree.props, {key:tree.key, [JUMP_PROP]:{channel, onClose:props.onClose}}));
    }
    let pastelHash, guildMembers, presenceStore, sessionsStore, displayNameType, nativeRowGroup, nativeSwitchRow, nativeLock, oauthModal;
    // The original PlatformIndicators plugin's themable PNG glyphs, tinted by status.
    const platformPngs = {"desktop": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEUAAACvv7+3u7+5u7+2ub+4u726vL65u765vL65vMG5u723ub23v7+3t7+6vL+4ur+6u765u764vL+4ur23t7+7vb+3ur25ur64ur+7u766ur6vr7/+1nXbAAAAHHRSTlMAEEB/UHDv/99fgIAgQJ+f7++fnyB/YN9vTz8QSaZf3QAAAI1JREFUeAHt1tUBwkAURNEXHZzg1n+d2Fc8u4OTOQXcyKqJ3ARh5C22qiQFYTC0khFIYyuYgDYthGagzQuhDLRFIYS7yBPuakLmSaF2CimkkEIKKfT8I5un0MdCT7v6LUFbFUIhaGsr2IAUWcl2B0K2t6pDVKttGR5P3BJvpxCnfdTMHVo9NaRQ1MpKRC5jHSw3VFQzIwAAAABJRU5ErkJggg==", "web": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAQAAAD/5HvMAAADgklEQVR42u3a32vVdRzH8VdOv2NzGzM7bkp0E9F9RQSbOmK6groQpeugOzXJfnCW3YwgC4IyHCldrBmFELtQRxfK2MHp1sjVZRfBMSJFYu6cMUnOOZPz9Gb45uyc79fv5/tDvDiPv+DJh/fn8+HL56umpqbHFZsZ4hjjzJOnQJkyBfLMM87H7GWzHh16OcoVKgQpM8N79Cht7GaSVcJa5QK7lBZe5SpRzDCgpLGdH6gS3SRPKzm8xTJxFTmgJNDKtyRllFbFQxfTRLVCvSk6FR3b+J3onuRTlllvgUzk1YmVsyJJdPMN1bqkzmizM00cc1rDIP9SawpPrjhFPAf1AN1cotZJ940ezwKb1q33BLX2Kzx2sBwzZ7vWoYXvAVOkV2FxlqjuMMtBNqkBNpIDzI/h7ywnTsfIP5gquxUGV3EiB7zMPcxlPRwDOJITTgNmpx6GyZSDnqKAOa9g9LKKIzniA0yFbQrC+5B6UDf/Y44oCFdwdUPOGMfkgr8kyrg6Lmf0YUq0yw9DuLnBcTw5YwNFzB754RhmkYaUCH7BDMsPZzDDZFMM+gQzJj/8inlTYiS1oNcws/LD35jnJUtKPOgFzHX5YQmzdmCRTSXoGcyi/FDGtEqWlHhQG6YULsjTA4zg5iZf4CkAXrig25gtUowk+FwB2IpZDDfUz8pEWiUF4DnM9XDbfkiKl6QAvB5u248H38KMJBZ0FDMW7uo4qwbIJhQ0gcnKD3sxN3lCirNKgZfrf5hB+aGdEuYVNUQ2dtAuTIk2+WMG87V8MBIzaBQzrdDDVqBDPuIE0cUy5rCC0MMq5lAqQR9hKmRcPoNu0ZF0EN0sYs7JBAyc+UwNsUJYd7nGO2zUGr4CTL9MqMGu8KIaYB43C2yVJPq4h8kpDAaoYv6kS3U4jKvfaGELeUyVfoXDT4C5wAatg8cfuHqbS4A54/K8UgTMd/WnNjuckyqAKdCj8DhArdO0NFilQ8xxhyiq7JMbRqk1GXAEuDshV3hMUesvXkoo6CKe3NHJArUqfEln7KBrdCgaMnVJcIsPa6OcczKKjk6mqFfkFH20RAi6SIfiweMkjS0xwTBvEFaVE3hKAvspEleBfUoOvTGfOH+mJ40X6ctEkaNfaWEn56kQVoVz9CltZDhCjhJBSuR4l4weHdrZwzBjzJFniTJlbpNnljGyDNLW/BmlqelxdR++AoGbDB4jjAAAAABJRU5ErkJggg==", "mobile": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAMAAADVRocKAAAAXVBMVEUAAAAwMDgwMDUwMDUuMDYwMDYvMTcvMTYvMTYwMDYwMDUvMTYwMjUvMTUvMjYvMTUuMDUuMDQvMDUtMTUwMDgvMDUwMDAtMDYuMDYwMDAtMDUvMDYuMDUtMDcpMTo5aAq8AAAAH3RSTlMAIGBvf1C//89fMN9g75+/j3+fP0C/IFBfMGDPb08fcZ9WCgAAAMNJREFUeAHt2YWNxQAMg2EX/fiVud1/zBuhSaRjfwv8UsQx5J9L0iw/VySIyUoaXa7wu93pcE/g9KDTFS4F+amF5Em3ZwK7FwPeMEsYcoNVxZAaViX5uTd6MuQJKwY5A01u9goFWph1fyKggAIKKKCAAgoooIACCiiggAIKKKCAAgoooIACn/l9d/t3gU/fcEqG9LDKGVLB6saQAZ97owZ2w5NuzwEOKd1G4FMLE5wG36Y/w29ZadRviBn2/Nw2HfjTPgD3/UVA1TCAGgAAAABJRU5ErkJggg==", "embedded": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAk1BMVEUAAAC3u7+4ur+5vL+5u765u7+6vL+2ub+3v7+6u7+5vL66v7+6vL65u761ur+4u765vL+3t7+6u765u7+9vb23t7+7vb+6u766ur+5ur6/v7+vv7+9vcW1tb+5u727u763ur25vL+6vL+3ub24ur+5u7+4vL+5ur66ur64ur25vL+6u764ur24u722uby5u76vr7/eehxsAAAAMXRSTlMAQJ/f/8+fUCC/3zDv7zC/UEDvfx8gf88w3xAQHzCAT2Bfb4Bvj5/PP6+vv59wUM8QEONx+AAAAWZJREFUeAHt1dWa6zAMBOA5PSqzs2Vmhvd/uWWcVFHqr5f+r+3JRqtJ8UhBEAT/Mv8lpWwuD02hKHcpFXBTuSJ3qtZwQ0HPUVULiCuJhzpiGuKlCZaTL3gnxEVPaLWdkAxYJznIdfGmy0k9MEkOivChLQSkbwS18KElZEBBLSMIX4QMuRxaEJ0vCBndCkJMbEZjIRO6MTWCqjWlRjO6MTeCpLoooDWuCFvSjcgK0pYzohsrM0hZzhXdWJtBynJyR4rGv19dzrp3EC3nhoJKZpCynNxalzqIlrPKU7WDlOXUym8H0XIOufy+htxZX9tHBU24/L5mXH5fSy6/r4jL/8sOidYJv2x7fu0k84SgIn/Qmb50dT2oB6YXk+tf4hElWuuPdeaIlCFx/fkLeM+Q1Ferw3RQZ9SmP8jQlR9H/NZ3tKmG08+sW/SMnrxzZ6Qy/TrfBWkdL+Lq0RUptaYHJyU+HwRB4O0FjTMnvIkvoBQAAAAASUVORK5CYII=", "vr": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAANlBMVEVMaXHv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hs7PTu7vHv7/Hv7/Hv7/Hv7/Hv7/Hv7/Hv7/EEUZf/AAAAEXRSTlMAzGV4UNr78OcJFDufKb6ri3Gd0SEAAAHQSURBVFjD7VbHdsQgDDRNiOby/z+bjY0N2LRk95C8xxwNHo0KkqZpYGBg4PMwbBa4ZYFiZqaPRVGxNSCoavPwJs0ujLbk2K0TtipKz1s3Zl3RE/PILGKmsqbLL8JcwZ5y9LJmi3E+k8Ib1UH8xcI95Utnaeb2TAnmbzLP01NsnilfBEcBCW9FVXWpwzvxrGYiE785ASC1p2DO3M5xlWty5ZREyrEmKlQK0Tedweu1npUdNPxDVBrlHe5bIHQQue1m/YVIEKjIGKmGG7ZbPKYpqnsMnsGqqxUQNSzpP8WdJoSaNUop7nwFInZF600ijT0F3kE06dXS6RNEXfh7ROI/EMG7RPAM2++I8D48wqefZe0cJy74Bo+HaixBJPbRLXX0k5ueDenWgtzVYojLz670edNL55y2wSgPQPOtFhPbirPlKYlDPOyBPwUtjD8auzr6GwYXDKRrA4RAucMFmR0PvuXjeZ3K+wIiT++MD8Wa32n8KSxc67ArSOYcOzln6rTmi5eKhWbMIbMGyV2gkZkjKE4ZVr6cM1Lp6qxslN6ZoDodeLoVi6igTbqlYmOJ0muIBrIku4oFK7Ix9I7atAQ2SWym1F5HEjB3NDAwMPAuvgCPRUw2yKsaYwAAAABJRU5ErkJggg=="};
    function PlatformPng(props) {
        const uri = platformPngs[props.platform];
        if (!uri) return el(RN.View,{style:{width:16,height:16,borderRadius:8,backgroundColor:props.color}});
        return el(RN.Image,{source:{uri,width:16,height:16},style:{width:16,height:16,tintColor:props.color}});
    }
    let reviewToken = "", reviewAccount = null, reviewAuthAttempt = 0, reviewAuthState = "idle", reviewAuthError = "";
    const reviewCache = new Map(), platformWrappers = new WeakMap();
    const REVIEW_API = "https://manti.vendicated.dev/api/reviewdb";
    const pastelCache = new Map();
    let pastelCacheColor, pastelCacheHash;
    function pastelColor(seed, saturation, lightness) {
        if (!pastelHash || !RN || typeof RN.processColor !== "function") return null;
        // Rows re-render constantly; the color only depends on these inputs and the active helpers.
        if (pastelCacheColor !== RN.processColor || pastelCacheHash !== pastelHash) {
            pastelCache.clear(); pastelCacheColor = RN.processColor; pastelCacheHash = pastelHash;
        }
        const cacheKey = saturation + ":" + lightness + ":" + seed;
        const known = pastelCache.get(cacheKey);
        if (known) return known;
        const color = computePastel(seed, saturation, lightness);
        if (pastelCache.size >= 1024) pastelCache.delete(pastelCache.keys().next().value);
        pastelCache.set(cacheKey, color);
        return color;
    }
    function computePastel(seed, saturation, lightness) {
        const hue = ((pastelHash(String(seed)) >>> 0) % 360) / 360;
        function component(offset) {
            const k = (offset + hue * 12) % 12;
            return Math.round(255 * (lightness - saturation * Math.min(lightness,1-lightness) * Math.max(-1,Math.min(k-3,9-k,1))));
        }
        const hex = "#" + [component(0),component(8),component(4)].map(value => value.toString(16).padStart(2,"0")).join("");
        return {hex, value:RN.processColor(hex)};
    }
    function pastelMentions(content, guildId) {
        if (!Array.isArray(content)) return content;
        let changed = false;
        const next = content.map(node => {
            if (!node || typeof node !== "object") return node;
            let result = node;
            if (node.type === "mention" && node.userId && (!node.colorString || settings.pastelAll) &&
                (!guildId || guildMembers && guildMembers.getMember(guildId,node.userId))) {
                const color = pastelColor(node.userId,0.85,0.75);
                if (color) result = Object.assign({},node,{roleColor:color.value,color:color.value,colorString:color.hex});
            }
            if (Array.isArray(node.content)) {
                const children = pastelMentions(node.content,guildId);
                if (children !== node.content) result = Object.assign({},result,{content:children});
            }
            if (result !== node) changed = true;
            return result;
        });
        return changed ? next : content;
    }
    function pastelMessage(message, source) {
        if (!message || !message.authorId) return message;
        if (message.guildId && (!guildMembers || !guildMembers.getMember(message.guildId,message.authorId)) && !(source && source.webhookId)) return message;
        let next = Object.assign({},message,{shouldShowRoleOnName:true}), seed;
        if (source && source.webhookId) seed = settings.pastelWebhookName ? message.username : source.webhookId;
        else if (!(source && source.colorString != null ? source.colorString : message.roleColor) || settings.pastelAll) seed = message.authorId;
        const color = seed && pastelColor(seed,0.75,0.6);
        if (color) next = Object.assign({},message,{roleColor:color.value,usernameColor:color.value,colorString:color.value,shouldShowRoleOnName:true});
        const content = pastelMentions(message.content,message.guildId);
        if (content !== message.content) next = Object.assign({},next,{content});
        // Native MessageView applies Message.textColor via TextView.setTextColor (348.10 bridge field).
        // Never wrap content in a link node: that made the text blue, tappable and show "usernameOnClick".
        if (color && settings.pastelContent) {
            const text = pastelColor(seed,0.85,0.75);
            if (text) next = Object.assign({},next,{textColor:text.value});
        }
        return next;
    }
    // Read All: a ReadAllNotificationsButton port for the mobile server bar (GuildsBar 15920,
    // useGuildsBarProps 15929). The button lives in the SEPARATOR row, below the DM button and
    // unread DMs and above the line, so the native FastList's sections, anchors and recycler
    // keys stay stock. Only that row's height grows, through the list's own itemSize.
    const READ_ALL_HEIGHT = 36;
    const readAllViews = new WeakMap(), readAllData = new WeakMap();
    // ReadStateActionCreators (6532) exports ack/bulkAck by name, with no default object.
    function readActionsExport() {
        if (typeof global.__r !== "function") return null;
        try { const m=global.__r(6532); return m && typeof m.bulkAck==="function" ? m : m && m.default; } catch (_) { return null; }
    }
    function readAllExports() {
        const x=(id,key) => inspectedExport(id,key);
        return {sorted:x(5751,"default"), guildReads:x(7054,"default"), markGuilds:x(13507,"default"), sections:x(1086,"AnalyticsSections"),
            privateReads:x(13299,"default"), reads:x(4852,"default"), readActions:readActionsExport(), readTypes:x(5019,"ReadStateTypes"),
            renderSections:x(15919,"FastListRenderSections")};
    }
    function unreadGuildIds(api) {
        if (!api.sorted || typeof api.sorted.getFlattenedGuildIds!=="function" || !api.guildReads) return [];
        return Array.from(api.sorted.getFlattenedGuildIds() || []).filter(id => typeof id==="string" &&
            (api.guildReads.hasUnread(id) || api.guildReads.getMentionCount(id) > 0));
    }
    function unreadDmIds(api) {
        if (!api.privateReads || typeof api.privateReads.getUnreadPrivateChannelIds!=="function") return [];
        return Array.from(api.privateReads.getUnreadPrivateChannelIds() || []).filter(id => typeof id==="string");
    }
    // Same native paths as Discord: the server menu's markGuildsAsRead (13507) with the
    // GUILD_LIST source, and a single BULK_ACK for DMs at each channel's last message.
    function readAll(mode) {
        if (!enabled("readAll") || !READ_ALL_MODES.includes(mode)) return;
        const api=readAllExports(), ui=reviewUI();
        let guilds=0, dms=0;
        try {
            if (mode!=="dms") {
                const ids=unreadGuildIds(api);
                if (ids.length && typeof api.markGuilds==="function") { api.markGuilds(ids, api.sections && api.sections.GUILD_LIST); guilds=ids.length; }
            }
            if (mode!=="guilds") {
                const ids=unreadDmIds(api);
                if (ids.length && api.readActions && typeof api.readActions.bulkAck==="function" && api.reads) {
                    const type=api.readTypes && api.readTypes.CHANNEL != null ? api.readTypes.CHANNEL : 0;
                    // A DM without a known last message can't be acknowledged; sending it anyway
                    // made the whole request fail. Discord's own /read-states/ack-bulk takes 100 at a time.
                    const acks=ids.map(channelId => ({channelId, readStateType:type, messageId:api.reads.lastMessageId(channelId)})).filter(ack => ack.messageId);
                    for (let i=0;i<acks.length;i+=100) api.readActions.bulkAck(acks.slice(i,i+100));
                    dms=acks.length;
                }
            }
        } catch (error) { reviewToast(ui,"Couldn't mark as read: "+error); return; }
        const parts=[];
        if (guilds) parts.push(guilds+(guilds===1 ? " server" : " servers"));
        if (dms) parts.push(dms+(dms===1 ? " DM" : " DMs"));
        reviewToast(ui, parts.length ? "Marked "+parts.join(" and ")+" as read" : "Nothing unread");
    }
    // Holding the button: Discord's own action sheet with the three one-time choices.
    function readAllChooser() {
        const ui=reviewUI();
        const options=[["guilds","Mark servers as read"],["dms","Mark DMs as read"],["both","Mark servers and DMs as read"]]
            .map(([mode,label]) => ({label, onPress:() => readAll(mode)}));
        if (typeof ui.simpleSheet==="function") try { ui.simpleSheet({key:"VenusReadAll",header:{title:"Read all"},options}); return; } catch (_) {}
        if (RN && RN.Alert) RN.Alert.alert("Read all",undefined,options.map(option => ({text:option.label,onPress:option.onPress})).concat([{text:"Cancel",style:"cancel"}]));
    }
    let readAllStyleHook, readAllStylesTried=false;
    function ReadAllButton() {
        useSettings("readAll");
        const ui=reviewUI();
        // Discord's semantic tokens, so the pill follows light, dark and custom themes.
        if (!readAllStylesTried) {
            readAllStylesTried=true;
            const c=ui.colors;
            if (typeof ui.createStyles==="function" && c) try {
                readAllStyleHook=ui.createStyles({pill:{backgroundColor:c.BACKGROUND_MOD_NORMAL},pressed:{backgroundColor:c.BACKGROUND_MOD_STRONG},text:{color:c.TEXT_DEFAULT}});
            } catch (_) { readAllStyleHook=null; }
        }
        let styles=null;
        if (readAllStyleHook) try { styles=readAllStyleHook(); } catch (_) {}
        styles=styles || {pill:{backgroundColor:"#4e505899"},pressed:{backgroundColor:"#4e5058"},text:{color:"#dbdee1"}};
        return el(RN.View,{style:{height:READ_ALL_HEIGHT,alignItems:"center",justifyContent:"center"}},
            el(RN.Pressable,{accessibilityRole:"button",accessibilityHint:"Hold to choose",
                hitSlop:6,onPress:() => readAll(settings.readAllMode),onLongPress:readAllChooser,delayLongPress:350,
                style:({pressed}) => [{height:26,minWidth:48,paddingHorizontal:8,borderRadius:13,alignItems:"center",justifyContent:"center"},styles.pill,
                    pressed ? styles.pressed : null,pressed ? {transform:[{scale:0.96}]} : null]},
                el(RN.Text,{numberOfLines:1,allowFontScaling:false,style:[{fontSize:11,fontWeight:"700",includeFontPadding:false},styles.text]},"Read all")));
    }
    function readAllBarProps(orig, self, args) {
        const result=orig.apply(self,args);
        if (React) useSettings("readAll");
        const data=result && result.listDataProps;
        if (!enabled("readAll") || !React || !RN || !data || typeof data.itemSize!=="function" || typeof data.renderItem!=="function") return result;
        // The wrapped list data is shared per native listDataProps, but the returned props are per result:
        // keying the whole view on listDataProps handed back an older result's listProps.
        const known=readAllViews.get(result);
        if (known) return known;
        let listDataProps=readAllData.get(data);
        if (!listDataProps) {
            const enums=readAllExports().renderSections, separator=enums && typeof enums.SEPARATOR==="number" ? enums.SEPARATOR : 6;
            const itemSize=data.itemSize, renderItem=data.renderItem;
            listDataProps=Object.assign({},data,{
                itemSize:function (section) { const size=itemSize.apply(this,arguments); return section===separator && enabled("readAll") ? size+READ_ALL_HEIGHT : size; },
                renderItem:function (section) {
                    const node=renderItem.apply(this,arguments);
                    return section===separator && enabled("readAll") ? el(RN.View,{key:"venus-read-all",style:{width:"100%"}},el(ReadAllButton,null),node) : node;
                }});
            readAllData.set(data, listDataProps);
        }
        const view=Object.assign({},result,{listDataProps});
        readAllViews.set(result, view);
        return view;
    }
    // Quest Completer: finds unfinished Quests and completes them in the background, with no screen.
    // Based on the community quest scripts (aamiaa's gist, CompleteDiscordQuest, Questify), rebuilt on
    // 348.10's own modules: QuestStore (7120), fetchCurrentQuests (9765), questUserStatusFromServer (7127)
    // and the HTTP client (1283). Video, Play and Activity tasks are run; stream tasks need a real Go Live.
    const QUEST_VIDEO_TASKS = ["WATCH_VIDEO_ON_MOBILE", "WATCH_VIDEO"], QUEST_ACTIVITY_TASK = "PLAY_ACTIVITY", QUEST_PLAY_TASK = "PLAY_ON_DESKTOP";
    // QuestContent.QUEST_HOME_MOBILE: where Discord's own app says a quest was accepted from.
    const QUEST_HOME_MOBILE = 12;
    // Video progress may run at most ~10 s ahead of the time since accepting; report about every 7 s like the player.
    // Play and Activity heartbeats follow Discord's desktop QuestProgressManager: one a minute, and when less
    // than a minute is left it waits exactly what's left plus one second.
    const QUEST_VIDEO_LEEWAY = 10, QUEST_VIDEO_STEP = 7, QUEST_HEARTBEAT_MS = 60000, QUEST_HEARTBEAT_TAIL_MS = 1000;
    // QuestVariants.MOBILE_ACTIVITY_QUEST: an Activity Quest that Discord's phone app reports itself.
    const QUEST_MOBILE_ACTIVITY = 36;
    // Discord answers 401 when a phone reports play time, so Play and Activity heartbeats are sent as Discord
    // Stable for Windows: host 1.0.9261, web build 634304, updater metadata 93252, Electron 42.11.10.
    const QUEST_DESKTOP = {version:"1.0.9261", build:634304, native:93252, electron:"42.11.10", chrome:"148.0.7778.280",
        osVersion:"10.0.26100", osSdk:"26100"};
    const QUEST_DESKTOP_UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/" +
        QUEST_DESKTOP.version + " Chrome/" + QUEST_DESKTOP.chrome + " Electron/" + QUEST_DESKTOP.electron + " Safari/537.36";
    // Bits desktop's launch signature keeps clear when it detects no client mod (docs.discord.food, Launch Signature).
    const QUEST_SIGNATURE_BITS = [119, 108, 100, 91, 84, 75, 61, 55, 48, 38, 24, 11];
    const QUEST_HEARTBEAT_SESSION_MS = 30 * 60 * 1000;
    const QUEST_REFETCH_MS = 30 * 60 * 1000, QUEST_RETRY_MS = 30 * 60 * 1000, QUEST_REFUSED_MS = 6 * 60 * 60 * 1000, QUEST_OFFLINE_MS = 5 * 60 * 1000;
    // Heartbeats in a row that Discord answers without counting any more time before Quest Completer gives up for now.
    const QUEST_STALLED_BEATS = 5;
    const quest = {store:null, dispatcher:null, generation:0, running:null, enrolling:false, skip:new Map(), enrollBlockedUntil:0,
        scanTimer:undefined, refetchTimer:undefined, user:null, completed:0, last:"", error:"", desktop:null, executables:new Map()};
    function questSleep(ms) { return new Promise(resolve => { later(resolve, ms); }); }
    function questStore() {
        if (quest.store) return quest.store;
        const store = inspectedExport(7120, "default");
        if (!store || typeof store.getQuest !== "function") return null;
        questAttach(store);
        return store;
    }
    function questAttach(store) {
        if (quest.store || !store || typeof store.getQuest !== "function") return;
        quest.store = store;
        if (typeof store.addChangeListener === "function") store.addChangeListener(questsChanged);
    }
    // Store updates arrive in bursts (fetch, enroll, progress). One scan per burst is enough.
    function questsChanged() { if (enabled("quests")) questsSchedule(1500); }
    function questsSchedule(ms) {
        if (quest.scanTimer !== undefined || typeof global.setTimeout !== "function") return;
        quest.scanTimer = global.setTimeout(questsScan, ms);
    }
    function questStatus(text, error) {
        if (error) quest.error = text; else { quest.last = text; quest.error = ""; }
        notify("quests");
    }
    // Discord's HTTP client (its auth and headers), with this request's own interceptResponse. Discord asks
    // it before its global handler (captcha, MFA, restricted-hours screens), so taking every failed response
    // here means a challenge just fails the request quietly instead of opening a screen.
    function questIntercept(response, retry, cancel) {
        if (!response || response.ok || typeof cancel !== "function") return false;
        const error = new Error("HTTP " + response.status);
        error.status = response.status; error.body = response.body;
        cancel(error);
        return true;
    }
    // desktop: send this request as the Windows desktop app. Only Play and Activity heartbeats (and the game
    // lookup that names their executable) do; enrolling and video progress stay the phone, which Discord accepts.
    function questRequest(url, body, desktop, method) {
        const http = inspectedExport(1283, "HTTP"), send = http && http[method || "post"];
        if (typeof send !== "function") return Promise.reject(new Error("Discord's network client isn't ready"));
        const request = {url, interceptResponse:questIntercept};
        if (body !== undefined) request.body = body;
        if (desktop) request.onRequestCreated = questDesktopRequest;
        return Promise.resolve().then(() => send.call(http, request));
    }
    function questHex(count) { let hex = ""; for (let i = 0; i < count; i++) hex += Math.floor(Math.random() * 16).toString(16); return hex; }
    function questUuidText(hex) { return hex.slice(0, 8) + "-" + hex.slice(8, 12) + "-" + hex.slice(12, 16) + "-" + hex.slice(16, 20) + "-" + hex.slice(20, 32); }
    // RFC 4122 version 4, like crypto.randomUUID().
    function questUuid() { const hex = questHex(32); return hex.slice(0, 12) + "4" + hex.slice(13, 16) + "89ab"[Math.floor(Math.random() * 4)] + hex.slice(17); }
    // A random UUID with every client-mod bit cleared, the way desktop makes one when it detects no mods.
    function questLaunchSignature() {
        const digits = questUuid().split("").map(c => parseInt(c, 16));
        for (const bit of QUEST_SIGNATURE_BITS) { const i = 31 - Math.floor(bit / 4); digits[i] &= ~(1 << bit % 4); }
        return questUuidText(digits.map(d => d.toString(16)).join(""));
    }
    function questBase64(text) {
        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", bytes = [];
        for (const c of unescape(encodeURIComponent(text))) bytes.push(c.charCodeAt(0));
        let out = "";
        for (let i = 0; i < bytes.length; i += 3) {
            const n = bytes[i] << 16 | (bytes[i + 1] || 0) << 8 | (bytes[i + 2] || 0);
            out += chars[n >> 18 & 63] + chars[n >> 12 & 63] + (i + 1 < bytes.length ? chars[n >> 6 & 63] : "=") + (i + 2 < bytes.length ? chars[n & 63] : "=");
        }
        return out;
    }
    function questLocale() {
        try {
            const read = inspectedExport(1348, "getSuperProperties"), own = typeof read === "function" ? read() : null;
            const locale = own && own.system_locale;
            if (typeof locale === "string" && /^[A-Za-z]{2,3}(-[A-Za-z0-9]{2,8})*$/.test(locale)) return locale;
        } catch (_) {}
        return "en-US";
    }
    // One desktop launch per Discord launch: its launch id and signature stay the same, and the analytics
    // heartbeat session id rolls over every 30 minutes like desktop's. The locale is the phone's own.
    function questDesktopProperties() {
        const now = Date.now();
        const identity = quest.desktop || (quest.desktop = {launch:questUuidText(questUuid()), signature:questLaunchSignature(),
            locale:questLocale(), session:"", sessionAt:0});
        if (!identity.session || now - identity.sessionAt >= QUEST_HEARTBEAT_SESSION_MS) { identity.session = questUuidText(questUuid()); identity.sessionAt = now; }
        // Same keys, in the same order, as desktop's getSuperProperties.
        const properties = {os:"Windows", browser:"Discord Client", release_channel:"stable", client_version:QUEST_DESKTOP.version,
            os_version:QUEST_DESKTOP.osVersion, os_arch:"x64", app_arch:"x64", system_locale:identity.locale, has_client_mods:false,
            client_launch_id:identity.launch, browser_user_agent:QUEST_DESKTOP_UA, browser_version:QUEST_DESKTOP.electron,
            os_sdk_version:QUEST_DESKTOP.osSdk, client_build_number:QUEST_DESKTOP.build, native_build_number:QUEST_DESKTOP.native,
            client_event_source:null, launch_signature:identity.signature, client_heartbeat_session_id:identity.session,
            client_app_state:"unfocused"};
        try {
            const encode = inspectedExport(1283, "encodeProperties"), encoded = typeof encode === "function" ? encode(properties) : null;
            if (typeof encoded === "string" && encoded) return encoded;
        } catch (_) {}
        return questBase64(JSON.stringify(properties));
    }
    // Discord's HTTP client hands over the request before its prepareRequest adds the phone's X-Super-Properties,
    // so those headers are swapped as they're set. The native User-Agent interceptor leaves this Windows agent
    // alone (see questCompleter in DiscordPatches.kt); every other request still says Discord-Android.
    function questDesktopRequest(request) {
        if (!request || typeof request.set !== "function") return;
        const properties = questDesktopProperties(), set = request.set;
        const value = (name, original) => {
            const key = String(name).toLowerCase();
            return key === "x-super-properties" ? properties : key === "user-agent" ? QUEST_DESKTOP_UA : original;
        };
        request.set = function (name, original) {
            if (name && typeof name === "object") {
                const copy = {};
                for (const key of Object.keys(name)) copy[key] = value(key, name[key]);
                return set.call(this, copy);
            }
            return set.call(this, name, value(name, original));
        };
        request.set("User-Agent", QUEST_DESKTOP_UA);
        request.set("X-Super-Properties", properties);
    }
    // QuestStore exposes these as getters in 348.10; accept a method too.
    function questFlag(store, key) {
        try { const value = store[key]; return typeof value === "function" ? value.call(store) : value; } catch (_) { return undefined; }
    }
    function questDispatch(action) {
        const dispatcher = quest.dispatcher || inspectedExport(585, "default");
        try {
            if (!dispatcher || typeof dispatcher.dispatch !== "function") return false;
            const result = dispatcher.dispatch(action);
            if (result && typeof result.catch === "function") result.catch(() => {});
            return true;
        } catch (_) { return false; }
    }
    function questUserStatus(body) {
        const convert = inspectedExport(7127, "questUserStatusFromServer");
        try { return body && typeof convert === "function" ? convert(body) : null; } catch (_) { return null; }
    }
    function questRetryAfter(error) {
        const body = error && error.body, value = body && (body.retry_after != null ? body.retry_after : body.retryAfter);
        const seconds = Number(value != null ? value : error && error.retryAfter);
        return Number.isFinite(seconds) && seconds > 0 ? Math.min(seconds, 86400) * 1000 : error && error.status === 429 ? 60000 : 0;
    }
    function questTime(value) {
        if (value == null || value === "") return NaN;
        const time = value instanceof Date ? value.getTime() : typeof value === "number" ? value : Date.parse(String(value));
        return Number.isFinite(time) ? time : NaN;
    }
    function questName(item) {
        const messages = item && item.config && item.config.messages;
        return messages && typeof messages.questName === "string" && messages.questName ? messages.questName : "a Quest";
    }
    // The game a Play or Activity task counts time for. Since mid-2026 it lives on the task
    // (taskConfigV2.tasks.<TYPE>.applications[0].id); older quests carry it on config.application.
    function questApplication(item, task) {
        const apps = task && task.applications, first = Array.isArray(apps) ? apps.find(app => app && app.id) : null;
        const id = first ? first.id : item && item.config && item.config.application && item.config.application.id;
        return id != null && /^\d{5,25}$/.test(String(id)) ? String(id) : null;
    }
    // The first task this phone can do, in the order the settings allow.
    function questTask(item) {
        const config = item && item.config, tasks = config && (config.taskConfigV2 || config.taskConfig);
        const all = tasks && tasks.tasks;
        if (!all || typeof all !== "object") return null;
        if (settings.questsVideo) for (const type of QUEST_VIDEO_TASKS) {
            const target = Number(all[type] && all[type].target);
            if (target > 0) return {type, target, kind:"video"};
        }
        // "Play <game> for 15 minutes": the same heartbeat Discord's desktop app sends while the game runs.
        const play = all[QUEST_PLAY_TASK], playTarget = Number(play && play.target), playApp = questApplication(item, play);
        if (settings.questsPlay && playTarget > 0 && playApp) return {type:QUEST_PLAY_TASK, target:playTarget, kind:"play", applicationId:playApp};
        const activity = all[QUEST_ACTIVITY_TASK], target = Number(activity && activity.target);
        const activityApp = questApplication(item, activity), features = config.features;
        const mobile = Array.isArray(features) && features.includes(QUEST_MOBILE_ACTIVITY);
        if (settings.questsActivity && target > 0 && activityApp) return {type:QUEST_ACTIVITY_TASK, target, kind:"activity", applicationId:activityApp, mobile};
        return null;
    }
    function questProgress(item, type) {
        const progress = item && item.userStatus && item.userStatus.progress, value = Number(progress && progress[type] && progress[type].value);
        return Number.isFinite(value) && value > 0 ? value : 0;
    }
    function questOpen(item, now) {
        if (!item || typeof item.id !== "string" || !item.config) return false;
        if (item.userStatus && item.userStatus.completedAt) return false;
        const expires = questTime(item.config.expiresAt);
        return !(expires <= now + 60000) && !((quest.skip.get(item.id) || 0) > now);
    }
    function questsScan() {
        quest.scanTimer = undefined;
        if (!enabled("quests")) return;
        const store = questStore();
        if (!store) return;
        if (questFlag(store, "isQuestAccessSuspended") === true) { if (!quest.error) questStatus("Discord has paused Quests on this account.", true); return; }
        let all;
        try { all = store.quests; } catch (_) { return; }
        if (!all || typeof all.values !== "function") return;
        const now = Date.now(), ready = [], waiting = [];
        for (const item of all.values()) {
            if (!questOpen(item, now) || !questTask(item)) continue;
            if (item.userStatus && item.userStatus.enrolledAt) ready.push(item); else if (settings.questsEnroll) waiting.push(item);
        }
        // Soonest-expiring first, so nothing runs out while another quest is going.
        const expiry = item => { const time = questTime(item.config.expiresAt); return Number.isFinite(time) ? time : Infinity; };
        const soonest = (a, b) => expiry(a) - expiry(b);
        ready.sort(soonest); waiting.sort(soonest);
        const blocked = quest.enrollBlockedUntil > now || questTime(questFlag(store, "questEnrollmentBlockedUntil")) > now;
        if (waiting.length && !quest.enrolling && !blocked) questEnroll(waiting[0]);
        if (!quest.running && ready.length) questRun(ready[0]);
    }
    // Accepting one at a time, a few seconds apart. A refusal or captcha leaves that quest alone for hours.
    function questEnroll(item) {
        const generation = quest.generation, id = item.id;
        quest.enrolling = true;
        questRequest("/quests/" + id + "/enroll", {location:QUEST_HOME_MOBILE}).then(response => {
            if (generation !== quest.generation) return;
            const status = questUserStatus(response && response.body);
            if (!status || !questDispatch({type:"QUESTS_ENROLL_SUCCESS", enrolledQuestUserStatus:status})) questsFetch(true);
        }, error => {
            if (generation !== quest.generation) return;
            const wait = questRetryAfter(error);
            if (wait) quest.enrollBlockedUntil = Date.now() + wait;
            // Only a real answer from Discord (refused, captcha) leaves the Quest alone for hours. No connection
            // means Discord never saw the request, so it's tried again sooner.
            const refused = error && Number.isFinite(error.status) && error.status > 0;
            quest.skip.set(id, Date.now() + Math.max(wait, refused ? QUEST_REFUSED_MS : QUEST_OFFLINE_MS));
        }).then(() => {
            if (generation !== quest.generation) return;
            quest.enrolling = false;
            questsSchedule(3000 + Math.floor(Math.random() * 2000));
        });
    }
    function questActive(entry) { return quest.running === entry && entry.generation === quest.generation && enabled("quests"); }
    function questRun(item) {
        const task = questTask(item), entry = {id:item.id, task, generation:quest.generation, name:questName(item)};
        quest.running = entry;
        notify("quests");
        const work = task.kind === "video" ? questVideo(entry, item) : task.kind === "play" ? questPlay(entry) : questActivity(entry);
        work.then(done => {
            if (!done || entry.generation !== quest.generation) return;
            quest.completed++;
            // The store's own update follows; don't pick the same quest again in the meantime.
            quest.skip.set(entry.id, Date.now() + 10 * 60 * 1000);
            questStatus("Completed " + entry.name + ".", false);
        }, error => {
            if (entry.generation !== quest.generation) return;
            const wait = questRetryAfter(error);
            quest.skip.set(entry.id, Date.now() + Math.max(wait, QUEST_RETRY_MS));
            questStatus("Couldn't finish " + entry.name + ": " + String(error && error.message || error), true);
        }).then(() => {
            if (quest.running === entry) { quest.running = null; notify("quests"); }
            if (entry.generation === quest.generation) questsSchedule(2000 + Math.floor(Math.random() * 2000));
        });
    }
    // Mirrors the server's answer into QuestStore, so Discord's own Quest screens stay right.
    function questVideoStatus(response) {
        const body = response && response.body;
        if (body && body.quest_id) questDispatch({type:"QUESTS_USER_STATUS_UPDATE", user_status:body});
        return !!(body && body.completed_at);
    }
    async function questVideo(entry, item) {
        const enrolled = questTime(item.userStatus && item.userStatus.enrolledAt), target = entry.task.target;
        if (!Number.isFinite(enrolled)) throw new Error("no accepted time");
        let done = questProgress(item, entry.task.type), completed = false;
        while (questActive(entry) && done < target) {
            const allowed = (Date.now() - enrolled) / 1000 + QUEST_VIDEO_LEEWAY, next = Math.min(target, done + QUEST_VIDEO_STEP);
            if (allowed < next) { await questSleep(Math.max(1000, Math.ceil((next - allowed) * 1000))); continue; }
            const response = await questRequest("/quests/" + entry.id + "/video-progress", {timestamp:Math.min(target, next + Math.random())});
            if (!questActive(entry)) return false;
            completed = questVideoStatus(response);
            done = next;
            if (completed) break;
            await questSleep(1000 + Math.floor(Math.random() * 500));
        }
        if (!questActive(entry)) return false;
        if (!completed) completed = questVideoStatus(await questRequest("/quests/" + entry.id + "/video-progress", {timestamp:target}));
        return completed;
    }
    // The executable_path desktop reports for a running game: the last two parts of its lowercase path, the way
    // its QuestProgressManager trims exePath (973522 Ic). Discord's own list of the game's Windows executables
    // is read once per game, and a test build, launcher or helper is never the one picked.
    function questExecutableName(app) {
        const all = app && Array.isArray(app.executables) ? app.executables : [];
        const rank = name => (/(^|[\/_.-])(test|launcher|crash|helper|setup|update|install|unins)/i.test(name) ? 2 : 0) + (name.includes("/") ? 1 : 0);
        const names = all.filter(e => e && e.os === "win32" && !e.is_launcher && typeof e.name === "string" && /\.exe$/i.test(e.name))
            .map(e => e.name.replace(/^>/, "").replace(/\\/g, "/").toLowerCase()).filter(name => !/(^|\/)\.\.(\/|$)/.test(name));
        names.sort((a, b) => rank(a) - rank(b) || (a < b ? -1 : a > b ? 1 : 0));
        return names[0] || null;
    }
    function questExecutablePath(app, exe) {
        const parts = exe.split("/").filter(Boolean);
        if (parts.length >= 2) return parts.slice(-2).join("/");
        const folder = String(app && app.name || "").toLowerCase().replace(/[<>:"\/\\|?*]/g, "").trim();
        return folder ? folder + "/" + parts[0] : null;
    }
    async function questExecutable(applicationId) {
        if (quest.executables.has(applicationId)) return quest.executables.get(applicationId);
        let path = null;
        try {
            const response = await questRequest("/applications/public?application_ids=" + applicationId, undefined, true, "get");
            const list = response && response.body, app = Array.isArray(list) ? list.find(a => a && String(a.id) === applicationId) : null;
            const exe = questExecutableName(app);
            if (exe) path = questExecutablePath(app, exe);
            // Only Discord's answer is remembered. A dropped connection used to leave the game unnamed until Discord restarted.
            if (quest.executables.size >= 64) quest.executables.delete(quest.executables.keys().next().value);
            quest.executables.set(applicationId, path);
        } catch (_) {}
        // Unknown is fine: desktop sends no path for a game it can't place either.
        return path;
    }
    // Same body as Discord's own sendHeartbeat (9765): application_id names the game or Activity, and a game
    // also says which executable is running. Play and Activity heartbeats go out as Discord for Windows.
    async function questHeartbeat(entry, desktop) {
        const body = {application_id:entry.task.applicationId, terminal:false};
        if (entry.executablePath) body.executable_path = entry.executablePath;
        const response = await questRequest("/quests/" + entry.id + "/heartbeat", body, desktop);
        const reply = response && response.body, status = questUserStatus(reply), type = entry.task.type;
        if (status) questDispatch({type:"QUESTS_SEND_HEARTBEAT_SUCCESS", questId:entry.id, userStatus:status});
        const value = Number(reply && reply.progress && reply.progress[type] && reply.progress[type].value);
        return {value:Number.isFinite(value) ? value : 0, completed:!!(reply && reply.completed_at)};
    }
    // Desktop's pace: a beat right away, then one a minute. With under a minute left it waits what's left plus a
    // second, and stops once Discord says the Quest is done. A finished Quest gets no terminal beat on desktop.
    async function questBeat(entry, desktop) {
        const target = entry.task.target;
        let best = -1, stalled = 0;
        while (questActive(entry)) {
            const beat = await questHeartbeat(entry, desktop);
            if (!questActive(entry)) return false;
            if (beat.completed || beat.value >= target) return true;
            // A Quest Discord stops counting used to get a heartbeat every minute for as long as Discord stayed open.
            if (beat.value > best) { best = beat.value; stalled = 0; }
            else if (++stalled >= QUEST_STALLED_BEATS) throw new Error("Discord stopped counting time");
            const left = Math.max(0, (target - beat.value) * 1000);
            await questSleep(left <= QUEST_HEARTBEAT_MS ? left + QUEST_HEARTBEAT_TAIL_MS : QUEST_HEARTBEAT_MS);
        }
        return false;
    }
    // Activity Quests: Discord counts time in the Activity without it being started. A mobile Activity Quest is
    // one the phone app reports itself, so only the others are sent as desktop.
    function questActivity(entry) { return questBeat(entry, !entry.task.mobile); }
    // Play Quests: Discord counts time for the quest's game without it being installed or started.
    async function questPlay(entry) {
        entry.executablePath = await questExecutable(entry.task.applicationId);
        if (!questActive(entry)) return false;
        return questBeat(entry, true);
    }
    // Mobile only loads Quests when you open them; ask for them once in a while, through Discord's own fetch.
    function questsFetch(force) {
        const store = questStore(), fetch = inspectedExport(9765, "fetchCurrentQuests");
        if (!store || typeof fetch !== "function") return;
        try {
            if (questFlag(store, "isFetchingCurrentQuests") === true) return;
            const last = questTime(questFlag(store, "lastFetchedCurrentQuests")) || 0;
            if (!force && last && Date.now() - last < QUEST_REFETCH_MS) return;
            const result = fetch();
            if (result && typeof result.catch === "function") result.catch(() => {});
        } catch (_) {}
    }
    function questsRefetchLoop() {
        quest.refetchTimer = undefined;
        if (!enabled("quests") || typeof global.setTimeout !== "function") return;
        questsFetch(false); questsSchedule(1000);
        quest.refetchTimer = global.setTimeout(questsRefetchLoop, QUEST_REFETCH_MS);
    }
    function questsStart(delay) {
        if (!enabled("quests") || typeof global.setTimeout !== "function") return;
        if (quest.refetchTimer !== undefined && global.clearTimeout) global.clearTimeout(quest.refetchTimer);
        quest.refetchTimer = global.setTimeout(questsRefetchLoop, delay);
    }
    // Stops everything in flight: switching it off, logging out, or another account signing in.
    function questsStop() {
        quest.generation++;
        quest.running = null; quest.enrolling = false; quest.enrollBlockedUntil = 0; quest.skip.clear();
        if (global.clearTimeout) {
            if (quest.scanTimer !== undefined) global.clearTimeout(quest.scanTimer);
            if (quest.refetchTimer !== undefined) global.clearTimeout(quest.refetchTimer);
        }
        quest.scanTimer = undefined; quest.refetchTimer = undefined;
    }
    function questsReset() { questsStop(); quest.completed = 0; quest.last = ""; quest.error = ""; notify("quests"); }
    function questsConnected(event) {
        const id = event && event.user && event.user.id;
        if (id && quest.user && id !== quest.user) questsReset();
        if (id) quest.user = id;
        // A reconnect keeps the quest that's running; a first connect waits for Discord to settle.
        questsStart(8000);
    }
    function questsInit(dispatcher) {
        if (quest.dispatcher || !dispatcher || typeof dispatcher.subscribe !== "function") return;
        quest.dispatcher = dispatcher;
        dispatcher.subscribe("CONNECTION_OPEN", questsConnected);
        dispatcher.subscribe("LOGOUT", () => { questsReset(); quest.user = null; });
    }
    function questsSettingChanged(key, value) {
        if (key === "quests" && !value) { questsStop(); return; }
        if (!enabled("quests")) return;
        if (key === "quests") { questsStart(1000); return; }
        // Turning a quest type off stops that kind if it's the one running.
        const running = quest.running && quest.running.task;
        if (!value && running && (key === "questsVideo" && running.kind === "video" || key === "questsActivity" && running.kind === "activity" ||
            key === "questsPlay" && running.kind === "play")) {
            quest.generation++; quest.running = null; quest.enrolling = false;
            if (quest.scanTimer !== undefined && global.clearTimeout) global.clearTimeout(quest.scanTimer);
            quest.scanTimer = undefined;
        }
        questsSchedule(1000);
    }
    function questStatusText() {
        if (!enabled("quests")) return "Off.";
        const lines = [quest.completed ? "Completed " + quest.completed + (quest.completed === 1 ? " Quest" : " Quests") + " since Discord opened." : "Waiting for new Quests."];
        if (quest.running) lines.push("Now: " + quest.running.name + ".");
        if (quest.last) lines.push("Last: " + quest.last);
        if (quest.error) lines.push(quest.error);
        return lines.join("\n");
    }
    // Settings page: three switches and a plain-language status line.
    const QUEST_NOTE = "Rewards still need claiming yourself. Stream Quests need a real stream, so they're skipped. Discord may pause Quests on accounts that complete them automatically.";
    function QuestSettings() {
        // Every status change (start, finish, error) already notifies "quests"; no 5-second redraw timer.
        useSettings("quests");
        const ui = reviewUI();
        if (!RN) return null;
        const Group = ui.TableRowGroup || RN.View, Switch = ui.TableSwitchRow, Text = inspectedExport(4833, "Text");
        const toggle = (key, label, subLabel) => switchRow(Switch, key, label, subLabel);
        const text = questStatusText();
        const groups = [
            el(Group, {key:"plugin", title:"Quest Completer"}, toggle("quests", "Complete Quests automatically", "Runs in the background whenever Discord is open. No screen opens and nothing needs a tap.")),
            el(Group, {key:"types", title:"Quests to complete"},
                toggle("questsVideo", "Video Quests", "Reports the video as watched, at normal speed."),
                toggle("questsPlay", "Play Quests", "Counts time for the game without installing or starting it."),
                toggle("questsActivity", "Activity Quests", "Counts time in an Activity without starting one."),
                toggle("questsEnroll", "Accept new Quests", "Accept Quests you haven't started, one at a time. Off: only Quests you accepted yourself.")),
            el(Group, {key:"status", title:"Status"}, el(RN.View, {style:{padding:12}},
                Text ? el(Text, {variant:"text-sm/medium", color:"text-default"}, text) : el(RN.Text, {style:{color:"#dbdee1", fontSize:14}}, text))),
            el(RN.View, {key:"note", style:{paddingHorizontal:4}},
                Text ? el(Text, {variant:"text-xs/medium", color:"text-muted"}, QUEST_NOTE) : el(RN.Text, {style:{color:"#949ba4", fontSize:12}}, QUEST_NOTE))];
        return settingsBody(ui, groups);
    }
    // Shared by the Read All, ReviewDB and NoDelete pages: Discord's spacing, scrolling and switch rows.
    function settingsBody(ui,groups,scroll) {
        const body=ui.Stack ? el(ui.Stack,{style:{paddingVertical:24,paddingHorizontal:12},spacing:24},groups) :
            el(RN.View,{style:{paddingVertical:24,paddingHorizontal:12,gap:24}},groups);
        return RN.ScrollView ? el(RN.ScrollView,scroll || null,body) : body;
    }
    function switchRow(Switch,key,label,subLabel) {
        return Switch ? el(Switch,{key,label,subLabel,value:settings[key],onValueChange:value=>setSetting(key,value)}) : null;
    }
    // Settings page: Discord's own radio list (TableRadioGroup 5995 / TableRadioRow 5994).
    function ReadAllSettings() {
        useSettings("readAll");
        const ui=reviewUI();
        if (!React || !RN) return null;
        const Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow;
        const RadioGroup=inspectedExport(5995,"TableRadioGroup"), RadioRow=inspectedExport(5994,"TableRadioRow");
        const choices=[["guilds","Servers","Mark every unread server as read."],["dms","Direct messages","Mark every unread DM and group DM as read."],
            ["both","Servers and DMs","Mark everything as read in one tap."]];
        const on=enabled("readAll");
        const picker=RadioGroup && RadioRow ?
            el(RadioGroup,{key:"mode",title:"When you tap Read all",value:settings.readAllMode,onChange:value => setSetting("readAllMode",value)},
                choices.map(([value,label,subLabel]) => el(RadioRow,{key:value,value,label,subLabel,disabled:!on}))) :
            el(Group,{key:"mode"},choices.map(([value,label]) => ui.TableRow &&
                el(ui.TableRow,{key:value,label:(settings.readAllMode===value ? "\u2713 " : "")+label,disabled:!on,onPress:() => setSetting("readAllMode",value)})));
        const groups=[
            el(Group,{key:"plugin",title:"Read All"},switchRow(Switch,"readAll","Show the Read all button","In the server list, under Direct Messages. Hold it for a one-time choice.")),
            picker];
        return settingsBody(ui,groups);
    }
    const deletedHighlight = {};
    function messageRow(orig, self, args) {
        const result = orig.apply(self,args), row = args[0];
        if (!result || !row || row.rowType !== 1 || !result.message) return result;
        let message = result.message;
        if (enabled("pastelize")) {
            message = pastelMessage(message,row.message);
            if (message.referencedMessage && message.referencedMessage.message) message = Object.assign({},message,{referencedMessage:
                Object.assign({},message.referencedMessage,{message:pastelMessage(message.referencedMessage.message,null)})});
        }
        let next = message === result.message ? result : Object.assign({},result,{message});
        const source = row.message || message;
        const channelId = source.channel_id || source.channelId || message.channelId;
        const id = source.id || message.id;
        const bucket = deleted.size && enabled("noDelete") && deletedByChannel.get(channelId);
        if (bucket && bucket.has(deletedKey(channelId,id)) && RN && typeof RN.processColor === "function") {
            // Native row highlight schema from RowGeneratorConstants (7379). No injected notice, altered
            // message content, or AutoMod state. Only retained local rows are tinted.
            if (deletedHighlight.owner !== RN.processColor) {
                deletedHighlight.owner = RN.processColor;
                deletedHighlight.gutter = RN.processColor("#f23f43");
                deletedHighlight.background = RN.processColor("#f23f431a");
            }
            next = Object.assign({},next,{backgroundHighlight:{backgroundColor:deletedHighlight.background,gutterColor:deletedHighlight.gutter}});
        }
        return next;
    }
    // Deferred retention bookkeeping; runs immediately where timers are absent.
    function later(fn, ms, immediate) { if (typeof global.setTimeout === "function") return global.setTimeout(fn, ms); if (immediate !== false) fn(); return undefined; }
    function inspectedExport(id, key) {
        // Demand-load only a verified bundled helper at the UI action/render boundary.
        // No module scans, remote scripts, or eager initialization of unrelated screens.
        if (typeof global.__r !== "function") return null;
        try { const exports = global.__r(id); return exports && exports[key]; } catch (_) { return null; }
    }
    const PLATFORM_COLORS = {online:"#23a55a",idle:"#f0b232",dnd:"#f23f43"};
    const PLATFORM_LABELS = {desktop:"Desktop",mobile:"Mobile",web:"Web",embedded:"Console",vr:"VR"};
    // This user's clients as a stable key, so a badge only re-renders when its own presence changes.
    function platformClients(userId) {
        let clients = presenceStore.getClientStatus(userId);
        const current = userStore && userStore.getCurrentUser();
        if (current && current.id === userId && sessionsStore && typeof sessionsStore.getSessions === "function") {
            clients = {};
            Object.values(sessionsStore.getSessions() || {}).forEach(session => {
                const client = session.clientInfo && session.clientInfo.client;
                if (client && client !== "unknown") clients[client] = session.status;
            });
        }
        return clients || null;
    }
    function platformKey(userId) {
        const clients = presenceStore && platformClients(userId);
        return clients ? Object.keys(clients).map(key => key + ":" + clients[key]).join(",") : "";
    }
    // One listener per store for every badge on screen, not two per badge. Each change works
    // out a person's clients once, however many badges show them, and wakes only those badges.
    const platformSubs = new Map(), platformStores = new Set();
    function platformChanged() {
        platformSubs.forEach((entry, userId) => {
            const key = platformKey(userId);
            if (key !== entry.key) { entry.key = key; entry.fns.forEach(fn => fn()); }
        });
    }
    function platformSubscribe(userId, fn) {
        let entry = platformSubs.get(userId);
        if (!entry) platformSubs.set(userId, entry = {key:platformKey(userId), fns:new Set()});
        entry.fns.add(fn);
        [presenceStore,sessionsStore].forEach(store => {
            if (store && !platformStores.has(store) && typeof store.addChangeListener === "function" && typeof store.removeChangeListener === "function") {
                platformStores.add(store); store.addChangeListener(platformChanged);
            }
        });
        return () => {
            entry.fns.delete(fn);
            if (!entry.fns.size && platformSubs.get(userId) === entry) platformSubs.delete(userId);
            if (!platformSubs.size) { platformStores.forEach(store => store.removeChangeListener(platformChanged)); platformStores.clear(); }
        };
    }
    function PlatformBadges(props) {
        useSettings("platformIndicators");
        const [,update] = React.useState(0);
        // SessionsStore is the upstream source for the current user's own clients.
        if (enabled("platformIndicators")) {
            if (!sessionsStore) sessionsStore = inspectedExport(4855,"default");
            if (!presenceStore) presenceStore = inspectedExport(4877,"default");
            if (!userStore) userStore = inspectedExport(1378,"default");
        }
        const userId = props.userId;
        React.useEffect(() => platformSubscribe(userId, () => update(n => n+1)),[presenceStore,sessionsStore,userId]);
        if (!enabled("platformIndicators") || !presenceStore || !RN) return null;
        const clients = platformClients(userId);
        if (!clients) return null;
        const colors = PLATFORM_COLORS, labels = PLATFORM_LABELS;
        // One icon per reported client, in presence order.
        const icons = Object.keys(clients).filter(key => key !== "unknown" && colors[clients[key]]).map(key =>
            el(RN.View,{key,accessible:true,accessibilityRole:"image",accessibilityLabel:(labels[key] || key)+": "+clients[key]},
                el(PlatformPng,{platform:key,color:colors[clients[key]]})));
        return icons.length ? el(RN.View,{key:"venus-platforms",style:{flexDirection:"row",gap:2,alignItems:"center"}},icons) : null;
    }
    function platformName(orig, self, args) {
        if (React) useSettings("platformIndicators");
        const tree = orig.apply(self,args), user = args[0] && args[0].user;
        if (!enabled("platformIndicators") || !settings.piProfile || !React || !RN || !tree || !user) return tree;
        return el(RN.View,{style:{flexDirection:"row",flexWrap:"wrap",gap:6,alignItems:"center"}},tree,el(PlatformBadges,{userId:user.id}));
    }
    // DM header (HBC fn58674 PrivateChannelHeader) renders its name inside a separate
    // ChannelTitle component (fn58681, props title/accessibleTitle/userId), so the badge
    // goes inside ChannelTitle's own output: right after the name, before the arrow.
    // One cached wrapper per component and placement, so React keeps the same element type.
    const platformTypes = {piDmHeader:new WeakMap(), piUserList:new WeakMap()};
    function platformType(target, option) {
        let type = platformTypes[option].get(target);
        if (!type) platformTypes[option].set(target, type = function () { return platformPlacement(target,this,arguments,option); });
        return type;
    }
    function platformHeader(orig,self,args) {
        if (React) useSettings("platformIndicators");
        const tree = orig.apply(self,args);
        if (!enabled("platformIndicators") || !settings.piDmHeader || !React || !RN || !tree) return tree;
        let swapped = false;
        function visit(node,depth) {
            if (!node || depth > 18 || typeof node !== "object") return node;
            if (Array.isArray(node)) { const next = node.map(child => visit(child,depth+1)); return next.some((c,i)=>c!==node[i]) ? next : node; }
            if (!node.props) return node;
            const p = node.props;
            if (!swapped && typeof node.type === "function" && "accessibleTitle" in p && "title" in p && typeof p.userId === "string") {
                swapped = true;
                const type = platformType(node.type,"piDmHeader");
                return el(type,Object.assign({},p,{key:node.key}));
            }
            const child = visit(p.children,depth+1);
            return child === p.children ? node : React.cloneElement(node,{children:child});
        }
        const next = visit(tree,0);
        return swapped ? next : placePlatformTree(tree,args[0] || {},"piDmHeader");
    }
    // DM list rows (MessagesItemChannelContent, fn65485): the name shares its line with the
    // server tag, so icons go in the right-side channelIcons row beside the muted/favorite
    // icon (props muted/selected/blocked), above the timestamp.
    function platformDmRow(orig,self,args) {
        if (React) useSettings("platformIndicators");
        const tree = orig.apply(self,args), channel = args[0] && args[0].channel;
        if (!enabled("platformIndicators") || !settings.piUserList || !React || !RN || !tree || !channel) return tree;
        const userId = channel.type === 1 && Array.isArray(channel.recipients) && channel.recipients.length === 1 && channel.recipients[0];
        if (!userId) return tree;
        const isIcon = child => child && child.props && "muted" in child.props && "selected" in child.props && "blocked" in child.props;
        let added = false;
        const next = cloneTree(tree,(node,p) => {
            if (added || node.type === RN.Text) return p;
            const children = Array.isArray(p.children) ? p.children : [p.children];
            if (!children.some(isIcon)) return p;
            added = true;
            return Object.assign({},p,{children:children.concat(el(RN.View,{key:"venus-platform-dm",style:{marginRight:4}},el(PlatformBadges,{userId})))});
        },0);
        return added ? next : placePlatformTree(tree,args[0] || {},"piUserList");
    }
    function platformPlacement(orig,self,args,option) {
        if (React) useSettings("platformIndicators");
        return placePlatformTree(orig.apply(self,args),args[0] || {},option);
    }
    // Pure tree transform: header/DM fallbacks MUST NOT subscribe a second time.
    // Their chosen placement changes while loading, changing channels or toggling
    // settings; putting hooks here changes the parent fiber's hook count.
    function placePlatformTree(tree,props,option) {
        if (!enabled("platformIndicators") || (option && !settings[option]) || !React || !RN || !tree) return tree;
        const channel = props.channel || channelStore && props.channelId && channelStore.getChannel(props.channelId);
        const userId = props.user && props.user.id || props.userId || channel && channel.type === 1 && channel.recipients && channel.recipients.length === 1 && channel.recipients[0];
        if (!userId) return tree;
        // Verified UserRow exposes label; private headers / DM content expose a
        // channel-title Text; voice MemberRowItem exposes its username Text. Preserve
        // every handler, subtitle, trailing action and frozen child.
        let added = false;
        return cloneTree(tree,(node,p) => {
            if (added) return p;
            if (p.label != null && typeof p.label !== "string" && typeof p.label !== "number") {
                added = true;
                return Object.assign({},p,{label:el(RN.View,{key:"venus-platform-label",style:{flexDirection:"row",alignItems:"center",gap:6,flexShrink:1}},p.label,el(PlatformBadges,{userId}))});
            }
            const children = Array.isArray(p.children) ? p.children : [p.children];
            const title = children.find(child => child && child.props && (child.type === RN.Text && typeof child.props.children === "string" || typeof child.props.variant === "string" && /(?:channel-title|heading|semibold)/.test(child.props.variant) || typeof child.props.userName === "string" && "userId" in child.props));
            // A React Native Text must not contain a View.
            if (!title || node.type === RN.Text) return p;
            added = true;
            return Object.assign({},p,{children:children.map(child => child !== title ? child : el(RN.View,{key:"venus-platform-title",style:{flexDirection:"row",alignItems:"center",gap:6,flexShrink:1}},child,el(PlatformBadges,{userId})))});
        },0);
    }
    const platformRenderers = new WeakMap();
    function platformRow(row) {
        // Swap a list row's private UserRow for a cached wrapper adding badges after its label.
        if (!row || typeof row !== "object" || typeof row.type !== "function" || !React) return row;
        return el(platformType(row.type,"piUserList"),Object.assign({},row.props,{key:row.key}));
    }
    function wrapProfileTree(tree, target, operation, cache) {
        if (!tree || !target || !React) return tree;
        let patched = cache.get(target);
        if (!patched) {
            patched = function () { return operation(target,this,arguments); };
            cache.set(target,patched);
        }
        // cloneTree transforms props, not element types; replace the specific named
        // child without invoking it outside React's hook lifecycle.
        function visit(node,depth) {
            if (!node || depth>18 || typeof node!=="object" || !node.props) return node;
            if (node.type === target) return el(patched,Object.assign({},node.props,{key:node.key}));
            const children=node.props.children;
            if (Array.isArray(children)) {
                const next=children.map(child=>visit(child,depth+1));
                return next.some((child,i)=>child!==children[i]) ? React.cloneElement(node,{children:next}) : node;
            }
            const child=visit(children,depth+1);
            return child===children ? node : React.cloneElement(node,{children:child});
        }
        return visit(tree,0);
    }
    function hiddenInfo(orig,self,args) {
        if (React) useSettings("hiddenChannels");
        const tree = orig.apply(self,args), channel = args[0] && args[0].channel;
        if (!tree || !React || !RN || !hiddenMetadata(channel)) return tree;
        const icon = nativeLock || inspectedExport(5410,"LockIcon");
        if (!icon) return tree;
        // Lock next to hidden names, (20px lock, right margin).
        return el(RN.View,{style:{flexDirection:"row",alignItems:"center"},accessibilityLabel:hiddenName(channel)+", locked"},
            el(icon,{color:"#80848e",style:{width:20,height:20,marginRight:4}}),tree);
    }
    function authorizationUrl(result) {
        // Do not depend on a browser-complete global URL / URLSearchParams in RN.
        // Rebuild ONLY our fixed HTTPS endpoint; untrusted query keys cannot add
        // credentials, change the host, request another client mod or leak a token.
        const location = typeof result === "string" ? result : result && result.location;
        if (typeof location !== "string" || location.length > 8192) throw new Error("Invalid authorization redirect");
        const match = /^https:\/\/manti\.vendicated\.dev\/api\/reviewdb\/auth\?([^#]*)$/.exec(location);
        if (!match) throw new Error("Invalid authorization redirect");
        const values = {};
        match[1].split("&").forEach(part => {
            const index = part.indexOf("="), key = decodeURIComponent(index < 0 ? part : part.slice(0,index));
            if (!["code","error","error_description"].includes(key)) return;
            if (owns(values,key)) throw new Error("Invalid authorization redirect");
            values[key] = decodeURIComponent((index < 0 ? "" : part.slice(index+1)).replace(/\+/g," "));
        });
        if (values.error) throw new Error(values.error === "access_denied" ? "Authorization cancelled" : "Discord did not authorize ReviewDB");
        if (!values.code || values.code.length > 2048 || /[\s\u0000-\u001f]/.test(values.code)) throw new Error("Invalid authorization redirect");
        return REVIEW_API+"/auth?code="+encodeURIComponent(values.code)+"&returnType=json&clientMod=vendetta";
    }
    async function reviewJson(url,options,timeoutMessage) {
        const controller = typeof global.AbortController === "function" ? new global.AbortController() : null;
        let timer;
        const task = Promise.resolve().then(async () => {
            const response = await global.fetch(url,Object.assign({credentials:"omit",headers:{accept:"application/json","content-type":"application/json"}},options,controller ? {signal:controller.signal} : {}));
            let result;
            try {result = await response.json();} catch (_) {throw new Error("ReviewDB returned an unreadable response (HTTP "+response.status+")");}
            if (!response.ok || !result || result.success === false) throw new Error(result && result.message || "ReviewDB HTTP "+response.status);
            return result;
        });
        // Abort alone is insufficient on Android versions without AbortController,
        // or on fetch implementations that don't reject when the signal aborts.
        const timeout = new Promise((resolve,reject) => {
            if (global.setTimeout) timer = global.setTimeout(() => {reject(new Error(timeoutMessage || "ReviewDB took too long to respond. Try again."));if (controller) controller.abort();},15000);
        });
        try {return await Promise.race([task,timeout]);}
        finally {if (timer !== undefined && global.clearTimeout) global.clearTimeout(timer);}
    }
    async function reviewRequest(path, method, body) {
        if (!enabled("reviewDB") || typeof global.fetch !== "function") throw new Error("ReviewDB is disabled or networking is unavailable");
        if (!/^\/(users(?:\/\d{17,20}\/reviews)?|reports)(?:\?|$)/.test(path)) throw new Error("Invalid ReviewDB request");
        // Credentials go in the Authorization header as ReviewDB's API expects, never in
        // JSON bodies (which proxies and error reporters are more likely to log).
        const token = method && method !== "GET" ? reviewAuth() : "";
        const headers = {accept:"application/json","content-type":"application/json",...(token ? {authorization:token} : {})};
        return reviewJson(REVIEW_API+path,{method:method || "GET",headers,...(body ? {body:JSON.stringify(body)} : {})});
    }
    function clearReviewAuth() {
        // Every Discord logout lands here: only rewrite preferences when a sign-in was saved.
        const saved=!!(reviewToken || reviewAccount);
        reviewAuthAttempt++;reviewToken="";reviewAccount=null;reviewAuthState="idle";reviewAuthError="";
        reviewCache.clear();if (saved) save();notify("reviewDB");
    }
    // One UserStore listener for every review view, and it only wakes them when the signed-in
    // account actually changes. Before, each open view re-rendered every review view on any user update.
    let reviewWatchers=0, reviewWatchStore=null, reviewWatchId;
    function reviewUserChanged() {
        const id=currentId();
        if (id===reviewWatchId) return;
        reviewWatchId=id;
        reviewAuth();
        notify("reviewDB");
    }
    function useReviews() {
        useSettings("reviewDB");
        React.useEffect(() => {
            const store=userStore;
            if (!store || typeof store.addChangeListener!=="function") return;
            if (!reviewWatchers++) { reviewWatchStore=store; reviewWatchId=currentId(); store.addChangeListener(reviewUserChanged); }
            return () => {
                if (--reviewWatchers || !reviewWatchStore) return;
                if (typeof reviewWatchStore.removeChangeListener==="function") reviewWatchStore.removeChangeListener(reviewUserChanged);
                reviewWatchStore=null;
            };
        },[userStore]);
    }
    function currentId() { const user=userStore && userStore.getCurrentUser(); return user && user.id; }
    // Discord design-system parts traced in the pinned HBC98 bundle. Demand-loaded at
    // render/action time only; no extra Metro factories are wrapped for them.
    const reviewExports=new Map();
    let reviewParts=null;
    function reviewUI() {
        // Once every part has loaded, reuse the same object: this runs on every render.
        if (reviewParts) return reviewParts;
        // Keep successful exports, never a partially initialized UI snapshot.
        // Missing exports must be retried when Metro finishes initializing them.
        const x=(id,key) => {
            const slot=id+":"+key;
            if (reviewExports.has(slot)) return reviewExports.get(slot);
            const value=inspectedExport(id,key);
            if (value != null) reviewExports.set(slot,value);
            return value;
        };
        let tokens=null;
        try { const t=typeof global.__r==="function" && global.__r(588); tokens=t && (t.default || t); } catch (_) {}
        const parts={TableRow:x(5916,"TableRow"),TableRowGroup:nativeRowGroup || x(5997,"TableRowGroup"),TableSwitchRow:nativeSwitchRow || x(6621,"TableSwitchRow"),
            Stack:x(5280,"Stack"),Card:x(5918,"Card"),FormRow:x(8057,"FormRow"),FormLabel:x(8057,"FormLabel"),FormSubLabel:x(8057,"FormSubLabel"),
            TextInput:x(6021,"TextInput"),Send:x(4778,"SendMessageIcon"),ActionSheet:x(6624,"ActionSheet"),Header:x(6571,"BottomSheetTitleHeader"),
            Close:x(6619,"ActionSheetCloseButton"),sheets:x(4801,"default"),showSheet:x(4801,"showActionSheet"),simpleSheet:x(6616,"showSimpleActionSheet"),clipboard:x(6614,"Clipboard"),
            alerts:x(5205,"default"),toasts:x(4531,"default"),pushModal:x(4694,"pushModal"),popModal:x(4694,"popModal"),OAuth:oauthModal || x(8510,"default"),
            createStyles:x(4837,"createStyles"),theme:x(4551,"useThemeContext"),colors:tokens && tokens.colors};
        if (Object.keys(parts).every(key => parts[key] != null)) reviewParts=parts;
        return parts;
    }
    function reviewToast(ui,content) {
        try { if (ui.toasts && typeof ui.toasts.open==="function") ui.toasts.open({key:"venus-toast",content}); } catch (_) {}
    }
    function hideReviewSheet(ui,key) { try { if (ui.sheets && typeof ui.sheets.hideActionSheet==="function") ui.sheets.hideActionSheet(key); } catch (_) {} }
    // Styles from Discord's createStyles: semantic tokens resolve
    // per theme. Decided once so a mounted card never changes its hook count.
    let reviewStyleHook, reviewStylesTried=false;
    function useReviewStyles(ui) {
        if (!reviewStylesTried) {
            reviewStylesTried=true;
            const c=ui.colors;
            if (typeof ui.createStyles==="function" && c) try {
                reviewStyleHook=ui.createStyles({card:{backgroundColor:c.CARD_BACKGROUND_DEFAULT,borderRadius:16,padding:8},
                    row:{backgroundColor:c.CARD_SECONDARY_BG},text:{color:c.TEXT_DEFAULT},muted:{color:c.TEXT_MUTED},
                    placeholder:{color:c.INPUT_PLACEHOLDER_TEXT_DEFAULT}});
            } catch (_) { reviewStyleHook=null; }
        }
        let styles=null;
        if (reviewStyleHook) try { styles=reviewStyleHook(); } catch (_) {}
        return styles || {card:{borderRadius:16,padding:8},row:{},text:{},muted:{},placeholder:{}};
    }
    function ReviewSettings() {
        useReviews();
        const ui=reviewUI();
        if (!React || !RN || !ui.TableRow) return null;
        const authenticated=!!reviewAuth(), pending=reviewAuthState==="exchanging";
        const Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow;
        const toggle=(key,label,subLabel) => switchRow(Switch,key,label,subLabel);
        const groups=[
            el(Group,{key:"plugin",title:"ReviewDB"},toggle("reviewDB","Enable ReviewDB","Read and write reviews of users and servers. Opening reviews shares that user or server ID with manti.vendicated.dev.")),
            el(Group,{key:"auth",title:"Account"},
                el(ui.TableRow,{key:"login",label:pending ? "Signing in..." : authenticated ? "Signed in to ReviewDB" : "Sign in to ReviewDB",
                    arrow:true,disabled:!enabled("reviewDB") || authenticated || pending,onPress:authenticateReviews,subLabel:reviewAuthError || (authenticated ? undefined : "Needed to post, delete or report reviews. Your Discord token is never used.")}),
                el(ui.TableRow,{key:"logout",label:"Sign out of ReviewDB",variant:authenticated ? "danger" : undefined,disabled:!authenticated,onPress:clearReviewAuth,
                    subLabel:"ReviewDB stays in Discord's Authorized Apps until you remove it there."})),
            el(Group,{key:"settings",title:"Settings"},
                toggle("reviewThemedSend","Profile-colored send button","Match the send button to the profile's theme colors."),
                toggle("reviewWarning","Show the be-respectful note","Show ReviewDB's reminder at the top of reviews."))];
        return settingsBody(ui,groups);
    }
    function NoDeleteSettings() {
        useSettings();
        const ui=reviewUI();
        const [draft,setDraft]=React.useState(String(settings.noDeleteLimit));
        // Follow the saved value when preferences finish loading after the page opened.
        React.useEffect(() => { setDraft(String(settings.noDeleteLimit)); },[settings.noDeleteLimit]);
        if (!React || !RN) return null;
        const Group=ui.TableRowGroup || RN.View, Switch=ui.TableSwitchRow;
        const toggle=(key,label,subLabel) => switchRow(Switch,key,label,subLabel);
        // An emptied field keeps the current maximum instead of silently resetting it to 512.
        const commit=() => { if (draft) setSetting("noDeleteLimit",draft); setDraft(String(settings.noDeleteLimit)); };
        const Text=inspectedExport(4833,"Text");
        const hint="Type 1 to "+MAX_DELETED+", then tap done. Now: "+settings.noDeleteLimit+". When it's full, the oldest message is removed.";
        const onText=text => setDraft(String(text).replace(/[^0-9]/g,"").slice(0,4));
        const inputProps={value:draft,keyboardType:"number-pad",maxLength:4,placeholder:"512",onBlur:commit,onSubmitEditing:commit,returnKeyType:"done"};
        // Discord's TextInput reports text via onChange(text); RN's via onChangeText.
        const input=ui.TextInput ? el(ui.TextInput,Object.assign({label:"Maximum saved messages",onChange:onText},inputProps)) :
            el(RN.TextInput,Object.assign({onChangeText:onText,style:{fontSize:16,padding:12}},inputProps));
        const groups=[
            el(Group,{key:"plugin",title:"NoDelete"},toggle("noDelete","Enable NoDelete","Keep deleted messages, including your own, outlined in red. Delete one again to hide it.")),
            el(Group,{key:"save",title:"Saving"},toggle("noDeleteSave","Save permanently","Keep them after Discord restarts, saved only on this phone for your account. When off, they're cleared on restart.")),
            el(Group,{key:"limit",title:"Maximum saved messages"},el(RN.View,{style:{padding:12,gap:8}},input,
                Text ? el(Text,{variant:"text-xs/medium",color:"text-muted"},hint) : el(RN.Text,{style:{color:"#949ba4",fontSize:12}},hint)))];
        return settingsBody(ui,groups,{keyboardShouldPersistTaps:"handled"});
    }
    function authenticateReviews() {
        if (!enabled("reviewDB") || reviewAuthState==="exchanging") return;
        const ui=reviewUI();
        if (typeof ui.pushModal!=="function" || typeof ui.popModal!=="function" || !ui.OAuth) {RN.Alert.alert("ReviewDB","Discord's authorization screen is unavailable. Reopen this page and try again.");return;}
        const accountId=currentId();
        if (!accountId) {RN.Alert.alert("ReviewDB","Discord account unavailable");return;}
        const attempt=++reviewAuthAttempt, key="oauth2-authorize";
        let closed=false;
        reviewAuthError="";notify("reviewDB");
        const live=() => enabled("reviewDB") && attempt===reviewAuthAttempt && currentId()===accountId;
        const close=() => { if (closed) return; closed=true; try { ui.popModal(key); } catch (_) {} };
        function fail(error) {
            if (!live()) return;
            reviewAuthState="idle";reviewAuthError=String(error && error.message || error);notify("reviewDB");
            reviewToast(ui,"Authorization failed! "+reviewAuthError);
        }
        ui.pushModal({key,modal:{key,modal:ui.OAuth,animation:"slide-up",shouldPersistUnderModals:false,closable:true,props:{
            clientId:"915703782174752809",redirectUri:REVIEW_API+"/auth",scopes:["identify"],responseType:"code",permissions:BigInt(0),cancelCompletesFlow:false,
            // Traced in 347.12 and 348.10 (useOAuth2AuthorizeForm, fn124513): after Authorize the form calls
            // dismissOAuthModal FIRST, waits 100 ms, and only THEN calls callback({location}).
            // Dismissal is never a cancellation; treating it as one discarded every sign-in.
            dismissOAuthModal:close,
            callback:result => {
                close();
                if (!live() || !result || result.canceled===true) return;
                let url;
                try { url=authorizationUrl(result); } catch (error) { fail(error); return; }
                reviewAuthState="exchanging";notify("reviewDB");
                reviewJson(url,{method:"GET"},"ReviewDB took too long to authorize. Try again.").then(auth => {
                    if (!live()) return;
                    if (auth.success!==true || typeof auth.token!=="string" || !auth.token.trim() || auth.token.length>8192) throw new Error(auth.message || "ReviewDB did not return a token");
                    reviewToken=auth.token;reviewAccount=accountId;reviewAuthState="idle";reviewAuthError="";reviewCache.clear();
                    save();notify("reviewDB");reviewToast(ui,"Successfully authenticated with ReviewDB");
                }).catch(fail);
            }}}});
    }
    function reviewsFor(userId, refresh) {
        if (!/^\d{17,20}$/.test(userId)) return Promise.reject(new Error("Invalid profile ID"));
        const cached = reviewCache.get(userId);
        if (!refresh && cached && cached.expires>Date.now()) return cached.promise;
        // Refreshing a cached profile replaces it in place; only a new profile evicts the oldest one.
        if (cached) reviewCache.delete(userId);
        else if (reviewCache.size>=32) reviewCache.delete(reviewCache.keys().next().value);
        const promise=reviewRequest("/users/"+userId+"/reviews").then(result=>{
            if (!Array.isArray(result.reviews)) throw new Error("Invalid review list");
            return result.reviews.slice(0,100).filter(review=>review && review.sender && typeof review.comment==="string");
        }).catch(error=>{
            // A newer request for this profile owns the slot; only drop our own failed entry.
            const current=reviewCache.get(userId);
            if (current && current.promise===promise) reviewCache.delete(userId);
            throw error;
        });
        reviewCache.set(userId,{promise,expires:Date.now()+60000});return promise;
    }
    function reviewAuth() {
        const current=currentId();
        // Only an actual account switch invalidates the token; an unloaded store at startup does not.
        if (reviewToken && reviewAccount && current && current!==reviewAccount) {
            reviewAuthAttempt++;reviewToken="";reviewAccount=null;reviewAuthState="idle";reviewCache.clear();save();
        }
        return reviewToken;
    }
    let reviewAdminsLoaded=false;
    const reviewAdmins=new Set();
    function loadReviewAdmins() {
        if (reviewAdminsLoaded || typeof global.fetch!=="function") return;
        reviewAdminsLoaded=true;
        reviewJson("https://manti.vendicated.dev/admins",{method:"GET"}).then(list => {
            if (Array.isArray(list)) list.forEach(id => { if (typeof id==="string") reviewAdmins.add(id); });
        },() => {reviewAdminsLoaded=false;});
    }
    const reviewImage=uri => typeof uri==="string" && /^https:\/\//.test(uri);
    function reviewActions(review, owner, ui, refetch) {
        const system=review.type===3, me=currentId(), sender=review.sender || {};
        function confirm(title, content, onConfirm) {
            if (ui.alerts && typeof ui.alerts.show==="function") try { ui.alerts.show({title,body:content,confirmText:"Yes",cancelText:"No",onConfirm}); return; } catch (_) {}
            RN.Alert.alert(title,content,[{text:"No",style:"cancel"},{text:"Yes",style:"destructive",onPress:onConfirm}]);
        }
        function mutate(path, method, body, done) {
            reviewRequest(path,method,body).then(result => {reviewCache.delete(owner);refetch();reviewToast(ui,result && result.message || done);},
                error => reviewToast(ui,String(error && error.message || error)));
        }
        const options=[{label:"Copy Text",onPress:() => {
            try { (ui.clipboard || RN.Clipboard).setString(review.comment); } catch (_) {}
            reviewToast(ui,"Copied Review Text");
        }}];
        if (reviewAuth() && !system) {
            if (sender.discordID===me || owner===me || reviewAdmins.has(me)) options.push({label:"Delete Review",isDestructive:true,
                onPress:() => confirm("Delete Review","Are you sure you want to delete this review?",() => mutate("/users/"+owner+"/reviews","DELETE",{reviewid:review.id},"Review deleted"))});
            options.push({label:"Report Review",isDestructive:true,
                onPress:() => confirm("Report Review","Are you sure you want to report this review?",() => mutate("/reports","PUT",{reviewid:review.id},"Review reported"))});
        }
        const title=system ? "ReviewDB System Message" : "Review by "+String(sender.username || "Unknown");
        if (typeof ui.simpleSheet==="function") try {
            ui.simpleSheet({key:"ReviewOverflow",header:{title,onClose:() => hideReviewSheet(ui,"ReviewOverflow")},options});return;
        } catch (_) {}
        RN.Alert.alert(title,undefined,options.map(option => ({text:option.label,style:option.isDestructive ? "destructive" : "default",onPress:option.onPress}))
            .concat([{text:"Cancel",style:"cancel"}]));
    }
    function ReviewRow(props) {
        const review=props.review, ui=props.ui, styles=props.styles, sender=review.sender;
        const timestamp=review.type!==3 && Number.isFinite(review.timestamp) ? new Date(review.timestamp*1000).toLocaleDateString() : "";
        const badges=(Array.isArray(sender.badges) ? sender.badges.slice(0,8) : []).filter(badge => badge && reviewImage(badge.icon));
        const label=el(RN.View,{style:{flexDirection:"row",alignItems:"center"}},
            el(ui.FormLabel,{text:String(sender.username || "Unknown"),style:styles.text}),
            el(RN.View,{style:{flexDirection:"row",alignItems:"center"}},badges.map((badge,index) =>
                el(RN.Pressable,{key:String(index),style:{marginLeft:4},onPress:() => reviewToast(ui,String(badge.name || ""))},
                    el(RN.Image,{source:{uri:badge.icon,width:16,height:16},style:{width:16,height:16}})))),
            el(ui.FormLabel,{text:timestamp,style:[styles.muted,{marginLeft:5}]}));
        return el(ui.TableRowGroup || RN.View,{style:[styles.row]},
            el(ui.FormRow,{style:[styles.row],label,
                subLabel:el(ui.FormSubLabel,{text:review.comment,style:styles.text}),
                leading:reviewImage(sender.profilePhoto) ? el(RN.Image,{style:{height:36,width:36,borderRadius:18},source:{uri:sender.profilePhoto}}) : undefined,
                onLongPress:() => reviewActions(review,props.owner,ui,props.refetch)}));
    }
    let reviewThemeHook, reviewThemeTried=false;
    function ReviewInput(props) {
        const ui=props.ui, styles=props.styles;
        const [text,setText]=React.useState(""), [busy,setBusy]=React.useState(false);
        // Like the style hook, choose once. Retrying missing UI exports must not
        // add a theme hook to an input which already mounted without one.
        if (!reviewThemeTried) {reviewThemeTried=true;reviewThemeHook=typeof ui.theme==="function" ? ui.theme : null;}
        // 348.10 useThemeContext (fn31267) throws outside its Provider. Reviews
        // on a server are not a user profile; keep the hook call but use the
        // standard send color when that optional context is absent.
        let theme=null;
        if (reviewThemeHook) try {theme=reviewThemeHook();} catch (_) {}
        const authenticated=!!reviewAuth(), canSend=authenticated && !busy && text.trim().length>0;
        const placeholder=!authenticated ? "You must be authenticated to add a review." : "Tap to "+(props.shouldEdit ? "edit your" : "add a")+" review";
        function send() {
            if (!canSend || !text.trim()) return;
            setBusy(true);
            reviewRequest("/users/"+props.userId+"/reviews","PUT",{comment:text.trim()}).then(result => {
                setText("");props.refetch();reviewToast(ui,result && result.message || "Review posted");
            },error => reviewToast(ui,String(error && error.message || error))).then(() => setBusy(false));
        }
        const input=ui.TextInput ?
            el(ui.TextInput,{style:[{flex:1,fontSize:16},styles.text],isDisabled:!authenticated,placeholder,placeholderTextColor:styles.placeholder.color,
                value:text,onChange:setText,maxLength:1000}) :
            el(RN.TextInput,{style:[{flex:1,fontSize:16},styles.text],editable:authenticated,placeholder,placeholderTextColor:styles.placeholder.color,
                value:text,onChangeText:setText,maxLength:1000});
        const color=settings.reviewThemedSend && theme && theme.primaryColor || "#5865f2";
        return el(RN.View,{style:{flexDirection:"row",alignItems:"center",gap:8,paddingHorizontal:8,paddingVertical:4}},
            el(RN.View,{style:{flex:1}},input),
            el(RN.Pressable,{accessibilityRole:"button",accessibilityLabel:props.shouldEdit ? "Update review" : "Send review",disabled:!canSend,onPress:send,
                style:{minHeight:40,minWidth:40,borderRadius:999,alignItems:"center",justifyContent:"center",backgroundColor:color,opacity:canSend ? 1 : 0.25}},
                ui.Send ? el(ui.Send,{size:"sm",color:"#ffffff"}) : el(RN.Text,{style:{color:"#ffffff",fontWeight:"700"}},">")));
    }
    function ReviewSection(props) {
        useReviews();
        const ui=reviewUI(), styles=useReviewStyles(ui), userId=props.userId;
        const [reviews,setReviews]=React.useState(null), [generation,reload]=React.useState(0), [error,setError]=React.useState("");
        const valid=typeof userId==="string" && /^\d{17,20}$/.test(userId);
        React.useEffect(() => {
            let live=true;
            if (!enabled("reviewDB") || !valid) return;
            setReviews(null);setError("");loadReviewAdmins();
            reviewsFor(userId,generation>0).then(list => {if (live) setReviews(list);},failure => {
                if (live) {setReviews(null);setError(String(failure && failure.message || failure).slice(0,512));}
            });
            return () => {live=false;};
        },[userId,generation,settings.reviewDB]);
        const Card=props.standalone ? RN && RN.View : ui.Card;
        if (!enabled("reviewDB") || !valid || !RN || !Card || !ui.FormRow) return null;
        const list=reviews || [], me=currentId();
        const shown=settings.reviewWarning ? list : list.filter(review => review.type!==3);
        const refetch=() => {reviewCache.delete(userId);reload(n => n+1);};
        const rows=error ? el(RN.View,{style:{gap:8}},
            el(RN.Text,{accessibilityRole:"alert",style:styles.text},"Couldn't load reviews: "+error),
            el(RN.Pressable,{accessibilityRole:"button",accessibilityLabel:"Retry reviews",onPress:refetch,style:{padding:12}},el(RN.Text,{style:styles.text},"Retry"))) :
            reviews===null ? el(RN.Text,{accessibilityLiveRegion:"polite",style:styles.muted},"Loading reviews...") :
            !shown.length ? el(RN.Text,{style:styles.muted},"No reviews yet.") :
            shown.map((review,index) => el(ReviewRow,{key:(review.id==null ? "" : String(review.id))+":"+index,review,owner:userId,ui,styles,refetch}));
        return el(RN.View,{style:[styles.card]},
            el(Card,props.standalone ? {accessibilityLabel:"Reviews"} : {title:"Reviews"},
                el(RN.View,{style:{gap:8}},rows),
                el(ReviewInput,{userId,ui,styles,refetch,shouldEdit:list.some(review => review.type!==3 && review.sender.discordID===me)})));
    }
    function ReviewSheet(props) {
        const ui=reviewUI();
        return el(ui.ActionSheet,{header:ui.Header ? el(ui.Header,{title:"Reviews",trailing:ui.Close ? el(ui.Close,{onPress:() => hideReviewSheet(ui,props.sheetKey)}) : undefined}) : undefined},
            el(RN.View,null,el(RN.ScrollView,{style:{gap:12,marginBottom:12}},el(ReviewSection,{userId:props.userId,standalone:true}))));
    }
    function openReviewSheet(userId) {
        if (!enabled("reviewDB") || !React || !RN || typeof userId!=="string" || !/^\d{17,20}$/.test(userId)) return;
        const ui=reviewUI();
        if (!ui.ActionSheet || typeof ui.showSheet!=="function") { reviewToast(ui,"Reviews are unavailable. Reopen the server menu and try again."); return; }
        // 4801's NAMED showActionSheet (HBC fn32121) takes an already-created
        // element, then schedules SHOW_ACTION_SHEET through Dispatcher.wait.
        // Reviews are bundled, not lazy imports: avoid openLazy's detached Promise
        // chain entirely. The inspected store (fn31181) accepts "stack".
        const key="VenusReviews:"+userId;
        try { ui.showSheet({key,content:el(ReviewSheet,{userId,sheetKey:key}),stackingBehavior:"stack"}); }
        catch (error) { reviewToast(ui,"Couldn't open reviews: "+String(error && error.message || error)); }
    }
    // Profiles: reviews go in as the LAST card of the profile card stack
    // (after the note). In 348.10 UserProfileNote (12627) is that last card in the normal, bot,
    // tabbed and You-screen layouts, so reviews render directly beneath it.
    function reviewNote(orig,self,args) {
        const tree=orig.apply(self,args), userId=args[0] && args[0].userId;
        if (!React || !RN || !features.reviewDB || typeof userId!=="string") return tree;
        return el(React.Fragment,null,tree,el(ReviewSection,{key:"venus-reviews:"+userId,userId}));
    }
    // The server sheet already supplies its native scrolling/presentation context
    // (GuildActionSheet fn60681). Expand content there instead of spawning a second
    // dialog. No detached dispatcher callback, new portal or nested RN ScrollView.
    function ServerReviews(props) {
        useReviews();
        const [open,setOpen]=React.useState(false), ui=reviewUI();
        React.useEffect(() => {setOpen(false);},[props.guildId]);
        if (!enabled("reviewDB") || !RN || !ui.TableRow) return null;
        return el(RN.View,null,
            el(ui.TableRowGroup || RN.View,null,el(ui.TableRow,{label:"Reviews",arrow:!open,
                subLabel:open ? "Tap to close server reviews." : "Read and write community reviews for this server.",
                accessibilityState:{expanded:open},onPress:() => {if (enabled("reviewDB")) setOpen(value => !value);}})),
            open ? el(ReviewSection,{key:props.guildId,userId:props.guildId,standalone:true}) : null);
    }
    function reviewGuild(orig,self,args) {
        if (React) useSettings("reviewDB");
        const props=args[0] || {}, guild=props.guild, ui=reviewUI();
        if (!enabled("reviewDB") || !React || !RN || !guild || !/^\d{17,20}$/.test(guild.id) || !ui.TableRow) return React ? el(orig,props) : orig.apply(self,args);
        return el(ServerReviews,{key:guild.id,guildId:guild.id});
    }
    // User long-press context menu gets a "Reviews" item.
    function reviewMenu(orig,self,args) {
        const props=args[0], menu=props && props.menu, id=menu && menu.key;
        if (!enabled("reviewDB") || !menu || !Array.isArray(menu.items) || menu.items.length!==3 || typeof id!=="string" || !/^\d{17,20}$/.test(id)) return orig.apply(self,args);
        const next=Array.from(args);
        next[0]=Object.assign({},props,{menu:Object.assign({},menu,{items:menu.items.concat([{label:"Reviews",action:() => openReviewSheet(id)}])})});
        return orig.apply(self,next);
    }
    function cloneWith(object, key, value) {
        // ES module markers, React tags, symbols and lazy getters are not necessarily enumerable.
        // Object.assign loses them and Metro imports the exports object as a component.
        const descriptors = Object.getOwnPropertyDescriptors(object);
        const old = descriptors[key];
        descriptors[key] = { value, writable: true, configurable: true, enumerable: old ? old.enumerable : true };
        return Object.create(Object.getPrototypeOf(object), descriptors);
    }
    function replaceValue(object, key, value) {
        const descriptor = Object.getOwnPropertyDescriptor(object, key);
        // Flux/store methods live on prototypes. Shadow them on the same instance:
        // cloning a live store would split dispatch state, subscriptions or private fields.
        if (!descriptor && Object.isExtensible(object)) {
            Object.defineProperty(object, key, {value, writable:true, configurable:true, enumerable:true});
            return object;
        }
        if (descriptor && descriptor.configurable) {
            Object.defineProperty(object, key, { value, writable: true, configurable: true, enumerable: descriptor.enumerable });
            return object;
        }
        if (descriptor && "value" in descriptor && descriptor.writable) { object[key] = value; return object; }
        return cloneWith(object, key, value);
    }
    function hookExport(exports, key, operation) {
        const orig = exports && exports[key];
        if (typeof orig !== "function") return exports;
        const patched = function () { return operation(orig, this, arguments); };
        return replaceValue(exports, key, patched);
    }
    // Hook a component export (plain function, or memo/forwardRef object) without breaking React tags.
    function hookComponent(exports, operation, key) {
        key = key || "default";
        const component = exports && exports[key];
        if (component && typeof component === "object" && component.$$typeof) {
            const inner = typeof component.type === "function" ? "type" : typeof component.render === "function" ? "render" : null;
            if (!inner) return exports;
            const orig = component[inner];
            return replaceValue(exports, key, cloneWith(component, inner, function () { return operation(orig, this, arguments); }));
        }
        return hookExport(exports, key, operation);
    }
    function activatePlugins(id, exports) {
        // MurmurHashV3 is CommonJS (module.exports=function), not an ES default export.
        if (features.pastelize && id === 1252) pastelHash = typeof exports === "function" ? exports : exports.default;
        if (features.pastelize && id === 2111) guildMembers = exports.default;
        if ((features.pastelize || features.noDelete) && id === 7378 && exports.default && exports.default.prototype) hookExport(exports.default.prototype,"generate",messageRow);
        if (features.platformIndicators && id === 4877) presenceStore = exports.default;
        if (features.platformIndicators && id === 4855) sessionsStore = exports.default;
        if (features.platformIndicators && id === 10603) {
            displayNameType=exports.DisplayName;
            exports=hookExport(exports,"DisplayName",platformName);
            return hookComponent(exports,(orig,self,args)=>wrapProfileTree(orig.apply(self,args),displayNameType,platformName,platformWrappers));
        }
        if (features.platformIndicators && id === 12845) return hookComponent(exports,platformHeader);
        if (features.platformIndicators && id === 15667) return hookComponent(exports,platformDmRow);
        // User list rows (UserRow, default export) and voice panel rows (FormComponents' named MemberRowItem).
        if (features.platformIndicators && id === 10371) return hookComponent(exports,(orig,self,args)=>platformPlacement(orig,self,args,"piUserList"));
        if (features.platformIndicators && id === 9108) return hookComponent(exports,(orig,self,args)=>platformPlacement(orig,self,args,"piUserList"),"MemberRowItem");
        // Profile "in voice" users (UserProfileActivityVoiceChannelUsers): private UserRow rows.
        if (features.platformIndicators && id === 12602) return hookComponent(exports,(orig,self,args)=>{
            const tree=orig.apply(self,args);
            if (!enabled("platformIndicators") || !settings.piUserList || !React || !tree) return tree;
            return cloneTree(tree,(node,p)=>{
                if (typeof p.renderItem!=="function" || p.__venusPlatforms) return p;
                const render=p.renderItem;
                // Same wrapper for the same renderItem, so the list doesn't redraw every row.
                let renderItem=platformRenderers.get(render);
                if (!renderItem) platformRenderers.set(render,renderItem=function(){return platformRow(render.apply(this,arguments));});
                return Object.assign({},p,{__venusPlatforms:true,renderItem});
            },0);
        });
        // Plain status dot on avatars: avatar Status (design/void/Status,
        // 13649) draws a phone badge when isMobileOnline; show the plain dot instead.
        if (features.platformIndicators && id === 13649) {
            const plain = (orig,self,args) => {
                const props = args[0];
                if (!enabled("platformIndicators") || !settings.piHideMobile || !props || !props.isMobileOnline) return orig.apply(self,args);
                const next = Array.from(args); next[0] = Object.assign({},props,{isMobileOnline:false}); return orig.apply(self,next);
            };
            return hookExport(hookExport(exports,"default",plain),"StatusWithTyping",plain);
        }
        if (features.readAll && id === 15929) return hookExport(exports,"default",readAllBarProps);
        if (features.reviewDB && id === 8510) oauthModal=exports.default;
        if (features.reviewDB && id === 5997) nativeRowGroup=exports.TableRowGroup;
        if (features.reviewDB && id === 6621) nativeSwitchRow=exports.TableSwitchRow;
        if (features.hiddenChannels && id === 5410) nativeLock=exports.LockIcon;
        if (features.hiddenChannels && id === 15859) {
            // ChannelInfo can be consumed as default export and as named export
            // (GuildRolesAndChannelsRow reads it by name); hook both.
            exports = hookComponent(exports,hiddenInfo);
            return hookExport(exports, "ChannelInfo", hiddenInfo);
        }
        if (features.reviewDB && id === 12627) return hookComponent(exports,reviewNote);
        if (features.reviewDB && id === 13987) return hookExport(exports,"ContextMenuPopout",reviewMenu);

        if (features.reviewDB && id === 13521) return hookComponent(exports,reviewGuild);
        if (id === 14130) exports.SETTING_RENDERER_CONFIG = nativeRegistry(exports.SETTING_RENDERER_CONFIG);
        if (id === 10874) return hookExport(exports, "createList", settingsSections);
        if (id === 14236) SettingsList = exports.SettingsList;
        if (features.copyBios && id === 10742) return hookComponent(exports, copyBio);
        if ((features.dashless || features.hiddenChannels) && id === 4990) {
            exports = hookExport(exports,"computeChannelName",channelLabel);
            return hookExport(exports, "default", channelLabel);
        }
        if (features.favouriteAnything && id === 12524) return hookComponent(exports, favouriteButton);
        if (features.favouriteAnything && id === 9861) return hookExport(exports, "addFavoriteGIF", favouriteAdd);
        if (features.favouriteAnything && id === 9864) return hookExport(exports, "useFavoriteGIFsMobile", favouriteList);
        if (id === 2051) channelStore = exports.default;
        if (features.noTyping && id === 11348) return replaceValue(exports, "default",
            hookExport(hookExport(exports.default, "startTyping", typing), "stopTyping", typing));
        if (features.quickDelete && id === 1127) locale = exports;
        if (features.quickDelete && id === 5205) return replaceValue(exports, "default", hookExport(exports.default, "show", quickConfirm));
        if (features.noDelete && id === 5059) {messageRecords = exports; restoreDeleted();}
        if ((features.noDelete || features.reviewDB || features.platformIndicators || features.hiddenChannels) && id === 1378) {userStore = exports.default; restoreDeleted();}
        if (features.noDelete && id === 5057) {
            msgStore = exports.default;
            exports = replaceValue(exports,"default",hookExport(hookExport(msgStore,"getMessage",retainedMessage),"getMessages",retainedMessages));
            restoreDeleted(); return exports;
        }
        if (features.quests && id === 7120) questAttach(exports.default);
        if (features.quests && id === 585) questsInit(exports.default);
        if ((features.noDelete || features.reviewDB || features.hiddenChannels) && id === 585) {
            dispatcher = exports.default.dispatch.bind(exports.default);
            return replaceValue(exports, "default", hookExport(exports.default, "dispatch", dispatchEvent));
        }
        if (features.hiddenChannels && [1086,1097].includes(id) && exports.Permissions) viewPermission = exports.Permissions.VIEW_CHANNEL;
        if (features.hiddenChannels && id === 1113) {
            exports = hookExport(exports, "transitionTo", hiddenNavigation);
            exports = hookExport(exports, "replaceWith", hiddenNavigation);
            return hookExport(exports, "transitionToGuild", hiddenGuildNavigation);
        }
        if (features.hiddenChannels && id === 4472) {
            // Lioncat6 finds permissions via findByProps("getChannelPermissions","can");
            // In 348.10 PermissionStore (4472) is the only module exporting both.
            // Candidate may be default export or the exports object itself.
            const candidate = exports && exports.default && typeof exports.default.can === "function" ? exports.default :
                exports && typeof exports.can === "function" ? exports : null;
            if (candidate) permissions = candidate;
            // Globally reveal VIEW_CHANNEL so Discord builds
            // real channel records (names) instead of obfuscated "hidden" stubs.
            // Message/voice access stays blocked via hiddenFetch/hiddenNavigation guards.
            // Use hookExport so frozen/sealed singletons are still patched via clone.
            try {
                if (candidate && !permissionsCanOrig) {
                    permissionsCanOrig = candidate.can.bind(candidate);
                    permissions = hookExport(hookExport(candidate, "can", hiddenCan), "canBasicChannel", hiddenCan);
                    return candidate === exports ? permissions : replaceValue(exports, "default", permissions);
                }
            } catch (_) {}
        }
        if (features.hiddenChannels && id === 4470) return replaceValue(exports, "default", hookExport(exports.default, "getChannels", hiddenDirectory));
        if (features.jumpToTop && id === 8838) chatHeight = exports;
        if (features.jumpToTop && id === 11643) jumpPill = exports.default;
        // 348.10's arrow is a registered image asset: Metro exports the asset id itself, not a default.
        if (features.jumpToTop && id === 11644) jumpIcon = exports && typeof exports === "object" && "default" in exports ? exports.default : exports;
        if (features.jumpToTop && id === 11642) return hookComponent(exports, jumpButton);
        if (features.jumpToTop && [9804,10418,15746].includes(id)) return hookComponent(exports, jumpSheet);
        if (id === 6880) {
            let actions = exports.default;
            if (!actions) return exports;
            if (features.noDelete) actions = hookExport(actions, "deleteMessage", deleteMessage);
            if (features.hiddenChannels) actions = hookExport(actions, "fetchMessages", hiddenFetch);
            if (features.freeNitro) {
                actions = hookExport(actions, "sendMessage", sendMessage);
                actions = hookExport(actions, "_sendMessage", sendMessage);
                actions = hookExport(actions, "sendStickers", sendStickers);
            }
            msgActions = actions;
            return replaceValue(exports, "default", actions);
        }
        if (!features.freeNitro) return exports;
        if (id === 1378) userStore = exports.default;
        if (id === 13528) { emojiCatalog = exports; return hookExport(exports, "canUserUse", catalogEligibility); }
        if (id === 5772) emojiStore = exports.default;
        if (id === 5815) stickerStore = exports.default;
        if (id === 4491) {
            // The pinned build exports the capabilities on a default singleton;
            // named aliases are not used by its picker. Hook the inspected object.
            let capabilities = exports.default || exports;
            function patchCapability(key, setting) {
                premiumOriginal[key] = typeof capabilities[key] === "function" ? capabilities[key].bind(capabilities) : undefined;
                capabilities = hookExport(capabilities, key, premiumOverride(key, setting));
            }
            patchCapability("canUseEmojisEverywhere", "emojis");
            patchCapability("canUseAnimatedEmojis", "emojis");
            // Keep sticker eligibility stock: only the inspected premium-only sendability result is relaxed.
            premiumOriginal.canUseCustomStickersEverywhere = typeof capabilities.canUseCustomStickersEverywhere === "function" ? capabilities.canUseCustomStickersEverywhere.bind(capabilities) : undefined;
            if (exports.default) exports = replaceValue(exports, "default", capabilities);
            else exports = capabilities;
        }
        if (id === 6756) {
            stickerRules = exports;
            exports = hookExport(exports, "getStickerSendability", sendability);
            exports = hookExport(exports, "isSendableSticker", sendableSticker);
            stickerRules = exports;
        }
        return exports;
    }

    function instrument(exports, depth) {
        if (!exports || (typeof exports !== "object" && typeof exports !== "function")) return exports;
        if (owns(exports, "createElement") && owns(exports, "useState")) React = exports;
        if (owns(exports, "View") && owns(exports, "Text") && owns(exports, "Modal")) RN = exports;
        if (typeof data(exports, "getSize") === "function" && typeof data(exports, "readFile") === "function" &&
            typeof data(exports, "writeFile") === "function") initFiles(exports);
        if (features.voice && owns(exports, "CloudUpload")) instrumentCloudUpload(exports.CloudUpload);
        const changes = new Map();
        let proxy = exports;
        if (features.picker) {
            const patched = pickerComponent(exports);
            if (patched !== exports) return patched;
        }
        // Invocation-scoped captures also work when Hermes eval disables block scoping.
        // The binding check fails fast at hook time (caught as "Hook unavailable",
        // leaving the module stock) instead of crashing the app at call time.
        function replacementFor(operation, orig) {
            if (typeof operation !== "function" || typeof orig !== "function")
                throw new Error("Venus: unusable export binding for hook");
            return function () { return operation(orig, this === proxy ? exports : this, arguments); };
        }
        // Only read explicitly identified export keys, never enumerate or invoke unrelated getters.
        for (const key of ["getAttachmentPayload", "post"]) {
            if (!owns(exports, key)) continue;
            if (key === "getAttachmentPayload" && !features.voice) continue;
            if (key === "post" && (!features.voice || !owns(exports, "get") || !owns(exports, "put"))) continue;
            let orig;
            try { orig = exports[key]; } catch (_) { continue; }
            if (typeof orig !== "function") continue;
            const operation = key === "post" ? postRequest : attachmentPayload;
            const patched = replacementFor(operation, orig);
            changes.set(key, patched);
            if (key === "post") status.request = true;
            if (key === "getAttachmentPayload") status.attachment = true;
        }
        if (depth < 2) for (const key of ["default", "HTTP"]) {
            // Data exports only: default getters can be cyclic during module initialization.
            const candidate = data(exports, key);
            if (!candidate || candidate === exports) continue;
            const patched = instrument(candidate, depth + 1);
            if (patched !== candidate) changes.set(key, patched);
        }
        if (!changes.size) return exports;
        // Preserve module identity and cached aliases wherever descriptors allow it.
        for (const [key, patched] of Array.from(changes)) {
            const descriptor = Object.getOwnPropertyDescriptor(exports, key);
            if (descriptor && descriptor.configurable) {
                Object.defineProperty(exports, key, { value: patched, writable: true,
                    configurable: true, enumerable: descriptor.enumerable });
                changes.delete(key);
            } else if (descriptor && "value" in descriptor && descriptor.writable) {
                exports[key] = patched;
                changes.delete(key);
            }
        }
        if (!changes.size) return exports;
        // Only immutable accessor exports need a proxy; never inspect them during RN initialization.
        // Do not violate Proxy invariants on non-writable, non-configurable data properties.
        for (const key of Array.from(changes.keys())) {
            const descriptor = Object.getOwnPropertyDescriptor(exports, key);
            if (descriptor && !descriptor.configurable && "value" in descriptor && !descriptor.writable)
                changes.delete(key);
        }
        proxy = new Proxy(exports, { get(target, key, self) {
            return changes.has(key) ? changes.get(key) : Reflect.get(target, key, self);
        } });
        return changes.size ? proxy : exports;
    }
    function activateModule(id, module) {
        try {
            if (id === 1163) {
                const nativeFiles = module.exports.default;
                if (nativeFiles && typeof nativeFiles.getSize === "function" &&
                    typeof nativeFiles.readFile === "function" && typeof nativeFiles.writeFile === "function")
                    initFiles(nativeFiles);
            }
            module.exports = activatePlugins(id, module.exports);
            if ([17, 19, 414, 1163, 1283, 5440, 5442].includes(id)) module.exports = instrument(module.exports, 0);
        } catch (error) {
            status.audioError = "Hook unavailable: " + String(error);
            if (global.console && typeof global.console.warn === "function")
                global.console.warn("[Venus] Hook unavailable", String(error));
        }
    }
    function decorateDefine(define) {
        if (typeof define !== "function") return define;
        return function (factory, id, dependencies) {
            if ((id !== 120 && !targetModules.has(id)) || typeof factory !== "function") return define.apply(this, arguments);
            const args = Array.from(arguments);
            args[0] = function () {
                const factoryArgs = Array.from(arguments);
                if (features.hiddenChannels && id === 6952) {
                    factoryArgs[1] = listImport(factoryArgs[1]);
                    factoryArgs[2] = listImport(factoryArgs[2]);
                    factoryArgs[3] = listImport(factoryArgs[3]);
                }
                const result = factory.apply(this, factoryArgs);
                const module = arguments[4]; // Verified Metro factory ABI in Discord 348.10.
                if (module && module.exports) {
                    if (id === 120) {
                        const initialize = module.exports.default;
                        let initializing = false;
                        if (typeof initialize === "function") module.exports.default = function () {
                            // Original errors propagate unchanged; only the outer successful init is ready.
                            if (initializing) return initialize.apply(this, arguments);
                            initializing = true;
                            let value;
                            try { value = initialize.apply(this, arguments); }
                            finally { initializing = false; }
                            environmentReady = true;
                            for (const [pendingId, pending] of deferred) activateModule(pendingId, pending);
                            deferred.clear();
                            return value;
                        };
                    } else if (!environmentReady) deferred.set(id, module);
                    else activateModule(id, module);
                }
                return result;
            };
            return define.apply(this, args);
        };
    }
    const existing = global.__d;
    let define = decorateDefine(existing);
    Object.defineProperty(global, "__d", { configurable: true, enumerable: true,
        get: () => define, set: value => { define = decorateDefine(value); } });
    // Local diagnostics/test API; not a network endpoint and no client-mod globals.
    global.__venusPatches = Object.freeze({ revision, settings, features, status, setSetting, formatSize, getSize });
})(globalThis);
