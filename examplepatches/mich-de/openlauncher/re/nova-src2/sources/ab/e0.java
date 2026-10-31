package ab;

import ab.e0;
import android.content.ComponentName;
import android.content.Context;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.location.Location;
import android.os.Build;
import android.os.Process;
import android.os.StrictMode;
import android.os.UserHandle;
import android.util.ArrayMap;
import android.util.SparseArray;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b.u4;
import b.x1;
import b0.u1;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.NovaLauncher;
import e0.n1;
import e0.o1;
import e10.j4;
import e10.s2;
import e10.y2;
import g0.d1;
import h50.g1;
import h50.h1;
import io.ktor.client.network.sockets.ConnectTimeoutException;
import java.io.IOException;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import k0.p1;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.UInt;
import kotlin.Unit;
import kotlin.collections.builders.MapBuilder;
import kotlin.collections.builders.SetBuilder;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kw.p2;
import l1.e3;
import m3.o0;
import mx.k0;
import o9.u2;
import org.xmlpull.v1.XmlPullParserException;
import p1.e1;
import p1.t1;
import t70.l1;
import t70.m0;
import t70.y0;
import z.p0;
import z.z0;

/* loaded from: classes.dex */
public abstract class e0 {

    /* renamed from: a, reason: collision with root package name */
    public static SparseArray f708a;

    /* renamed from: b, reason: collision with root package name */
    public static ArrayMap f709b;

    public static final int A(float f11, ArrayList arrayList) {
        if (f11 <= 0.0f) {
            return 0;
        }
        if (f11 >= ((m3.r) b70.g.h1(arrayList)).f75968g) {
            return ul.b.K(arrayList);
        }
        int size = arrayList.size() - 1;
        int i5 = 0;
        while (i5 <= size) {
            int i11 = (i5 + size) >>> 1;
            m3.r rVar = (m3.r) arrayList.get(i11);
            char c11 = rVar.f75967f > f11 ? (char) 1 : rVar.f75968g <= f11 ? (char) 65535 : (char) 0;
            if (c11 < 0) {
                i5 = i11 + 1;
            } else {
                if (c11 <= 0) {
                    return i11;
                }
                size = i11 - 1;
            }
        }
        return -(i5 + 1);
    }

    public static final void B(ArrayList arrayList, long j11, Function1 function1) {
        int size = arrayList.size();
        for (int iY = y(o0.f(j11), arrayList); iY < size; iY++) {
            m3.r rVar = (m3.r) arrayList.get(iY);
            if (rVar.f75963b >= o0.e(j11)) {
                return;
            }
            if (rVar.f75963b != rVar.f75964c) {
                function1.invoke(rVar);
            }
        }
    }

    public static final String C(ComponentKey componentKey, Context context) {
        return componentKey.f21251a.flattenToString() + "#" + ((ja.h) ja.h.f69294h.h(context)).d(componentKey.f21252b);
    }

