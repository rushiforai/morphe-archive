(function (runtime) {
    'use strict';
    runtime.decorateType(__TWITCH_DELETED_ROW_MODULE__, 'ChatMessageRow', function (original, React) {
        return function (props) {
            var enabled = runtime.policyHook(React, 12);
            var state = React.useState(null), revealed = state[0], setRevealed = state[1];
            var message = props.message;
            var identity = message && String(props.channelID) + ':' + String(message.id);
            React.useEffect(function () { if (!enabled) setRevealed(null); }, [enabled]);
            var available = enabled && message && message.id && message.deleted && !message.hidden &&
                typeof message.body === 'string' && message.body.length > 0;
            var expanded = available && revealed === identity;
            var next = available ? Object.assign({}, props, {message: Object.assign({}, message,
                {modActionType: expanded ? message.modActionType || 'delete' : undefined})}) : props;
            var result = original.call(this, next);
            if (!available) return result;
            function visit(node, depth) {
                if (depth > 12) return node;
                if (Array.isArray(node)) return node.map(function (child) { return visit(child, depth + 1); });
                if (!React.isValidElement(node)) return node;
                if (node.props.testID === 'chat-message-row') {
                    return React.cloneElement(node, {
                        onPress: function () { if (runtime.enabled(12)) setRevealed(expanded ? null : identity); },
                        accessibilityRole: 'button',
                        accessibilityHint: expanded ? 'Hide deleted message' : 'Show deleted message'
                    });
                }
                if (node.props.children == null) return node;
                return React.cloneElement(node, {children: visit(node.props.children, depth + 1)});
            }
            return visit(result, 0);
        };
    });
})(globalThis.__twitchPatchRuntime);
