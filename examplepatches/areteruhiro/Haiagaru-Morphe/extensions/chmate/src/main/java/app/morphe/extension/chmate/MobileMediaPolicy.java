package app.morphe.extension.chmate;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.SystemClock;
import android.content.SharedPreferences;

/** Additional preview traffic only; explicit URL actions remain available. */
final class MobileMediaPolicy {
    static final String IMAGE="urlImageFetchPolicy",LIST="threadListFetchPolicy",WEB="webCardFetchPolicy",X="xCardFetchPolicy";
    static final int WIFI_MEDIA_AND_THUMBNAIL=4,WIFI_MEDIA_ONLY=5;

    // On Android 7.0+ the default-network callback keeps this value current, so
    // media rows never synchronously cross Binder just to ask whether Wi-Fi is
    // active. Older Android versions use a short cache as a compatibility path.
    private static final Object NETWORK_LOCK = new Object();
    private static final long LEGACY_NETWORK_CACHE_MS = 1_000L;
    private static volatile boolean wifiKnown;
    private static volatile boolean wifiConnected;
    private static volatile long wifiCheckedAt;
    private static volatile boolean defaultNetworkCallbackRegistered;
    private static volatile boolean networkMonitorInitialized;
    private static ConnectivityManager connectivityManager;
    private static Network defaultNetwork;
    private static volatile Network activeWifiNetwork;

    static boolean wifi(){
        Context context=Haiagaru.applicationContextForExtension();if(context==null)return false;
        ensureNetworkMonitor(context);
        if(defaultNetworkCallbackRegistered)return wifiKnown&&wifiConnected;

        long now=SystemClock.elapsedRealtime();
        if(wifiKnown&&now-wifiCheckedAt<LEGACY_NETWORK_CACHE_MS)return wifiConnected;
        synchronized(NETWORK_LOCK){
            now=SystemClock.elapsedRealtime();
            if(!wifiKnown||now-wifiCheckedAt>=LEGACY_NETWORK_CACHE_MS)
                updateWifi(queryWifi(connectivityManagerFor(context)));
            return wifiKnown&&wifiConnected;
        }
    }

    private static void ensureNetworkMonitor(Context context){
        if(networkMonitorInitialized)return;
        synchronized(NETWORK_LOCK){
            if(networkMonitorInitialized)return;
            networkMonitorInitialized=true;
            ConnectivityManager manager=connectivityManagerFor(context);
            if(manager==null){updateWifi(false);return;}
            if(Build.VERSION.SDK_INT>=24){
                try{
                    manager.registerDefaultNetworkCallback(new ConnectivityManager.NetworkCallback(){
                        @Override public void onAvailable(Network network){
                            synchronized(NETWORK_LOCK){
                                defaultNetwork=network;
                                // Do not keep allowing a previous Wi-Fi route while
                                // Android is switching the default network.
                                updateWifi(false);
                            }
                        }
                        @Override public void onCapabilitiesChanged(Network network,NetworkCapabilities capabilities){
                            synchronized(NETWORK_LOCK){
                                if(defaultNetwork==null||defaultNetwork.equals(network)){
                                    defaultNetwork=network;
                                    updateWifi(isWifi(capabilities));
                                }
                            }
                        }
                        @Override public void onLost(Network network){
                            synchronized(NETWORK_LOCK){
                                if(network.equals(defaultNetwork)){
                                    defaultNetwork=null;
                                    updateWifi(false);
                                }
                            }
                        }
                        @Override public void onUnavailable(){
                            synchronized(NETWORK_LOCK){defaultNetwork=null;updateWifi(false);}
                        }
                    });
                    defaultNetworkCallbackRegistered=true;
                }catch(RuntimeException ignored){
                    // Fall back to a throttled query if callback registration is
                    // unavailable (for example, on a restricted process).
                }
            }
            // One initial snapshot preserves the old immediate behavior. After
            // this, API 24+ decisions use callback state only.
            updateWifi(queryWifi(manager));
        }
    }

    private static ConnectivityManager connectivityManagerFor(Context context){
        ConnectivityManager manager=connectivityManager;
        if(manager!=null)return manager;
        try{
            manager=(ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
            connectivityManager=manager;
        }catch(RuntimeException ignored){}
        return manager;
    }

    private static boolean queryWifi(ConnectivityManager manager){
        if(manager==null)return false;
        try{
            if(Build.VERSION.SDK_INT>=23){
                Network network=manager.getActiveNetwork();
                boolean connected=isWifi(network==null?null:manager.getNetworkCapabilities(network));
                defaultNetwork=network;
                activeWifiNetwork=connected?network:null;
                updateWifi(connected);
                return connected;
            }
            NetworkInfo info=manager.getActiveNetworkInfo();
            boolean connected=info!=null&&info.isConnected()&&info.getType()==ConnectivityManager.TYPE_WIFI;
            activeWifiNetwork=null;
            updateWifi(connected);
            return connected;
        }catch(RuntimeException ignored){return false;}
    }

    private static boolean isWifi(NetworkCapabilities capabilities){
        return capabilities!=null
                &&capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)
                &&!capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR);
    }

    private static void updateWifi(boolean connected){
        wifiConnected=connected;
        activeWifiNetwork=connected?defaultNetwork:null;
        wifiCheckedAt=SystemClock.elapsedRealtime();
        wifiKnown=true;
    }

    static Network activeWifiNetwork(){return wifi()&&Build.VERSION.SDK_INT>=23?activeWifiNetwork:null;}
    static int configured(String key){
        Context c=Haiagaru.applicationContextForExtension();if(c==null)return 2;
        SharedPreferences p=c.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        int value=p.getInt(key,2);
        if(IMAGE.equals(key)&&!p.contains(key)&&p.contains("urlImageFetchEnabled")&&!p.getBoolean("urlImageFetchEnabled",true))return 1;
        return value>=0&&value<=2?value:2;
    }
    static boolean allowed(String key){int mode=configured(key);return mode==0||mode==2&&wifi();}
    static int videoConfigured(){Context c=Haiagaru.applicationContextForExtension();if(c==null)return 4;SharedPreferences p=c.getSharedPreferences(WacchoiSearchOptions.PREFS,0);return p.getInt("urlVideoFetchMode",p.getInt("mediaAutoFetchMode",2)==3?3:4);}
    static int gifConfigured(){Context c=Haiagaru.applicationContextForExtension();return c==null?4:c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getInt(GifAutoFetchPolicy.KEY,4);}
    static int videoMode(int configured,boolean wifi){
        if(configured==WIFI_MEDIA_AND_THUMBNAIL)return wifi?1:3;
        if(configured==WIFI_MEDIA_ONLY)return wifi?2:3;
        return configured>=0&&configured<=3?configured:3;
    }
    static int gifMode(int configured,boolean wifi,boolean images){
        if(configured==WIFI_MEDIA_AND_THUMBNAIL)return wifi?0:3;
        if(configured==WIFI_MEDIA_ONLY)return wifi?2:3;
        return GifAutoFetchPolicy.mode(configured,images);
    }
    static long fileLimit(long existing) {
        Context c=Haiagaru.applicationContextForExtension();
        int mb=c==null?0:c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getInt("previewFileLimitMb",0);
        return mb<=0?existing:Math.min(existing,Math.min(1024,mb)*1024L*1024L);
    }
    private MobileMediaPolicy(){}
}
