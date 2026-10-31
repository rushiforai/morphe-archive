(function (runtime) {
    'use strict';
    runtime.target(__TWITCH_CHANNEL_SKINS_RIBBON_MODULE__, 'useChannelSkinsRibbon', function (original, React) {
        return function (channelID, suppressed, playerRef) {
            var blocked = runtime.policyHook(React, 4);
            var state = original.call(this, blocked ? null : channelID, blocked || suppressed, playerRef);
            return blocked ? Object.assign({}, state, {model: null}) : state;
        };
    });
    runtime.target(__TWITCH_CHANNEL_SKINS_CAMPAIGN_MODULE__, 'useChannelSkinCampaignActive', function (original, React) {
        return function (channelID, enabled) {
            var blocked = runtime.policyHook(React, 4);
            var state = original.call(this, blocked ? null : channelID, blocked ? false : enabled);
            return blocked ? Object.assign({}, state, {active: false, resolved: true}) : state;
        };
    });
})(globalThis.__twitchPatchRuntime);
