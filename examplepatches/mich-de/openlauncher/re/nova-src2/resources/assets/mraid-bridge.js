// mraid-bridge.js - This runs in the parent frame
(function() {
  // Create the bridge object
  var bridge = window.mraidbridge = {
    nativeSDKFiredReady: false,
    nativeCallQueue: [],
    nativeCallInFlight: false,
    lastSizeChangeProperties: null,
    iframeWindows: [] // Store references to iframe windows that have registered
  };

  // Constants mirrored from MRAID
  var EVENTS = {
    ERROR: 'error',
    INFO: 'info',
    READY: 'ready',
    STATECHANGE: 'stateChange',
    VIEWABLECHANGE: 'viewableChange',
    SIZECHANGE: 'sizeChange'
  };

  var STATES = {
    LOADING: 'loading',
    DEFAULT: 'default',
    EXPANDED: 'expanded',
    HIDDEN: 'hidden',
    RESIZED: 'resized'
  };

  // State and properties
  var currentPosition = {};
  var defaultPosition = {};
  var maxSize = {};
  var screenSize = {};
  var state = STATES.LOADING;
  var isViewable = false;
  var placementType = 'unknown';
  var supportProperties = {
    sms: false,
    tel: false,
    calendar: false,
    storePicture: false,
    inlineVideo: false
  };

  // Helper functions
  var stringify = function(obj) {
    if (typeof obj === 'object') {
      var out = [];
      if (obj.push) {
        for (var p in obj) out.push(obj[p]);
        return '[' + out.join(',') + ']';
      } else {
        for (var p in obj) out.push("'" + p + "': " + obj[p]);
        return '{' + out.join(',') + '}';
      }
    } else return String(obj);
  };

  bridge.executeNativeCall = function(args) {
      var command = args.shift();

      if (!this.nativeSDKFiredReady) {
          bridge.notifyErrorEvent('mraid is not ready', command);
          return;
      }

      var call = 'mraid://' + command;

      var key, value;
      var isFirstArgument = true;

      for (var i = 0; i < args.length; i += 2) {
        key = args[i];
        value = args[i + 1];

        if (value === null) continue;

        if (isFirstArgument) {
          call += '?';
          isFirstArgument = false;
        } else {
          call += '&';
        }

        call += encodeURIComponent(key) + '=' + encodeURIComponent(value);
      }

      if (this.nativeCallInFlight) {
        this.nativeCallQueue.push(call);
      } else {
        this.nativeCallInFlight = true;
        window.location = call;
      }
    };

  window.addEventListener('message', function(event) {
    try {
      var data = JSON.parse(event.data);
      if (data.command) {

        // Detect platform based on User-Agent
        var userAgent = navigator.userAgent || navigator.vendor || window.opera;
        var isAndroid = /android/i.test(userAgent);
        var isIOS = /iPad|iPhone|iPod/.test(userAgent) && !window.MSStream;

        // Convert params object to array of key-value pairs for executeNativeCall
        var args = [data.command];
        if (data.params) {
          for (var key in data.params) {
            if (data.params.hasOwnProperty(key)) {
              args.push(key);
              args.push(data.params[key]);
            }
          }
        }
        bridge.executeNativeCall(args);
      }
    } catch (e) {
      console.error('Error processing message from iframe:', e);
    }

  }, false);

  bridge.registerIframe = function(iframe) {
    if (iframe && iframe.contentWindow) {
      this.iframeWindows.push(iframe.contentWindow);
    }
  };

  function sendMessageToIframe(event, ...args) {
    const iframe = document.getElementById('adFrame');

    if (!iframe || !iframe.contentWindow) {
      console.error('Iframe not found or not loaded');
      return;
    }

    const payload = {
      type: 'mraidbridge:' + event,
      args: args
    };

    // Send message to the iframe
    iframe.contentWindow.postMessage(JSON.stringify(payload), '*');
  }

  // Fire change event to update properties in iframes
  bridge.fireChangeEvent = function(properties) {
    const iframe = document.getElementById('adFrame');

    if (!iframe || !iframe.contentWindow) {
      console.error('Iframe not found or not loaded');
      return;
    }

    const message = {
      type: 'mraidbridge:change',
      properties: properties
    };

    iframe.contentWindow.postMessage(JSON.stringify(message), '*');
  };

  // Native call handling
  bridge.nativeCallComplete = function(command) {
    if (this.nativeCallQueue.length === 0) {
      this.nativeCallInFlight = false;
      return;
    }

    var nextCall = this.nativeCallQueue.pop();
    window.location = nextCall;
  };

  // Position and size setters
  bridge.setCurrentPosition = function(x, y, width, height) {
    currentPosition = {
      x: x,
      y: y,
      width: width,
      height: height
    };
    sendMessageToIframe(EVENTS.INFO, 'Set current position to ' + stringify(currentPosition));
    this.fireChangeEvent({ currentPosition: currentPosition });
  };

  bridge.setDefaultPosition = function(x, y, width, height) {
    defaultPosition = {
      x: x,
      y: y,
      width: width,
      height: height
    };
    sendMessageToIframe(EVENTS.INFO, 'Set default position to ' + stringify(defaultPosition));
    this.fireChangeEvent({ defaultPosition: defaultPosition });
  };

  bridge.setMaxSize = function(width, height) {
    maxSize = {
      width: width,
      height: height
    };
    sendMessageToIframe(EVENTS.INFO, 'Set max size to ' + stringify(maxSize));
    this.fireChangeEvent({ maxSize: maxSize });
  };

  bridge.setPlacementType = function(_placementType) {
    placementType = _placementType;
    sendMessageToIframe(EVENTS.INFO, 'Set placement type to ' + stringify(placementType));
    this.fireChangeEvent({ placementType: placementType });
  };

  bridge.setScreenSize = function(width, height) {
    screenSize = {
      width: width,
      height: height
    };
    sendMessageToIframe(EVENTS.INFO, 'Set screen size to ' + stringify(screenSize));
    this.fireChangeEvent({ screenSize: screenSize });
  };

  bridge.setState = function(_state) {
    state = _state;
    sendMessageToIframe(EVENTS.INFO, 'Set state to ' + stringify(state));
    sendMessageToIframe(EVENTS.STATECHANGE, state);
    this.fireChangeEvent({ state: state });
  };

  bridge.setIsViewable = function(_isViewable) {
    isViewable = _isViewable;
    sendMessageToIframe(EVENTS.VIEWABLECHANGE, isViewable);
    sendMessageToIframe(EVENTS.INFO, 'Set isViewable to ' + stringify(isViewable));
    this.fireChangeEvent({ isViewable: isViewable });
  };

  bridge.setSupports = function(sms, tel, calendar, storePicture, inlineVideo) {
    supportProperties = {
      sms: sms,
      tel: tel,
      calendar: calendar,
      storePicture: storePicture,
      inlineVideo: inlineVideo
    };
    this.fireChangeEvent({ supportProperties: supportProperties });
  };

  // Event notifications
  bridge.notifyReadyEvent = function() {
    this.nativeSDKFiredReady = true;
    sendMessageToIframe(EVENTS.READY);
  };

  bridge.notifyErrorEvent = function(message, action) {
    sendMessageToIframe(EVENTS.ERROR, message, action);
  };

  bridge.fireReadyEvent = bridge.notifyReadyEvent;
  bridge.fireErrorEvent = bridge.notifyErrorEvent;

  bridge.notifySizeChangeEvent = function(width, height) {
    if (this.lastSizeChangeProperties &&
          width == this.lastSizeChangeProperties.width && height == this.lastSizeChangeProperties.height) {
      return;
    }

    this.lastSizeChangeProperties = {
        width: width,
        height: height
    };
    sendMessageToIframe(EVENTS.SIZECHANGE, width, height);
  };

  bridge.notifyStateChangeEvent = function() {
    if (state === STATES.LOADING) {
      sendMessageToIframe(EVENTS.INFO, 'Native SDK initialized.');
    }

    sendMessageToIframe(EVENTS.INFO, 'Set state to ' + stringify(state));
    sendMessageToIframe(EVENTS.STATECHANGE, state);
  };

  bridge.notifyViewableChangeEvent = function() {
    sendMessageToIframe(EVENTS.INFO, 'Set isViewable to ' + stringify(isViewable));
    sendMessageToIframe(EVENTS.VIEWABLECHANGE, isViewable);
  };
})();
