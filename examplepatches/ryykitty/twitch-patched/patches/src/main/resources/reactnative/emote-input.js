(function (runtime) {
    'use strict';
    function model(emote) {
        return {id: 'twitchpatches:' + encodeURIComponent(JSON.stringify(emote)), token: emote.name,
            setID: 'twitchpatches-' + emote.provider, type: 'GLOBAL', context: 'global', modifierCodes: []};
    }
    function normalize(text, catalog) {
        if (typeof text !== 'string' || text.charAt(0) === '/') return text;
        return text.replace(/(^|\s):([^\s:]{1,128}):(?=$|\s)/g, function (match, space, code) {
            return catalog.has(code) ? space + code : match;
        });
    }
    function suggestions(native, catalog) {
        var names = new Set(native.map(function (emote) { return emote.token; })), result = native.slice();
        catalog.forEach(function (emote, name) { if (!names.has(name)) result.push(model(emote)); });
        return result;
    }
    function images(native, catalog, nativeEmotes) {
        var result = Object.assign({}, native), names = new Set(nativeEmotes.map(function (emote) { return emote.token; }));
        catalog.forEach(function (emote, name) {
            if (names.has(name)) return;
            [name, ':' + name + ':'].forEach(function (token) {
                if (!Object.prototype.hasOwnProperty.call(result, token)) result[token] = {url: emote.url};
            });
        });
        return result;
    }
    runtime.emoteInput = {normalize: normalize, suggestions: suggestions, images: images};
    function ranked(matches, query) {
        var needle = String(query).replace(/^:/, '').toLowerCase();
        function code(match) { return String(match.replacement).trim().toLowerCase(); }
        function rank(match) { return code(match).indexOf(needle) === 0 ? 0 : 1; }
        return matches.slice().sort(function (first, second) {
            return rank(first) - rank(second) || code(first).localeCompare(code(second));
        });
    }
    runtime.target(__TWITCH_EMOTE_PROVIDER_MODULE__, 'createEmoteProvider', function (original) {
        return function createEmoteProvider() {
            var provider = original.apply(this, arguments);
            return Object.assign({}, provider, {getMatches: function (query) {
                var matches = provider.getMatches.apply(provider, arguments);
                return Array.isArray(matches) ? ranked(matches, query) : matches;
            }});
        };
    });
    var noInlineEmotes = {};
    runtime.target(__TWITCH_COMPOSER_BAR_MODULE__, 'ChatComposerBar', function (original, React) {
        return function ChatComposerBar(props) {
            var inline = runtime.policyHook(React, 14);
            return original(inline ? props : Object.assign({}, props, {emoteMap: noInlineEmotes}));
        };
    });
    runtime.target(__TWITCH_CHAT_COMPOSER_MODULE__, 'useChatComposer', function (original, React) {
        return function useChatComposer(props) {
            var enabled = runtime.policyHook(React, 5);
            var inline = runtime.policyHook(React, 14);
            var catalog = React.useSyncExternalStore(runtime.emotes.subscribe,
                function () { return runtime.emotes.snapshot(props.channelID); });
            React.useEffect(function () { return runtime.emotes.retain(props.channelID); }, [props.channelID]);
            var native = props.emoteSuggestions || [];
            var merged = React.useMemo(function () { return enabled ? suggestions(native, catalog) : native; },
                [native, catalog, enabled]);
            var send = React.useCallback(function () {
                var args = Array.prototype.slice.call(arguments);
                if (runtime.enabled(5)) args[0] = normalize(args[0], catalog);
                return props.send.apply(this, args);
            }, [props.send, catalog]);
            var result = original(Object.assign({}, props, {emoteSuggestions: merged, send: send}));
            var tokens = React.useMemo(function () {
                return enabled && inline ? images(result.cheermoteTokenImages, catalog, native) : result.cheermoteTokenImages;
            }, [result.cheermoteTokenImages, catalog, native, enabled, inline]);
            var changed = React.useCallback(function (draft, sendText) {
                if (!runtime.enabled(5)) return result.onSendTextChange(draft, sendText);
                return result.onSendTextChange(normalize(draft, catalog), normalize(sendText, catalog));
            }, [result.onSendTextChange, catalog]);
            return Object.assign({}, result, {cheermoteTokenImages: tokens,
                onSendTextChange: typeof result.onSendTextChange === 'function' ? changed : result.onSendTextChange});
        };
    });
})(globalThis.__twitchPatchRuntime);
