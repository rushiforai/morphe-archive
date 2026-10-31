package io.branch.search.internal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.stream.JsonReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.y3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3463y3 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: io.branch.search.internal.y3$a */
    public static final class a {
        public static void a(InputStream inputStream, C3243l3 c3243l3) throws IOException {
            GsonBuilder gsonBuilder = new GsonBuilder();
            gsonBuilder.serializeNulls();
            Gson gsonCreate = gsonBuilder.create();
            JsonReader jsonReader = new JsonReader(new InputStreamReader(inputStream));
            try {
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    String strNextName = jsonReader.nextName();
                    if (strNextName != null) {
                        int iHashCode = strNextName.hashCode();
                        if (iHashCode != -1865302145) {
                            if (iHashCode != -1340071486) {
                                if (iHashCode != -1161803523) {
                                    if (iHashCode == 37109963 && strNextName.equals("request_id")) {
                                        String requestID = jsonReader.nextString();
                                        C3309p1.a(EnumC3131e9.BundleUpdates, "Received Request ID " + requestID);
                                        Intrinsics.f(requestID, "requestID");
                                        c3243l3.a(requestID);
                                    }
                                } else if (strNextName.equals("actions")) {
                                    jsonReader.beginArray();
                                    int i5 = 1;
                                    while (jsonReader.hasNext()) {
                                        C3159g3 c3159g3 = (C3159g3) gsonCreate.fromJson(jsonReader, C3159g3.class);
                                        C3309p1.a(EnumC3131e9.BundleUpdates, "getting next action " + i5 + ": " + c3159g3.f64551a);
                                        c3243l3.a(c3159g3);
                                        i5++;
                                    }
                                    jsonReader.endArray();
                                    C3309p1.a(EnumC3131e9.BundleUpdates, "Completed updating bundle actions");
                                }
                            } else if (strNextName.equals("api_remote_configuration")) {
                                Map map = (Map) gsonCreate.fromJson(jsonReader, Map.class);
                                if (map != null) {
                                    JSONObject jSONObject = new JSONObject(map);
                                    c3243l3.a(jSONObject);
                                    C3309p1.a(EnumC3131e9.BundleUpdates, "Received remote config " + jSONObject);
                                } else {
                                    C3309p1.a(EnumC3131e9.BundleUpdates, "Received remote config was null");
                                }
                            }
                        } else if (strNextName.equals("min_refresh_wait_millis")) {
                            long jNextLong = jsonReader.nextLong();
                            C3309p1.a(EnumC3131e9.BundleUpdates, "Received Bundle Update TTL " + jNextLong);
                            c3243l3.f64958e[0] = Long.valueOf(jNextLong);
                        }
                    }
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Unknown bundle item key " + strNextName);
                    jsonReader.skipValue();
                }
                jsonReader.endObject();
                Unit unit = Unit.f71706a;
                jsonReader.close();
            } finally {
            }
        }
    }
}
