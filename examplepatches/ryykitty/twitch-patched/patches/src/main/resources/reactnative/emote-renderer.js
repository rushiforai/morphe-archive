(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_CHAT_ROW_MODULE__, 'ChatMessageRow', function (original, React, policy, require) {
        var observed = false;
        var Context = runtime.emoteDetails.context(React), Details = runtime.emoteDetails.create(React, require);
        function Row(props) {
            var enabled = runtime.policyHook(React, 5);
            var message = props.message;
            var channel = message && message.sourceRoomID || props.channelID;
            var state = React.useState(null), opened = state[0], setOpened = state[1];
            React.useEffect(function () { setOpened(null); }, [channel, message]);
            if (!observed) {
                observed = true;
                runtime.log('emotes row contract channel=' + (typeof channel === 'string' && /^\d{1,20}$/.test(channel)) +
                    ' ranges=' + !!(message && Array.isArray(message.emotes)));
            }
            var catalog = React.useSyncExternalStore(runtime.emotes.subscribe,
                function () { return runtime.emotes.snapshot(channel); }, function () { return runtime.emotes.snapshot(null); });
            React.useEffect(function () { return runtime.emotes.retain(channel); }, [channel]);
            var next = props;
            if (enabled && message) {
                var emotes = runtime.emoteProviders.augment(message.body, message.emotes, catalog, runtime.emotes.failed);
                if (emotes !== message.emotes) {
                    next = Object.assign({}, props, {message: Object.assign({}, message, {emotes: emotes})});
                    runtime.emotes.matched(emotes.length - message.emotes.length);
                }
            }
            var value = React.useMemo(function () { return {open: function (emote) {
                if (runtime.enabled(5) && runtime.enabled(3)) setOpened(emote);
            }}; }, []);
            var row = React.createElement(Context.Provider, {value: value, children: React.createElement(original, next)});
            // Mount the modal outside inline Text.
            return opened ? React.createElement(React.Fragment, {children: [row,
                React.createElement(Details, {emote: opened, onClosed: function () { setOpened(null); }})]}) : row;
        }
        return React.memo(Row, original.compare);
    }, true);
    runtime.target(__TWITCH_EMOTE_PART_MODULE__, 'EmotePart', function (original, React) {
        var Context = runtime.emoteDetails.context(React);
        function replaceImage(element, emote, depth) {
            if (!React.isValidElement(element) || depth > 6) return element;
            var props = element.props;
            if (typeof props.src === 'string' && props.src.indexOf('https://static-cdn.jtvnw.net/emoticons/v2/twitchpatches:') === 0) {
                return React.cloneElement(element, {src: props.src.indexOf('/static/') >= 0 ? emote.staticURL : emote.url,
                    style: [props.style, {aspectRatio: emote.ratio, width: 24 * emote.ratio}],
                    onLoad: function () { runtime.emotes.loaded(emote.provider, emote.format); },
                    onError: function () { runtime.emotes.fail(emote.url, emote.provider, emote.format); }});
            }
            if (props.children == null) return element;
            var layout = typeof props.testID === 'string' && props.testID.indexOf('chat-emote-wrapper-') === 0 ?
                {style: [props.style, {width: 24 * emote.ratio}]} : {};
            return React.cloneElement(element, layout, React.Children.map(props.children, function (child) {
                return replaceImage(child, emote, depth + 1);
            }));
        }
        return function EmotePart(props) {
            // Preserve hook order when the setting changes.
            var owner = React.useContext(Context);
            var emote = runtime.emoteDetails.decode(props.emoteId);
            var custom = typeof props.emoteId === 'string' && props.emoteId.indexOf('twitchpatches:') === 0;
            var result = original(custom ? Object.assign({}, props, {onPress: emote && owner ? function () {
                owner.open(emote);
            } : undefined}) : props);
            if (!emote) return result;
            return replaceImage(result, emote, 0);
        };
    });
})(globalThis.__twitchPatchRuntime);
