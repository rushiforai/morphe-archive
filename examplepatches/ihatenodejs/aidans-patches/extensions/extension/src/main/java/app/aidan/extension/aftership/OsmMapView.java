package app.aidan.extension.aftership;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.util.Log;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class OsmMapView extends FrameLayout {
    private static final String TAG = "AfterShipOsmMap";

    private final WebView webView;
    private boolean isPageLoaded = false;
    private String pendingScript = null;
    private boolean showZoomButtons = false;

    /**
     * Creates a map WebView and starts loading Leaflet from unpkg and OpenStreetMap tiles.
     */
    @SuppressLint("SetJavaScriptEnabled")
    public OsmMapView(Context context) {
        super(context);
        setLayoutParams(new LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        webView = new WebView(context);
        webView.setLayoutParams(new LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        webView.setBackgroundColor(Color.TRANSPARENT);

        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setCacheMode(WebSettings.LOAD_DEFAULT);
        settings.setUserAgentString("AfterShip-PackageTracker/5.25.8 (Android; OpenStreetMap)");

        webView.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                isPageLoaded = true;
                if (pendingScript != null) {
                    webView.evaluateJavascript(pendingScript, null);
                    pendingScript = null;
                }
            }
        });

        addView(webView);
        loadMap();
    }

    /**
     * Returns whether the current resource configuration explicitly enables night mode.
     */
    private boolean isNightMode() {
        int nightMask = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return nightMask == Configuration.UI_MODE_NIGHT_YES;
    }

    /**
     * Sets zoom-button visibility for the next {@link #loadMap()} call.
     * The currently displayed page is not updated.
     */
    public void setZoomButtonsEnabled(boolean enabled) {
        this.showZoomButtons = enabled;
    }

    /**
     * Loads a new map page using the current night mode and stored zoom-button setting.
     * The page fetches Leaflet resources and OpenStreetMap tiles over the network.
     */
    public void loadMap() {
        boolean night = isNightMode();
        String html = generateMapHtml(night, showZoomButtons);
        webView.loadDataWithBaseURL("https://tile.openstreetmap.org", html, "text/html", "UTF-8", null);
    }

    /**
     * Replaces the displayed route, or retains only the latest pending update until
     * page loading finishes. An empty coordinate list clears route markers and lines.
     * Exceptions while preparing or submitting the update are suppressed.
     *
     * @param coordinates latitude/longitude pairs in degrees, newest checkpoint first
     * @param colorInt route color; only the low 24 RGB bits are used
     * @param topOffsetCssPx top clearance in CSS pixels, clamped to at least 110
     * @param bottomOffsetPx bottom clearance, passed as CSS pixels without density
     *     conversion and clamped to at least 100
     * @param showZoom whether to show zoom buttons; also stored for later page loads
     */
    public void renderRoute(List<double[]> coordinates, int colorInt, int topOffsetCssPx, int bottomOffsetPx, boolean showZoom) {
        renderRoute(coordinates, colorInt, topOffsetCssPx, 16, bottomOffsetPx, showZoom);
    }

    /**
     * Replaces the displayed route, with custom top and left clearances for control alignment.
     *
     * @param coordinates latitude/longitude pairs in degrees, newest checkpoint first
     * @param colorInt route color; only the low 24 RGB bits are used
     * @param topOffsetCssPx top clearance in CSS pixels, clamped to at least 110
     * @param leftOffsetCssPx left clearance in CSS pixels for top-left controls, clamped to at least 0
     * @param bottomOffsetPx bottom clearance, passed as CSS pixels without density conversion and clamped to at least 100
     * @param showZoom whether to show zoom buttons; also stored for later page loads
     */
    public void renderRoute(List<double[]> coordinates, int colorInt, int topOffsetCssPx, int leftOffsetCssPx, int bottomOffsetPx, boolean showZoom) {
        this.showZoomButtons = showZoom;
        try {
            JSONArray jsonCoords = new JSONArray();
            for (double[] coord : coordinates) {
                JSONArray pt = new JSONArray();
                pt.put(coord[0]);
                pt.put(coord[1]);
                jsonCoords.put(pt);
            }

            String hexColor = String.format("#%06X", (0xFFFFFF & colorInt));
            JSONObject data = new JSONObject();
            data.put("coords", jsonCoords);
            data.put("color", hexColor);
            data.put("topOffset", Math.max(topOffsetCssPx, 0));
            data.put("bottomOffset", Math.max(bottomOffsetPx, 100));
            data.put("leftOffset", Math.max(leftOffsetCssPx, 0));
            data.put("showZoom", showZoom);

            String script = "if (window.renderAfterShipRoute) { window.renderAfterShipRoute(" + data.toString() + "); }";
            if (isPageLoaded) {
                webView.evaluateJavascript(script, null);
            } else {
                pendingScript = script;
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to build route JSON", e);
        }
    }

    /**
     * Returns a Leaflet map page using remote OpenStreetMap tiles, with the requested
     * dark styling and initial zoom-button visibility. The page exposes a route renderer
     * that reverses checkpoint order and coalesces consecutive near-identical locations.
     */
    private static String generateMapHtml(boolean isDark, boolean showZoom) {
        String tileUrl = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
        String bgColor = isDark ? "#121212" : "#f5f5f5";

        String tileFilterCss = isDark
                ? "filter: brightness(0.6) invert(1) contrast(2.5) hue-rotate(190deg) saturate(0.25) brightness(0.85);"
                : "filter: brightness(1.02) contrast(1.05) saturate(0.85);";

        String controlBg = isDark ? "#242424" : "#ffffff";
        String controlBorder = isDark ? "#383838" : "rgba(0,0,0,0.12)";
        String controlText = isDark ? "#ffffff" : "#222222";
        String controlDivider = isDark ? "#383838" : "rgba(0,0,0,0.08)";
        String controlShadow = isDark ? "rgba(0,0,0,0.6)" : "rgba(0,0,0,0.15)";
        String activeBg = isDark ? "rgba(255,255,255,0.12)" : "rgba(0,0,0,0.08)";
        String zoomDisplay = showZoom ? "flex" : "none";

        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "  <meta charset=\"utf-8\" />\n" +
                "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\" />\n" +
                "  <link rel=\"stylesheet\" href=\"https://unpkg.com/leaflet@1.9.4/dist/leaflet.css\" />\n" +
                "  <script src=\"https://unpkg.com/leaflet@1.9.4/dist/leaflet.js\"></script>\n" +
                "  <style>\n" +
                "    html, body, #map {\n" +
                "      height: 100%;\n" +
                "      width: 100%;\n" +
                "      margin: 0;\n" +
                "      padding: 0;\n" +
                "      background-color: " + bgColor + ";\n" +
                "      overflow: hidden;\n" +
                "    }\n" +
                "    .leaflet-tile {\n" +
                "      " + tileFilterCss + "\n" +
                "    }\n" +
                "    .leaflet-control-container .leaflet-top.leaflet-left {\n" +
                "      top: 110px;\n" +
                "      left: 16px;\n" +
                "      transition: top 0.2s ease, left 0.2s ease;\n" +
                "    }\n" +
                "    .leaflet-control-container .leaflet-top.leaflet-left .leaflet-control {\n" +
                "      margin: 0 !important;\n" +
                "    }\n" +
                "    .leaflet-control-container .leaflet-bottom {\n" +
                "      display: none !important;\n" +
                "    }\n" +
                "    .leaflet-control-attribution {\n" +
                "      background-color: " + (isDark ? "rgba(36, 36, 36, 0.85)" : "rgba(255, 255, 255, 0.85)") + " !important;\n" +
                "      color: " + (isDark ? "#cccccc" : "#333333") + " !important;\n" +
                "      border: 1px solid " + controlBorder + " !important;\n" +
                "      border-radius: 6px !important;\n" +
                "      box-shadow: 0 2px 6px " + controlShadow + " !important;\n" +
                "      padding: 2px 6px !important;\n" +
                "      font-size: 11px !important;\n" +
                "    }\n" +
                "    .leaflet-control-attribution a {\n" +
                "      color: " + (isDark ? "#8ab4f8" : "#0078A8") + " !important;\n" +
                "    }\n" +
                "    #zoom-controls {\n" +
                "      position: absolute;\n" +
                "      right: 16px;\n" +
                "      top: 110px;\n" +
                "      z-index: 1000;\n" +
                "      display: " + zoomDisplay + ";\n" +
                "      flex-direction: column;\n" +
                "      background-color: " + controlBg + ";\n" +
                "      border: 1px solid " + controlBorder + ";\n" +
                "      border-radius: 10px;\n" +
                "      box-shadow: 0 3px 10px " + controlShadow + ";\n" +
                "      overflow: hidden;\n" +
                "      user-select: none;\n" +
                "      -webkit-user-select: none;\n" +
                "      touch-action: none;\n" +
                "      transition: top 0.2s ease;\n" +
                "    }\n" +
                "    .zoom-btn {\n" +
                "      width: 38px;\n" +
                "      height: 38px;\n" +
                "      background: transparent;\n" +
                "      border: none;\n" +
                "      color: " + controlText + ";\n" +
                "      font-size: 22px;\n" +
                "      font-weight: 500;\n" +
                "      line-height: 38px;\n" +
                "      text-align: center;\n" +
                "      cursor: pointer;\n" +
                "      display: flex;\n" +
                "      align-items: center;\n" +
                "      justify-content: center;\n" +
                "      transition: background-color 0.15s ease, transform 0.1s ease;\n" +
                "      outline: none;\n" +
                "      -webkit-tap-highlight-color: transparent;\n" +
                "    }\n" +
                "    .zoom-btn:active {\n" +
                "      background-color: " + activeBg + ";\n" +
                "      transform: scale(0.92);\n" +
                "    }\n" +
                "    #zoom-divider {\n" +
                "      height: 1px;\n" +
                "      background-color: " + controlDivider + ";\n" +
                "      width: 100%;\n" +
                "    }\n" +
                "    @keyframes pulse-anim {\n" +
                "      0% { transform: scale(0.6); opacity: 0.85; }\n" +
                "      70% { transform: scale(2.4); opacity: 0; }\n" +
                "      100% { transform: scale(2.4); opacity: 0; }\n" +
                "    }\n" +
                "    .pulse-wrapper {\n" +
                "      position: relative;\n" +
                "      width: 40px;\n" +
                "      height: 40px;\n" +
                "      display: flex;\n" +
                "      align-items: center;\n" +
                "      justify-content: center;\n" +
                "    }\n" +
                "    .pulse-halo {\n" +
                "      position: absolute;\n" +
                "      width: 34px;\n" +
                "      height: 34px;\n" +
                "      border-radius: 50%;\n" +
                "      animation: pulse-anim 2s infinite ease-out;\n" +
                "    }\n" +
                "    .pulse-core {\n" +
                "      position: absolute;\n" +
                "      width: 14px;\n" +
                "      height: 14px;\n" +
                "      border-radius: 50%;\n" +
                "      border: 2.5px solid #ffffff;\n" +
                "      box-shadow: 0 2px 6px rgba(0,0,0,0.5);\n" +
                "    }\n" +
                "    .checkpoint-marker {\n" +
                "      width: 10px;\n" +
                "      height: 10px;\n" +
                "      background-color: #9E9E9E;\n" +
                "      border: 2px solid #ffffff;\n" +
                "      border-radius: 50%;\n" +
                "      box-shadow: 0 1px 4px rgba(0,0,0,0.4);\n" +
                "    }\n" +
                "    .origin-marker {\n" +
                "      width: 12px;\n" +
                "      height: 12px;\n" +
                "      background-color: #757575;\n" +
                "      border: 2px solid #ffffff;\n" +
                "      border-radius: 50%;\n" +
                "      box-shadow: 0 1px 4px rgba(0,0,0,0.4);\n" +
                "    }\n" +
                "  </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "  <div id=\"map\"></div>\n" +
                "  <div id=\"zoom-controls\">\n" +
                "    <button id=\"zoom-in\" class=\"zoom-btn\" aria-label=\"Zoom in\">+</button>\n" +
                "    <div id=\"zoom-divider\"></div>\n" +
                "    <button id=\"zoom-out\" class=\"zoom-btn\" aria-label=\"Zoom out\">−</button>\n" +
                "  </div>\n" +
                "  <script>\n" +
                "    var map = L.map('map', {\n" +
                "      zoomControl: false,\n" +
                "      attributionControl: false,\n" +
                "      fadeAnimation: true,\n" +
                "      zoomAnimation: true\n" +
                "    }).setView([37.7749, -122.4194], 4);\n" +
                "\n" +
                "    L.control.attribution({\n" +
                "      position: 'topleft'\n" +
                "    }).addTo(map);\n" +
                "\n" +
                "    L.tileLayer('" + tileUrl + "', {\n" +
                "      maxZoom: 18,\n" +
                "      attribution: '&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors'\n" +
                "    }).addTo(map);\n" +
                "\n" +
                "    var zoomContainer = document.getElementById('zoom-controls');\n" +
                "    L.DomEvent.disableClickPropagation(zoomContainer);\n" +
                "    L.DomEvent.disableScrollPropagation(zoomContainer);\n" +
                "    var topContainer = document.querySelector('.leaflet-control-container .leaflet-top.leaflet-left');\n" +
                "\n" +
                "    function attachZoom(btnId, fn) {\n" +
                "      var btn = document.getElementById(btnId);\n" +
                "      var fired = false;\n" +
                "      btn.addEventListener('touchend', function(e) {\n" +
                "        e.preventDefault();\n" +
                "        e.stopPropagation();\n" +
                "        fired = true;\n" +
                "        fn();\n" +
                "        setTimeout(function() { fired = false; }, 300);\n" +
                "      }, { passive: false });\n" +
                "      btn.addEventListener('click', function(e) {\n" +
                "        e.preventDefault();\n" +
                "        e.stopPropagation();\n" +
                "        if (!fired) fn();\n" +
                "      });\n" +
                "    }\n" +
                "\n" +
                "    attachZoom('zoom-in', function() { map.zoomIn(); });\n" +
                "    attachZoom('zoom-out', function() { map.zoomOut(); });\n" +
                "\n" +
                "    var routeLayer = L.layerGroup().addTo(map);\n" +
                "\n" +
                "    function buildGeodesicPath(pts) {\n" +
                "      if (pts.length < 2) return pts;\n" +
                "      var path = [];\n" +
                "      for (var i = 1; i < pts.length; i++) {\n" +
                "        var p1 = pts[i - 1];\n" +
                "        var p2 = pts[i];\n" +
                "        var lat1 = p1[0], lng1 = p1[1];\n" +
                "        var lat2 = p2[0], lng2 = p2[1];\n" +
                "        var dLat = lat2 - lat1;\n" +
                "        var dLng = lng2 - lng1;\n" +
                "        var dist = Math.sqrt(dLat * dLat + dLng * dLng);\n" +
                "        if (dist < 0.1) {\n" +
                "          path.push(p1);\n" +
                "          continue;\n" +
                "        }\n" +
                "        var midLat = (lat1 + lat2) / 2;\n" +
                "        var midLng = (lng1 + lng2) / 2;\n" +
                "        var curvature = Math.min(dist * 0.12, 4.0);\n" +
                "        var nx = -dLng / dist;\n" +
                "        var ny = dLat / dist;\n" +
                "        var ctrlLat = midLat + Math.abs(nx) * curvature;\n" +
                "        var ctrlLng = midLng + ny * (curvature * 0.3);\n" +
                "        for (var s = 0; s < 15; s++) {\n" +
                "          var t = s / 15;\n" +
                "          var inv = 1 - t;\n" +
                "          var lat = inv * inv * lat1 + 2 * inv * t * ctrlLat + t * t * lat2;\n" +
                "          var lng = inv * inv * lng1 + 2 * inv * t * ctrlLng + t * t * lng2;\n" +
                "          path.push([lat, lng]);\n" +
                "        }\n" +
                "      }\n" +
                "      path.push(pts[pts.length - 1]);\n" +
                "      return path;\n" +
                "    }\n" +
                "\n" +
                "    window.renderAfterShipRoute = function(data) {\n" +
                "      routeLayer.clearLayers();\n" +
                "      var rawCoords = data.coords;\n" +
                "      var color = data.color || '#5B7BFE';\n" +
                "      var topOffset = data.topOffset || 110;\n" +
                "      var leftOffset = (typeof data.leftOffset === 'number') ? data.leftOffset : 16;\n" +
                "      var bottomOffset = data.bottomOffset || 120;\n" +
                "      var showZoom = (data.showZoom === true);\n" +
                "\n" +
                "      if (zoomContainer) {\n" +
                "        zoomContainer.style.top = topOffset + 'px';\n" +
                "        zoomContainer.style.display = showZoom ? 'flex' : 'none';\n" +
                "      }\n" +
                "\n" +
                "      if (topContainer) {\n" +
                "        topContainer.style.top = topOffset + 'px';\n" +
                "        topContainer.style.left = leftOffset + 'px';\n" +
                "      }\n" +
                "\n" +
                "      if (!rawCoords || rawCoords.length === 0) return;\n" +
                "\n" +
                "      // Filter and deduplicate consecutive identical locations\n" +
                "      var uniquePts = [];\n" +
                "      for (var c = 0; c < rawCoords.length; c++) {\n" +
                "        var cur = [rawCoords[c][0], rawCoords[c][1]];\n" +
                "        if (uniquePts.length === 0) {\n" +
                "          uniquePts.push(cur);\n" +
                "        } else {\n" +
                "          var prev = uniquePts[uniquePts.length - 1];\n" +
                "          var d = Math.abs(cur[0] - prev[0]) + Math.abs(cur[1] - prev[1]);\n" +
                "          if (d > 0.0001) {\n" +
                "            uniquePts.push(cur);\n" +
                "          }\n" +
                "        }\n" +
                "      }\n" +
                "\n" +
                "      // Convert to chronological sequence: [Origin -> ... -> Current Destination]\n" +
                "      var chronologicalPts = uniquePts.slice().reverse();\n" +
                "\n" +
                "      if (chronologicalPts.length > 1) {\n" +
                "        var curvedPolyline = buildGeodesicPath(chronologicalPts);\n" +
                "        // Draw glow/background casing line\n" +
                "        L.polyline(curvedPolyline, {\n" +
                "          color: color,\n" +
                "          weight: 6,\n" +
                "          opacity: 0.35,\n" +
                "          lineJoin: 'round',\n" +
                "          lineCap: 'round'\n" +
                "        }).addTo(routeLayer);\n" +
                "\n" +
                "        // Draw primary crisp route line\n" +
                "        L.polyline(curvedPolyline, {\n" +
                "          color: color,\n" +
                "          weight: 3.5,\n" +
                "          opacity: 0.95,\n" +
                "          lineJoin: 'round',\n" +
                "          lineCap: 'round'\n" +
                "        }).addTo(routeLayer);\n" +
                "      }\n" +
                "\n" +
                "      for (var j = 0; j < chronologicalPts.length; j++) {\n" +
                "        var pt = chronologicalPts[j];\n" +
                "        var isDestination = (j === chronologicalPts.length - 1);\n" +
                "        var isOrigin = (j === 0 && chronologicalPts.length > 1);\n" +
                "        var icon;\n" +
                "\n" +
                "        if (isDestination) {\n" +
                "          icon = L.divIcon({\n" +
                "            className: 'custom-pulse-icon',\n" +
                "            html: '<div class=\"pulse-wrapper\">' +\n" +
                "                  '<div class=\"pulse-halo\" style=\"background-color:' + color + ';\"></div>' +\n" +
                "                  '<div class=\"pulse-core\" style=\"background-color:' + color + ';\"></div>' +\n" +
                "                  '</div>',\n" +
                "            iconSize: [40, 40],\n" +
                "            iconAnchor: [20, 20]\n" +
                "          });\n" +
                "        } else if (isOrigin) {\n" +
                "          icon = L.divIcon({\n" +
                "            className: 'custom-origin-icon',\n" +
                "            html: '<div class=\"origin-marker\"></div>',\n" +
                "            iconSize: [12, 12],\n" +
                "            iconAnchor: [6, 6]\n" +
                "          });\n" +
                "        } else {\n" +
                "          icon = L.divIcon({\n" +
                "            className: 'custom-checkpoint-icon',\n" +
                "            html: '<div class=\"checkpoint-marker\"></div>',\n" +
                "            iconSize: [10, 10],\n" +
                "            iconAnchor: [5, 5]\n" +
                "          });\n" +
                "        }\n" +
                "        L.marker(pt, { icon: icon }).addTo(routeLayer);\n" +
                "      }\n" +
                "\n" +
                "      if (chronologicalPts.length > 1) {\n" +
                "        map.fitBounds(L.latLngBounds(chronologicalPts), {\n" +
                "          paddingTopLeft: [30, topOffset + 15],\n" +
                "          paddingBottomRight: [30, bottomOffset],\n" +
                "          maxZoom: 13\n" +
                "        });\n" +
                "      } else {\n" +
                "        map.setView(chronologicalPts[0], 11);\n" +
                "      }\n" +
                "    };\n" +
                "  </script>\n" +
                "</body>\n" +
                "</html>";
    }
}
