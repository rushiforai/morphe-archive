package io.branch.search.internal;

import android.database.Cursor;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import io.branch.search.internal.EnumC3396u4;
import io.branch.search.internal.EnumC3449x6;
import io.branch.search.internal.requesthandler.model.Link;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.json.JsonElement;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;

/* renamed from: io.branch.search.internal.k, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3222k {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f64905a = new a();

    public static final Boolean a(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("can_use_uncached_images");
        if (cursor.getType(columnIndex) == 0) {
            return null;
        }
        return Boolean.valueOf(Boolean.parseBoolean(cursor.getString(columnIndex)));
    }

    public static final Float b(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("average_rating");
        if (cursor.getType(columnIndex) == 2) {
            return Float.valueOf(cursor.getFloat(columnIndex));
        }
        return null;
    }

    public static final Integer c(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("_order_rank");
        if (cursor.getType(columnIndex) == 1) {
            return Integer.valueOf(cursor.getInt(columnIndex));
        }
        return null;
    }

    public static final Long a(Cursor cursor, String str) {
        int columnIndex = cursor.getColumnIndex(str);
        if (cursor.getType(columnIndex) == 1) {
            return Long.valueOf(cursor.getLong(columnIndex));
        }
        return null;
    }

    public static final String b(Cursor cursor, String str) {
        int columnIndex = cursor.getColumnIndex(str);
        if (cursor.getType(columnIndex) == 0) {
            return null;
        }
        return cursor.getString(columnIndex);
    }

    /* renamed from: io.branch.search.internal.k$a */
    public static final class a implements InterfaceC3167gb<C3205j, List<? extends C3205j>> {
        @Override // io.branch.search.internal.InterfaceC3167gb
        public final Object a(Cursor cur, String sessionId) {
            EnumC3449x6 enumC3449x6;
            Iterable iterableN1;
            EnumC3379t4 enumC3379t4;
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(cur, "cur");
            String strB = C3222k.b(cur, "call_to_action");
            String strB2 = C3222k.b(cur, "campaign_type");
            String strB3 = C3222k.b(cur, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
            Long lA = C3222k.a(cur, "slot");
            String strB4 = C3222k.b(cur, "ranking_hint");
            String strB5 = C3222k.b(cur, "order_slot");
            String strB6 = C3222k.b(cur, "ad_state");
            String strB7 = C3222k.b(cur, "image_url");
            String strB8 = C3222k.b(cur, "linking");
            List<Link> listA = strB8 != null ? G8.a(new JSONArray(strB8)) : null;
            if (listA == null) {
                listA = EmptyList.f71733a;
            }
            List<Link> list = listA;
            Long lA2 = C3222k.a(cur, "is_ad_placeholder");
            String strB9 = C3222k.b(cur, "app_store_id");
            String strB10 = C3222k.b(cur, "app_icon_url");
            String strB11 = C3222k.b(cur, "entity_id");
            String strB12 = C3222k.b(cur, "app_name");
            String strB13 = C3222k.b(cur, "click_tracking_url");
            EnumC3449x6.a aVar = EnumC3449x6.Companion;
            String strB14 = C3222k.b(cur, "entity_type");
            aVar.getClass();
            EnumC3449x6[] enumC3449x6ArrValues = EnumC3449x6.values();
            int length = enumC3449x6ArrValues.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    enumC3449x6 = null;
                    break;
                }
                int i11 = i5;
                enumC3449x6 = enumC3449x6ArrValues[i11];
                int i12 = length;
                if (Intrinsics.b(enumC3449x6.f66269a, strB14)) {
                    break;
                }
                i5 = i11 + 1;
                length = i12;
            }
            if (enumC3449x6 == null) {
                enumC3449x6 = EnumC3449x6.Unknown;
            }
            EnumC3449x6 enumC3449x62 = enumC3449x6;
            Long lA3 = C3222k.a(cur, "user_id");
            String strB15 = C3222k.b(cur, PendingUpgradeStore.KEY_NAME);
            EnumC3396u4.a aVar2 = EnumC3396u4.Companion;
            String strB16 = C3222k.b(cur, "container_type");
            aVar2.getClass();
            EnumC3396u4 enumC3396u4A = EnumC3396u4.a.a(strB16);
            String[] columnNames = cur.getColumnNames();
            Intrinsics.f(columnNames, "columnNames");
            ArrayList arrayList = new ArrayList();
            int length2 = columnNames.length;
            int i13 = 0;
            while (i13 < length2) {
                int i14 = length2;
                String columnName = columnNames[i13];
                int i15 = i13;
                String str = strB3;
                Long l9 = lA;
                String str2 = strB4;
                List<String> listQ = ul.b.Q("ANA_", "ANL_", "ANR_", "ANH_");
                if (!(listQ instanceof Collection) || !listQ.isEmpty()) {
                    for (String str3 : listQ) {
                        Intrinsics.f(columnName, "columnName");
                        if (r70.j.I0(columnName, str3, false)) {
                            arrayList.add(columnName);
                            break;
                        }
                    }
                }
                i13 = i15 + 1;
                length2 = i14;
                strB3 = str;
                lA = l9;
                strB4 = str2;
            }
            String str4 = strB3;
            Long l11 = lA;
            String str5 = strB4;
            int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
            if (iD0 < 16) {
                iD0 = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String columnName2 = (String) it.next();
                Intrinsics.f(columnName2, "columnName");
                String strSubstring = columnName2.substring(4);
                Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                int columnIndex = cur.getColumnIndex(columnName2);
                linkedHashMap.put(strSubstring, (columnIndex == -1 || cur.isNull(columnIndex)) ? null : cur.getString(columnIndex));
            }
            KSerializer<List<JsonElement>> kSerializer = Zd.f63839a;
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                if (entry.getValue() != null) {
                    linkedHashMap2.put(entry.getKey(), entry.getValue());
                }
            }
            String strB17 = C3222k.b(cur, "app_click_tracking_url");
            String strB18 = C3222k.b(cur, "app_linking");
            Boolean boolA = C3222k.a(cur);
            String strB19 = C3222k.b(cur, "container_placements");
            if (strB19 == null || (iterableN1 = b70.g.N1(r70.k.i1(strB19, new String[]{","}, 6))) == null) {
                iterableN1 = EmptySet.f71734a;
            }
            ArrayList arrayList2 = new ArrayList(b70.c.u0(iterableN1, 10));
            Iterator it2 = iterableN1.iterator();
            while (it2.hasNext()) {
                String str6 = (String) it2.next();
                EnumC3379t4.Companion.getClass();
                Iterator it3 = it2;
                EnumC3379t4[] enumC3379t4ArrValues = EnumC3379t4.values();
                LinkedHashMap linkedHashMap3 = linkedHashMap2;
                int length3 = enumC3379t4ArrValues.length;
                int i16 = 0;
                while (true) {
                    if (i16 >= length3) {
                        enumC3379t4 = null;
                        break;
                    }
                    int i17 = i16;
                    enumC3379t4 = enumC3379t4ArrValues[i17];
                    int i18 = length3;
                    if (Intrinsics.b(enumC3379t4.f65858a, str6)) {
                        break;
                    }
                    i16 = i17 + 1;
                    length3 = i18;
                }
                if (enumC3379t4 == null) {
                    enumC3379t4 = EnumC3379t4.Unknown;
                }
                arrayList2.add(enumC3379t4);
                it2 = it3;
                linkedHashMap2 = linkedHashMap3;
            }
            return new C3205j(strB, strB2, str4, l11, str5, strB5, strB6, strB7, list, lA2, strB9, strB10, strB11, linkedHashMap2, strB12, strB13, enumC3449x62, lA3, strB15, enumC3396u4A, null, null, boolA, C3222k.b(cur, "uid"), b70.g.N1(arrayList2), strB18, C3222k.c(cur), strB17, C3222k.b(cur, "impression_url"), C3222k.b(cur, "screenshot_url"), null, false, false, null, C3222k.b(cur), C3222k.a(cur, "ratings_count"), C3222k.b(cur, "downloads_count"), C3222k.b(cur, "app_size"));
        }

        @Override // io.branch.search.internal.InterfaceC3167gb
        public final Object a(String sessionId, ArrayList queryResults) {
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(queryResults, "queryResults");
            return queryResults;
        }
    }
}
