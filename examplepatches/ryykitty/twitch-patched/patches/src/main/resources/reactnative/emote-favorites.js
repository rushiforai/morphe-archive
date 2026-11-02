(function (global) {
    'use strict';
    var runtime = global.__twitchPatchRuntime;
    var SECTION = 'twitchpatches-favorites', TOGGLE_LINK = 'twitch-patches://favorites/toggle?key=';
    var keys = [], details = {}, listeners = new Set(), noCatalog = [], currentPreview = null, Linking;
    function publish(nextKeys, nextDetails) {
        keys = nextKeys;
        details = nextDetails;
        listeners.forEach(function (listener) { listener(); });
    }
    function subscribe(listener) {
        listeners.add(listener);
        return function () { listeners.delete(listener); };
    }
    function snapshot() { return keys; }
    // Keyed by provider and emote id so another channel's emote with the same name stays separate.
    function providerKey(url) {
        var match = /^https:\/\/cdn\.(betterttv|7tv|frankerfacez)\.[a-z]+\/emote\/([^/]+)\//.exec(url);
        return match ? 'c:' + match[1] + ':' + match[2] : null;
    }
    function keyOf(emote) {
        if (emote.id.indexOf('twitchpatches:') !== 0) return 't:' + emote.id;
        var decoded = runtime.emoteDetails && runtime.emoteDetails.decode(emote.id);
        return decoded ? providerKey(decoded.url) : null;
    }
    function validDetails(info) {
        return !!info && typeof info.token === 'string' && info.token.length > 0 && info.token.length <= 128 &&
            /^\d{1,20}$/.test(info.channel) && ['SUBSCRIPTIONS', 'FOLLOWER', 'BITS_BADGE_TIERS', 'OTHER'].indexOf(info.kind) >= 0;
    }
    function toggle(key, info) {
        var adding = keys.indexOf(key) < 0, nextDetails = Object.assign({}, details);
        if (adding && validDetails(info)) nextDetails[key] = info;
        if (!adding) delete nextDetails[key];
        publish(adding ? keys.concat(key) : keys.filter(function (value) { return value !== key; }), nextDetails);
        var link = TOGGLE_LINK + encodeURIComponent(key);
        if (adding && validDetails(info)) link += '&token=' + encodeURIComponent(info.token) + '&channel=' + info.channel + '&kind=' + info.kind;
        Linking.openURL(link).catch(function () { runtime.log('favorite emote sync failed'); });
    }
    function label(key) { return keys.indexOf(key) >= 0 ? 'Remove from Favorites' : 'Add to Favorites'; }
    function loadNativeModules(require) {
        if (!Linking) Linking = require(__TWITCH_REACT_NATIVE_MODULE__).Linking;
        return require(__TWITCH_ICONS_MODULE__);
    }
    function starIcon(Icons, key) { return keys.indexOf(key) >= 0 ? Icons.IconStar : Icons.IconStarHollow; }
    function lockedElsewhere(key) {
        var info = details[key];
        if (!info || key.indexOf('t:') !== 0) return null;
        return {id: key.slice(2), token: info.token, setID: '', type: info.kind, context: 'global', modifierCodes: [], locked: true,
            unlockKind: info.kind === 'FOLLOWER' ? 'follow' : info.kind === 'BITS_BADGE_TIERS' ? 'bits' : 'subscription', lockedElsewhere: true};
    }
    function favoriteSection(groups) {
        var available = new Map();
        groups.forEach(function (group) {
            group.emotes.forEach(function (emote) {
                var key = keyOf(emote), known = key && available.get(key);
                if (key && (!known || (known.locked && !emote.locked))) available.set(key, emote);
            });
        });
        var emotes = keys.map(function (key) { return available.get(key) || lockedElsewhere(key); }).filter(Boolean);
        return emotes.length ? {id: SECTION, category: 'current_channel', title: 'Favorites', emotes: emotes} : null;
    }
    function subscribeCatalog(listener) {
        return runtime.emotes ? runtime.emotes.subscribe(listener) : function () {};
    }
    function cardDetails(emote, data) {
        var kind = {subscription: 'SUBSCRIPTIONS', follower: 'FOLLOWER', bitsTier: 'BITS_BADGE_TIERS'}[data.emoteType];
        return kind ? {token: emote.token, channel: data.emoteChannelID, kind: kind} : null;
    }
    function pickerDetails(emote, channelID) {
        if (!emote.locked) return null;
        return {token: emote.token, channel: channelID, kind: emote.unlockKind === 'follow' ? 'FOLLOWER' :
            emote.unlockKind === 'bits' ? 'BITS_BADGE_TIERS' : 'SUBSCRIPTIONS'};
    }
    runtime.emoteFavorites = {providerKey: providerKey};
    global.RN$registerCallableModule('TwitchPatchFavorites', function () {
        return {set: function (serialized) {
            var incoming;
            try { incoming = JSON.parse(serialized); }
            catch (error) { runtime.log('favorite emotes invalid'); return; }
            if (!incoming || !Array.isArray(incoming.keys)) return;
            var nextKeys = incoming.keys.filter(function (key) { return typeof key === 'string' && /^[tc]:\S{1,128}$/.test(key); });
            var nextDetails = {};
            nextKeys.forEach(function (key) { if (incoming.details && validDetails(incoming.details[key])) nextDetails[key] = incoming.details[key]; });
            if (JSON.stringify([nextKeys, nextDetails]) !== JSON.stringify([keys, details])) publish(nextKeys, nextDetails);
        }};
    });
    runtime.decorate(__TWITCH_EMOTE_PREVIEW_MODULE__, 'useEmotePreview', function (original) {
        return function useEmotePreview(options) {
            currentPreview = original(options);
            return currentPreview;
        };
    });
    runtime.decorate(__TWITCH_EMOTE_CARD_MODULE__, 'EmoteCard', function (original, React, policy, require) {
        function isEmoteImage(node) { return React.isValidElement(node) && /-image$/.test(node.props.testID || ''); }
        function withStar(node, star, depth) {
            if (!React.isValidElement(node) || depth > 16 || node.props.children == null || typeof node.props.children === 'function') return node;
            var children = React.Children.toArray(node.props.children);
            if (children.some(isEmoteImage)) return React.cloneElement(node, {}, children.concat(star));
            return React.cloneElement(node, {}, React.Children.map(node.props.children, function (child) {
                return withStar(child, star, depth + 1);
            }));
        }
        return function EmoteCard(props) {
            var enabled = runtime.policyHook(React, 13);
            React.useSyncExternalStore(subscribe, snapshot);
            var theme = require(__TWITCH_THEME_MODULE__).useTheme();
            var tree = original.apply(this, arguments);
            var emote = props.emote;
            var key = !enabled ? null : props.favoriteKey || (emote && typeof emote.id === 'string' ? 't:' + emote.id : null);
            if (!key) return tree;
            var info = props.favoriteKey ? null :
                cardDetails(emote, require(__TWITCH_EMOTE_CARD_DATA_MODULE__).fetchEmoteCardData({emote: emote}));
            var Icons = loadNativeModules(require);
            return withStar(tree, React.createElement(require(__TWITCH_REACT_NATIVE_MODULE__).Pressable, {key: 'emote-card-favorite',
                onPress: function () { toggle(key, info); }, hitSlop: 8, accessibilityRole: 'button', accessibilityLabel: label(key),
                testID: 'emote-card-favorite', style: {marginLeft: 'auto', alignSelf: 'center', padding: 8},
                children: React.createElement(starIcon(Icons, key), {fillColor: theme.colors.textBase})}), 0);
        };
    });
    runtime.decorateOutermost(__TWITCH_EMOTE_PICKER_MODULE__, 'EmotePickerTray', function (original, React, policy, require) {
        var Icons;
        function menuItem(insert, preview, key, channelID) {
            return React.createElement(insert.type, Object.assign({}, insert.props, {key: 'emote-preview-favorite',
                figure: {icon: starIcon(Icons, key)}, accessibilityLabel: label(key),
                testID: 'emote-preview-favorite', children: label(key),
                onPress: function () { toggle(key, pickerDetails(preview.previewEmote, channelID)); preview.dismissPreview(); }}));
        }
        function withStarGlyph(node, depth) {
            if (!React.isValidElement(node) || depth > 8) return node;
            if (node.props.testID === 'emote-nav-tab-glyph-' + SECTION) {
                var glyph = React.Children.toArray(node.props.children)[0];
                return React.cloneElement(node, {}, React.createElement(Icons.IconStar, {fillColor: glyph && glyph.props.fillColor}));
            }
            return node.props.children == null ? node : React.cloneElement(node, {}, React.Children.map(node.props.children,
                function (child) { return withStarGlyph(child, depth + 1); }));
        }
        function StarTab(props) {
            var type = props.template.type, Component = typeof type === 'function' ? type : type.type;
            return withStarGlyph(Component(props.template.props), 0);
        }
        function visitList(nodes, context, depth) {
            var result = [];
            nodes.forEach(function (node) {
                result.push(visit(node, context, depth));
                if (!React.isValidElement(node) || node.props.testID !== 'emote-preview-insert') return;
                var emote = context.preview && context.preview.previewEmote, key = emote ? keyOf(emote) : null;
                if (key) result.push(menuItem(node, context.preview, key, context.channelID));
            });
            return result.length === nodes.length && result.every(function (node, index) { return node === nodes[index]; }) ? nodes : result;
        }
        // Twitch's upsell only knows the current channel, so another channel's locked emote opens its own card.
        function withElsewhereCards(list, context) {
            return React.cloneElement(list, {renderItem: function (info) {
                var row = list.props.renderItem.apply(this, arguments);
                if (!info.section || info.section.key !== SECTION || !React.isValidElement(row)) return row;
                return React.cloneElement(row, {onSelectEmote: function (emote) {
                    if (emote.lockedElsewhere) context.openCard(emote);
                    else row.props.onSelectEmote.apply(this, arguments);
                }});
            }});
        }
        function visit(node, context, depth) {
            if (Array.isArray(node)) return visitList(node, context, depth + 1);
            if (!React.isValidElement(node) || depth > 16) return node;
            if (node.props.testID === 'emote-grid-list') return withElsewhereCards(node, context);
            if (node.props.testID === 'emote-nav-tablist') {
                return React.cloneElement(node, {}, React.Children.toArray(node.props.children).map(function (tab) {
                    var favorites = React.isValidElement(tab) && tab.props.category && tab.props.category.key === SECTION;
                    return favorites ? React.createElement(StarTab, {key: tab.key, template: tab}) : tab;
                }));
            }
            var changed = null;
            ['children', 'footer', 'overlay'].forEach(function (name) {
                if (node.props[name] == null) return;
                var next = visit(node.props[name], context, depth + 1);
                if (next !== node.props[name]) (changed = changed || {})[name] = next;
            });
            return changed ? React.cloneElement(node, changed) : node;
        }
        return function EmotePickerTray(props) {
            Icons = loadNativeModules(require);
            var enabled = runtime.policyHook(React, 13);
            var favorites = React.useSyncExternalStore(subscribe, snapshot);
            var catalog = React.useSyncExternalStore(subscribeCatalog, function () {
                return runtime.emotes ? runtime.emotes.pickerSnapshot(props.channelID) : noCatalog;
            });
            var card = React.useState(null), openedCard = card[0], openCard = card[1];
            var sections = React.useMemo(function () {
                var native = props.sections || [];
                var external = runtime.emotePicker ? runtime.emotePicker.sections(catalog, null) : noCatalog;
                var section = enabled ? favoriteSection(native.concat(external)) : null;
                return section ? [section].concat(native) : props.sections;
            }, [enabled, favorites, props.sections, catalog]);
            currentPreview = null;
            var tree = original.call(this, sections === props.sections ? props : Object.assign({}, props, {sections: sections}));
            if (!enabled) return tree;
            var visited = visit(tree, {preview: currentPreview, channelID: props.channelID, openCard: openCard}, 0);
            if (!openedCard) return visited;
            return React.createElement(React.Fragment, null, visited, React.createElement(require(__TWITCH_CHAT_CARD_HOST_MODULE__).ChatCardHost, {
                openCard: {kind: 'emote', emoteID: openedCard.id, token: openedCard.token}, channelID: props.channelID,
                onClose: function () { openCard(null); }}));
        };
    });
})(globalThis);
