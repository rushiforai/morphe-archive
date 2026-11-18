package ctw.menu;

import android.app.Activity;
import android.app.Application;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.webkit.JsPromptResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.FrameLayout;

import ctw.packs.Packs;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * GTA: Chinatown Wars mod menu ("Add mod menu" patch): a MOD button at the top of the screen opens an HTML panel
 * (WebView) on the left, over the running game. A dialog would pause the game; this panel does not. The page talks to
 * this class through prompt(): onJsPrompt runs the action and answers with the new state. Game actions go to the
 * natives registered by libctwmenu.so (AML mod), which run them on the game thread.
 */
public final class Menu {
    private static final String TAG = "CTWMenu";
    private static final String GAME_ACTIVITY = "com.rockstargames.gtactw.GameActivity";

    static native void nativeToggle(String key, boolean on);
    static native void nativeAction(String id, int arg);
    static native int[] nativeVehicleClasses();

    // Vehicle names from the game's text (E_MAIN.gxt), in eVehicleId order.
    private static final String[] CARS = {
        "Admiral", "Blista", "Dukes", "Polmav", "Noose Enforcer", "Buccaneer", "Fire Truck", "Rhino", "Ambulance",
        "Burrito", "Flatbed", "Speeder", "Angel", "Cabbie", "Hellenbach", "Tanker", "Banshee", "Comet",
        "Police Patrol", "Yankee", "Turismo", "Cognoscenti", "Chavos", "Cavalcade", "Cavalcade FXT", "Bobcat",
        "Recovery", "Formula R", "Resolution X", "MK GT9", "500 XLR8", "Style SR", "Cityscape", "Bulldozer",
        "FIB Rancher", "Reefer", "Coast Guard Dinghy", "Coast Guard Launch", "Destroyer", "Dinghy", "Bus",
        "Resolution X", "Gumshoe", "Wet Ski", "Cruiser", "Defender", "Burrito", "Burrito", "Burrito", "Burrito",
        "Burrito", "Go Kart", "Yankee", "Yankee", "Yankee", "Yankee", "Yankee", "Infernus", "Patriot", "Sabre GT",
        "Stallion", "Sultan", "Peyote", "Ingot", "Perennial", "Hearse", "Limo", "Admiral", "Banshee", "Burrito",
        "Burrito", "Angel", "Bobcat", "Burrito", "Burrito", "Burrito", "Burrito", "Burrito", "Burrito", "Burrito",
        "Burrito", "Chavos", "Cognoscenti", "Comet", "Turismo", "Dukes", "Cavalcade FXT", "Hellenbach", "Manana",
        "NRG 900", "Alphamail", "Angel", "Baggage Handler", "Chopper", "Voodoo", "Sparrow", "Zhouboat", "Angel",
        "Sanchez", "Jetmax", "Dragon Wagon", "Cognoscenti", "Recovery"
    };
    // eWeaponType order (E_MAIN.gxt weapon names); 0 (fists) is not offered.
    private static final String[] WEAPONS = {"Fists", "Nightstick", "Baseball bat", "Sword", "Chainsaw", "Pistol",
        "Revolver", "Twin pistols", "Micro SMG", "SMG", "Shotgun", "Stubby shotgun", "Double barreled shotgun",
        "Assault Rifle", "Carbine Rifle", "Minigun", "Flame thrower", "RPG", "Sniper rifle", "Taser", "Grenades",
        "Molotovs", "Flashbangs", "Proximity mines"};
    private static final String[] WEATHER = {"Sunny", "Extra sunny", "Cloudy", "Rain", "Heavy rain", "Hurricane", "Fog"};
    private static final String[] DENSITY = {"Car", "Ped", "Cop"}, DENSITY_LABEL = {"Traffic", "Pedestrians", "Cops"};
    private static final String[] STEP = {"Off", "Normal", "High"};

    private static final Map<String, Boolean> toggles = new LinkedHashMap<>();
    private static final int[] densityStep = {1, 1, 1};
    private static Activity attached;
    private static WebView web;

