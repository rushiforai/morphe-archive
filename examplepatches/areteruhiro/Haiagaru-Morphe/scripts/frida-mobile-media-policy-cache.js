rpc.exports.test = function () {
  return new Promise(function (resolve, reject) {
    Java.perform(function () {
      var activeOverload = null;
      var capabilitiesOverload = null;
      var activeInfoOverload = null;
      var allNetworksOverload = null;
      var networkInfoOverload = null;
      var activeCalls = 0;
      var capabilitiesCalls = 0;
      var activeInfoCalls = 0;
      var allNetworksCalls = 0;
      var networkInfoCalls = 0;
      var measuringThreadId = null;
      var savedSettings = null;
      var policyPreferences = null;
      var policyKey = 'urlImageFetchPolicy';
      try {
        send({ type: 'log', payload: 'begin policy cache check' });
        var Policy = Java.use('app.morphe.extension.chmate.MobileMediaPolicy');
        var VideoFrames = Java.use('app.morphe.extension.chmate.VideoFrameThumbnail');
        send({ type: 'log', payload: 'loaded MobileMediaPolicy' });
        var ConnectivityManager = Java.use('android.net.ConnectivityManager');
        var BuildVersion = Java.use('android.os.Build$VERSION');
        var Thread = Java.use('java.lang.Thread');
        var app = Java.use('app.morphe.extension.chmate.Haiagaru').applicationContextForExtension();
        policyPreferences = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
        var settingsKeys = [policyKey, 'videoPreviewFour', 'videoPreviewWifiOnly'];
        savedSettings = {};
        for (var keyIndex = 0; keyIndex < settingsKeys.length; keyIndex++) {
          var key = settingsKeys[keyIndex];
          savedSettings[key] = { present: policyPreferences.contains(key),
            value: key === policyKey ? policyPreferences.getInt(key, 2) : policyPreferences.getBoolean(key, key === 'videoPreviewWifiOnly') };
        }
        policyPreferences.edit().putInt(policyKey, 2).putBoolean('videoPreviewFour', true)
          .putBoolean('videoPreviewWifiOnly', true).commit();
        send({ type: 'log', payload: 'configured Wi-Fi-only test policy' });
        var activeMethods = ConnectivityManager.getActiveNetwork;
        if (activeMethods) {
          activeOverload = activeMethods.overload();
          activeOverload.implementation = function () {
            if (measuringThreadId !== null && Thread.currentThread().getId().toString() === measuringThreadId) activeCalls++;
            return activeOverload.call(this);
          };
        }
        var capabilityMethods = ConnectivityManager.getNetworkCapabilities;
        if (capabilityMethods) {
          capabilitiesOverload = capabilityMethods.overload('android.net.Network');
          capabilitiesOverload.implementation = function (network) {
            if (measuringThreadId !== null && Thread.currentThread().getId().toString() === measuringThreadId) capabilitiesCalls++;
            return capabilitiesOverload.call(this, network);
          };
        }
        var activeInfoMethods = ConnectivityManager.getActiveNetworkInfo;
        if (activeInfoMethods) {
          activeInfoOverload = activeInfoMethods.overload();
          activeInfoOverload.implementation = function () {
            if (measuringThreadId !== null && Thread.currentThread().getId().toString() === measuringThreadId) activeInfoCalls++;
            return activeInfoOverload.call(this);
          };
        }
        var allNetworksMethods = ConnectivityManager.getAllNetworks;
        if (allNetworksMethods) {
          allNetworksOverload = allNetworksMethods.overload();
          allNetworksOverload.implementation = function () {
            if (measuringThreadId !== null && Thread.currentThread().getId().toString() === measuringThreadId) allNetworksCalls++;
            return allNetworksOverload.call(this);
          };
        }
        var networkInfoMethods = ConnectivityManager.getNetworkInfo;
        if (networkInfoMethods) {
          networkInfoOverload = networkInfoMethods.overload('android.net.Network');
          networkInfoOverload.implementation = function (network) {
            if (measuringThreadId !== null && Thread.currentThread().getId().toString() === measuringThreadId) networkInfoCalls++;
            return networkInfoOverload.call(this, network);
          };
        }

        // The first call initializes the callback and takes one compatibility
        // snapshot. Measure only the repeated row-policy path after that warmup.
        Policy.allowed(policyKey);
        var fourPreviewAllowed = VideoFrames.fourAllowed();
        if (fourPreviewAllowed) {
          var connection = VideoFrames.connectionForPreview(app, 'https://example.com/no-request.mp4', true);
          connection.disconnect();
        }
        send({ type: 'log', payload: 'warmup returned' });
        var activeBefore = activeCalls;
        var capabilitiesBefore = capabilitiesCalls;
        measuringThreadId = Thread.currentThread().getId().toString();
        var start = Date.now();
        var count = 50000;
        for (var i = 0; i < count; i++) {
          Policy.allowed(policyKey);
          VideoFrames.fourAllowed();
        }
        var elapsed = Date.now() - start;
        measuringThreadId = null;
        var activeDelta = activeCalls - activeBefore;
        var capabilitiesDelta = capabilitiesCalls - capabilitiesBefore;
        var activeInfoDelta = activeInfoCalls;
        var allNetworksDelta = allNetworksCalls;
        var networkInfoDelta = networkInfoCalls;
        var sdk = BuildVersion.SDK_INT.value;
        var callbackRegistered = sdk >= 24;
        var maximumExpected = callbackRegistered ? 0 : 2 * (Math.ceil(elapsed / 1000) + 1);
        if (activeDelta + capabilitiesDelta + activeInfoDelta + allNetworksDelta + networkInfoDelta > maximumExpected) {
          throw new Error('Binder query count exceeded throttled bound: active=' + activeDelta +
            ', capabilities=' + capabilitiesDelta + ', activeInfo=' + activeInfoDelta +
            ', allNetworks=' + allNetworksDelta + ', networkInfo=' + networkInfoDelta +
            ', elapsedMs=' + elapsed + ', callback=' + callbackRegistered);
        }
        resolve({
          policyChecks: count,
          videoFourChecks: count,
          elapsedMs: elapsed,
          sdk: sdk,
          fourPreviewAllowed: fourPreviewAllowed,
          defaultNetworkCallbackRegistered: callbackRegistered,
          activeNetworkCallsDuringChecks: activeDelta,
          capabilitiesCallsDuringChecks: capabilitiesDelta,
          activeNetworkInfoCallsDuringChecks: activeInfoDelta,
          getAllNetworksCallsDuringChecks: allNetworksDelta,
          getNetworkInfoCallsDuringChecks: networkInfoDelta,
          maxExpectedCalls: maximumExpected
        });
      } catch (error) {
        send({ type: 'log', payload: 'failure: ' + (error.stack || String(error)) });
        reject(error.stack || String(error));
      } finally {
        measuringThreadId = null;
        if (activeOverload) activeOverload.implementation = null;
        if (capabilitiesOverload) capabilitiesOverload.implementation = null;
        if (activeInfoOverload) activeInfoOverload.implementation = null;
        if (allNetworksOverload) allNetworksOverload.implementation = null;
        if (networkInfoOverload) networkInfoOverload.implementation = null;
        if (policyPreferences && savedSettings) {
          var edit = policyPreferences.edit();
          for (var restoreKey in savedSettings) {
            var saved = savedSettings[restoreKey];
            if (!saved.present) edit.remove(restoreKey);
            else if (restoreKey === policyKey) edit.putInt(restoreKey, saved.value);
            else edit.putBoolean(restoreKey, saved.value);
          }
          edit.commit();
        }
      }
    });
  });
};