    public static Location D(String str) {
        if (str.equals("Africa/Abidjan")) {
            return J(5.19d, -4.2d);
        }
        if (str.equals("Africa/Accra")) {
            return J(5.33d, 0.13d);
        }
        if (str.equals("Africa/Addis_Ababa")) {
            return J(9.2d, 38.42d);
        }
        if (str.equals("Africa/Algiers")) {
            return J(36.47d, 3.3d);
        }
        if (str.equals("Africa/Asmara")) {
            return J(15.2d, 38.53d);
        }
        if (str.equals("Africa/Asmera")) {
            return J(15.333333d, 38.933333d);
        }
        if (str.equals("Africa/Bamako")) {
            return J(12.39d, -8.0d);
        }
        if (str.equals("Africa/Bangui")) {
            return J(4.22d, 18.35d);
        }
        if (str.equals("Africa/Banjul")) {
            return J(13.28d, -16.39d);
        }
        if (str.equals("Africa/Bissau")) {
            return J(11.51d, -15.35d);
        }
        if (str.equals("Africa/Blantyre")) {
            return J(-15.47d, 35.0d);
        }
        if (str.equals("Africa/Brazzaville")) {
            return J(-4.16d, 15.17d);
        }
        if (str.equals("Africa/Bujumbura")) {
            return J(-3.23d, 29.22d);
        }
        if (str.equals("Africa/Cairo")) {
            return J(30.3d, 31.15d);
        }
        if (str.equals("Africa/Casablanca")) {
            return J(33.39d, -7.35d);
        }
        if (str.equals("Africa/Ceuta")) {
            return J(35.53d, -5.19d);
        }
        if (str.equals("Africa/Conakry")) {
            return J(9.31d, -13.43d);
        }
        if (str.equals("Africa/Dakar")) {
            return J(14.4d, -17.26d);
        }
        if (str.equals("Africa/Dar_es_Salaam")) {
            return J(-6.48d, 39.17d);
        }
        if (str.equals("Africa/Djibouti")) {
            return J(11.36d, 43.9d);
        }
        if (str.equals("Africa/Douala")) {
            return J(4.3d, 9.42d);
        }
        if (str.equals("Africa/El_Aaiun")) {
            return J(27.9d, -13.12d);
        }
        if (str.equals("Africa/Freetown")) {
            return J(8.3d, -13.15d);
        }
        if (str.equals("Africa/Gaborone")) {
            return J(-24.39d, 25.55d);
        }
        if (str.equals("Africa/Harare")) {
            return J(-17.5d, 31.3d);
        }
        if (str.equals("Africa/Johannesburg")) {
            return J(-26.15d, 28.0d);
        }
        if (str.equals("Africa/Juba")) {
            return J(4.51d, 31.36d);
        }
        if (str.equals("Africa/Kampala")) {
            return J(0.19d, 32.25d);
        }
        if (str.equals("Africa/Khartoum")) {
            return J(15.36d, 32.32d);
        }
        if (str.equals("Africa/Kigali")) {
            return J(-1.57d, 30.4d);
        }
        if (str.equals("Africa/Kinshasa")) {
            return J(-4.18d, 15.18d);
        }
        if (str.equals("Africa/Lagos")) {
            return J(6.27d, 3.24d);
        }
        if (str.equals("Africa/Libreville")) {
            return J(0.23d, 9.27d);
        }
        if (str.equals("Africa/Lome")) {
            return J(6.8d, 1.13d);
        }
        if (str.equals("Africa/Luanda")) {
            return J(-8.48d, 13.14d);
        }
        if (str.equals("Africa/Lubumbashi")) {
            return J(-11.4d, 27.28d);
        }
        if (str.equals("Africa/Lusaka")) {
            return J(-15.25d, 28.17d);
        }
        if (str.equals("Africa/Malabo")) {
            return J(3.45d, 8.47d);
        }
        if (str.equals("Africa/Maputo")) {
            return J(-25.58d, 32.35d);
        }
        if (str.equals("Africa/Maseru")) {
            return J(-29.28d, 27.3d);
        }
        if (str.equals("Africa/Mbabane")) {
            return J(-26.18d, 31.6d);
        }
        if (str.equals("Africa/Mogadishu")) {
            return J(2.4d, 45.22d);
        }
        if (str.equals("Africa/Monrovia")) {
            return J(6.18d, -10.47d);
        }
        if (str.equals("Africa/Nairobi")) {
            return J(-1.17d, 36.49d);
        }
        if (str.equals("Africa/Ndjamena")) {
            return J(12.7d, 15.3d);
        }
        if (str.equals("Africa/Niamey")) {
            return J(13.31d, 2.7d);
        }
        if (str.equals("Africa/Nouakchott")) {
            return J(18.6d, -15.57d);
        }
        if (str.equals("Africa/Ouagadougou")) {
            return J(12.22d, -1.31d);
        }
        if (str.equals("Africa/Porto-Novo")) {
            return J(6.29d, 2.37d);
        }
        if (str.equals("Africa/Sao_Tome")) {
            return J(0.2d, 6.44d);
        }
        if (str.equals("Africa/Timbuktu")) {
            return J(16.775833d, -3.009444d);
        }
        if (str.equals("Africa/Tripoli")) {
            return J(32.54d, 13.11d);
        }
        if (str.equals("Africa/Tunis")) {
            return J(36.48d, 10.11d);
        }
        if (str.equals("Africa/Windhoek")) {
            return J(-22.34d, 17.6d);
        }
        if (str.equals("America/Adak")) {
            return J(51.5248d, -176.3929d);
        }
        if (str.equals("America/Anchorage")) {
            return J(61.1305d, -149.5401d);
        }
        if (str.equals("America/Anguilla")) {
            return J(18.12d, -63.4d);
        }
        if (str.equals("America/Antigua")) {
            return J(17.3d, -61.48d);
        }
        if (str.equals("America/Araguaina")) {
            return J(-7.12d, -48.12d);
        }
        if (str.equals("America/Argentina/Buenos_Aires")) {
            return J(-34.36d, -58.27d);
        }
        if (str.equals("America/Argentina/Catamarca")) {
            return J(-28.28d, -65.47d);
        }
        if (str.equals("America/Argentina/ComodRivadavia")) {
            return J(-45.864722d, -67.480833d);
        }
        if (str.equals("America/Argentina/Cordoba")) {
            return J(-31.24d, -64.11d);
        }
        if (str.equals("America/Argentina/Jujuy")) {
            return J(-24.11d, -65.18d);
        }
        if (str.equals("America/Argentina/La_Rioja")) {
            return J(-29.26d, -66.51d);
        }
        if (str.equals("America/Argentina/Mendoza")) {
            return J(-32.53d, -68.49d);
        }
        if (str.equals("America/Argentina/Rio_Gallegos")) {
            return J(-51.38d, -69.13d);
        }
        if (str.equals("America/Argentina/Salta")) {
            return J(-24.47d, -65.25d);
        }
        if (str.equals("America/Argentina/San_Juan")) {
            return J(-31.32d, -68.31d);
        }
        if (str.equals("America/Argentina/San_Luis")) {
            return J(-33.19d, -66.21d);
        }
        if (str.equals("America/Argentina/Tucuman")) {
            return J(-26.49d, -65.13d);
        }
        if (str.equals("America/Argentina/Ushuaia")) {
            return J(-54.48d, -68.18d);
        }
        if (str.equals("America/Aruba")) {
            return J(12.3d, -69.58d);
        }
        if (str.equals("America/Asuncion")) {
            return J(-25.16d, -57.4d);
        }
        if (str.equals("America/Atikokan")) {
            return J(48.4531d, -91.3718d);
        }
        if (str.equals("America/Atka")) {
            return J(52.199167d, -174.213333d);
        }
        if (str.equals("America/Bahia")) {
            return J(-12.59d, -38.31d);
        }
        if (str.equals("America/Bahia_Banderas")) {
            return J(20.48d, -105.15d);
        }
        if (str.equals("America/Barbados")) {
            return J(13.6d, -59.37d);
        }
        if (str.equals("America/Belem")) {
            return J(-1.27d, -48.29d);
        }
        if (str.equals("America/Belize")) {
            return J(17.3d, -88.12d);
        }
        if (str.equals("America/Blanc-Sablon")) {
            return J(51.25d, -57.7d);
        }
        if (str.equals("America/Boa_Vista")) {
            return J(2.49d, -60.4d);
        }
        if (str.equals("America/Bogota")) {
            return J(4.36d, -74.5d);
        }
        if (str.equals("America/Boise")) {
            return J(43.3649d, -116.1209d);
        }
        if (str.equals("America/Buenos_Aires")) {
            return J(-34.36d, -58.27d);
        }
        if (str.equals("America/Cambridge_Bay")) {
            return J(69.65d, -105.31d);
        }
        if (str.equals("America/Campo_Grande")) {
            return J(-20.27d, -54.37d);
        }
        if (str.equals("America/Cancun")) {
            return J(21.5d, -86.46d);
        }
        if (str.equals("America/Caracas")) {
            return J(10.3d, -66.56d);
        }
        if (str.equals("America/Catamarca")) {
            return J(-28.28d, -65.47d);
        }
        if (str.equals("America/Cayenne")) {
            return J(4.56d, -52.2d);
        }
        if (str.equals("America/Cayman")) {
            return J(19.18d, -81.23d);
        }
        if (str.equals("America/Chicago")) {
            return J(41.51d, -87.39d);
        }
        if (str.equals("America/Chihuahua")) {
            return J(28.38d, -106.5d);
        }
        if (str.equals("America/Coral_Harbour")) {
            return J(64.137d, -83.164d);
        }
        if (str.equals("America/Cordoba")) {
            return J(-31.24d, -64.11d);
        }
        if (str.equals("America/Costa_Rica")) {
            return J(9.56d, -84.5d);
        }
        if (str.equals("America/Creston")) {
            return J(49.6d, -116.31d);
        }
        if (str.equals("America/Cuiaba")) {
            return J(-15.35d, -56.5d);
        }
        if (str.equals("America/Curacao")) {
            return J(12.11d, -69.0d);
        }
        if (str.equals("America/Danmarkshavn")) {
            return J(76.46d, -18.4d);
        }
        if (str.equals("America/Dawson")) {
            return J(64.4d, -139.25d);
        }
        if (str.equals("America/Dawson_Creek")) {
            return J(59.46d, -120.14d);
        }
        if (str.equals("America/Denver")) {
            return J(39.4421d, -104.5903d);
        }
        if (str.equals("America/Detroit")) {
            return J(42.1953d, -83.245d);
        }
        if (str.equals("America/Dominica")) {
            return J(15.18d, -61.24d);
        }
        if (str.equals("America/Edmonton")) {
            return J(53.33d, -113.28d);
        }
        if (str.equals("America/Eirunepe")) {
            return J(-6.4d, -69.52d);
        }
        if (str.equals("America/El_Salvador")) {
            return J(13.42d, -89.12d);
        }
        if (str.equals("America/Ensenada")) {
            return J(31.857778d, -116.605833d);
        }
        if (str.equals("America/Fort_Nelson")) {
            return J(58.48d, -122.42d);
        }
        if (str.equals("America/Fort_Wayne")) {
            return J(41.080556d, -85.139167d);
        }
        if (str.equals("America/Fortaleza")) {
            return J(-3.43d, -38.3d);
        }
        if (str.equals("America/Glace_Bay")) {
            return J(46.12d, -59.57d);
        }
        if (str.equals("America/Godthab")) {
            return J(64.11d, -51.44d);
        }
        if (str.equals("America/Goose_Bay")) {
            return J(53.2d, -60.25d);
        }
        if (str.equals("America/Grand_Turk")) {
            return J(21.28d, -71.8d);
        }
        if (str.equals("America/Grenada")) {
            return J(12.3d, -61.45d);
        }
        if (str.equals("America/Guadeloupe")) {
            return J(16.14d, -61.32d);
        }
        if (str.equals("America/Guatemala")) {
            return J(14.38d, -90.31d);
        }
        if (str.equals("America/Guayaquil")) {
            return J(-2.1d, -79.5d);
        }
        if (str.equals("America/Guyana")) {
            return J(6.48d, -58.1d);
        }
        if (str.equals("America/Halifax")) {
            return J(44.39d, -63.36d);
        }
        if (str.equals("America/Havana")) {
            return J(23.8d, -82.22d);
        }
        if (str.equals("America/Hermosillo")) {
            return J(29.4d, -110.58d);
        }
        if (str.equals("America/Indiana/Indianapolis")) {
            return J(39.4606d, -86.929d);
        }
        if (str.equals("America/Indiana/Knox")) {
            return J(41.1745d, -86.373d);
        }
        if (str.equals("America/Indiana/Marengo")) {
            return J(38.2232d, -86.2041d);
        }
        if (str.equals("America/Indiana/Petersburg")) {
            return J(38.2931d, -87.1643d);
        }
        if (str.equals("America/Indiana/Tell_City")) {
            return J(37.5711d, -86.4541d);
        }
        if (str.equals("America/Indiana/Vevay")) {
            return J(38.4452d, -85.402d);
        }
        if (str.equals("America/Indiana/Vincennes")) {
            return J(38.4038d, -87.3143d);
        }
        if (str.equals("America/Indiana/Winamac")) {
            return J(41.305d, -86.3611d);
        }
        if (str.equals("America/Indianapolis")) {
            return J(39.4606d, -86.929d);
        }
        if (str.equals("America/Inuvik")) {
            return J(68.2059d, -133.43d);
        }
        if (str.equals("America/Iqaluit")) {
            return J(63.44d, -68.28d);
        }
        if (str.equals("America/Jamaica")) {
            return J(17.5805d, -76.4736d);
        }
        if (str.equals("America/Jujuy")) {
            return J(-24.11d, -65.18d);
        }
        if (str.equals("America/Juneau")) {
            return J(58.1807d, -134.2511d);
        }
        if (str.equals("America/Kentucky/Louisville")) {
            return J(38.1515d, -85.4534d);
        }
        if (str.equals("America/Kentucky/Monticello")) {
            return J(36.4947d, -84.5057d);
        }
        if (str.equals("America/Knox_IN")) {
            return J(41.1745d, -86.373d);
        }
        if (str.equals("America/Kralendijk")) {
            return J(12.903d, -68.1636d);
        }
        if (str.equals("America/La_Paz")) {
            return J(-16.3d, -68.9d);
        }
        if (str.equals("America/Lima")) {
            return J(-12.3d, -77.3d);
        }
        if (str.equals("America/Los_Angeles")) {
            return J(34.308d, -118.1434d);
        }
        if (str.equals("America/Louisville")) {
            return J(38.1515d, -85.4534d);
        }
        if (str.equals("America/Lower_Princes")) {
            return J(18.305d, -63.25d);
        }
        if (str.equals("America/Maceio")) {
            return J(-9.4d, -35.43d);
        }
        if (str.equals("America/Managua")) {
            return J(12.9d, -86.17d);
        }
        if (str.equals("America/Manaus")) {
            return J(-3.8d, -60.1d);
        }
        if (str.equals("America/Marigot")) {
            return J(18.4d, -63.5d);
        }
        if (str.equals("America/Martinique")) {
            return J(14.36d, -61.5d);
        }
        if (str.equals("America/Matamoros")) {
            return J(25.5d, -97.3d);
        }
        if (str.equals("America/Mazatlan")) {
            return J(23.13d, -106.25d);
        }
        if (str.equals("America/Mendoza")) {
            return J(-32.53d, -68.49d);
        }
        if (str.equals("America/Menominee")) {
            return J(45.628d, -87.3651d);
        }
        if (str.equals("America/Merida")) {
            return J(20.58d, -89.37d);
        }
        if (str.equals("America/Metlakatla")) {
            return J(55.737d, -131.3435d);
        }
        if (str.equals("America/Mexico_City")) {
            return J(19.24d, -99.9d);
        }
        if (str.equals("America/Miquelon")) {
            return J(47.3d, -56.2d);
        }
        if (str.equals("America/Moncton")) {
            return J(46.6d, -64.47d);
        }
        if (str.equals("America/Monterrey")) {
            return J(25.4d, -100.19d);
        }
        if (str.equals("America/Montevideo")) {
            return J(-34.53d, -56.11d);
        }
        if (str.equals("America/Montreal")) {
            return J(45.5d, -73.566667d);
        }
        if (str.equals("America/Montserrat")) {
            return J(16.43d, -62.13d);
        }
        if (str.equals("America/Nassau")) {
            return J(25.5d, -77.21d);
        }
        if (str.equals("America/New_York")) {
            return J(40.4251d, -74.23d);
        }
        if (str.equals("America/Nipigon")) {
            return J(49.1d, -88.16d);
        }
        if (str.equals("America/Nome")) {
            return J(64.3004d, -165.2423d);
        }
        if (str.equals("America/Noronha")) {
            return J(-3.51d, -32.25d);
        }
        if (str.equals("America/North_Dakota/Beulah")) {
            return J(47.1551d, -101.464d);
        }
        if (str.equals("America/North_Dakota/Center")) {
            return J(47.659d, -101.1757d);
        }
        if (str.equals("America/North_Dakota/New_Salem")) {
            return J(46.5042d, -101.2439d);
        }
        if (str.equals("America/Ojinaga")) {
            return J(29.34d, -104.25d);
        }
        if (str.equals("America/Panama")) {
            return J(8.58d, -79.32d);
        }
        if (str.equals("America/Pangnirtung")) {
            return J(66.8d, -65.44d);
        }
        if (str.equals("America/Paramaribo")) {
            return J(5.5d, -55.1d);
        }
        if (str.equals("America/Phoenix")) {
            return J(33.2654d, -112.424d);
        }
        if (str.equals("America/Port-au-Prince")) {
            return J(18.32d, -72.2d);
        }
        if (str.equals("America/Port_of_Spain")) {
            return J(10.39d, -61.31d);
        }
        if (str.equals("America/Porto_Acre")) {
            return J(-9.587778d, -67.532778d);
        }
        if (str.equals("America/Porto_Velho")) {
            return J(-8.46d, -63.54d);
        }
        if (str.equals("America/Puerto_Rico")) {
            return J(18.2806d, -66.622d);
        }
        if (str.equals("America/Rainy_River")) {
            return J(48.43d, -94.34d);
        }
        if (str.equals("America/Rankin_Inlet")) {
            return J(62.49d, -92.459d);
        }
        if (str.equals("America/Recife")) {
            return J(-8.3d, -34.54d);
        }
        if (str.equals("America/Regina")) {
            return J(50.24d, -104.39d);
        }
        if (str.equals("America/Resolute")) {
            return J(49.53d, -97.9d);
        }
        if (str.equals("America/Rio_Branco")) {
            return J(-9.58d, -67.48d);
        }
        if (str.equals("America/Rosario")) {
            return J(-32.94682d, -60.63932d);
        }
        if (str.equals("America/Santa_Isabel")) {
            return J(30.18d, -114.52d);
        }
        if (str.equals("America/Santarem")) {
            return J(-2.26d, -54.52d);
        }
        if (str.equals("America/Santiago")) {
            return J(-33.27d, -70.4d);
        }
        if (str.equals("America/Santo_Domingo")) {
            return J(18.28d, -69.54d);
        }
        if (str.equals("America/Sao_Paulo")) {
            return J(-23.32d, -46.37d);
        }
        if (str.equals("America/Scoresbysund")) {
            return J(70.29d, -21.58d);
        }
        if (str.equals("America/Shiprock")) {
            return J(36.6875d, -108.836389d);
        }
        if (str.equals("America/Sitka")) {
            return J(57.1035d, -135.1807d);
        }
        if (str.equals("America/St_Barthelemy")) {
            return J(17.53d, -62.51d);
        }
        if (str.equals("America/St_Johns")) {
            return J(47.34d, -52.43d);
        }
        if (str.equals("America/St_Kitts")) {
            return J(17.18d, -62.43d);
        }
        if (str.equals("America/St_Lucia")) {
            return J(14.1d, -61.0d);
        }
        if (str.equals("America/St_Thomas")) {
            return J(18.21d, -64.56d);
        }
        if (str.equals("America/St_Vincent")) {
            return J(13.9d, -61.14d);
        }
        if (str.equals("America/Swift_Current")) {
            return J(50.17d, -107.5d);
        }
        if (str.equals("America/Tegucigalpa")) {
            return J(14.6d, -87.13d);
        }
        if (str.equals("America/Thule")) {
            return J(76.34d, -68.47d);
        }
        if (str.equals("America/Thunder_Bay")) {
            return J(48.23d, -89.15d);
        }
        if (str.equals("America/Tijuana")) {
            return J(32.32d, -117.1d);
        }
        if (str.equals("America/Toronto")) {
            return J(43.39d, -79.23d);
        }
        if (str.equals("America/Tortola")) {
            return J(18.27d, -64.37d);
        }
        if (str.equals("America/Vancouver")) {
            return J(49.16d, -123.7d);
        }
        if (str.equals("America/Virgin")) {
            return J(10.39d, -61.31d);
        }
        if (str.equals("America/Whitehorse")) {
            return J(60.43d, -135.3d);
        }
        if (str.equals("America/Winnipeg")) {
            return J(49.53d, -97.9d);
        }
        if (str.equals("America/Yakutat")) {
            return J(59.3249d, -139.4338d);
        }
        if (str.equals("America/Yellowknife")) {
            return J(62.27d, -114.21d);
        }
        if (str.equals("Antarctica/Casey")) {
            return J(-66.17d, 110.31d);
        }
        if (str.equals("Antarctica/Davis")) {
            return J(-68.35d, 77.58d);
        }
        if (str.equals("Antarctica/DumontDUrville")) {
            return J(-66.4d, 140.1d);
        }
        if (str.equals("Antarctica/Macquarie")) {
            return J(-54.3d, 158.57d);
        }
        if (str.equals("Antarctica/Mawson")) {
            return J(-67.36d, 62.53d);
        }
        if (str.equals("Antarctica/McMurdo")) {
            return J(-77.5d, 166.36d);
        }
        if (str.equals("Antarctica/Palmer")) {
            return J(-64.48d, -64.6d);
        }
        if (str.equals("Antarctica/Rothera")) {
            return J(-67.34d, -68.8d);
        }
        if (str.equals("Antarctica/South_Pole")) {
            return J(-36.52d, 174.46d);
        }
        if (str.equals("Antarctica/Syowa")) {
            return J(-69.22d, 39.3524d);
        }
        if (str.equals("Antarctica/Troll")) {
            return J(-72.41d, 2.3206d);
        }
        if (str.equals("Antarctica/Vostok")) {
            return J(-78.24d, 106.54d);
        }
        if (str.equals("Arctic/Longyearbyen")) {
            return J(78.0d, 16.0d);
        }
        if (str.equals("Asia/Aden")) {
            return J(12.45d, 45.12d);
        }
        if (str.equals("Asia/Almaty")) {
            return J(43.15d, 76.57d);
        }
        if (str.equals("Asia/Amman")) {
            return J(31.57d, 35.56d);
        }
        if (str.equals("Asia/Anadyr")) {
            return J(64.45d, 177.29d);
        }
        if (str.equals("Asia/Aqtau")) {
            return J(44.31d, 50.16d);
        }
        if (str.equals("Asia/Aqtobe")) {
            return J(50.17d, 57.1d);
        }
        if (!str.equals("Asia/Ashgabat") && !str.equals("Asia/Ashkhabad")) {
            if (str.equals("Asia/Baghdad")) {
                return J(33.21d, 44.25d);
            }
            if (str.equals("Asia/Bahrain")) {
                return J(26.23d, 50.35d);
            }
            if (str.equals("Asia/Baku")) {
                return J(40.23d, 49.51d);
            }
            if (str.equals("Asia/Bangkok")) {
                return J(13.45d, 100.31d);
            }
            if (str.equals("Asia/Beirut")) {
                return J(33.53d, 35.3d);
            }
            if (str.equals("Asia/Bishkek")) {
                return J(42.54d, 74.36d);
            }
            if (str.equals("Asia/Brunei")) {
                return J(4.56d, 114.55d);
            }
            if (str.equals("Asia/Calcutta")) {
                return J(22.32d, 88.22d);
            }
            if (str.equals("Asia/Chita")) {
                return J(52.3d, 113.28d);
            }
            if (str.equals("Asia/Choibalsan")) {
                return J(48.4d, 114.3d);
            }
            if (!str.equals("Asia/Chongqing") && !str.equals("Asia/Chungking")) {
                if (str.equals("Asia/Colombo")) {
                    return J(6.56d, 79.51d);
                }
                if (str.equals("Asia/Dacca")) {
                    return J(23.43d, 90.25d);
                }
                if (str.equals("Asia/Damascus")) {
                    return J(33.3d, 36.18d);
                }
                if (str.equals("Asia/Dhaka")) {
                    return J(23.43d, 90.25d);
                }
                if (str.equals("Asia/Dili")) {
                    return J(-8.33d, 125.35d);
                }
                if (str.equals("Asia/Dubai")) {
                    return J(25.18d, 55.18d);
                }
                if (str.equals("Asia/Dushanbe")) {
                    return J(38.35d, 68.48d);
                }
                if (str.equals("Asia/Gaza")) {
                    return J(31.3d, 34.28d);
                }
                if (str.equals("Asia/Harbin")) {
                    return J(45.75d, 126.633333d);
                }
                if (str.equals("Asia/Hebron")) {
                    return J(31.32d, 35.542d);
                }
                if (str.equals("Asia/Ho_Chi_Minh")) {
                    return J(10.45d, 106.4d);
                }
                if (str.equals("Asia/Hong_Kong")) {
                    return J(22.17d, 114.9d);
                }
                if (str.equals("Asia/Hovd")) {
                    return J(48.1d, 91.39d);
                }
                if (str.equals("Asia/Irkutsk")) {
                    return J(52.16d, 104.2d);
                }
                if (str.equals("Asia/Istanbul")) {
                    return J(41.1d, 28.58d);
                }
                if (str.equals("Asia/Jakarta")) {
                    return J(-6.1d, 106.48d);
                }
                if (str.equals("Asia/Jayapura")) {
                    return J(-2.32d, 140.42d);
                }
                if (str.equals("Asia/Jerusalem")) {
                    return J(31.465d, 35.1326d);
                }
                if (str.equals("Asia/Kabul")) {
                    return J(34.31d, 69.12d);
                }
                if (str.equals("Asia/Kamchatka")) {
                    return J(53.1d, 158.39d);
                }
                if (str.equals("Asia/Karachi")) {
                    return J(24.52d, 67.3d);
                }
                if (str.equals("Asia/Kashgar")) {
                    return J(39.466667d, 75.983333d);
                }
                if (!str.equals("Asia/Kathmandu") && !str.equals("Asia/Katmandu")) {
                    if (str.equals("Asia/Khandyga")) {
                        return J(62.3923d, 135.3314d);
                    }
                    if (str.equals("Asia/Kolkata")) {
                        return J(22.32d, 88.22d);
                    }
                    if (str.equals("Asia/Krasnoyarsk")) {
                        return J(56.1d, 92.5d);
                    }
                    if (str.equals("Asia/Kuala_Lumpur")) {
                        return J(3.1d, 101.42d);
                    }
                    if (str.equals("Asia/Kuching")) {
                        return J(1.33d, 110.2d);
                    }
                    if (str.equals("Asia/Kuwait")) {
                        return J(29.2d, 47.59d);
                    }
                    if (!str.equals("Asia/Macao") && !str.equals("Asia/Macau")) {
                        if (str.equals("Asia/Magadan")) {
                            return J(59.34d, 150.48d);
                        }
                        if (str.equals("Asia/Makassar")) {
                            return J(-5.7d, 119.24d);
                        }
                        if (str.equals("Asia/Manila")) {
                            return J(14.35d, 121.0d);
                        }
                        if (str.equals("Asia/Muscat")) {
                            return J(23.36d, 58.35d);
                        }
                        if (str.equals("Asia/Nicosia")) {
                            return J(35.1d, 33.22d);
                        }
                        if (str.equals("Asia/Novokuznetsk")) {
                            return J(53.45d, 87.7d);
                        }
                        if (str.equals("Asia/Novosibirsk")) {
                            return J(55.2d, 82.55d);
                        }
                        if (str.equals("Asia/Omsk")) {
                            return J(55.0d, 73.24d);
                        }
                        if (str.equals("Asia/Oral")) {
                            return J(51.13d, 51.21d);
                        }
                        if (str.equals("Asia/Phnom_Penh")) {
                            return J(11.33d, 104.55d);
                        }
                        if (str.equals("Asia/Pontianak")) {
                            return J(0.2d, 109.2d);
                        }
                        if (str.equals("Asia/Pyongyang")) {
                            return J(39.1d, 125.45d);
                        }
                        if (str.equals("Asia/Qatar")) {
                            return J(25.17d, 51.32d);
                        }
                        if (str.equals("Asia/Qyzylorda")) {
                            return J(44.48d, 65.28d);
                        }
                        if (str.equals("Asia/Rangoon")) {
                            return J(16.47d, 96.1d);
                        }
                        if (str.equals("Asia/Riyadh")) {
                            return J(24.38d, 46.43d);
                        }
                        if (str.equals("Asia/Saigon")) {
                            return J(10.45d, 106.4d);
                        }
                        if (str.equals("Asia/Sakhalin")) {
                            return J(46.58d, 142.42d);
                        }
                        if (str.equals("Asia/Samarkand")) {
                            return J(39.4d, 66.48d);
                        }
                        if (str.equals("Asia/Seoul")) {
                            return J(37.33d, 126.58d);
                        }
                        if (str.equals("Asia/Shanghai")) {
                            return J(31.14d, 121.28d);
                        }
                        if (str.equals("Asia/Singapore")) {
                            return J(1.17d, 103.51d);
                        }
                        if (str.equals("Asia/Srednekolymsk")) {
                            return J(67.28d, 153.43d);
                        }
                        if (str.equals("Asia/Taipei")) {
                            return J(25.3d, 121.3d);
                        }
                        if (str.equals("Asia/Tashkent")) {
                            return J(41.2d, 69.18d);
                        }
                        if (str.equals("Asia/Tbilisi")) {
                            return J(41.43d, 44.49d);
                        }
                        if (str.equals("Asia/Tehran")) {
                            return J(35.4d, 51.26d);
                        }
                        if (str.equals("Asia/Tel_Aviv")) {
                            return J(31.465d, 35.1326d);
                        }
                        if (!str.equals("Asia/Thimbu") && !str.equals("Asia/Thimphu")) {
                            if (str.equals("Asia/Tokyo")) {
                                return J(35.3916d, 139.4441d);
                            }
                            if (str.equals("Asia/Ujung_Pandang")) {
                                return J(-5.7d, 119.24d);
                            }
                            if (!str.equals("Asia/Ulaanbaatar") && !str.equals("Asia/Ulan_Bator")) {
                                if (str.equals("Asia/Urumqi")) {
                                    return J(43.48d, 87.35d);
                                }
                                if (str.equals("Asia/Ust-Nera")) {
                                    return J(64.3337d, 143.1336d);
                                }
                                if (str.equals("Asia/Vientiane")) {
                                    return J(17.58d, 102.36d);
                                }
                                if (str.equals("Asia/Vladivostok")) {
                                    return J(43.1d, 131.56d);
                                }
                                if (str.equals("Asia/Yakutsk")) {
                                    return J(62.0d, 129.4d);
                                }
                                if (str.equals("Asia/Yekaterinburg")) {
                                    return J(56.51d, 60.36d);
                                }
                                if (str.equals("Asia/Yerevan")) {
                                    return J(40.11d, 44.3d);
                                }
                                if (str.equals("Atlantic/Azores")) {
                                    return J(37.44d, -25.4d);
                                }
                                if (str.equals("Atlantic/Bermuda")) {
                                    return J(32.17d, -64.46d);
                                }
                                if (str.equals("Atlantic/Canary")) {
                                    return J(28.6d, -15.24d);
                                }
                                if (str.equals("Atlantic/Cape_Verde")) {
                                    return J(14.55d, -23.31d);
                                }
                                if (!str.equals("Atlantic/Faeroe") && !str.equals("Atlantic/Faroe")) {
                                    if (str.equals("Atlantic/Jan_Mayen")) {
                                        return J(70.983333d, -8.533333d);
                                    }
                                    if (str.equals("Atlantic/Madeira")) {
                                        return J(32.38d, -16.54d);
                                    }
                                    if (str.equals("Atlantic/Reykjavik")) {
                                        return J(64.9d, -21.51d);
                                    }
                                    if (str.equals("Atlantic/South_Georgia")) {
                                        return J(-54.16d, -36.32d);
                                    }
                                    if (str.equals("Atlantic/St_Helena")) {
                                        return J(-15.55d, -5.42d);
                                    }
                                    if (str.equals("Atlantic/Stanley")) {
                                        return J(-51.42d, -57.51d);
                                    }
                                    if (str.equals("Australia/ACT")) {
                                        return J(-33.52d, 151.13d);
                                    }
                                    if (str.equals("Australia/Adelaide")) {
                                        return J(-34.55d, 138.35d);
                                    }
                                    if (str.equals("Australia/Brisbane")) {
                                        return J(-27.28d, 153.2d);
                                    }
                                    if (str.equals("Australia/Broken_Hill")) {
                                        return J(-31.57d, 141.27d);
                                    }
                                    if (str.equals("Australia/Canberra")) {
                                        return J(-35.3075d, 149.124417d);
                                    }
                                    if (str.equals("Australia/Currie")) {
                                        return J(-39.56d, 143.52d);
                                    }
                                    if (str.equals("Australia/Darwin")) {
                                        return J(-12.28d, 130.5d);
                                    }
                                    if (str.equals("Australia/Eucla")) {
                                        return J(-31.43d, 128.52d);
                                    }
                                    if (str.equals("Australia/Hobart")) {
                                        return J(-42.53d, 147.19d);
                                    }
                                    if (str.equals("Australia/LHI")) {
                                        return J(-31.33d, 159.5d);
                                    }
                                    if (str.equals("Australia/Lindeman")) {
                                        return J(-20.16d, 149.0d);
                                    }
                                    if (str.equals("Australia/Lord_Howe")) {
                                        return J(-31.33d, 159.5d);
                                    }
                                    if (str.equals("Australia/Melbourne")) {
                                        return J(-37.49d, 144.58d);
                                    }
                                    if (str.equals("Australia/NSW")) {
                                        return J(-33.52d, 151.13d);
                                    }
                                    if (str.equals("Australia/North")) {
                                        return J(-12.28d, 130.5d);
                                    }
                                    if (str.equals("Australia/Perth")) {
                                        return J(-31.57d, 115.51d);
                                    }
                                    if (str.equals("Australia/Queensland")) {
                                        return J(-27.28d, 153.2d);
                                    }
                                    if (str.equals("Australia/South")) {
                                        return J(-34.55d, 138.35d);
                                    }
                                    if (str.equals("Australia/Sydney")) {
                                        return J(-33.52d, 151.13d);
                                    }
                                    if (str.equals("Australia/Tasmania")) {
                                        return J(-42.53d, 147.19d);
                                    }
                                    if (str.equals("Australia/Victoria")) {
                                        return J(-37.49d, 144.58d);
                                    }
                                    if (str.equals("Australia/West")) {
                                        return J(-31.57d, 115.51d);
                                    }
                                    if (str.equals("Australia/Yancowinna")) {
                                        return J(-31.57d, 141.27d);
                                    }
                                    if (str.equals("Brazil/Acre")) {
                                        return J(-9.58d, -67.48d);
                                    }
                                    if (str.equals("Brazil/DeNoronha")) {
                                        return J(-3.51d, -32.25d);
                                    }
                                    if (str.equals("Brazil/East")) {
                                        return J(-23.32d, -46.37d);
                                    }
                                    if (str.equals("Brazil/West")) {
                                        return J(-3.8d, -60.1d);
                                    }
                                    if (str.equals("CET")) {
                                        return J(48.52d, 2.2d);
                                    }
                                    if (!str.equals("CST") && !str.equals("CST6CDT")) {
                                        if (str.equals("Canada/Atlantic")) {
                                            return J(44.39d, -63.36d);
                                        }
                                        if (str.equals("Canada/Central")) {
                                            return J(49.53d, -97.9d);
                                        }
                                        if (str.equals("Canada/East-Saskatchewan")) {
                                            return J(50.24d, -104.39d);
                                        }
                                        if (str.equals("Canada/Eastern")) {
                                            return J(43.39d, -79.23d);
                                        }
                                        if (str.equals("Canada/Mountain")) {
                                            return J(53.33d, -113.28d);
                                        }
                                        if (str.equals("Canada/Newfoundland")) {
                                            return J(47.34d, -52.43d);
                                        }
                                        if (str.equals("Canada/Pacific")) {
                                            return J(49.16d, -123.7d);
                                        }
                                        if (str.equals("Canada/Saskatchewan")) {
                                            return J(50.24d, -104.39d);
                                        }
                                        if (str.equals("Canada/Yukon")) {
                                            return J(60.43d, -135.3d);
                                        }
                                        if (str.equals("Chile/Continental")) {
                                            return J(-33.27d, -70.4d);
                                        }
                                        if (str.equals("Chile/EasterIsland")) {
                                            return J(-27.9d, -109.26d);
                                        }
                                        if (str.equals("Cuba")) {
                                            return J(23.8d, -82.22d);
                                        }
                                        if (str.equals("EET")) {
                                            return J(41.1d, 28.58d);
                                        }
                                        if (!str.equals("EST") && !str.equals("EST5EDT")) {
                                            if (str.equals("Egypt")) {
                                                return J(30.3d, 31.15d);
                                            }
                                            if (str.equals("Eire")) {
                                                return J(53.2d, -6.15d);
                                            }
                                            if (!str.equals("Etc/GMT") && !str.equals("Etc/GMT+0")) {
                                                if (str.equals("Etc/GMT+1")) {
                                                    return J(37.44d, -25.4d);
                                                }
                                                if (str.equals("Etc/GMT+10")) {
                                                    return J(21.1825d, -157.513d);
                                                }
                                                if (str.equals("Etc/GMT+11")) {
                                                    return J(-19.1d, -169.55d);
                                                }
                                                if (str.equals("Etc/GMT+12")) {
                                                    return J(0.8d, 176.6d);
                                                }
                                                if (str.equals("Etc/GMT+2")) {
                                                    return J(-3.51d, -32.25d);
                                                }
                                                if (str.equals("Etc/GMT+3")) {
                                                    return J(-12.59d, -38.31d);
                                                }
                                                if (str.equals("Etc/GMT+4")) {
                                                    return J(-3.8d, -60.1d);
                                                }
                                                if (str.equals("Etc/GMT+5")) {
                                                    return J(40.4251d, -74.23d);
                                                }
                                                if (str.equals("Etc/GMT+6")) {
                                                    return J(41.51d, -87.39d);
                                                }
                                                if (str.equals("Etc/GMT+7")) {
                                                    return J(33.2654d, -112.424d);
                                                }
                                                if (str.equals("Etc/GMT+8")) {
                                                    return J(34.308d, -118.1434d);
                                                }
                                                if (str.equals("Etc/GMT+9")) {
                                                    return J(61.1305d, -149.5401d);
                                                }
                                                if (str.equals("Etc/GMT-0")) {
                                                    return J(51.303d, 0.731d);
                                                }
                                                if (str.equals("Etc/GMT-1")) {
                                                    return J(48.52d, 2.2d);
                                                }
                                                if (str.equals("Etc/GMT-10")) {
                                                    return J(-27.28d, 153.2d);
                                                }
                                                if (str.equals("Etc/GMT-11")) {
                                                    return J(-29.3d, 167.58d);
                                                }
                                                if (str.equals("Etc/GMT-12")) {
                                                    return J(53.1d, 158.39d);
                                                }
                                                if (str.equals("Etc/GMT-13")) {
                                                    return J(-14.16d, -170.42d);
                                                }
                                                if (str.equals("Etc/GMT-14")) {
                                                    return J(1.52d, -157.2d);
                                                }
                                                if (str.equals("Etc/GMT-2")) {
                                                    return J(41.1d, 28.58d);
                                                }
                                                if (str.equals("Etc/GMT-3")) {
                                                    return J(55.4521d, 37.3704d);
                                                }
                                                if (str.equals("Etc/GMT-4")) {
                                                    return J(53.12d, 50.9d);
                                                }
                                                if (str.equals("Etc/GMT-5")) {
                                                    return J(56.51d, 60.36d);
                                                }
                                                if (str.equals("Etc/GMT-6")) {
                                                    return J(55.0d, 73.24d);
                                                }
                                                if (str.equals("Etc/GMT-7")) {
                                                    return J(13.45d, 100.31d);
                                                }
                                                if (str.equals("Etc/GMT-8")) {
                                                    return J(3.1d, 101.42d);
                                                }
                                                if (str.equals("Etc/GMT-9")) {
                                                    return J(37.33d, 126.58d);
                                                }
                                                if (!str.equals("Etc/GMT0") && !str.equals("Etc/Greenwich") && !str.equals("Etc/UCT") && !str.equals("Etc/UTC") && !str.equals("Etc/Universal") && !str.equals("Etc/Zulu")) {
                                                    if (str.equals("Europe/Amsterdam")) {
                                                        return J(52.22d, 4.54d);
                                                    }
                                                    if (str.equals("Europe/Andorra")) {
                                                        return J(42.3d, 1.31d);
                                                    }
                                                    if (str.equals("Europe/Athens")) {
                                                        return J(37.58d, 23.43d);
                                                    }
                                                    if (str.equals("Europe/Belfast")) {
                                                        return J(54.597d, -5.93d);
                                                    }
                                                    if (str.equals("Europe/Belgrade")) {
                                                        return J(44.5d, 20.3d);
                                                    }
                                                    if (str.equals("Europe/Berlin")) {
                                                        return J(52.3d, 13.22d);
                                                    }
                                                    if (str.equals("Europe/Bratislava")) {
                                                        return J(48.9d, 17.7d);
                                                    }
                                                    if (str.equals("Europe/Brussels")) {
                                                        return J(50.5d, 4.2d);
                                                    }
                                                    if (str.equals("Europe/Bucharest")) {
                                                        return J(44.26d, 26.6d);
                                                    }
                                                    if (str.equals("Europe/Budapest")) {
                                                        return J(47.3d, 19.5d);
                                                    }
                                                    if (str.equals("Europe/Busingen")) {
                                                        return J(47.42d, 8.41d);
                                                    }
                                                    if (str.equals("Europe/Chisinau")) {
                                                        return J(47.0d, 28.5d);
                                                    }
                                                    if (str.equals("Europe/Copenhagen")) {
                                                        return J(55.4d, 12.35d);
                                                    }
                                                    if (str.equals("Europe/Dublin")) {
                                                        return J(53.2d, -6.15d);
                                                    }
                                                    if (str.equals("Europe/Gibraltar")) {
                                                        return J(36.8d, -5.21d);
                                                    }
                                                    if (str.equals("Europe/Guernsey")) {
                                                        return J(49.27d, -2.32d);
                                                    }
                                                    if (str.equals("Europe/Helsinki")) {
                                                        return J(60.1d, 24.58d);
                                                    }
                                                    if (str.equals("Europe/Isle_of_Man")) {
                                                        return J(54.9d, -4.28d);
                                                    }
                                                    if (str.equals("Europe/Istanbul")) {
                                                        return J(41.1d, 28.58d);
                                                    }
                                                    if (str.equals("Europe/Jersey")) {
                                                        return J(49.12d, -2.7d);
                                                    }
                                                    if (str.equals("Europe/Kaliningrad")) {
                                                        return J(54.43d, 20.3d);
                                                    }
                                                    if (str.equals("Europe/Kiev")) {
                                                        return J(50.26d, 30.31d);
                                                    }
                                                    if (str.equals("Europe/Lisbon")) {
                                                        return J(38.43d, -9.8d);
                                                    }
                                                    if (str.equals("Europe/Ljubljana")) {
                                                        return J(46.3d, 14.31d);
                                                    }
                                                    if (str.equals("Europe/London")) {
                                                        return J(51.303d, 0.731d);
                                                    }
                                                    if (str.equals("Europe/Luxembourg")) {
                                                        return J(49.36d, 6.9d);
                                                    }
                                                    if (str.equals("Europe/Madrid")) {
                                                        return J(40.24d, -3.41d);
                                                    }
                                                    if (str.equals("Europe/Malta")) {
                                                        return J(35.54d, 14.31d);
                                                    }
                                                    if (str.equals("Europe/Mariehamn")) {
                                                        return J(60.6d, 19.57d);
                                                    }
                                                    if (str.equals("Europe/Minsk")) {
                                                        return J(53.54d, 27.34d);
                                                    }
                                                    if (str.equals("Europe/Monaco")) {
                                                        return J(43.42d, 7.23d);
                                                    }
                                                    if (str.equals("Europe/Moscow")) {
                                                        return J(55.4521d, 37.3704d);
                                                    }
                                                    if (str.equals("Europe/Nicosia")) {
                                                        return J(35.1d, 33.22d);
                                                    }
                                                    if (str.equals("Europe/Oslo")) {
                                                        return J(59.55d, 10.45d);
                                                    }
                                                    if (str.equals("Europe/Paris")) {
                                                        return J(48.52d, 2.2d);
                                                    }
                                                    if (str.equals("Europe/Podgorica")) {
                                                        return J(42.26d, 19.16d);
                                                    }
                                                    if (str.equals("Europe/Prague")) {
                                                        return J(50.5d, 14.26d);
                                                    }
                                                    if (str.equals("Europe/Riga")) {
                                                        return J(56.57d, 24.6d);
                                                    }
                                                    if (str.equals("Europe/Rome")) {
                                                        return J(41.54d, 12.29d);
                                                    }
                                                    if (str.equals("Europe/Samara")) {
                                                        return J(53.12d, 50.9d);
                                                    }
                                                    if (str.equals("Europe/San_Marino")) {
                                                        return J(43.55d, 12.28d);
                                                    }
                                                    if (str.equals("Europe/Sarajevo")) {
                                                        return J(43.52d, 18.25d);
                                                    }
                                                    if (str.equals("Europe/Simferopol")) {
                                                        return J(44.57d, 34.6d);
                                                    }
                                                    if (str.equals("Europe/Skopje")) {
                                                        return J(41.59d, 21.26d);
                                                    }
                                                    if (str.equals("Europe/Sofia")) {
                                                        return J(42.41d, 23.19d);
                                                    }
                                                    if (str.equals("Europe/Stockholm")) {
                                                        return J(59.2d, 18.3d);
                                                    }
                                                    if (str.equals("Europe/Tallinn")) {
                                                        return J(59.25d, 24.45d);
                                                    }
                                                    if (str.equals("Europe/Tirane")) {
                                                        return J(41.2d, 19.5d);
                                                    }
                                                    if (str.equals("Europe/Tiraspol")) {
                                                        return J(47.0d, 28.5d);
                                                    }
                                                    if (str.equals("Europe/Uzhgorod")) {
                                                        return J(48.37d, 22.18d);
                                                    }
                                                    if (str.equals("Europe/Vaduz")) {
                                                        return J(47.9d, 9.31d);
                                                    }
                                                    if (str.equals("Europe/Vatican")) {
                                                        return J(41.5408d, 12.2711d);
                                                    }
                                                    if (str.equals("Europe/Vienna")) {
                                                        return J(48.13d, 16.2d);
                                                    }
                                                    if (str.equals("Europe/Vilnius")) {
                                                        return J(54.41d, 25.19d);
                                                    }
                                                    if (str.equals("Europe/Volgograd")) {
                                                        return J(48.44d, 44.25d);
                                                    }
                                                    if (str.equals("Europe/Warsaw")) {
                                                        return J(52.15d, 21.0d);
                                                    }
                                                    if (str.equals("Europe/Zagreb")) {
                                                        return J(45.48d, 15.58d);
                                                    }
                                                    if (str.equals("Europe/Zaporozhye")) {
                                                        return J(47.5d, 35.1d);
                                                    }
                                                    if (str.equals("Europe/Zurich")) {
                                                        return J(47.23d, 8.32d);
                                                    }
                                                    if (!str.equals("GB") && !str.equals("GB-Eire") && !str.equals("GMT") && !str.equals("GMT+0") && !str.equals("GMT-0") && !str.equals("GMT0") && !str.equals("Greenwich")) {
                                                        if (str.equals("HST")) {
                                                            return J(21.1825d, -157.513d);
                                                        }
                                                        if (str.equals("Hongkong")) {
                                                            return J(22.17d, 114.9d);
                                                        }
                                                        if (str.equals("Iceland")) {
                                                            return J(64.9d, -21.51d);
                                                        }
                                                        if (str.equals("Indian/Antananarivo")) {
                                                            return J(-18.55d, 47.31d);
                                                        }
                                                        if (str.equals("Indian/Chagos")) {
                                                            return J(-7.2d, 72.25d);
                                                        }
                                                        if (str.equals("Indian/Christmas")) {
                                                            return J(-10.25d, 105.43d);
                                                        }
                                                        if (str.equals("Indian/Cocos")) {
                                                            return J(-12.1d, 96.55d);
                                                        }
                                                        if (str.equals("Indian/Comoro")) {
                                                            return J(-11.41d, 43.16d);
                                                        }
                                                        if (str.equals("Indian/Kerguelen")) {
                                                            return J(-49.211d, 70.1303d);
                                                        }
                                                        if (str.equals("Indian/Mahe")) {
                                                            return J(-4.4d, 55.28d);
                                                        }
                                                        if (str.equals("Indian/Maldives")) {
                                                            return J(4.1d, 73.3d);
                                                        }
                                                        if (str.equals("Indian/Mauritius")) {
                                                            return J(-20.1d, 57.3d);
                                                        }
                                                        if (str.equals("Indian/Mayotte")) {
                                                            return J(-12.47d, 45.14d);
                                                        }
                                                        if (str.equals("Indian/Reunion")) {
                                                            return J(-20.52d, 55.28d);
                                                        }
                                                        if (str.equals("Iran")) {
                                                            return J(35.4d, 51.26d);
                                                        }
                                                        if (str.equals("Israel")) {
                                                            return J(31.465d, 35.1326d);
                                                        }
                                                        if (str.equals("Jamaica")) {
                                                            return J(17.5805d, -76.4736d);
                                                        }
                                                        if (str.equals("Japan")) {
                                                            return J(35.3916d, 139.4441d);
                                                        }
                                                        if (str.equals("Kwajalein")) {
                                                            return J(9.5d, 167.2d);
                                                        }
                                                        if (str.equals("Libya")) {
                                                            return J(32.54d, 13.11d);
                                                        }
                                                        if (str.equals("MET")) {
                                                            return J(48.52d, 2.2d);
                                                        }
                                                        if (!str.equals("MST") && !str.equals("MST7MDT")) {
                                                            if (str.equals("Mexico/BajaNorte")) {
                                                                return J(32.32d, -117.1d);
                                                            }
                                                            if (str.equals("Mexico/BajaSur")) {
                                                                return J(23.13d, -106.25d);
                                                            }
                                                            if (str.equals("Mexico/General")) {
                                                                return J(19.24d, -99.9d);
                                                            }
                                                            if (str.equals("NZ")) {
                                                                return J(-36.52d, 174.46d);
                                                            }
                                                            if (str.equals("NZ-CHAT")) {
                                                                return J(-43.57d, -176.33d);
                                                            }
                                                            if (str.equals("Navajo")) {
                                                                return J(39.4421d, -104.5903d);
                                                            }
                                                            if (str.equals("PRC")) {
                                                                return J(31.14d, 121.28d);
                                                            }
                                                            if (str.equals("PST8PDT")) {
                                                                return J(34.308d, -118.1434d);
                                                            }
                                                            if (str.equals("Pacific/Apia")) {
                                                                return J(-13.5d, -171.44d);
                                                            }
                                                            if (str.equals("Pacific/Auckland")) {
                                                                return J(-36.52d, 174.46d);
                                                            }
                                                            if (str.equals("Pacific/Bougainville")) {
                                                                return J(-6.13d, 155.34d);
                                                            }
                                                            if (str.equals("Pacific/Chatham")) {
                                                                return J(-43.57d, -176.33d);
                                                            }
                                                            if (str.equals("Pacific/Chuuk")) {
                                                                return J(7.25d, 151.47d);
                                                            }
                                                            if (str.equals("Pacific/Easter")) {
                                                                return J(-27.9d, -109.26d);
                                                            }
                                                            if (str.equals("Pacific/Efate")) {
                                                                return J(-17.4d, 168.25d);
                                                            }
                                                            if (str.equals("Pacific/Enderbury")) {
                                                                return J(-3.8d, -171.5d);
                                                            }
                                                            if (str.equals("Pacific/Fakaofo")) {
                                                                return J(-9.22d, -171.14d);
                                                            }
                                                            if (str.equals("Pacific/Fiji")) {
                                                                return J(-18.8d, 178.25d);
                                                            }
                                                            if (str.equals("Pacific/Funafuti")) {
                                                                return J(-8.31d, 179.13d);
                                                            }
                                                            if (str.equals("Pacific/Galapagos")) {
                                                                return J(0.54d, -89.36d);
                                                            }
                                                            if (str.equals("Pacific/Gambier")) {
                                                                return J(-23.8d, -134.57d);
                                                            }
                                                            if (str.equals("Pacific/Guadalcanal")) {
                                                                return J(-9.32d, 160.12d);
                                                            }
                                                            if (str.equals("Pacific/Guam")) {
                                                                return J(13.28d, 144.45d);
                                                            }
                                                            if (str.equals("Pacific/Honolulu")) {
                                                                return J(21.1825d, -157.513d);
                                                            }
                                                            if (str.equals("Pacific/Johnston")) {
                                                                return J(16.45d, -169.31d);
                                                            }
                                                            if (str.equals("Pacific/Kiritimati")) {
                                                                return J(1.52d, -157.2d);
                                                            }
                                                            if (str.equals("Pacific/Kosrae")) {
                                                                return J(5.19d, 162.59d);
                                                            }
                                                            if (str.equals("Pacific/Kwajalein")) {
                                                                return J(9.5d, 167.2d);
                                                            }
                                                            if (str.equals("Pacific/Majuro")) {
                                                                return J(7.9d, 171.12d);
                                                            }
                                                            if (str.equals("Pacific/Marquesas")) {
                                                                return J(-9.0d, -139.3d);
                                                            }
                                                            if (str.equals("Pacific/Midway")) {
                                                                return J(28.13d, -177.22d);
                                                            }
                                                            if (str.equals("Pacific/Nauru")) {
                                                                return J(0.31d, 166.55d);
                                                            }
                                                            if (str.equals("Pacific/Niue")) {
                                                                return J(-19.1d, -169.55d);
                                                            }
                                                            if (str.equals("Pacific/Norfolk")) {
                                                                return J(-29.3d, 167.58d);
                                                            }
                                                            if (str.equals("Pacific/Noumea")) {
                                                                return J(-22.16d, 166.27d);
                                                            }
                                                            if (str.equals("Pacific/Pago_Pago")) {
                                                                return J(-14.16d, -170.42d);
                                                            }
                                                            if (str.equals("Pacific/Palau")) {
                                                                return J(7.2d, 134.29d);
                                                            }
                                                            if (str.equals("Pacific/Pitcairn")) {
                                                                return J(-25.4d, -130.5d);
                                                            }
                                                            if (!str.equals("Pacific/Pohnpei") && !str.equals("Pacific/Ponape")) {
                                                                if (str.equals("Pacific/Port_Moresby")) {
                                                                    return J(-9.3d, 147.1d);
                                                                }
                                                                if (str.equals("Pacific/Rarotonga")) {
                                                                    return J(-21.14d, -159.46d);
                                                                }
                                                                if (str.equals("Pacific/Saipan")) {
                                                                    return J(15.12d, 145.45d);
                                                                }
                                                                if (str.equals("Pacific/Samoa")) {
                                                                    return J(-14.16d, -170.42d);
                                                                }
                                                                if (str.equals("Pacific/Tahiti")) {
                                                                    return J(-17.32d, -149.34d);
                                                                }
                                                                if (str.equals("Pacific/Tarawa")) {
                                                                    return J(1.25d, 173.0d);
                                                                }
                                                                if (str.equals("Pacific/Tongatapu")) {
                                                                    return J(-21.1d, -175.1d);
                                                                }
                                                                if (str.equals("Pacific/Truk")) {
                                                                    return J(7.25d, 151.47d);
                                                                }
                                                                if (str.equals("Pacific/Wake")) {
                                                                    return J(19.17d, 166.37d);
                                                                }
                                                                if (str.equals("Pacific/Wallis")) {
                                                                    return J(-13.18d, -176.1d);
                                                                }
                                                                if (str.equals("Pacific/Yap")) {
                                                                    return J(7.25d, 151.47d);
                                                                }
                                                                if (str.equals("Poland")) {
                                                                    return J(52.15d, 21.0d);
                                                                }
                                                                if (str.equals("Portugal")) {
                                                                    return J(38.43d, -9.8d);
                                                                }
                                                                if (str.equals("ROC")) {
                                                                    return J(25.3d, 121.3d);
                                                                }
                                                                if (str.equals("ROK")) {
                                                                    return J(37.33d, 126.58d);
                                                                }
                                                                if (str.equals("Singapore")) {
                                                                    return J(1.17d, 103.51d);
                                                                }
                                                                if (str.equals("Turkey")) {
                                                                    return J(41.1d, 28.58d);
                                                                }
                                                                if (str.equals("UCT")) {
                                                                    return J(51.303d, 0.731d);
                                                                }
                                                                if (str.equals("US/Alaska")) {
                                                                    return J(61.1305d, -149.5401d);
                                                                }
                                                                if (str.equals("US/Aleutian")) {
                                                                    return J(51.5248d, -176.3929d);
                                                                }
                                                                if (str.equals("US/Arizona")) {
                                                                    return J(33.2654d, -112.424d);
                                                                }
                                                                if (str.equals("US/Central")) {
                                                                    return J(41.51d, -87.39d);
                                                                }
                                                                if (str.equals("US/East-Indiana")) {
                                                                    return J(39.4606d, -86.929d);
                                                                }
                                                                if (str.equals("US/Eastern")) {
                                                                    return J(40.4251d, -74.23d);
                                                                }
                                                                if (str.equals("US/Hawaii")) {
                                                                    return J(21.1825d, -157.513d);
                                                                }
                                                                if (str.equals("US/Indiana-Starke")) {
                                                                    return J(41.1745d, -86.373d);
                                                                }
                                                                if (str.equals("US/Michigan")) {
                                                                    return J(42.1953d, -83.245d);
                                                                }
                                                                if (str.equals("US/Mountain")) {
                                                                    return J(39.4421d, -104.5903d);
                                                                }
                                                                if (!str.equals("US/Pacific") && !str.equals("US/Pacific-New")) {
                                                                    if (str.equals("US/Samoa")) {
                                                                        return J(-14.16d, -170.42d);
                                                                    }
                                                                    if (!str.equals("UTC") && !str.equals("Universal")) {
                                                                        if (str.equals("W-SU")) {
                                                                            return J(55.4521d, 37.3704d);
                                                                        }
                                                                        if (!str.equals("WET") && !str.equals("Zulu")) {
                                                                            return J(41.51d, -87.39d);
                                                                        }
                                                                        return J(51.303d, 0.731d);
                                                                    }
                                                                    return J(51.303d, 0.731d);
                                                                }
                                                                return J(34.308d, -118.1434d);
                                                            }
                                                            return J(6.58d, 158.13d);
                                                        }
                                                        return J(33.2654d, -112.424d);
                                                    }
                                                    return J(51.303d, 0.731d);
                                                }
                                                return J(51.303d, 0.731d);
                                            }
                                            return J(51.303d, 0.731d);
                                        }
                                        return J(40.4251d, -74.23d);
                                    }
                                    return J(41.51d, -87.39d);
                                }
                                return J(62.1d, -6.46d);
                            }
                            return J(47.55d, 106.53d);
                        }
                        return J(27.28d, 89.39d);
                    }
                    return J(22.14d, 113.35d);
                }
                return J(27.43d, 85.19d);
            }
            return J(29.558333d, 106.566667d);
        }
        return J(37.57d, 58.23d);
    }

