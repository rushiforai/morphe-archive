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
    runtime.target(__TWITCH_CHAT_COMPOSER_MODULE__, 'useChatComposer', function (original, React) {
        return function useChatComposer(props) {
            var enabled = runtime.policyHook(React, 5);
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
                return enabled ? images(result.cheermoteTokenImages, catalog, native) : result.cheermoteTokenImages;
            }, [result.cheermoteTokenImages, catalog, native, enabled]);
            var changed = React.useCallback(function (text) {
                return result.onSendTextChange(runtime.enabled(5) ? normalize(text, catalog) : text);
            }, [result.onSendTextChange, catalog]);
            return Object.assign({}, result, {cheermoteTokenImages: tokens,
                onSendTextChange: typeof result.onSendTextChange === 'function' ? changed : result.onSendTextChange});
        };
    });
})(globalThis.__twitchPatchRuntime);
