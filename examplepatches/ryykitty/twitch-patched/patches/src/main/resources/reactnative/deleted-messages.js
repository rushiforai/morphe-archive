(function (runtime) {
    'use strict';
    runtime.decorateType(__TWITCH_DELETED_ROW_MODULE__, 'ChatMessageRow', function (original, React) {
        return function (props) {
            var enabled = runtime.policyHook(React, 12);
            var message = props.message;
            var hiddenFromViewers = enabled && message && message.deleted && !message.hidden && !message.modActionType &&
                typeof message.body === 'string' && message.body.length > 0;
            if (!hiddenFromViewers) return original.call(this, props);
            // Twitch's moderator view keeps the text when a moderation action is known.
            return original.call(this, Object.assign({}, props, {message: Object.assign({}, message, {modActionType: 'delete'})}));
        };
    });
})(globalThis.__twitchPatchRuntime);