    public static Pair E(int i5, tz.v vVar) {
        vz.a aVar;
        vz.a aVar2;
        int i11 = vVar.f90178a;
        UInt.Companion companion = UInt.f71696b;
        float fN = (float) v4.a.n(r4.a.j(i11, ul.b.n0(0.0f, vVar.f90182e, 0.0f, 5)));
        int iN0 = fN < 40.0f ? (15.0f > fN || fN > 25.0f) ? ul.b.n0(0.0f, i11, 20.0f, 3) : ul.b.n0(0.0f, i11, fN - 10, 3) : fN < 60.0f ? ul.b.n0(20.0f, i11, fN + 10, 1) : (90.0f > fN || fN > 100.0f) ? ul.b.n0(0.0f, i11, 95.0f, 3) : ul.b.n0(0.0f, i11, 85.0f, 3);
        vz.a aVarA = vz.a.a(iN0);
        vz.a aVarA2 = vz.a.a(i5);
        float f11 = aVarA2.f93390c;
        if (f11 > 50.0f) {
            float f12 = aVarA2.f93388a;
            float f13 = aVarA2.f93389b;
            float f14 = f11 - 70;
            if (f14 < 0.0f) {
                f14 = 0.0f;
            }
            aVar = new vz.a(f12, f13, f14);
        } else {
            float f15 = aVarA2.f93388a;
            float f16 = aVarA2.f93389b;
            float f17 = f11 + 70;
            if (f17 > 100.0f) {
                f17 = 100.0f;
            }
            aVar = new vz.a(f15, f16, f17);
        }
        int iB = aVar.b();
        float f18 = aVarA.f93390c;
        if (f18 > 50.0f) {
            float f19 = f18 - 50;
            aVar2 = new vz.a(aVarA.f93388a, aVarA.f93389b, f19 >= 0.0f ? f19 : 0.0f);
        } else {
            float f21 = f18 + 50;
            aVar2 = new vz.a(aVarA.f93388a, aVarA.f93389b, f21 <= 100.0f ? f21 : 100.0f);
        }
        return new Pair(new Pair(new tz.c(i5), new tz.c(iB)), new Pair(new tz.c(iN0), new tz.c(aVar2.b())));
    }