    /** Called from GameNative's static init (after the mod loader): attaches to the game screen when it resumes. */
    public static void install() {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                public void onActivityResumed(Activity a) { attach(a); }
                public void onActivityCreated(Activity a, Bundle b) {}
                public void onActivityStarted(Activity a) {}
                public void onActivityPaused(Activity a) {}
                public void onActivityStopped(Activity a) {}
                public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                public void onActivityDestroyed(Activity a) { if (a == attached) { attached = null; web = null; } }
            });
        } catch (Throwable t) {
            Log.w(TAG, "menu not installed", t);
        }
    }

    private static void attach(Activity a) {
        if (a == attached || !GAME_ACTIVITY.equals(a.getClass().getName())) return;
        attached = a;
        if (toggles.isEmpty()) for (String k : new String[]{"god", "ammo", "noWanted", "oneHit", "carGod", "freeze", "warp"})
            toggles.put(k, k.equals("warp"));
        web = new WebView(a);
        web.getSettings().setJavaScriptEnabled(true);
        web.setBackgroundColor(Color.TRANSPARENT);
        web.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onJsPrompt(WebView v, String url, String msg, String def, JsPromptResult r) {
                String out;
                try {
                    out = msg.equals("model") ? model() : handle(msg);
                } catch (Throwable t) {
                    Log.w(TAG, "action " + msg + " failed", t);
                    out = state();
                }
                r.confirm(out);
                return true;
            }
        });
        web.setVisibility(View.GONE);
        float dp = a.getResources().getDisplayMetrics().density;
        a.addContentView(web, new FrameLayout.LayoutParams((int) (380 * dp), -1, Gravity.START | Gravity.CENTER_VERTICAL));
        Button b = new Button(a);
        b.setText("MOD");
        b.setAlpha(0.6f);
        b.setOnClickListener(v -> {
            boolean show = web.getVisibility() != View.VISIBLE;
            // (Re)load on open: the vehicle list needs the game's data, which is loaded by then.
            if (show) web.loadDataWithBaseURL(null, PAGE, "text/html", "utf-8", null);
            web.setVisibility(show ? View.VISIBLE : View.GONE);
        });
        a.addContentView(b, new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.CENTER_HORIZONTAL));
    }

    private static String handle(String msg) {
        if (msg.isEmpty()) return state();
        int c = msg.indexOf(':');
        String id = c < 0 ? msg : msg.substring(0, c);
        int arg = c < 0 ? 0 : Integer.parseInt(msg.substring(c + 1));
        if (toggles.containsKey(id)) {
            boolean on = !toggles.get(id);
            toggles.put(id, on);
            nativeToggle(id, on);
        } else if (id.startsWith("radio")) {
            web.setVisibility(View.GONE);
            if (id.equals("radioRemove")) Packs.removeRadio(attached);
            else Packs.importRadio(attached, id.equals("radioZip"));
        } else if (id.startsWith("set")) nativeAction("set", Integer.parseInt(id.substring(3)));
        else if (id.equals("m100k")) nativeAction("money", 100000);
        else if (id.equals("m1m")) nativeAction("money", 1000000);
        else if (id.startsWith("d") && id.length() == 4) {
            int k = Arrays.asList(DENSITY).indexOf(id.substring(1));
            densityStep[k] = (densityStep[k] + 1) % 3;
            nativeAction("density", k * 3 + densityStep[k]);
        } else if (id.startsWith("h") && id.length() <= 3 && Character.isDigit(id.charAt(1))) nativeAction("hour", Integer.parseInt(id.substring(1)));
        else if (id.startsWith("w") && id.length() == 2) nativeAction("weather", id.charAt(1) - '0');
        else nativeAction(id, arg);  // health, armour, wup, wdown, wclear, m10k, drugs, nitro, car, gun, eagle, fast, attr, tp*
        return state();
    }

    private static String state() {
        JSONObject s = new JSONObject();
        try {
            for (Map.Entry<String, Boolean> e : toggles.entrySet()) s.put(e.getKey(), e.getValue());
            for (int k = 0; k < 3; k++) s.put("d" + DENSITY[k], DENSITY_LABEL[k] + ": " + STEP[densityStep[k]]);
        } catch (Exception ignored) {
        }
        return s.toString();
    }

    // Menu model: tab -> rows {kind: t toggle | b button | c cycle | g grid, id, label, items}.
    private static String model() throws Exception {
        JSONObject m = new JSONObject();
        JSONArray player = new JSONArray(), vehicle = new JSONArray(), weapons = new JSONArray(), world = new JSONArray(),
                teleport = new JSONArray();
        row(player, "t", "god", "God mode");
        row(player, "t", "ammo", "Infinite ammo");
        row(player, "t", "noWanted", "Never wanted");
        row(player, "t", "oneHit", "One-hit kills");
        row(player, "b", "health", "Health + repair");
        row(player, "b", "armour", "Armour");
        row(player, "b", "wup", "Wanted +1");
        row(player, "b", "wdown", "Wanted −1");
        row(player, "b", "wclear", "Clear wanted");
        row(player, "b", "m10k", "+$10K");
        row(player, "b", "m100k", "+$100K");
        row(player, "b", "m1m", "+$1M");
        row(player, "b", "drugs", "Fill drug stash");
        row(vehicle, "t", "carGod", "Indestructible vehicle");
        row(vehicle, "t", "warp", "Put me in spawned car");
        row(vehicle, "b", "nitro", "Nitro boost");
        vehicle.put(grid("car", cars()));
        for (int s = 0; s < 4; s++) row(weapons, "b", "set" + s, "Weapon set " + (s + 1));
        row(weapons, "b", "eagle", "Explosive pistol (toggle)");
        List<Object[]> guns = new ArrayList<>();
        for (int i = 1; i < WEAPONS.length; i++) guns.add(new Object[]{WEAPONS[i], i, ""});
        weapons.put(grid("gun", guns));
        row(world, "t", "freeze", "Freeze time + mission timers");
        for (String k : DENSITY) row(world, "c", "d" + k, "");
        row(world, "b", "fast", "Fast clock (toggle)");
        row(world, "b", "attr", "Attractor (toggle)");
        for (int h = 0; h < 24; h += 3) row(world, "b", "h" + h, String.format("%02d:00", h));
        for (int i = 0; i < WEATHER.length; i++) row(world, "b", "w" + i, WEATHER[i]);
        row(teleport, "b", "tpw", "To map waypoint");
        row(teleport, "b", "tps", "Save this spot");
        row(teleport, "b", "tpl", "Go to saved spot");
        m.put("Player", player).put("Vehicle", vehicle).put("Weapons", weapons).put("World", world).put("Teleport", teleport);
        if (Packs.loaderPresent(attached)) {  // "Load texture and radio packs" patch
            JSONArray packs = new JSONArray();
            row(packs, "b", "radioZip", "Import radio (.zip)");
            row(packs, "b", "radioFolder", "Import radio folder");
            if (Packs.hasRadio(attached)) row(packs, "b", "radioRemove", "Remove radio pack");
            m.put("Packs", packs);
        }
        return m.toString();
    }

    // Spawnable vehicles grouped by class (from the game's vehicle info), A-Z inside each; repeated names numbered.
    private static List<Object[]> cars() {
        int[] cls = new int[0];
        try {
            cls = nativeVehicleClasses();
        } catch (Throwable ignored) {
        }
        String[] names = {"Cars", "Bikes", "Boats", "Other", "Helicopters", "Tanks"};
        Map<String, Integer> seen = new LinkedHashMap<>();
        List<Object[]> out = new ArrayList<>();
        for (int i = 0; i < Math.min(CARS.length, cls.length == 0 ? CARS.length : cls.length); i++) {
            int n = seen.merge(CARS[i], 1, Integer::sum);
            String group = cls.length == 0 ? "" : cls[i] >= 0 && cls[i] < names.length ? names[cls[i]] : "Other";
            out.add(new Object[]{n > 1 ? CARS[i] + " " + n : CARS[i], i, group});
        }
        out.sort((x, y) -> {
            int g = ((String) x[2]).compareTo((String) y[2]);
            return g != 0 ? g : ((String) x[0]).compareTo((String) y[0]);
        });
        return out;
    }

    private static void row(JSONArray tab, String kind, String id, String label) {
        try {
            tab.put(new JSONObject().put("kind", kind).put("id", id).put("label", label));
        } catch (Exception ignored) {
        }
    }

    private static JSONObject grid(String id, List<Object[]> items) throws Exception {
        JSONArray a = new JSONArray();
        for (Object[] it : items) a.put(new JSONArray().put(it[0]).put(it[1]).put(it[2]));
        return new JSONObject().put("kind", "g").put("id", id).put("items", a);
    }

    private static final String PAGE = ""
        + "<!doctype html><meta name=viewport content=\"width=device-width,initial-scale=1,user-scalable=no\"><style>\n"
        + "*{box-sizing:border-box;-webkit-tap-highlight-color:transparent;user-select:none}\n"
        + "body{margin:0;font:15px system-ui,sans-serif;color:#eee;background:transparent}\n"
        + "#p{position:fixed;inset:0;display:flex;flex-direction:column;background:rgba(14,16,22,.88);border-right:2px solid #e4002b}\n"
        + "h1{margin:0;padding:10px 14px;font-size:17px;letter-spacing:2px;background:linear-gradient(90deg,#e4002b,#7a0017)}\n"
        + "nav{display:flex;gap:4px;padding:6px;overflow-x:auto}nav b{flex:1;text-align:center;padding:8px 4px;font-size:13px;border-radius:8px;background:#232733;font-weight:600;white-space:nowrap}\n"
        + "nav b.on{background:#e4002b}main{flex:1;overflow-y:auto;padding:6px 8px 20px}\n"
        + ".t{display:flex;justify-content:space-between;align-items:center;padding:11px 12px;margin:4px 0;border-radius:10px;background:#1c2029}\n"
        + ".s{width:44px;height:24px;border-radius:12px;background:#444;position:relative;transition:.2s}.s:after{content:'';position:absolute;top:3px;left:3px;width:18px;height:18px;border-radius:50%;background:#fff;transition:.2s}\n"
        + ".on .s{background:#21c45d}.on .s:after{left:23px}\n"
        + ".g{display:grid;grid-template-columns:1fr 1fr;gap:6px;margin:6px 0}.b{padding:11px 6px;border-radius:10px;background:#2a2f3c;text-align:center}\n"
        + ".b:active,.t:active{background:#e4002b}input{width:100%;padding:10px;margin:8px 0 2px;border-radius:10px;border:0;background:#262b37;color:#eee;font-size:15px}\n"
        + "small{color:#8a93a6}h3{grid-column:1/-1;margin:10px 2px 0;font-size:13px;color:#e4002b;letter-spacing:1px;text-transform:uppercase}</style><div id=p><h1>CTW MOD MENU</h1><nav id=n></nav><main id=m></main></div><script>\n"
        + "const M=JSON.parse(prompt('model'));let S=JSON.parse(prompt('')),tab=Object.keys(M)[0],q='';\n"
        + "const go=(id,a)=>{S=JSON.parse(prompt(a===undefined?id:id+':'+a));draw()};\n"
        + "function draw(){n.innerHTML=Object.keys(M).map(t=>'<b class=\"'+(t==tab?'on':'')+'\" onclick=\"tab=\\''+t+'\\';q=\\'\\';draw()\">'+t+'</b>').join('');\n"
        + "let h='',btns=[];const flush=()=>{if(btns.length)h+='<div class=g>'+btns.join('')+'</div>';btns=[]};\n"
        + "for(const r of M[tab]){if(r.kind=='b'){btns.push('<div class=b onclick=\"go(\\''+r.id+'\\')\">'+r.label+'</div>');continue}flush();\n"
        + "if(r.kind=='t')h+='<div class=\"t '+(S[r.id]?'on':'')+'\" onclick=\"go(\\''+r.id+'\\')\"><span>'+r.label+'</span><i class=s></i></div>';\n"
        + "if(r.kind=='c')h+='<div class=t onclick=\"go(\\''+r.id+'\\')\"><span>'+S[r.id]+'</span><small>tap to change</small></div>';\n"
        + "if(r.kind=='g'){h+='<input placeholder=\"Search '+(r.id=='car'?'vehicles':'weapons')+'\u2026\" value=\"'+q+'\" oninput=\"q=this.value;draw();this.focus()\"><div class=g>'+\n"
        + "(()=>{let g=null,o='';for(const[x,i,c]of r.items){if(!x.toLowerCase().includes(q.toLowerCase()))continue;if(c!=g){g=c;if(c)o+='<h3>'+c+'</h3>'}o+='<div class=b onclick=\"go(\\''+r.id+'\\','+i+')\">'+x+'</div>'}return o})()+'</div>'}}\n"
        + "flush();m.innerHTML=h;const f=m.querySelector('input');if(f&&q)f.setSelectionRange(q.length,q.length)}\n"
        + "draw();</script>\n";
}
