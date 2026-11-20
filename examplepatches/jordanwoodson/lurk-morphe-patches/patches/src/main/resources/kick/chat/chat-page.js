// Lurk's changes to Kick's chat page (chat.mobile.kick.com), which Kick shows in a WebView on the stream screen
// and the channel's Chat tab. KickChat evaluates `(<this function>)(options)` when the page starts and again when
// it finishes loading, with the switches that are on:
//   moderatorView Show deleted messages is on. Its moderator view comes from lurk-chat-moderator.js, which runs
//                 before the page's own scripts; this only reports whether that worked.
//   timestamps    show each line's time; textSize the chat text size in px; compact less space between lines
//   clock         with timestamps: 0 writes the times as 13:05, 1 as 1:05, as on Twitch
//   ignoreClears  keep the messages when a moderator clears the chat
//   hide          CSS selectors of chat lines to hide (subs and gifts, hosts, reward redemptions)
//   sevenTv       show 7TV emotes. sevenTvChannel is the channel's slug and sevenTvUser its owner's Kick user ID,
//                 each null when the app hasn't seen them; without either only global emotes show.
//   sevenTvBadges show the 7TV badge each chatter chose, as 7TV's event service reports it for the channel of
//                 sevenTvUser (its owner's Kick user ID); nothing without it.
//   keywords     Chat keywords: send each chat line to the app and tint or hide it by the app's verdict.
//   search       Chat search: a button at the top right opens a box; while it holds text, only the lines whose
//                sender or text contain it stay shown, new ones included.
//   generation    this page's token, which the app requires on every message the page sends it.
// The page is served by Kick and can change at any time, so every step only touches what it finds and does
// nothing otherwise.
(function (options) {
    'use strict';
    // At page start the WebView can still be showing the previous document.
    if (location.host !== 'chat.mobile.kick.com') return 'not the chat page';
    // While the page still loads, the document-start script may not have run yet: report it once it has.
    const moderator = () => !options.moderatorView || document.readyState === 'loading' ? []
        : [window.lurkModeratorView ? 'moderator view' : 'no moderator view'];
    if (window.lurkChat) return ['already applied'].concat(moderator()).join(', ');
    window.lurkChat = options;
    const applied = moderator();

    function whenReady(run) {
        const go = () => {
            const app = document.getElementById('app');
            if (app) run(app);
        };
        if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', go, {once: true});
        else go();
    }

    if (options.hide && options.hide.length) {
        whenReady(() => {
            const style = document.createElement('style');
            style.textContent = options.hide.join(',') + '{display:none!important}';
            (document.head || document.documentElement).appendChild(style);
        });
        applied.push('hide ' + options.hide.join(' '));
    }

    // Chat timestamps, text size and compact lines: the page styles each line from custom properties on <body>,
    // which it sets inline from the app's chat settings (--timestamps-display, --chatroom-font-size,
    // --message-gap). A stylesheet rule marked !important wins over those inline values whenever the page sets them.
    const look = [];
    if (options.timestamps) look.push('--timestamps-display:inline!important');
    if (Number.isInteger(options.textSize) && options.textSize >= 10 && options.textSize <= 32) {
        look.push('--chatroom-font-size:' + options.textSize + 'px!important');
    }
    if (options.compact) look.push('--message-gap:0px!important;line-height:1.3!important');
    if (look.length) {
        whenReady(() => {
            const style = document.createElement('style');
            style.textContent = 'body{' + look.join(';') + '}' +
                (options.compact ? '.message-container{padding-top:1px!important;padding-bottom:1px!important}' : '');
            (document.head || document.documentElement).appendChild(style);
        });
        if (options.timestamps) applied.push('timestamps');
        if (look.length > (options.timestamps ? 1 : 0)) applied.push('text size ' + (options.textSize || 'Kick') +
            (options.compact ? ', compact' : ''));
    }

    if (options.timestamps && (options.clock === 0 || options.clock === 1)) {
        clock(options.clock === 1);
        applied.push(options.clock === 1 ? '12-hour clock' : '24-hour clock');
    }

    // Chat timestamps clock: the page writes each line's time into its .timestamp with
    // toLocaleTimeString(locale, {hour: '2-digit', minute: '2-digit'}) in the config's locale ("01:05 PM" in English,
    // "13:05" in German). Lurk writes it as Twitch does, 13:05 or 1:05: the hour and minute come back from the page's
    // own text through a table of every minute of a day written the same way. Text the table doesn't know, or that
    // two minutes share, stays as Kick wrote it.
    function clock(twelve) {
        let minutes = null, observer;
        const locale = () => {
            if (typeof window.locale === 'string' && window.locale) return window.locale;
            try {
                const config = JSON.parse(new URL(location.href).searchParams.get('config'));
                if (config && typeof config.locale === 'string' && config.locale) return config.locale;
            } catch (_) { /* The page's default below. */ }
            return 'en';
        };
        const table = () => {
            if (minutes) return minutes;
            minutes = new Map();
            const day = new Date(2000, 0, 1);
            try {
                for (let minute = 0; minute < 1440; minute++) {
                    day.setHours(Math.floor(minute / 60), minute % 60, 0, 0);
                    const text = day.toLocaleTimeString(locale(), {hour: '2-digit', minute: '2-digit'});
                    minutes.set(text, minutes.has(text) ? -1 : minute);
                }
            } catch (_) {
                minutes.clear();
            }
            return minutes;
        };
        const rewrite = (stamp) => {
            if (stamp.dataset.lurkClock) return;
            const minute = table().get(stamp.textContent);
            if (minute === undefined || minute < 0) return;
            const hour = Math.floor(minute / 60), rest = minute % 60;
            stamp.dataset.lurkClock = '1';
            stamp.textContent = (twelve ? hour % 12 || 12 : hour) + ':' + (rest < 10 ? '0' : '') + rest;
        };
        whenReady((app) => {
            app.querySelectorAll('.timestamp').forEach(rewrite);
            observer = new MutationObserver((records) => {
                for (const record of records) for (const node of record.addedNodes) {
                    if (node.nodeType !== 1) continue;
                    if (node.matches('.timestamp')) rewrite(node);
                    node.querySelectorAll('.timestamp').forEach(rewrite);
                }
            });
            observer.observe(app, {childList: true, subtree: true});
        });
        window.addEventListener('pagehide', () => { if (observer) observer.disconnect(); }, {once: true});
    }

    // The page clears chat by emptying the message list (`app.innerHTML = ""`); nothing else empties it outside
    // the KICKs gift preview, which KickChat leaves alone.
    if (options.ignoreClears) {
        whenReady((app) => {
            const html = Object.getOwnPropertyDescriptor(Element.prototype, 'innerHTML');
            if (!html || !html.set) return;
            Object.defineProperty(app, 'innerHTML', {
                configurable: true,
                get() {
                    return html.get.call(this);
                },
                set(value) {
                    if (value !== '') html.set.call(this, value);
                },
            });
        });
        applied.push('ignore clears');
    }

    if (options.sevenTv) {
        sevenTv(options.sevenTvChannel, options.sevenTvUser);
        applied.push('7tv ' + (options.sevenTvUser || options.sevenTvChannel || 'global only'));
    }

    if (options.sevenTvBadges) {
        if (sevenTvBadges(options.sevenTvUser)) applied.push('7tv badges ' + options.sevenTvUser);
        else applied.push('7tv badges: channel owner unknown');
    }

    if (options.search) {
        whenReady(search);
        applied.push('search');
    }

    if (options.keywords && options.generation && window.ReactNativeWebView) {
        keywords();
        applied.push('keywords');
    }

    // 7TV badges: 7TV publishes no list of badge holders. Its event service pushes, for a channel, the badge each
    // chatter there chose (an entitlement naming the 7TV user and their linked Kick account) and each badge's image
    // (a cosmetic), which is how 7TV's own browser extension learns them. One WebSocket to events.7tv.io subscribes
    // to both for the channel's owner; no chatter is looked up. A line whose sender (data-sender-id, the Kick user
    // ID) holds a badge gets its image after Kick's own badges, also when the badge arrives after the line.
    function sevenTvBadges(user) {
        if (typeof user !== 'string' || !/^[0-9]{1,20}$/.test(user)) return false;
        const badges = new Map(), holders = new Map();
        const timers = new Set();
        let stopped = false, socket = null, reconnect = 0, heartbeat = null, observer = null, app = null;
        const later = (fn, ms) => {
            const timer = setTimeout(() => { timers.delete(timer); if (!stopped) fn(); }, ms);
            timers.add(timer); return timer;
        };
        const cancel = (timer) => { clearTimeout(timer); timers.delete(timer); };
        // { "id", "tooltip", "name", "host": { "url": "//cdn.7tv.app/badge/<id>", "files": [{ "name": "3x.webp",
        // "static_name", "width", "frame_count" }] } }: the largest file up to 3x, its still copy when animated.
        function badgeOf(data) {
            const host = data && data.host;
            if (!host || typeof host.url !== 'string' || !/^\/\/cdn\.7tv\.app\/badge\/[0-9A-Za-z]{1,32}$/.test(host.url) ||
                !Array.isArray(host.files)) return null;
            let chosen = null, width = 0;
            for (const file of host.files.slice(0, 16)) {
                if (!file || typeof file.name !== 'string') continue;
                const w = Number(file.width) || 0;
                if (file.name.startsWith('4x') || w > 72 || w <= width) continue;
                const name = Number(file.frame_count) > 1 && typeof file.static_name === 'string' ? file.static_name : file.name;
                if (!/^[1-3]x(?:_static)?\.(?:webp|png)$/.test(name)) continue;
                chosen = name; width = w;
            }
            if (!chosen) return null;
            const title = typeof data.tooltip === 'string' && data.tooltip ? data.tooltip
                : typeof data.name === 'string' && data.name ? data.name : '7TV badge';
            return {url: 'https:' + host.url + '/' + chosen, title: title.slice(0, 100)};
        }
        // The Kick user ID among a 7TV user's linked accounts.
        function kickUser(account) {
            const connections = account && Array.isArray(account.connections) ? account.connections : [];
            for (const connection of connections.slice(0, 16)) {
                if (connection && connection.platform === 'KICK' && /^[0-9]{1,20}$/.test(String(connection.id))) return String(connection.id);
            }
            return null;
        }
        function dispatch(d) {
            const object = d && d.body && d.body.object;
            if (!object || object.kind !== 'BADGE' || typeof d.type !== 'string') return;
            const removed = /\.delete$/.test(d.type);
            if (d.type.startsWith('cosmetic.')) {
                const id = object.data && object.data.id;
                if (typeof id !== 'string' || !id) return;
                if (removed) badges.delete(id);
                else {
                    const badge = badgeOf(object.data);
                    if (!badge) return;
                    if (!badges.has(id) && badges.size >= 2000) return;
                    badges.set(id, badge);
                }
                for (const [sender, badgeId] of holders) if (badgeId === id) decorateSender(sender);
            } else if (d.type.startsWith('entitlement.')) {
                const id = object.ref_id, sender = kickUser(object.user);
                if (typeof id !== 'string' || !id || !sender) return;
                if (removed) {
                    if (holders.get(sender) !== id) return;
                    holders.delete(sender);
                } else {
                    holders.delete(sender); holders.set(sender, id);
                    if (holders.size > 20000) holders.delete(holders.keys().next().value);
                }
                decorateSender(sender);
            }
        }
        function decorate(wrapper) {
            const line = wrapper.closest('[data-sender-id]'), name = wrapper.querySelector(':scope > .username');
            if (!line || !name) return;
            const id = holders.get(line.dataset.senderId), badge = id && badges.get(id);
            let mark = wrapper.querySelector(':scope > [data-lurk-badge]');
            if (!badge) { if (mark) mark.remove(); return; }
            if (mark && mark.dataset.lurkBadge === id) return;
            if (!mark) {
                mark = document.createElement('span');
                const image = document.createElement('img');
                image.classList.add('badge'); image.decoding = 'async'; image.referrerPolicy = 'no-referrer';
                mark.appendChild(image);
            }
            mark.dataset.lurkBadge = id;
            const image = mark.firstChild;
            image.src = badge.url; image.alt = badge.title; image.title = badge.title;
            if (mark.nextSibling !== name) wrapper.insertBefore(mark, name);
        }
        function decorateSender(sender) {
            if (!app) return;
            for (const line of app.querySelectorAll('[data-sender-id="' + CSS.escape(sender) + '"]')) {
                line.querySelectorAll('.user-wrapper').forEach(decorate);
            }
            if (observer) observer.takeRecords();
        }
        function scan(root) {
            if (root.matches && root.matches('.user-wrapper')) decorate(root);
            if (root.querySelectorAll) root.querySelectorAll('.user-wrapper').forEach(decorate);
        }
        function connect() {
            if (stopped || document.hidden || socket) return;
            const ws = socket = new WebSocket('wss://events.7tv.io/v3');
            let interval = 30000;
            const watchdog = () => { cancel(heartbeat); heartbeat = later(() => ws.close(), interval * 2 + 1000); };
            ws.onopen = () => {
                if (socket !== ws || stopped) return;
                for (const type of ['cosmetic.*', 'entitlement.*']) {
                    ws.send(JSON.stringify({op: 35, d: {type, condition: {platform: 'KICK', ctx: 'channel', id: user}}}));
                }
                watchdog();
            };
            ws.onmessage = (event) => {
                if (socket !== ws || stopped || typeof event.data !== 'string' || event.data.length > 262144) return;
                try {
                    const message = JSON.parse(event.data);
                    if (message.op === 1) { interval = Math.max(1000, Math.min(60000, Number(message.d.heartbeat_interval) || 30000)); reconnect = 0; watchdog(); }
                    if (message.op === 2) watchdog();
                    if (message.op === 4 || message.op === 7) { ws.close(); return; }
                    if (message.op === 0) dispatch(message.d);
                } catch (_) { /* Ignore malformed dispatches. */ }
            };
            ws.onclose = () => {
                if (socket !== ws) return;
                socket = null; cancel(heartbeat);
                if (stopped || document.hidden || reconnect >= 8) return;
                later(connect, Math.min(60000, 1000 * Math.pow(2, Math.min(reconnect++, 6))) * (0.8 + Math.random() * 0.4));
            };
        }
        whenReady((root) => {
            if (stopped) return; app = root;
            observer = new MutationObserver((records) => {
                for (const record of records) for (const node of record.addedNodes) if (node.nodeType === 1) scan(node);
            });
            observer.observe(app, {childList: true, subtree: true}); scan(app);
        });
        document.addEventListener('visibilitychange', () => {
            if (document.hidden) { if (socket) socket.close(); }
            else { reconnect = 0; connect(); }
        });
        window.addEventListener('pagehide', () => {
            stopped = true; timers.forEach(clearTimeout); timers.clear();
            if (socket) socket.close(); if (observer) observer.disconnect();
        }, {once: true});
        window.lurkChat.sevenTvBadges = {badges, holders};
        connect();
        return true;
    }

    // Chat search (issue 83): only the lines whose sender or text contain the query (any case) stay shown while the
    // box holds text. The page keeps only its recent lines, so older ones can't be found.
    function search(app) {
        let query = '', observer = null;
        const style = document.createElement('style');
        style.textContent = '.message-container.lurk-search-miss{display:none!important}' +
            '#lurk-search{position:fixed;top:6px;right:6px;z-index:2147483647;display:flex;gap:4px;align-items:center}' +
            '#lurk-search button{width:32px;height:32px;padding:0;border:0;border-radius:16px;' +
            'background:rgba(0,0,0,.55);color:#fff;font-size:16px;line-height:32px}' +
            '#lurk-search input{display:none;width:55vw;height:32px;box-sizing:border-box;padding:0 12px;' +
            'border:1px solid #53fc18;border-radius:16px;background:rgba(0,0,0,.85);color:#fff;font-size:14px}' +
            '#lurk-search.lurk-open input{display:block}';
        (document.head || document.documentElement).appendChild(style);
        const box = document.createElement('div');
        box.id = 'lurk-search';
        const input = document.createElement('input');
        input.type = 'search';
        input.placeholder = 'Search chat';
        input.setAttribute('aria-label', 'Search chat');
        const toggle = document.createElement('button');
        toggle.type = 'button';
        toggle.setAttribute('aria-label', 'Search chat');
        toggle.textContent = '\u{1F50D}';
        box.append(input, toggle);
        document.body.appendChild(box);
        const words = (line) => {
            const name = line.dataset.senderUsername || (line.querySelector('.username') || {}).textContent || '';
            const content = line.dataset.originalContent != null ? line.dataset.originalContent
                : (line.querySelector('.message-content') || {}).textContent || '';
            return (name + ' ' + content).toLowerCase();
        };
        const apply = (line) => line.classList.toggle('lurk-search-miss', query !== '' && !words(line).includes(query));
        const all = () => app.querySelectorAll('.message-container').forEach(apply);
        const watch = (on) => {
            if (on && !observer) {
                observer = new MutationObserver((records) => {
                    for (const record of records) for (const node of record.addedNodes) {
                        if (node.nodeType !== 1) continue;
                        if (node.matches('.message-container')) apply(node);
                        node.querySelectorAll('.message-container').forEach(apply);
                    }
                });
                observer.observe(app, {childList: true, subtree: true});
            } else if (!on && observer) {
                observer.disconnect();
                observer = null;
            }
        };
        input.addEventListener('input', () => {
            query = input.value.trim().toLowerCase();
            all();
            watch(query !== '');
        });
        toggle.addEventListener('click', () => {
            const open = box.classList.toggle('lurk-open');
            toggle.textContent = open ? '\u2715' : '\u{1F50D}';
            toggle.setAttribute('aria-label', open ? 'Close chat search' : 'Search chat');
            if (open) {
                input.focus();
                return;
            }
            input.value = '';
            query = '';
            all();
            watch(false);
        });
        window.addEventListener('pagehide', () => watch(false), {once: true});
    }

    // Chat keywords: each chat line, already shown or new, goes to the app (sender's name and kick.com handle, the
    // text as sent), which matches it against the Lurk lists and answers through window.lurkChat.verdicts:
    // 1 tints the line, 2 hides it. Lines are sent in batches; a hidden line can show for a moment first.
    function keywords() {
        const pending = new Map();
        let timer = null, observer;
        const send = () => {
            clearTimeout(timer); timer = null;
            if (!pending.size) return;
            const items = Array.from(pending.values());
            pending.clear();
            window.ReactNativeWebView.postMessage(JSON.stringify({type: 'lurkKeywords', generation: options.generation, items}));
        };
        const queue = (line) => {
            const id = line.dataset.messageId;
            if (!id || line.dataset.lurkKeywords) return;
            line.dataset.lurkKeywords = '1';
            const content = line.querySelector('.message-content');
            const text = line.dataset.originalContent != null ? line.dataset.originalContent : (content ? content.textContent : '');
            pending.set(id, {id, name: line.dataset.senderUsername || '', slug: line.dataset.senderSlug || '', text: text.slice(0, 2000)});
            if (pending.size >= 200) send();
            else if (!timer) timer = setTimeout(send, 50);
        };
        window.lurkChat.verdicts = (verdicts) => {
            for (const id of Object.keys(verdicts || {})) {
                const line = document.querySelector('.message-container[data-message-id="' + CSS.escape(id) + '"]');
                if (line) line.classList.add(verdicts[id] === 2 ? 'lurk-hidden' : 'lurk-highlight');
            }
        };
        whenReady((app) => {
            const style = document.createElement('style');
            style.textContent = '.message-container.lurk-hidden{display:none!important}' +
                '.message-container.lurk-highlight{background:rgba(83,252,24,.16)!important;box-shadow:inset 3px 0 #53fc18}';
            (document.head || document.documentElement).appendChild(style);
            app.querySelectorAll('.message-container').forEach(queue);
            observer = new MutationObserver((records) => {
                for (const record of records) for (const node of record.addedNodes) {
                    if (node.nodeType !== 1) continue;
                    if (node.matches('.message-container')) queue(node);
                    node.querySelectorAll('.message-container').forEach(queue);
                }
            });
            observer.observe(app, {childList: true, subtree: true});
        });
        window.addEventListener('pagehide', () => { if (observer) observer.disconnect(); clearTimeout(timer); }, {once: true});
    }

    // 7TV: a word of a message that is the name of one of the channel's 7TV emotes, or of a global one, becomes
    // that emote's image. Messages already on the page are rewritten once the sets load, later ones as they come.
    function sevenTv(slug, user) {
        const API = 'https://7tv.io/v3/';
        const idOK = (id) => typeof id === 'string' && /^(?:[a-f0-9]{24}|[0-9A-HJKMNP-TV-Z]{26})$/i.test(id);
        const sets = {channel: null, global: null};
        const timers = new Set(), controllers = new Set(), flights = new Map();
        let stopped = false, observer, socket, reconnect = 0, heartbeat, lastSequence;
        let byName = new Map(), app;
        const originals = new WeakMap(), failedImages = new Set();
        const later = (fn, ms) => {
            const timer = setTimeout(() => { timers.delete(timer); if (!stopped) fn(); }, ms);
            timers.add(timer); return timer;
        };
        const cancel = (timer) => { clearTimeout(timer); timers.delete(timer); };
        const get = (url) => {
            if (flights.has(url)) return flights.get(url);
            const task = (async () => {
                for (let attempt = 0; attempt < 3 && !stopped && !document.hidden; attempt++) {
                    const controller = new AbortController(); controllers.add(controller);
                    let deadline, retry = 500 * Math.pow(2, attempt);
                    try {
                        const response = await Promise.race([
                            fetch(url, {credentials: 'omit', referrerPolicy: 'no-referrer', signal: controller.signal}),
                            new Promise((_, reject) => { deadline = later(() => {
                                controller.abort(); reject(new Error('deadline'));
                            }, 10000); }),
                        ]);
                        if (response.status === 404) return null;
                        if (!response.ok) {
                            if (response.status !== 429 && response.status < 500) return null;
                            const after = Number(response.headers.get('Retry-After'));
                            if (Number.isFinite(after) && after > 0) retry = Math.min(60000, after * 1000);
                            throw new Error('transient');
                        }
                        // Keep the deadline through body consumption, including trickling responses.
                        const body = await Promise.race([
                            (async () => {
                                const reader = response.body.getReader();
                                const chunks = []; let length = 0;
                                while (true) {
                                    const part = await reader.read(); if (part.done) break;
                                    length += part.value.length;
                                    if (length > 2097152) { await reader.cancel(); throw new Error('body too large'); }
                                    chunks.push(part.value);
                                }
                                const data = new Uint8Array(length); let offset = 0;
                                for (const part of chunks) { data.set(part, offset); offset += part.length; }
                                return JSON.parse(new TextDecoder().decode(data));
                            })(),
                            new Promise((_, reject) => controller.signal.addEventListener('abort', () => reject(new Error('deadline')), {once:true})),
                        ]);
                        return body;
                    } catch (_) {
                        if (stopped) return null;
                    } finally {
                        cancel(deadline); controllers.delete(controller);
                    }
                    if (attempt < 2) await new Promise((resolve) => later(resolve, retry));
                }
                return null;
            })().finally(() => flights.delete(url));
            flights.set(url, task); return task;
        };
        function catalog(set) {
            const result = [];
            for (const e of (set && Array.isArray(set.emotes) ? set.emotes : []).slice(0, 2000)) {
                if (!e || !idOK(e.id) || typeof e.name !== 'string' || !/^[^\s:<>&"'\\]{1,100}$/u.test(e.name)) continue;
                result.push({id: e.id, name: e.name, flags: ((e.flags & 1) || (e.data && (e.data.flags & 256))) ? 1 : 0,
                    url: 'https://cdn.7tv.app/emote/' + e.id + '/2x.webp',
                    animated: !!(e.data && e.data.animated === true), width: 64, height: 64});
            }
            return result;
        }
        function publish() {
            if (stopped) return;
            byName = new Map(); failedImages.clear();
            for (const key of ['channel', 'global']) for (const e of catalog(sets[key])) if (!byName.has(e.name)) byName.set(e.name, e);
            window.lurkChat.sevenTvCount = ['channel', 'global'].map((key) => sets[key] && Array.isArray(sets[key].emotes) ? sets[key].emotes.length : 0);
            if (app) scan(app, true);
            if (options.generation && window.ReactNativeWebView) window.ReactNativeWebView.postMessage(JSON.stringify({
                type: 'lurk7tvCatalog', generation: options.generation, channelId: options.channelId || null,
                slug: slug || null, setIds: currentIds(), emotes: Array.from(byName.values()).slice(0, 2000),
            }));
        }
        function currentIds() { return Array.from(new Set(['channel', 'global'].map((k) => sets[k] && sets[k].id).filter(idOK))); }
        function normalizedSet(set) {
            if (!set || typeof set !== 'object' || Array.isArray(set)) return null;
            if (Array.isArray(set.emotes)) return set;
            // The provider omits an empty emote vector. Require a valid set identity
            // before treating an omitted vector as authoritative rather than malformed.
            if (!Object.prototype.hasOwnProperty.call(set, 'emotes') && idOK(set.id)) return {...set, emotes:[]};
            return null;
        }
        async function loadGlobal() {
            const set = normalizedSet(await get(API + 'emote-sets/global'));
            if (!stopped && set) { sets.global = set; publish(); connect(); }
        }
        async function loadChannel() {
            // KickChat learns the owner from the same Kick response as the slug; without it, globals only.
            const owner = user;
            if (!owner || stopped) return;
            const result = await get(API + 'users/kick/' + encodeURIComponent(owner));
            if (stopped || !result || typeof result !== 'object' || Array.isArray(result)) return;
            const set = normalizedSet(result.emote_set);
            const noSet = result.emote_set === null ||
                (!Object.prototype.hasOwnProperty.call(result, 'emote_set') && idOK(result.id));
            if (set || noSet) {
                sets.channel = set; publish(); connect();
            }
        }
        const refreshes = new Map();
        function refetch(id) {
            if (!currentIds().includes(id) || refreshes.has(id)) return;
            refreshes.set(id, later(async () => {
                refreshes.delete(id);
                const set = normalizedSet(await get(API + 'emote-sets/' + id));
                if (stopped || !set || set.id !== id) return;
                for (const key of ['channel', 'global']) if (sets[key] && sets[key].id === id) sets[key] = set;
                publish();
            }, 250));
        }
        let subscribed = '';
        function connect() {
            if (stopped || document.hidden) return;
            const ids = currentIds(), signature = ids.join(',');
            if (socket && subscribed === signature) return;
            if (socket) { socket.onclose = null; socket.close(); }
            socket = null; cancel(heartbeat); lastSequence = null;
            subscribed = signature;
            if (!ids.length) return;
            const ws = socket = new WebSocket('wss://events.7tv.io/v3');
            let interval = 30000;
            const watchdog = () => { cancel(heartbeat); heartbeat = later(() => ws.close(), interval * 2 + 1000); };
            ws.onopen = () => {
                if (socket !== ws || stopped) return;
                for (const id of ids) ws.send(JSON.stringify({op: 35, d: {type: 'emote_set.update', condition: {object_id: id}}}));
                watchdog();
            };
            ws.onmessage = (event) => {
                if (socket !== ws || stopped || typeof event.data !== 'string' || event.data.length > 262144) return;
                try {
                    const message = JSON.parse(event.data);
                    if (message.op === 1) { interval = Math.max(1000, Math.min(60000, Number(message.d.heartbeat_interval) || 30000)); reconnect = 0; watchdog(); }
                    if (message.op === 2) watchdog();
                    if (message.op === 4 || message.op === 6) { ws.close(); return; }
                    if (message.op !== 0) return;
                    if (Number.isSafeInteger(message.s)) {
                        if (lastSequence != null && message.s !== lastSequence + 1) ids.forEach(refetch);
                        lastSequence = message.s;
                    }
                    if (message.d && message.d.type === 'emote_set.update' && message.d.body) refetch(message.d.body.id);
                } catch (_) { /* Ignore malformed dispatches. */ }
            };
            ws.onclose = () => {
                if (socket !== ws || stopped) return;
                socket = null; lastSequence = null; cancel(heartbeat);
                if (document.hidden || reconnect >= 8) return;
                later(() => { currentIds().forEach(refetch); connect(); }, Math.min(60000, 1000 * Math.pow(2, Math.min(reconnect++, 6))) * (0.8 + Math.random() * 0.4));
            };
        }
        function revalidate() {
            if (!document.hidden) { loadGlobal(); loadChannel(); }
            later(revalidate, 300000);
        }
        function restore(content) {
            for (const wrapper of content.querySelectorAll('[data-lurk-layer]')) wrapper.replaceWith(...wrapper.childNodes);
            for (const generated of content.querySelectorAll('[data-lurk-emote]')) {
                const text = originals.get(generated);
                if (text != null) generated.replaceWith(document.createTextNode(text));
            }
            content.normalize();
        }
        function rewrite(content, refresh) {
            if (refresh) restore(content);
            for (const node of Array.from(content.childNodes)) {
                if (node.nodeType !== Node.TEXT_NODE) continue;
                const words = node.data.split(/(\s+)/);
                if (!words.some((word) => byName.has(word))) continue;
                const parts = document.createDocumentFragment(); let text = '';
                for (const word of words) {
                    const emote = byName.get(word);
                    if (!emote || failedImages.has(emote.url)) { text += word; continue; }
                    if (text) parts.appendChild(document.createTextNode(text)); text = '';
                    const image = document.createElement('img');
                    image.src = emote.url; image.alt = word; image.title = word;
                    image.decoding = 'async'; image.loading = 'lazy'; image.referrerPolicy = 'no-referrer';
                    image.classList.add('emote'); image.dataset.lurkEmote = String(emote.flags);
                    originals.set(image, word);
                    image.onerror = () => {
                        if (!image.isConnected || stopped) return;
                        failedImages.add(emote.url); scan(content, true);
                    };
                    parts.appendChild(image);
                }
                if (text) parts.appendChild(document.createTextNode(text));
                node.replaceWith(parts);
            }
            let base = null, whitespace = [];
            for (const node of Array.from(content.childNodes)) {
                if (node.nodeType === Node.TEXT_NODE && /^[ \t]*$/.test(node.data)) { whitespace.push(node); continue; }
                if (node.nodeType === Node.ELEMENT_NODE && node.matches('img.emote')) {
                    if (node.dataset.lurkEmote === '1' && base) {
                        let wrapper = base;
                        if (!base.hasAttribute('data-lurk-layer')) {
                            wrapper = document.createElement('span'); wrapper.dataset.lurkLayer = '1';
                            wrapper.style.cssText = 'display:inline-block;position:relative;vertical-align:middle';
                            base.replaceWith(wrapper); wrapper.appendChild(base); base = wrapper;
                        }
                        // Keep whitespace as owned nodes so refresh restores the original message exactly.
                        for (const space of whitespace) { const saved = document.createElement('span'); saved.dataset.lurkEmote = 'space'; originals.set(saved, space.data); space.replaceWith(saved); wrapper.appendChild(saved); }
                        node.style.cssText = 'position:absolute;left:50%;top:50%;transform:translate(-50%,-50%)';
                        wrapper.appendChild(node);
                    } else base = node;
                } else if (node.nodeType === Node.ELEMENT_NODE && node.hasAttribute('data-lurk-layer')) base = node;
                else base = null;
                whitespace = [];
            }
        }
        function scan(root, refresh) {
            if (root.matches && root.matches('.message-content')) rewrite(root, refresh);
            if (root.querySelectorAll) root.querySelectorAll('.message-content').forEach((node) => rewrite(node, refresh));
            if (observer) observer.takeRecords();
        }
        whenReady((root) => {
            if (stopped) return; app = root;
            observer = new MutationObserver((records) => {
                const changed = new Set();
                for (const record of records) {
                    const content = record.target.nodeType === 1 ? record.target.closest('.message-content') : record.target.parentElement && record.target.parentElement.closest('.message-content');
                    if (content) changed.add(content);
                    for (const node of record.addedNodes) if (node.nodeType === 1) changed.add(node);
                }
                changed.forEach((node) => scan(node, false));
            });
            observer.observe(app, {childList:true, subtree:true, characterData:true}); scan(app, false);
        });
        document.addEventListener('visibilitychange', () => {
            if (document.hidden) { controllers.forEach((c) => c.abort()); if (socket) socket.close(); }
            else { loadGlobal(); loadChannel(); currentIds().forEach(refetch); connect(); }
        });
        window.addEventListener('pagehide', () => {
            if (options.generation && window.ReactNativeWebView) window.ReactNativeWebView.postMessage(JSON.stringify({
                type:'lurk7tvDispose', generation:options.generation, channelId:options.channelId || null, slug:slug || null,
            }));
            stopped = true; controllers.forEach((c) => c.abort()); timers.forEach(clearTimeout); timers.clear();
            if (socket) socket.close(); if (observer) observer.disconnect();
        }, {once:true});
        revalidate();
    }

    return applied.join(', ') || 'nothing';
})
