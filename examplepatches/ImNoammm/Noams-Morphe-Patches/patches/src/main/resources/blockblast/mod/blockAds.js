// Block ads: every ad first asks advertisementGameInfo.getIsCanPlayAd(), fresh per request. False takes
// each caller's own no-ad branch: rewarded and full-screen flows get their success callback at once (the
// paying no-ads path, code -2), banners are not shown, and nothing waits on a native callback.
bb.feature('blockAds', {
    title: 'Ads',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Block all ads', def: true },
    ],
    start: function () {
        bb.on('AdvertisementGameInfo', function (exports) {
            var info = exports.advertisementGameInfo;
            bb.wrap(Object.getPrototypeOf(info), 'getIsCanPlayAd', function (original) {
                return function () {
                    if (bb.get('blockAds', 'enabled')) {
                        try {
                            if (typeof this.reportShowActionRequestResult === 'function') this.reportShowActionRequestResult(-2);
                        } catch (e) { }
                        return false;
                    }
                    return original.apply(this, arguments);
                };
            });
        });
    },
});
