(function (runtime) {
    'use strict';
    runtime.reload.control = function (React, IconRefresh, ToastAndroid) {
        return function ReloadControl(props) {
            var latest = React.useRef(props);
            latest.current = props;
            var gesture = React.useRef(null);
            if (!gesture.current) gesture.current = runtime.reload.gesture(function () {
                var current = latest.current;
                if (current.active && !current.loading) current.owner.request(current.binding);
            }, function (visible) {
                if (visible) ToastAndroid.show('Double-tap to reload stream', ToastAndroid.SHORT);
            }, setTimeout, clearTimeout, function () { return performance.now(); });
            React.useEffect(function () {
                gesture.current.reset();
                return function () { gesture.current.reset(); };
            }, [props.binding && props.binding.channel, props.active, props.loading]);
            var template = props.template, button = template.props.children;
            if (!props.active) return null;
            return React.cloneElement(button, {
                testID: 'player-controls-reload', accessibilityLabel: 'Reload stream',
                accessibilityHint: 'Double-tap to reload stream', disabled: props.loading,
                accessibilityActions: [{name: 'activate', label: 'Reload stream'}],
                onAccessibilityAction: function (event) {
                    if (event.nativeEvent.actionName === 'activate') gesture.current.activate();
                },
                onPress: function () { if (!latest.current.loading && latest.current.active) gesture.current.press(); },
                icon: React.createElement(IconRefresh, button.props.icon.props)
            });
        };
    };
    runtime.reload.insert = function (React, result, create) {
        var count = 0, matches = 0, limit = {};
        function visit(node, depth) {
            if (++count > 2048 || depth > 32) throw limit;
            if (Array.isArray(node)) {
                var changed = false, next = [];
                node.forEach(function (child) {
                    var updated = visit(child, depth + 1);
                    next.push(updated); changed = changed || updated !== child;
                    if (React.isValidElement(child) && child.props.testID === 'player-controls-mute-tooltip' &&
                        React.isValidElement(child.props.children) && child.props.children.props.testID === 'player-controls-mute') {
                        matches++; next.push(create(child)); changed = true;
                    }
                });
                return changed ? next : node;
            }
            if (!React.isValidElement(node) || node.props.children === undefined) return node;
            var children = visit(node.props.children, depth + 1);
            return children === node.props.children ? node : React.cloneElement(node, {children: children});
        }
        try {
            var output = visit(result, 0);
            return matches === 1 ? output : result;
        } catch (error) {
            if (error !== limit) throw error;
            runtime.log('reload control tree limit'); return result;
        }
    };
})(globalThis.__twitchPatchRuntime);
