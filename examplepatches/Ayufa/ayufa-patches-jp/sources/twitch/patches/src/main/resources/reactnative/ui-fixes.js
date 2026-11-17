(function (runtime) {
    'use strict';
    // Always-on fixes (not tied to any patch setting):
    // - Stream preview thumbnails never refresh in the app because every
    //   channel's preview URL is constant while the image behind it changes
    //   every few minutes, so the native image cache keeps serving the first
    //   frame it ever fetched. Preview URLs get a cache key that rolls over
    //   on the same 5-minute cadence the preview CDN itself uses
    //   (Cache-Control: max-age=300), so visible previews reload fresh art.
    //   The key is applied at every layer that touches the URL: the shared
    //   getStreamThumbnailUrl helper (the home/following feed renders its
    //   result through React Native's own Image, not CoreImage), the
    //   CoreImage component used by some surfaces, and the components that
    //   receive the preview URL as a prop and render it through React
    //   Native's Image themselves (the following list, the skyline
    //   backdrop), whose props are busted at the component boundary.
    // - The chat line list shows a "Reconnecting to chat..." line while the
    //   connection is down, but nothing marks the recovery itself (the
    //   "Welcome to the chat room!" line is the same one shown on the first
    //   join). When a connected line follows a reconnecting or disconnected
    //   line, a matching "reconnected" status line is rendered right before
    //   it, built from the same StatusLine and CoreText pieces and styling
    //   the app's own chat lines use, so the list reads: reconnecting,
    //   reconnected, welcome.
    var PREVIEW_BUCKET_MS = 300000;
    function previewBucket(now) { return Math.floor(now / PREVIEW_BUCKET_MS); }
    function bustPreview(url, now) {
        return url + (url.indexOf('?') >= 0 ? '&' : '?') + 'v=' + previewBucket(now);
    }
    runtime.target(__TWITCH_THUMBNAIL_URL_MODULE__, 'getStreamThumbnailUrl', function (original) {
        return function () {
            var url = original.apply(this, arguments);
            return typeof url === 'string' && url.indexOf('/previews-ttv/') >= 0 ?
                bustPreview(url, Date.now()) : url;
        };
    });
    runtime.target(__TWITCH_CORE_IMAGE_MODULE__, 'CoreImage', function (original, React) {
        return function (props) {
            var src = props ? props.src : null;
            var uri = typeof src === 'string' ? src :
                (src && typeof src.uri === 'string' ? src.uri : null);
            var preview = !!uri && uri.indexOf('/previews-ttv/') >= 0;
            var setTick = React.useState(0)[1];
            React.useEffect(function () {
                if (!preview) return undefined;
                var last = previewBucket(Date.now());
                var timer = setInterval(function () {
                    var next = previewBucket(Date.now());
                    if (next !== last) {
                        last = next;
                        setTick(function (count) { return count + 1; });
                    }
                }, 30000);
                return function () { clearInterval(timer); };
            }, [preview, uri]);
            if (!preview) return React.createElement(original, props);
            var busted = bustPreview(uri, Date.now());
            var nextSrc = typeof src === 'string' ? busted :
                Object.assign({}, src, {uri: busted});
            return React.createElement(original, Object.assign({}, props, {src: nextSrc}));
        };
    });
    function bustPreviewProps(original, React) {
        return function (props) {
            var url = props ? props.previewImageURL : null;
            var vertical = props ? props.verticalPreviewImageURL : null;
            var bustUrl = typeof url === 'string' && url.indexOf('/previews-ttv/') >= 0;
            var bustVertical = typeof vertical === 'string' && vertical.indexOf('/previews-ttv/') >= 0;
            var active = bustUrl || bustVertical;
            var setTick = React.useState(0)[1];
            React.useEffect(function () {
                if (!active) return undefined;
                var last = previewBucket(Date.now());
                var timer = setInterval(function () {
                    var next = previewBucket(Date.now());
                    if (next !== last) {
                        last = next;
                        setTick(function (count) { return count + 1; });
                    }
                }, 30000);
                return function () { clearInterval(timer); };
            }, [active, url, vertical]);
            if (!active) return React.createElement(original, props);
            var next = Object.assign({}, props);
            if (bustUrl) next.previewImageURL = bustPreview(url, Date.now());
            if (bustVertical) next.verticalPreviewImageURL = bustPreview(vertical, Date.now());
            return React.createElement(original, next);
        };
    }
    runtime.target(__TWITCH_FOLLOWING_THUMBNAIL_MODULE__, 'FollowingRowThumbnail', bustPreviewProps);
    runtime.target(__TWITCH_SKYLINE_BACKGROUND_MODULE__, 'SkylineThumbnailBackground', bustPreviewProps);
    var chatRecoveryPending = false;
    function markChatRecoveryPending(original, React) {
        return function (props) {
            chatRecoveryPending = true;
            return React.createElement(original, props);
        };
    }
    runtime.target(__TWITCH_CHAT_RECONNECTING_LINE_MODULE__, 'ChatReconnectingLine', markChatRecoveryPending);
    runtime.target(__TWITCH_CHAT_DISCONNECTED_LINE_MODULE__, 'ChatDisconnectedLine', markChatRecoveryPending);
    runtime.target(__TWITCH_CHAT_CONNECTED_LINE_MODULE__, 'ChatConnectedLine', function (original, React, runtime, require) {
        return function (props) {
            var connected = React.createElement(original, props);
            if (!chatRecoveryPending) return connected;
            chatRecoveryPending = false;
            var StatusLine = require(__TWITCH_STATUS_LINE_MODULE__).StatusLine;
            var CoreText = require(__TWITCH_CORE_TEXT_MODULE__).CoreText;
            if (typeof StatusLine !== 'function' || typeof CoreText !== 'function') return connected;
            var notice = React.createElement(StatusLine, {testID: 'chat-reconnected-line'},
                React.createElement(CoreText, {color: 'alt-2'}, 'チャットに再接続しました'));
            return React.createElement(React.Fragment, null, notice, connected);
        };
    });
})(globalThis.__twitchPatchRuntime);
