/* Manual location override.
   Feeds the coordinates stored by the map picker (LocationStore) into
   navigator.geolocation, falling back to the real provider when unset. */
(function () {
  "use strict";

  var watches = {};
  var seq = 0;

  function toPosition(lat, lng) {
    return {
      coords: {
        latitude: lat,
        longitude: lng,
        accuracy: 5,
        altitude: null,
        altitudeAccuracy: null,
        heading: null,
        speed: null
      },
      timestamp: Date.now()
    };
  }

  function install() {
    var geo = navigator.geolocation;
    if (!geo || geo.fakeInstalled) {
      return;
    }
    geo.fakeInstalled = true;

    var origGet = geo.getCurrentPosition.bind(geo);

    function deliver(success, error, options) {
      if (!window.cordova) {
        origGet(success, error, options);
        return;
      }
      cordova.exec(
        function (loc) {
          if (loc && loc.enabled) {
            setTimeout(function () {
              success && success(toPosition(loc.lat, loc.lng));
            }, 30);
          } else {
            origGet(success, error, options);
          }
        },
        function () {
          origGet(success, error, options);
        },
        "MockChecker",
        "loc",
        []
      );
    }

    geo.getCurrentPosition = deliver;

    geo.watchPosition = function (success, error, options) {
      var id = ++seq;
      deliver(success, error, options);
      watches[id] = setInterval(function () {
        deliver(success, error, options);
      }, 15000);
      return id;
    };

    geo.clearWatch = function (id) {
      if (watches[id]) {
        clearInterval(watches[id]);
        delete watches[id];
      }
    };
  }

  install();
  document.addEventListener("deviceready", install, false);
})();
