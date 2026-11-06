(function (runtime) {
    'use strict';
    runtime.promotionElements = function (React, result, remove) {
        var count = 0;
        var limit = {};
        function visit(node, depth) {
            if (++count > 2048 || depth > 32) throw limit;
            if (Array.isArray(node)) {
                var changed = false;
                var children = node.map(function (child) {
                    var next = visit(child, depth + 1);
                    changed = changed || next !== child;
                    return next;
                });
                return changed ? children : node;
            }
            if (!React.isValidElement(node)) return node;
            if (remove(node.props)) return null;
            var children = node.props.children;
            if (children === undefined) return node;
            var next = visit(children, depth + 1);
            return next === children ? node : React.cloneElement(node, {children: next});
        }
        try { return visit(result, 0); }
        catch (error) {
            if (error !== limit) throw error;
            runtime.log('promotion tree limit');
            return result;
        }
    };
})(globalThis.__twitchPatchRuntime);
