package app.jofslash.extension.thecryptoapp;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Candlestick chart for a symbol, in a programmatic WebView (no XML). Primary source is the free
 * TradingView Advanced Chart embed (indicators included); a toggle switches to a self-contained
 * fallback that renders Binance /klines with the lightweight-charts library. Chrome styled via
 * {@link Palette}.
 */
public final class ChartActivity extends Activity {

    static final String TAG = CustomAlerts.TAG;

    private Palette p;
    private WebView web;
    private String symbol = "BTCUSDT";
    private boolean fallback = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            p = new Palette(this);
            // Before any view: creating the WebView sets up the window, after which the
            // no-title request in Palette.setUpWindow comes too late.
            requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
            String s = getIntent() != null ? getIntent().getStringExtra("symbol") : null;
            // Only letters and digits reach the HTML/JS below. Charts are Binance pairs, so a
            // bare coin ("BTC") is shown as its USDT pair.
            String clean = PriceFetcher.normalize(s);
            if (clean != null) symbol = PriceFetcher.binancePair(clean);

            LinearLayout root = new LinearLayout(this);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(p.screenBg);

            root.addView(buildBar());

            web = new WebView(this);
            WebSettings ws = web.getSettings();
            ws.setJavaScriptEnabled(true);
            ws.setDomStorageEnabled(true);
            root.addView(web, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            p.setUpWindow(this, root);
            setContentView(root);
            loadChart();
        } catch (Throwable t) {
            Log.e(TAG, "chart: onCreate failed", t);
        }
    }

    @Override
    protected void onDestroy() {
        // A WebView left alive keeps the chart's JS and network running after the screen closes.
        if (web != null) {
            try {
                web.stopLoading();
                web.destroy();
            } catch (Throwable ignored) {
            }
            web = null;
        }
        super.onDestroy();
    }

    private View buildBar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        int pad = p.dp(14);
        bar.setPadding(pad, pad, pad, pad);
        bar.setBackgroundColor(p.screenBg);

        TextView title = new TextView(this);
        title.setText(symbol);
        title.setTextColor(p.textPrimary);
        title.setTextSize(18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        bar.addView(title, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button toggle = new Button(this);
        toggle.setText("Switch source");
        toggle.setAllCaps(false);
        toggle.setTextColor(p.textPrimary);
        toggle.setBackground(p.secondaryButton());
        toggle.setOnClickListener(v -> {
            fallback = !fallback;
            loadChart();
        });
        bar.addView(toggle);

        return bar;
    }

    private void loadChart() {
        try {
            String html = fallback ? fallbackHtml() : tradingViewHtml();
            String base = fallback ? "https://api.binance.com" : "https://www.tradingview.com";
            web.loadDataWithBaseURL(base, html, "text/html", "utf-8", null);
            Log.i(TAG, "chart: loading " + (fallback ? "Binance-klines fallback" : "TradingView") + " for " + symbol);
        } catch (Throwable t) {
            Log.e(TAG, "chart: load failed", t);
        }
    }

    private String tradingViewHtml() {
        String theme = p.night ? "dark" : "light";
        String bg = String.format("#%06X", p.screenBg & 0xFFFFFF);
        return "<!DOCTYPE html><html><head><meta name='viewport' content='width=device-width, initial-scale=1'>"
                + "<style>html,body{margin:0;height:100%;background:" + bg + ";}#tv{height:100%;}</style></head>"
                + "<body><div id='tv'></div>"
                + "<script src='https://s3.tradingview.com/tv.js'></script>"
                + "<script>new TradingView.widget({"
                + "autosize:true,symbol:'BINANCE:" + symbol + "',interval:'60',timezone:'Etc/UTC',"
                + "theme:'" + theme + "',style:'1',locale:'en',enable_publishing:false,allow_symbol_change:true,"
                + "studies:['MASimple@tv-basicstudies','RSI@tv-basicstudies'],container_id:'tv'});</script>"
                + "</body></html>";
    }

    private String fallbackHtml() {
        String bg = String.format("#%06X", p.screenBg & 0xFFFFFF);
        String text = String.format("#%06X", p.textPrimary & 0xFFFFFF);
        String up = String.format("#%06X", p.up & 0xFFFFFF);
        String down = String.format("#%06X", p.down & 0xFFFFFF);
        return "<!DOCTYPE html><html><head><meta name='viewport' content='width=device-width, initial-scale=1'>"
                + "<style>html,body{margin:0;height:100%;background:" + bg + ";color:" + text + ";"
                + "font-family:sans-serif;}#c{height:90%;}#t{padding:8px;}</style></head><body>"
                + "<div id='t'>" + symbol + " - Binance 1h klines</div><div id='c'></div>"
                + "<script src='https://unpkg.com/lightweight-charts@4.1.3/dist/lightweight-charts.standalone.production.js'></script>"
                + "<script>"
                + "var chart=LightweightCharts.createChart(document.getElementById('c'),{layout:{background:{color:'" + bg + "'},textColor:'" + text + "'},grid:{vertLines:{visible:false},horzLines:{visible:false}},timeScale:{timeVisible:true}});"
                + "var s=chart.addCandlestickSeries({upColor:'" + up + "',downColor:'" + down + "',borderVisible:false,wickUpColor:'" + up + "',wickDownColor:'" + down + "'});"
                + "fetch('https://api.binance.com/api/v3/klines?symbol=" + symbol + "&interval=1h&limit=168')"
                + ".then(function(r){return r.json();}).then(function(d){"
                + "if(!Array.isArray(d)){document.getElementById('t').innerText='" + symbol + " - not on Binance for klines';return;}"
                + "var data=d.map(function(k){return {time:Math.floor(k[0]/1000),open:+k[1],high:+k[2],low:+k[3],close:+k[4]};});"
                + "s.setData(data);chart.timeScale().fitContent();"
                + "}).catch(function(e){document.getElementById('t').innerText='" + symbol + " - chart error: '+e;});"
                + "</script></body></html>";
    }
}
