(function (global) {
    'use strict';
    var runtime = global.__twitchPatchRuntime;
    runtime.target(__TWITCH_CLIPS_FEED_MODULE__, 'ClipsFeedPage', function (original, React, runtime, require) {
        var ThemeProvider = require(__TWITCH_THEME_MODULE__).ThemeProvider;
        return function (props) {
            // Video controls retain Twitch's dark palette inside the app-themed page.
            var children = React.createElement(ThemeProvider, {children: props.children});
            return React.createElement(original, Object.assign({}, props, {children: children}));
        };
    });
    runtime.target(__TWITCH_STREAM_ITEM_MODULE__, 'FeedStreamItem', function (original, React, runtime, require) {
        var ThemeProvider = require(__TWITCH_THEME_MODULE__).ThemeProvider;
        return React.memo(function (props) {
            var item = React.createElement(original, props);
            return props.freeScroll === true ? item : React.createElement(ThemeProvider, {children: item});
        }, original.compare);
    }, true);
    runtime.target(__TWITCH_FEED_CHROME_MODULE__, 'FeedTopChrome', function (original, React, runtime, require) {
        var lightTheme = require(__TWITCH_PALETTE_MODULE__).lightTheme;
        function styleChrome(element, height) {
            if (!React.isValidElement(element)) return element;
            if (element.props.testID === 'feed-top-scrim') return React.cloneElement(element, {height: height});
            var props = {};
            if (element.props.testID === 'feed-top-chrome')
                props.style = [element.props.style, {backgroundColor: lightTheme.colors.backgroundBody}];
            if (element.props.children != null)
                props.children = React.Children.map(element.props.children,
                    function (child) { return styleChrome(child, height); });
            return Object.keys(props).length ? React.cloneElement(element, props) : element;
        }
        return React.memo(function (props) {
            var light = runtime.policyHook(React, 11);
            var result = original.type(light === true ? Object.assign({}, props, {feedTheme: lightTheme}) : props);
            // The category row scrolls beneath this overlay but is not part of the header.
            return light === true && props.tabsBarHeight > 0 ? styleChrome(result, props.tabsBarHeight) : result;
        }, original.compare);
    }, true);
    runtime.target(__TWITCH_FEED_SCRIM_MODULE__, 'FeedTopScrim', function (original, React, runtime, require) {
        var lightTheme = require(__TWITCH_PALETTE_MODULE__).lightTheme;
        function tint(element, color) {
            if (!React.isValidElement(element)) return element;
            var props = {};
            if (element.props.stopColor === '#000000') props.stopColor = color;
            if (element.props.children != null)
                props.children = React.Children.map(element.props.children, function (child) { return tint(child, color); });
            return Object.keys(props).length ? React.cloneElement(element, props) : element;
        }
        return function (props) {
            var light = runtime.policyHook(React, 11);
            var result = original(props);
            return light === true ? tint(result, lightTheme.colors.backgroundBody) : result;
        };
    });
})(globalThis);