    public static final Object F(j3.k kVar, j3.a0 a0Var) {
        Object objD = kVar.f68812a.d(a0Var);
        if (objD == null) {
            return null;
        }
        return objD;
    }

    public static synchronized SparseArray G(Context context) {
        SparseArray sparseArray = f708a;
        if (sparseArray != null) {
            return sparseArray;
        }
        M(context);
        return f708a;
    }

    public static boolean H(byte b11) {
        return b11 > -65;
    }

    public static final long I(float f11, long j11, long j12) {
        float fD0 = bh.g.d0(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j12 >> 32)), f11);
        float fD02 = bh.g.d0(Float.intBitsToFloat((int) (j11 & 4294967295L)), Float.intBitsToFloat((int) (j12 & 4294967295L)), f11);
        return (Float.floatToRawIntBits(fD0) << 32) | (Float.floatToRawIntBits(fD02) & 4294967295L);
    }

    public static Location J(double d5, double d11) {
        Location location = new Location("timezone");
        location.setLatitude(d5);
        location.setLongitude(d11);
        return location;
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00d3, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static m90.x K(m90.j... jVarArr) {
        int i5 = 0;
        if (jVarArr.length == 0) {
            return new m90.x(new m90.j[0], new int[]{0, -1});
        }
        ArrayList arrayListD1 = kotlin.collections.c.d1(jVarArr);
        b70.c.x0(arrayListD1);
        ArrayList arrayList = new ArrayList(jVarArr.length);
        for (m90.j jVar : jVarArr) {
            arrayList.add(-1);
        }
        Integer[] numArr = (Integer[]) arrayList.toArray(new Integer[0]);
        ArrayList arrayListT = ul.b.T(Arrays.copyOf(numArr, numArr.length));
        int length = jVarArr.length;
        int i11 = 0;
        int i12 = 0;
        while (i11 < length) {
            arrayListT.set(ul.b.l(arrayListD1, jVarArr[i11]), Integer.valueOf(i12));
            i11++;
            i12++;
        }
        if (((m90.j) arrayListD1.get(0)).c() <= 0) {
            throw new IllegalArgumentException("the empty byte string is not a supported option");
        }
        int i13 = 0;
        while (i13 < arrayListD1.size()) {
            m90.j prefix = (m90.j) arrayListD1.get(i13);
            int i14 = i13 + 1;
            int i15 = i14;
            while (i15 < arrayListD1.size()) {
                m90.j jVar2 = (m90.j) arrayListD1.get(i15);
                jVar2.getClass();
                Intrinsics.g(prefix, "prefix");
                if (jVar2.n(0, prefix, prefix.c())) {
                    if (jVar2.c() == prefix.c()) {
                        throw new IllegalArgumentException(("duplicate option: " + jVar2).toString());
                    }
                    if (((Number) arrayListT.get(i15)).intValue() > ((Number) arrayListT.get(i13)).intValue()) {
                        arrayListD1.remove(i15);
                        arrayListT.remove(i15);
                    } else {
                        i15++;
                    }
                }
            }
            i13 = i14;
        }
        m90.g gVar = new m90.g();
        m(0L, gVar, 0, arrayListD1, 0, arrayListD1.size(), arrayListT);
        int[] iArr = new int[(int) (gVar.f76126b / 4)];
        while (!gVar.N()) {
            iArr[i5] = gVar.readInt();
            i5++;
        }
        Object[] objArrCopyOf = Arrays.copyOf(jVarArr, jVarArr.length);
        Intrinsics.f(objArrCopyOf, "copyOf(this, size)");
        return new m90.x((m90.j[]) objArrCopyOf, iArr);
    }

    public static c30.c L(String statusLine) throws ProtocolException, NumberFormatException {
        int i5;
        String strSubstring;
        Intrinsics.g(statusLine, "statusLine");
        boolean zI0 = r70.j.I0(statusLine, "HTTP/1.", false);
        x80.f0 f0Var = x80.f0.HTTP_1_0;
        if (zI0) {
            i5 = 9;
            if (statusLine.length() < 9 || statusLine.charAt(8) != ' ') {
                throw new ProtocolException("Unexpected status line: ".concat(statusLine));
            }
            int iCharAt = statusLine.charAt(7) - '0';
            if (iCharAt != 0) {
                if (iCharAt != 1) {
                    throw new ProtocolException("Unexpected status line: ".concat(statusLine));
                }
                f0Var = x80.f0.HTTP_1_1;
            }
        } else {
            if (!r70.j.I0(statusLine, "ICY ", false)) {
                throw new ProtocolException("Unexpected status line: ".concat(statusLine));
            }
            i5 = 4;
        }
        int i11 = i5 + 3;
        if (statusLine.length() < i11) {
            throw new ProtocolException("Unexpected status line: ".concat(statusLine));
        }
        try {
            String strSubstring2 = statusLine.substring(i5, i11);
            Intrinsics.f(strSubstring2, "this as java.lang.String…ing(startIndex, endIndex)");
            int i12 = Integer.parseInt(strSubstring2);
            if (statusLine.length() <= i11) {
                strSubstring = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else {
                if (statusLine.charAt(i11) != ' ') {
                    throw new ProtocolException("Unexpected status line: ".concat(statusLine));
                }
                strSubstring = statusLine.substring(i5 + 4);
                Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
            }
            return new c30.c(f0Var, i12, strSubstring);
        } catch (NumberFormatException unused) {
            throw new ProtocolException("Unexpected status line: ".concat(statusLine));
        }
    }

    public static synchronized void M(Context context) {
        ya.r rVar;
        SparseArray sparseArray = new SparseArray();
        ArrayMap arrayMap = new ArrayMap();
        try {
            XmlResourceParser xml = context.getResources().getXml(2132213779);
            try {
                int depth = xml.getDepth();
                while (true) {
                    int next = xml.next();
                    if (next == 3 && xml.getDepth() <= depth) {
                        break;
                    }
                    if (next == 1) {
                        break;
                    }
                    if (next == 2 && "section".equals(xml.getName())) {
                        d0 d0Var = new d0(context, Xml.asAttributeSet(xml));
                        int depth2 = xml.getDepth();
                        while (true) {
                            int next2 = xml.next();
                            if ((next2 == 3 && xml.getDepth() <= depth2) || next2 == 1) {
                                break;
                            }
                            if (next2 == 2 && "widget".equals(xml.getName())) {
                                TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xml), u2.P);
                                ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(typedArrayObtainStyledAttributes.getString(2));
                                boolean z11 = typedArrayObtainStyledAttributes.getBoolean(0, false);
                                if (arrayMap.containsKey(componentNameUnflattenFromString)) {
                                    rVar = (ya.r) arrayMap.get(componentNameUnflattenFromString);
                                } else {
                                    ya.r rVar2 = new ya.r();
                                    arrayMap.put(componentNameUnflattenFromString, rVar2);
                                    rVar = rVar2;
                                }
                                if (z11) {
                                    rVar.c(-1);
                                }
                                rVar.c(d0Var.f703a);
                            }
                        }
                        sparseArray.put(d0Var.f703a, d0Var);
                    }
                }
                f708a = sparseArray;
                f709b = arrayMap;
                xml.close();
            } catch (Throwable th2) {
                if (xml != null) {
                    try {
                        xml.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        } catch (IOException | XmlPullParserException e3) {
            throw new RuntimeException(e3);
        }
    }

    public static final Object N(Function0 function0) {
        StrictMode.ThreadPolicy threadPolicy = StrictMode.getThreadPolicy();
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(threadPolicy).permitDiskReads().permitDiskWrites().build());
        try {
            return function0.invoke();
        } finally {
            StrictMode.setThreadPolicy(threadPolicy);
        }
    }

    public static void O() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        NovaLauncher novaLauncher = NovaLauncher.f45649u1;
        if (novaLauncher != null && !novaLauncher.hasWindowFocus()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NovaLauncher");
            bVar.b("postRecreate: launcher not foregrounded — deferring to onResume", new Object[0]);
            novaLauncher.G0 = true;
            return;
        }
        long j11 = jCurrentTimeMillis - NovaLauncher.f45650v1;
        if (NovaLauncher.f45650v1 != 0 && j11 < com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a.f39430h) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("NovaLauncher");
            bVar2.n("postRecreate: rate-limited (last=%dms ago). Call stack:", Long.valueOf(j11));
            bVar2.r("NovaLauncher");
            bVar2.o(new Throwable("postRecreate rate-limited"));
            return;
        }
        if (jCurrentTimeMillis - NovaLauncher.f45652x1 > 30000) {
            NovaLauncher.f45652x1 = jCurrentTimeMillis;
            NovaLauncher.f45651w1 = 0;
        }
        NovaLauncher.f45651w1++;
        if (NovaLauncher.f45651w1 <= 5) {
            NovaLauncher.f45650v1 = jCurrentTimeMillis;
            NovaLauncher.f45647s1 = false;
            l1 l1Var = l1.f88818a;
            a80.e eVar = y0.f88884a;
            m0.t(l1Var, y70.o.f96819a, null, new x1(29), 2);
            return;
        }
        IllegalStateException illegalStateException = new IllegalStateException("postRecreate burst: " + NovaLauncher.f45651w1 + " calls in " + (jCurrentTimeMillis - NovaLauncher.f45652x1) + "ms");
        mc0.b bVar3 = mc0.d.f76206a;
        bVar3.r("NovaLauncher");
        bVar3.f(illegalStateException, "postRecreate burst — stopping to break suspected loop", new Object[0]);
    }

    public static final boolean R(z.o0 o0Var, Object obj, Object obj2) {
        Object objD = o0Var.d(obj);
        if (objD == null) {
            return false;
        }
        if (!(objD instanceof p0)) {
            if (!objD.equals(obj2)) {
                return false;
            }
            o0Var.k(obj);
            return true;
        }
        p0 p0Var = (p0) objD;
        boolean zL = p0Var.l(obj2);
        if (zL && p0Var.b()) {
            o0Var.k(obj);
        }
        return zL;
    }

    public static final void T(z.o0 o0Var, Object obj) {
        boolean zB;
        long[] jArr = o0Var.f97866a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        int i13 = (i5 << 3) + i12;
                        Object obj2 = o0Var.f97867b[i13];
                        Object obj3 = o0Var.f97868c[i13];
                        if (obj3 instanceof p0) {
                            p0 p0Var = (p0) obj3;
                            p0Var.l(obj);
                            zB = p0Var.b();
                        } else {
                            zB = obj3 == obj;
                        }
                        if (zB) {
                            o0Var.l(i13);
                        }
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return;
                }
            }
            if (i5 == length) {
                return;
            } else {
                i5++;
            }
        }
    }

    public static Set U(Object obj) {
        Set setSingleton = Collections.singleton(obj);
        Intrinsics.f(setSingleton, "singleton(...)");
        return setSingleton;
    }

    public static LinkedHashMap V(String editsString) {
        Intrinsics.g(editsString, "editsString");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator it = r70.k.i1(editsString, new String[]{";"}, 6).iterator();
        while (it.hasNext()) {
            try {
                List listI1 = r70.k.i1((String) it.next(), new String[]{":"}, 6);
                if (listI1.size() == 2) {
                    String str = (String) listI1.get(0);
                    List listI12 = r70.k.i1((CharSequence) listI1.get(1), new String[]{"|"}, 6);
                    if (listI12.size() == 2) {
                        linkedHashMap.put(str, new op.g(Integer.parseInt((String) listI12.get(0)), Integer.parseInt((String) listI12.get(1))));
                    }
                }
            } catch (Throwable unused) {
            }
        }
        return linkedHashMap;
    }

    public static final void W(o50.a0 a0Var, o50.a0 url) {
        Intrinsics.g(a0Var, "<this>");
        Intrinsics.g(url, "url");
        a0Var.f79533d = url.f79533d;
        String str = url.f79530a;
        Intrinsics.g(str, "<set-?>");
        a0Var.f79530a = str;
        a0Var.e(url.f79532c);
        a0Var.d(url.f79537h);
        a0Var.f79534e = url.f79534e;
        a0Var.f79535f = url.f79535f;
        o50.y yVar = new o50.y();
        ul.b.f(yVar, url.f79538i);
        a0Var.f79538i = yVar;
        a0Var.f79539j = new aa.h(yVar);
        String str2 = url.f79536g;
        Intrinsics.g(str2, "<set-?>");
        a0Var.f79536g = str2;
        a0Var.f79531b = url.f79531b;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object X(HttpURLConnection httpURLConnection, k50.d request, g50.b bVar, ContinuationImpl continuationImpl) throws Throwable {
        g50.h hVar;
        Object obj;
        if (continuationImpl instanceof g50.h) {
            hVar = (g50.h) continuationImpl;
            int i5 = hVar.f57193w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f57193w = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new g50.h(continuationImpl);
            }
        }
        Object obj2 = hVar.f57192v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f57193w;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj2);
            try {
                return bVar.invoke(httpURLConnection);
            } catch (Throwable th2) {
                th = th2;
                hVar.f57190t = request;
                hVar.f57191u = th;
                hVar.f57193w = 1;
                if (m0.z(hVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th = hVar.f57191u;
            request = hVar.f57190t;
            ResultKt.b(obj2);
        }
        if (!(th instanceof SocketTimeoutException)) {
            if (th instanceof ConnectException) {
                String message = th.getMessage();
                if (!(message != null ? r70.k.K0(message, "timed out", false) : false)) {
                }
            } else {
                z11 = false;
            }
        }
        if (!z11) {
            throw th;
        }
        za0.b bVar2 = h50.l1.f59228a;
        Intrinsics.g(request, "request");
        StringBuilder sb2 = new StringBuilder("Connect timeout has expired [url=");
        sb2.append(request.f71123a);
        sb2.append(", connect_timeout=");
        Map map = (Map) request.f71128f.d(f50.h.f54327a);
        h1 h1Var = (h1) (map != null ? map.get(g1.f59194a) : null);
        if (h1Var == null || (obj = h1Var.f59204b) == null) {
            obj = "unknown";
        }
        sb2.append(obj);
        sb2.append(" ms]");
        throw new ConnectTimeoutException(sb2.toString(), th);
    }

    public static Bitmap Y(Drawable drawable, int i5, int i11, int i12) {
        if ((i12 & 1) != 0) {
            i5 = drawable.getIntrinsicWidth();
        }
        if ((i12 & 2) != 0) {
            i11 = drawable.getIntrinsicHeight();
        }
        if (drawable instanceof BitmapDrawable) {
            BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
            if (bitmapDrawable.getBitmap() != null) {
                return (i5 == bitmapDrawable.getBitmap().getWidth() && i11 == bitmapDrawable.getBitmap().getHeight()) ? bitmapDrawable.getBitmap() : Bitmap.createScaledBitmap(bitmapDrawable.getBitmap(), i5, i11, true);
            }
            throw new IllegalArgumentException("bitmap is null");
        }
        Rect bounds = drawable.getBounds();
        int i13 = bounds.left;
        int i14 = bounds.top;
        int i15 = bounds.right;
        int i16 = bounds.bottom;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
        drawable.setBounds(0, 0, i5, i11);
        drawable.draw(new Canvas(bitmapCreateBitmap));
        drawable.setBounds(i13, i14, i15, i16);
        return bitmapCreateBitmap;
    }

    public static final ComponentKey a(Context context, String str) throws NumberFormatException {
        ComponentName componentNameUnflattenFromString;
        UserHandle userHandleMyUserHandle;
        int iS0 = r70.k.S0(str, "#", 0, false, 6);
        if (iS0 != -1) {
            String strSubstring = str.substring(0, iS0);
            Intrinsics.f(strSubstring, "substring(...)");
            String strSubstring2 = str.substring(iS0 + 1);
            Intrinsics.f(strSubstring2, "substring(...)");
            long j11 = Long.parseLong(strSubstring2);
            componentNameUnflattenFromString = ComponentName.unflattenFromString(strSubstring);
            userHandleMyUserHandle = ((ja.h) ja.h.f69294h.h(context)).e(j11);
        } else {
            componentNameUnflattenFromString = ComponentName.unflattenFromString(str);
            userHandleMyUserHandle = Process.myUserHandle();
        }
        if (userHandleMyUserHandle == null || componentNameUnflattenFromString == null) {
            return null;
        }
        return new ComponentKey(componentNameUnflattenFromString, userHandleMyUserHandle);
    }

    public static final fz.u b(Context context) {
        y2 y2Var = y2.f51877a;
        int iD0 = y2Var.D0(context.getResources());
        ComponentName componentName = k0.f77184z;
        int iH = ul.b.H(iD0);
        return new fz.u(iH, iD0, (fz.d) y2Var.i().l(), ((gz.j) y2.F0().l()).b(context, iH));
    }

    public static final fz.u c(Context context, int i5, int i11, fz.d dVar, String str) {
        e10.w wVar = e10.w.f51855b;
        gz.i iVar = gz.j.Companion;
        iVar.getClass();
        Object objDecodeFromString = gz.j.f58651g;
        try {
            wVar.getClass();
            objDecodeFromString = wVar.decodeFromString(iVar.serializer(), str);
        } catch (Exception unused) {
        }
        return new fz.u(i5, i11, dVar, ((gz.j) objDecodeFromString).b(context, i5));
    }

    public static final void d(final o0.a0 a0Var, b2.t tVar, final o0.z zVar, final p1 p1Var, final float f11, final k0.h hVar, g0.m0 m0Var, boolean z11, n1 n1Var, final Function1 function1, p1.o oVar, final int i5) {
        final b2.t tVar2;
        final g0.m0 m0Var2;
        final boolean z12;
        final n1 n1Var2;
        n1 n1VarA;
        b2.t tVar3;
        int i11;
        g0.m0 m0Var3;
        int i12;
        boolean z13;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-578931208);
        int i13 = i5 | (tVar4.f(a0Var) ? 4 : 2) | 48 | (tVar4.f(zVar) ? 256 : 128) | (tVar4.f(p1Var) ? 2048 : 1024) | 373317632;
        int i14 = tVar4.h(function1) ? 4 : 2;
        if (tVar4.S(i13 & 1, ((306783379 & i13) == 306783378 && (i14 & 3) == 2) ? false : true)) {
            tVar4.X();
            int i15 = i5 & 1;
            Object obj = p1.n.f81514a;
            if (i15 == 0 || tVar4.B()) {
                c0.y yVarA = u1.a(tVar4);
                boolean zF = tVar4.f(yVarA);
                Object objP = tVar4.P();
                if (zF || objP == obj) {
                    objP = new g0.j(yVarA);
                    tVar4.m0(objP);
                }
                g0.j jVar = (g0.j) objP;
                n1VarA = o1.a(tVar4);
                tVar3 = b2.r.f17024a;
                i11 = i14;
                m0Var3 = jVar;
                i12 = i13 & (-1908408321);
                z13 = true;
            } else {
                tVar4.V();
                tVar3 = tVar;
                n1VarA = n1Var;
                i12 = i13 & (-1908408321);
                i11 = i14;
                m0Var3 = m0Var;
                z13 = z11;
            }
            tVar4.q();
            d1 d1Var = d1.f56493a;
            float fA = hVar.a();
            int i16 = (i12 & 14) | 48 | ((i12 >> 3) & 896);
            boolean z14 = ((((i16 & 14) ^ 6) > 4 && tVar4.f(a0Var)) || (i16 & 6) == 4) | ((((i16 & 896) ^ 384) > 256 && tVar4.f(p1Var)) || (i16 & 384) == 256);
            Object objP2 = tVar4.P();
            if (z14 || objP2 == obj) {
                objP2 = new o0.w(new o0.c(p1Var, a0Var, hVar));
                tVar4.m0(objP2);
            }
            boolean z15 = z13;
            n1 n1Var3 = n1VarA;
            b2.t tVar5 = tVar3;
            bh.g.k(zVar, (o0.w) objP2, tVar5, p1Var, m0Var3, z15, n1Var3, f11, fA, function1, tVar4, ((i12 << 3) & 57344) | ((i12 >> 6) & 14) | 3120 | 818085888, (i11 << 3) & 112);
            tVar2 = tVar5;
            n1Var2 = n1Var3;
            z12 = z15;
            m0Var2 = m0Var3;
        } else {
            tVar4.V();
            tVar2 = tVar;
            m0Var2 = m0Var;
            z12 = z11;
            n1Var2 = n1Var;
        }
        t1 t1VarU = tVar4.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2(tVar2, zVar, p1Var, f11, hVar, m0Var2, z12, n1Var2, function1, i5) { // from class: o0.b

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ b2.t f78709b;

                /* renamed from: c, reason: collision with root package name */
                public final /* synthetic */ z f78710c;

                /* renamed from: d, reason: collision with root package name */
                public final /* synthetic */ p1 f78711d;

                /* renamed from: e, reason: collision with root package name */
                public final /* synthetic */ float f78712e;

                /* renamed from: f, reason: collision with root package name */
                public final /* synthetic */ k0.h f78713f;

                /* renamed from: g, reason: collision with root package name */
                public final /* synthetic */ g0.m0 f78714g;

                /* renamed from: h, reason: collision with root package name */
                public final /* synthetic */ boolean f78715h;

                /* renamed from: i, reason: collision with root package name */
                public final /* synthetic */ n1 f78716i;

                /* renamed from: j, reason: collision with root package name */
                public final /* synthetic */ Function1 f78717j;

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj2, Object obj3) {
                    ((Integer) obj3).getClass();
                    int iL = p1.a0.l(1769473);
                    e0.d(this.f78708a, this.f78709b, this.f78710c, this.f78711d, this.f78712e, this.f78713f, this.f78714g, this.f78715h, this.f78716i, this.f78717j, (p1.o) obj2, iL);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void g(final b2.t tVar, final String str, final Function0 function0, final Function1 function1, p1.o oVar, final int i5) {
        int i11;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(2009080522);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(str) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.h(function0) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.h(function1) ? 2048 : 1024;
        }
        if ((i11 & 1171) == 1170 && tVar2.E()) {
            tVar2.V();
        } else {
            Context context = (Context) tVar2.j(AndroidCompositionLocals_androidKt.f14166b);
            y2.f51877a.getClass();
            s2 s2VarF0 = y2.f0();
            tVar2.b0(-1180187305);
            e1 e1VarA = androidx.compose.runtime.d.a(s2VarF0.c(), s2VarF0.l(), null, tVar2, 0, 2);
            q00.l lVar = new q00.l(s2VarF0, e1VarA);
            tVar2.p(false);
            int i12 = (int) (((gy.c) e1VarA.getValue()).f58249b * 100);
            s2 s2VarB = y2.b(context);
            tVar2.b0(-1180187305);
            e1 e1VarA2 = androidx.compose.runtime.d.a(s2VarB.c(), s2VarB.l(), null, tVar2, 0, 2);
            tVar2.p(false);
            e3.a(j4.c(((tz.g) e1VarA2.getValue()).o.d((g30.b) g30.b.f57016l.h(context))), null, null, x1.f.d(1611459958, new b00.y0(str, function0, tVar, i12, function1, lVar), tVar2), tVar2, 3072, 6);
            tVar2 = tVar2;
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: b00.v0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    ab.e0.g(tVar, str, function0, function1, (p1.o) obj, p1.a0.l(i5 | 1));
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final long h(float f11, float f12) {
        return (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
    }

    public static final o50.f0 i(String urlString) {
        Intrinsics.g(urlString, "urlString");
        o50.a0 a0Var = new o50.a0();
        o50.b0.b(a0Var, urlString);
        return a0Var.b();
    }

    public static final tz.w j(g30.c cVar) {
        int iB;
        boolean zI = x7.f.I(cVar.f57030d, 2);
        boolean zI2 = x7.f.I(cVar.f57030d, 1);
        int i5 = cVar.f57027a;
        if (i5 == 0) {
            UInt.Companion companion = UInt.f71696b;
            iB = -12566464;
        } else if (zI2 || y2.f51877a.G1()) {
            tz.c.Companion.getClass();
            iB = -1;
        } else if (zI) {
            tz.c.Companion.getClass();
            iB = -16777216;
        } else {
            if (r4.a.h(i5) >= 0.18d) {
                double[] dArr = new double[3];
                r4.a.i(dArr, i5);
                iB = r4.a.b(40.0d, dArr[1], dArr[2]);
            } else {
                iB = i5;
            }
            UInt.Companion companion2 = UInt.f71696b;
        }
        UInt.Companion companion3 = UInt.f71696b;
        int i11 = cVar.f57028b;
        Integer numValueOf = Integer.valueOf(i11);
        if (i11 == 0) {
            numValueOf = null;
        }
        tz.c cVar2 = numValueOf != null ? new tz.c(numValueOf.intValue()) : null;
        int i12 = cVar.f57029c;
        Integer numValueOf2 = Integer.valueOf(i12);
        if (i12 == 0) {
            numValueOf2 = null;
        }
        return new tz.w(iB, i5, cVar2, numValueOf2 != null ? new tz.c(numValueOf2.intValue()) : null);
    }

    public static final void k(z.o0 o0Var, Object obj, Object obj2) {
        int i5 = o0Var.i(obj);
        boolean z11 = i5 < 0;
        Object obj3 = z11 ? null : o0Var.f97868c[i5];
        if (obj3 != null) {
            if (obj3 instanceof p0) {
                ((p0) obj3).d(obj2);
            } else if (obj3 != obj2) {
                p0 p0Var = new p0();
                p0Var.d(obj3);
                p0Var.d(obj2);
                obj2 = p0Var;
            }
            obj2 = obj3;
        }
        if (!z11) {
            o0Var.f97868c[i5] = obj2;
            return;
        }
        int i11 = ~i5;
        o0Var.f97867b[i11] = obj;
        o0Var.f97868c[i11] = obj2;
    }

    public static SetBuilder l(SetBuilder setBuilder) {
        MapBuilder mapBuilder = setBuilder.f71786a;
        mapBuilder.b();
        return mapBuilder.f71769i > 0 ? setBuilder : SetBuilder.f71785b;
    }

    public static void m(long j11, m90.g gVar, int i5, ArrayList arrayList, int i11, int i12, ArrayList arrayList2) {
        int i13;
        int i14;
        ArrayList arrayList3;
        long j12;
        int i15;
        int i16 = i5;
        ArrayList arrayList4 = arrayList;
        ArrayList arrayList5 = arrayList2;
        if (i11 >= i12) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        for (int i17 = i11; i17 < i12; i17++) {
            if (((m90.j) arrayList4.get(i17)).c() < i16) {
                throw new IllegalArgumentException("Failed requirement.");
            }
        }
        m90.j jVar = (m90.j) arrayList.get(i11);
        m90.j jVar2 = (m90.j) arrayList4.get(i12 - 1);
        if (i16 == jVar.c()) {
            int iIntValue = ((Number) arrayList5.get(i11)).intValue();
            int i18 = i11 + 1;
            m90.j jVar3 = (m90.j) arrayList4.get(i18);
            i13 = i18;
            i14 = iIntValue;
            jVar = jVar3;
        } else {
            i13 = i11;
            i14 = -1;
        }
        if (jVar.j(i16) == jVar2.j(i16)) {
            int iMin = Math.min(jVar.c(), jVar2.c());
            int i19 = 0;
            for (int i21 = i16; i21 < iMin && jVar.j(i21) == jVar2.j(i21); i21++) {
                i19++;
            }
            long j13 = 4;
            long j14 = (gVar.f76126b / j13) + j11 + 2 + i19 + 1;
            gVar.j0(-i19);
            gVar.j0(i14);
            int i22 = i16 + i19;
            while (i16 < i22) {
                gVar.j0(jVar.j(i16) & 255);
                i16++;
            }
            if (i13 + 1 == i12) {
                if (i22 != ((m90.j) arrayList4.get(i13)).c()) {
                    throw new IllegalStateException("Check failed.");
                }
                gVar.j0(((Number) arrayList5.get(i13)).intValue());
                return;
            } else {
                m90.g gVar2 = new m90.g();
                gVar.j0(((int) ((gVar2.f76126b / j13) + j14)) * (-1));
                m(j14, gVar2, i22, arrayList4, i13, i12, arrayList5);
                gVar.I(gVar2);
                return;
            }
        }
        int i23 = 1;
        for (int i24 = i13 + 1; i24 < i12; i24++) {
            if (((m90.j) arrayList4.get(i24 - 1)).j(i16) != ((m90.j) arrayList4.get(i24)).j(i16)) {
                i23++;
            }
        }
        long j15 = 4;
        long j16 = (gVar.f76126b / j15) + j11 + 2 + (i23 * 2);
        gVar.j0(i23);
        gVar.j0(i14);
        for (int i25 = i13; i25 < i12; i25++) {
            int iJ = ((m90.j) arrayList4.get(i25)).j(i16);
            if (i25 == i13 || iJ != ((m90.j) arrayList4.get(i25 - 1)).j(i16)) {
                gVar.j0(iJ & 255);
            }
        }
        m90.g gVar3 = new m90.g();
        int i26 = i13;
        while (i26 < i12) {
            byte bJ = ((m90.j) arrayList4.get(i26)).j(i16);
            int i27 = i26 + 1;
            int i28 = i27;
            while (true) {
                if (i28 >= i12) {
                    i28 = i12;
                    break;
                } else if (bJ != ((m90.j) arrayList4.get(i28)).j(i16)) {
                    break;
                } else {
                    i28++;
                }
            }
            if (i27 == i28 && i16 + 1 == ((m90.j) arrayList4.get(i26)).c()) {
                gVar.j0(((Number) arrayList5.get(i26)).intValue());
                arrayList3 = arrayList5;
                j12 = j16;
                i15 = i28;
            } else {
                gVar.j0(((int) ((gVar3.f76126b / j15) + j16)) * (-1));
                arrayList3 = arrayList5;
                j12 = j16;
                i15 = i28;
                m(j12, gVar3, i16 + 1, arrayList, i26, i15, arrayList3);
                arrayList4 = arrayList;
            }
            j16 = j12;
            i26 = i15;
            arrayList5 = arrayList3;
        }
        gVar.I(gVar3);
    }

    public static void q(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    public static final void r(long j11, d1 d1Var) {
        if (d1Var == d1.f56493a) {
            if (y3.a.g(j11) != Integer.MAX_VALUE) {
                return;
            }
            j0.b.c("Vertically scrollable component was measured with an infinity maximum height constraints, which is disallowed. One of the common reasons is nesting layouts like LazyColumn and Column(Modifier.verticalScroll()). If you want to add a header before the list of items please add a header as a separate item() before the main items() inside the LazyColumn scope. There could be other reasons for this to happen: your ComposeView was added into a LinearLayout with some weight, you applied Modifier.wrapContentSize(unbounded = true) or wrote a custom layout. Please try to remove the source of infinite constraints in the hierarchy above the scrolling container.");
        } else {
            if (y3.a.h(j11) != Integer.MAX_VALUE) {
                return;
            }
            j0.b.c("Horizontally scrollable component was measured with an infinity maximum width constraints, which is disallowed. One of the common reasons is nesting layouts like LazyRow and Row(Modifier.horizontalScroll()). If you want to add a header before the list of items please add a header as a separate item() before the main items() inside the LazyRow scope. There could be other reasons for this to happen: your ComposeView was added into a LinearLayout with some weight, you applied Modifier.wrapContentSize(unbounded = true) or wrote a custom layout. Please try to remove the source of infinite constraints in the hierarchy above the scrolling container.");
        }
    }

    public static int t(Comparable comparable, Comparable comparable2) {
        if (comparable == comparable2) {
            return 0;
        }
        if (comparable == null) {
            return -1;
        }
        if (comparable2 == null) {
            return 1;
        }
        return comparable.compareTo(comparable2);
    }

    public static z.o0 u() {
        long[] jArr = z0.f97875a;
        return new z.o0();
    }

    public static final q3.q v(Context context) {
        return new q3.q(new jx.v(context, 1), new q3.d(Build.VERSION.SDK_INT >= 31 ? q3.c0.f83543a.a(context) : 0));
    }

    public static String w(Map editsMap) {
        Intrinsics.g(editsMap, "editsMap");
        StringBuilder sb2 = new StringBuilder();
        for (Map.Entry entry : editsMap.entrySet()) {
            String str = (String) entry.getKey();
            op.g gVar = (op.g) entry.getValue();
            sb2.append(str + ":" + gVar.b() + "|" + gVar.c() + ";");
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public static View x(int i5, View view) {
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i11 = 0; i11 < childCount; i11++) {
            View viewFindViewById = viewGroup.getChildAt(i11).findViewById(i5);
            if (viewFindViewById != null) {
                return viewFindViewById;
            }
        }
        return null;
    }

    public static final int y(int i5, List list) {
        int i11;
        int i12 = ((m3.r) b70.g.h1(list)).f75964c;
        if (i5 > ((m3.r) b70.g.h1(list)).f75964c) {
            s3.a.a("Index " + i5 + " should be less or equal than last line's end " + i12);
        }
        int size = list.size() - 1;
        int i13 = 0;
        while (true) {
            if (i13 > size) {
                i11 = -(i13 + 1);
                break;
            }
            i11 = (i13 + size) >>> 1;
            m3.r rVar = (m3.r) list.get(i11);
            char c11 = rVar.f75963b > i5 ? (char) 1 : rVar.f75964c <= i5 ? (char) 65535 : (char) 0;
            if (c11 >= 0) {
                if (c11 <= 0) {
                    break;
                }
                size = i11 - 1;
            } else {
                i13 = i11 + 1;
            }
        }
        if (i11 >= 0 && i11 < list.size()) {
            return i11;
        }
        StringBuilder sbJ = u4.j(i11, "Found paragraph index ", " should be in range [0, ");
        sbJ.append(list.size());
        sbJ.append(").\nDebug info: index=");
        sbJ.append(i5);
        sbJ.append(", paragraphs=[");
        sbJ.append(a4.b.b(list, null, new p2(11), 31));
        sbJ.append(AbstractJsonLexerKt.END_LIST);
        s3.a.a(sbJ.toString());
        return i11;
    }

    public static final int z(int i5, List list) {
        int size = list.size() - 1;
        int i11 = 0;
        while (i11 <= size) {
            int i12 = (i11 + size) >>> 1;
            m3.r rVar = (m3.r) list.get(i12);
            char c11 = rVar.f75965d > i5 ? (char) 1 : rVar.f75966e <= i5 ? (char) 65535 : (char) 0;
            if (c11 < 0) {
                i11 = i12 + 1;
            } else {
                if (c11 <= 0) {
                    return i12;
                }
                size = i12 - 1;
            }
        }
        return -(i11 + 1);
    }

    public abstract void P(d4.f fVar, d4.f fVar2);

    public abstract void Q(d4.f fVar, Thread thread);

    public abstract boolean n(d4.g gVar, d4.c cVar, d4.c cVar2);

    public abstract boolean o(d4.g gVar, Object obj, Object obj2);

    public abstract boolean p(d4.g gVar, d4.f fVar, d4.f fVar2);
}
