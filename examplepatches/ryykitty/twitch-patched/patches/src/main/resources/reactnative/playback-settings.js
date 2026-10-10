(function (global) {
    'use strict';
    global.__twitchPatchRuntime.target(__TWITCH_PLAYBACK_SETTINGS_MODULE__, 'PlaybackSettingsSheet', function (original, React) {
        return function (props) {
            var settings = props.isParticipatingDJ === true ?
                Object.assign({}, props, {isParticipatingDJ: false}) : props;
            return React.createElement(original, settings);
        };
    });
})(globalThis);
