(function (global) {
    'use strict';
    function allowDjPlayback(original) {
        return function (props) {
            var settings = props.isParticipatingDJ === true ?
                Object.assign({}, props, {isParticipatingDJ: false}) : props;
            return original.call(this, settings);
        };
    }
    global.__twitchPatchRuntime.target(__TWITCH_PLAYBACK_SETTINGS_MODULE__, 'PlaybackSettingsSheet', allowDjPlayback);
    global.__twitchPatchRuntime.target(__TWITCH_BACKGROUND_AUDIO_MODULE__, 'BackgroundAudioManager', allowDjPlayback);
    global.__twitchPatchRuntime.target(__TWITCH_AUDIO_RENDITION_MODULE__, 'useAudioOnlyRendition', allowDjPlayback);
    var vetoModule = __TWITCH_BACKGROUND_VETO_MODULE__;
    if (vetoModule !== null)
        global.__twitchPatchRuntime.target(vetoModule, 'backgroundAudioVeto', allowDjPlayback);
})(globalThis);
