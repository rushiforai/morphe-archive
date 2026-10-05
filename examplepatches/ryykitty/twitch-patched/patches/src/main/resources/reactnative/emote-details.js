(function (runtime) {
    'use strict';
    var prefix = 'twitchpatches-emote-details';
    var context;
    function getContext(React) {
        if (!context) context = React.createContext(null);
        return context;
    }
    function decode(id) {
        if (typeof id !== 'string' || id.indexOf('twitchpatches:') !== 0 || id.length > 4096) return null;
        var emote;
        try { emote = JSON.parse(decodeURIComponent(id.slice('twitchpatches:'.length))); }
        catch (error) { return null; }
        if (!emote || (emote.provider !== 'bttv' && emote.provider !== '7tv') ||
            typeof emote.name !== 'string' || !emote.name.length || emote.name.length > 100 || /\s/.test(emote.name) ||
            !runtime.emoteProviders.safeURL(emote.url) || !runtime.emoteProviders.safeURL(emote.staticURL) ||
            typeof emote.ratio !== 'number' || emote.ratio < 0.25 || emote.ratio > 4) return null;
        return emote;
    }
    function label(emote) {
        return (emote.provider === 'bttv' ? 'BTTV' : '7TV') + (emote.channel ? ' channel emote' : ' global emote');
    }
    function create(React, require) {
        var Card, Sheet;
        function Preview(props) {
            var emote = props.emote;
            var result = Card({emote: {token: emote.name}, imageURL: emote.url, testID: prefix});
            if (!React.isValidElement(result) || result.props.testID !== prefix) {
                runtime.log('emotes details card contract failed');
                return null;
            }
            function replace(element, depth) {
                if (!React.isValidElement(element) || depth > 12) return element;
                if (element.props.testID === prefix + '-type') {
                    return React.cloneElement(element, {}, label(emote));
                }
                if (element.props.children == null) return element;
                return React.cloneElement(element, {}, React.Children.map(element.props.children, function (child) {
                    return replace(child, depth + 1);
                }));
            }
            return replace(result, 0);
        }
        return function Details(props) {
            if (!Card) {
                Card = require(__TWITCH_EMOTE_CARD_MODULE__).EmoteCard;
                Sheet = require(__TWITCH_BOTTOM_SHEET_MODULE__).BottomSheet;
            }
            var state = React.useState(true), visible = state[0], setVisible = state[1];
            var enabled = runtime.policyHook(React, 5), foreground = runtime.policyHook(React, 3);
            var close = function () { setVisible(false); };
            React.useEffect(function () { if (!enabled || !foreground) close(); }, [enabled, foreground]);
            React.useEffect(function () { runtime.log('emotes details opened'); }, []);
            return React.createElement(Sheet, {visible: visible, onClose: close, onClosed: props.onClosed,
                accessibilityLabel: props.emote.name + ', ' + label(props.emote), initialDetent: false,
                disableBodyInlinePadding: true, testID: prefix + '-sheet',
                children: React.createElement(Preview, {emote: props.emote})});
        };
    }
    runtime.emoteDetails = {decode: decode, label: label, create: create, context: getContext};
})(globalThis.__twitchPatchRuntime);
