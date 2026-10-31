package com.google.firebase.crashlytics.internal.metadata;

import b.c0;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.common.CommonUtils;
import com.google.firebase.crashlytics.internal.persistence.FileStore;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import vm.c;

/* loaded from: classes.dex */
class MetaDataStore {
    private static final String KEY_USER_ID = "userId";
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private final FileStore fileStore;

    public MetaDataStore(FileStore fileStore) {
        this.fileStore = fileStore;
    }

    private static Map<String, String> jsonToKeysData(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        HashMap map = new HashMap();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            map.put(next, valueOrNull(jSONObject, next));
        }
        return map;
    }

    private static List<RolloutAssignment> jsonToRolloutsState(String str) throws JSONException {
        JSONArray jSONArray = new JSONObject(str).getJSONArray("rolloutsState");
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            String string = jSONArray.getString(i5);
            try {
                arrayList.add(RolloutAssignment.create(string));
            } catch (Exception e3) {
                Logger.getLogger().w("Failed de-serializing rollouts state. " + string, e3);
            }
        }
        return arrayList;
    }

    private String jsonToUserId(String str) throws JSONException {
        return valueOrNull(new JSONObject(str), KEY_USER_ID);
    }

    private static String keysDataToJson(Map<String, String> map) {
        return new JSONObject(map).toString();
    }

    private static String rolloutsStateToJson(List<RolloutAssignment> list) {
        HashMap map = new HashMap();
        JSONArray jSONArray = new JSONArray();
        for (int i5 = 0; i5 < list.size(); i5++) {
            try {
                jSONArray.put(new JSONObject(((c) RolloutAssignment.ROLLOUT_ASSIGNMENT_JSON_ENCODER).f(list.get(i5))));
            } catch (JSONException e3) {
                Logger.getLogger().w("Exception parsing rollout assignment!", e3);
            }
        }
        map.put("rolloutsState", jSONArray);
        return new JSONObject(map).toString();
    }

    private static void safeDeleteCorruptFile(File file) {
        if (file.exists() && file.delete()) {
            Logger.getLogger().i("Deleted corrupt file: " + file.getAbsolutePath());
        }
    }

    private static String userIdToJson(String str) throws JSONException {
        return new JSONObject(str) { // from class: com.google.firebase.crashlytics.internal.metadata.MetaDataStore.1
            final /* synthetic */ String val$userId;

            {
                this.val$userId = str;
                put(MetaDataStore.KEY_USER_ID, str);
            }
        }.toString();
    }

    private static String valueOrNull(JSONObject jSONObject, String str) {
        if (jSONObject.isNull(str)) {
            return null;
        }
        return jSONObject.optString(str, null);
    }

    public File getInternalKeysFileForSession(String str) {
        return this.fileStore.getSessionFile(str, UserMetadata.INTERNAL_KEYDATA_FILENAME);
    }

    public File getKeysFileForSession(String str) {
        return this.fileStore.getSessionFile(str, UserMetadata.KEYDATA_FILENAME);
    }

    public File getRolloutsStateForSession(String str) {
        return this.fileStore.getSessionFile(str, UserMetadata.ROLLOUTS_STATE_FILENAME);
    }

    public File getUserDataFileForSession(String str) {
        return this.fileStore.getSessionFile(str, UserMetadata.USERDATA_FILENAME);
    }

    public Map<String, String> readKeyData(String str) {
        return readKeyData(str, false);
    }

    public List<RolloutAssignment> readRolloutsState(String str) throws Throwable {
        FileInputStream fileInputStream;
        File rolloutsStateForSession = getRolloutsStateForSession(str);
        if (!rolloutsStateForSession.exists() || rolloutsStateForSession.length() == 0) {
            safeDeleteCorruptFile(rolloutsStateForSession, c0.k("The file has a length of zero for session: ", str));
            return Collections.EMPTY_LIST;
        }
        FileInputStream fileInputStream2 = null;
        try {
            try {
                fileInputStream = new FileInputStream(rolloutsStateForSession);
            } catch (Exception e3) {
                e = e3;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            List<RolloutAssignment> listJsonToRolloutsState = jsonToRolloutsState(CommonUtils.streamToString(fileInputStream));
            Logger.getLogger().d("Loaded rollouts state:\n" + listJsonToRolloutsState + "\nfor session " + str);
            CommonUtils.closeOrLog(fileInputStream, "Failed to close rollouts state file.");
            return listJsonToRolloutsState;
        } catch (Exception e11) {
            e = e11;
            fileInputStream2 = fileInputStream;
            Logger.getLogger().w("Error deserializing rollouts state.", e);
            safeDeleteCorruptFile(rolloutsStateForSession);
            CommonUtils.closeOrLog(fileInputStream2, "Failed to close rollouts state file.");
            return Collections.EMPTY_LIST;
        } catch (Throwable th3) {
            th = th3;
            fileInputStream2 = fileInputStream;
            CommonUtils.closeOrLog(fileInputStream2, "Failed to close rollouts state file.");
            throw th;
        }
    }

    /* JADX WARN: Type inference failed for: r3v2, types: [int] */
    public String readUserId(String str) throws Throwable {
        FileInputStream fileInputStream;
        File userDataFileForSession = getUserDataFileForSession(str);
        Closeable closeable = null;
        if (userDataFileForSession.exists()) {
            ?? r32 = (userDataFileForSession.length() > 0L ? 1 : (userDataFileForSession.length() == 0L ? 0 : -1));
            try {
                if (r32 != 0) {
                    try {
                        fileInputStream = new FileInputStream(userDataFileForSession);
                        try {
                            String strJsonToUserId = jsonToUserId(CommonUtils.streamToString(fileInputStream));
                            Logger.getLogger().d("Loaded userId " + strJsonToUserId + " for session " + str);
                            CommonUtils.closeOrLog(fileInputStream, "Failed to close user metadata file.");
                            return strJsonToUserId;
                        } catch (Exception e3) {
                            e = e3;
                            Logger.getLogger().w("Error deserializing user metadata.", e);
                            safeDeleteCorruptFile(userDataFileForSession);
                            CommonUtils.closeOrLog(fileInputStream, "Failed to close user metadata file.");
                            return null;
                        }
                    } catch (Exception e11) {
                        e = e11;
                        fileInputStream = null;
                    } catch (Throwable th2) {
                        th = th2;
                        CommonUtils.closeOrLog(closeable, "Failed to close user metadata file.");
                        throw th;
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                closeable = r32;
            }
        }
        Logger.getLogger().d("No userId set for session " + str);
        safeDeleteCorruptFile(userDataFileForSession);
        return null;
    }

    public void writeKeyData(String str, Map<String, String> map) {
        writeKeyData(str, map, false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [boolean] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v3, types: [java.io.Closeable] */
    public void writeRolloutState(String str, List<RolloutAssignment> list) {
        Throwable th2;
        BufferedWriter bufferedWriter;
        Exception e3;
        File rolloutsStateForSession = getRolloutsStateForSession(str);
        ?? IsEmpty = list.isEmpty();
        if (IsEmpty != 0) {
            safeDeleteCorruptFile(rolloutsStateForSession, c0.k("Rollout state is empty for session: ", str));
            return;
        }
        try {
            try {
                String strRolloutsStateToJson = rolloutsStateToJson(list);
                bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(rolloutsStateForSession), UTF_8));
                try {
                    bufferedWriter.write(strRolloutsStateToJson);
                    bufferedWriter.flush();
                    CommonUtils.closeOrLog(bufferedWriter, "Failed to close rollouts state file.");
                } catch (Exception e11) {
                    e3 = e11;
                    Logger.getLogger().w("Error serializing rollouts state.", e3);
                    safeDeleteCorruptFile(rolloutsStateForSession);
                    CommonUtils.closeOrLog(bufferedWriter, "Failed to close rollouts state file.");
                }
            } catch (Throwable th3) {
                th2 = th3;
                CommonUtils.closeOrLog(IsEmpty, "Failed to close rollouts state file.");
                throw th2;
            }
        } catch (Exception e12) {
            bufferedWriter = null;
            e3 = e12;
        } catch (Throwable th4) {
            IsEmpty = 0;
            th2 = th4;
            CommonUtils.closeOrLog(IsEmpty, "Failed to close rollouts state file.");
            throw th2;
        }
    }

    public void writeUserData(String str, String str2) {
        String strUserIdToJson;
        BufferedWriter bufferedWriter;
        File userDataFileForSession = getUserDataFileForSession(str);
        BufferedWriter bufferedWriter2 = null;
        try {
            try {
                strUserIdToJson = userIdToJson(str2);
                bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(userDataFileForSession), UTF_8));
            } catch (Exception e3) {
                e = e3;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            bufferedWriter.write(strUserIdToJson);
            bufferedWriter.flush();
            CommonUtils.closeOrLog(bufferedWriter, "Failed to close user metadata file.");
        } catch (Exception e11) {
            e = e11;
            bufferedWriter2 = bufferedWriter;
            Logger.getLogger().w("Error serializing user metadata.", e);
            CommonUtils.closeOrLog(bufferedWriter2, "Failed to close user metadata file.");
        } catch (Throwable th3) {
            th = th3;
            bufferedWriter2 = bufferedWriter;
            CommonUtils.closeOrLog(bufferedWriter2, "Failed to close user metadata file.");
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [int] */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.io.Closeable] */
    public Map<String, String> readKeyData(String str, boolean z11) throws Throwable {
        Throwable th2;
        FileInputStream fileInputStream;
        Exception e3;
        File internalKeysFileForSession = z11 ? getInternalKeysFileForSession(str) : getKeysFileForSession(str);
        if (!internalKeysFileForSession.exists() || internalKeysFileForSession.length() == 0) {
            safeDeleteCorruptFile(internalKeysFileForSession, c0.k("The file has a length of zero for session: ", str));
            return Collections.EMPTY_MAP;
        }
        try {
            try {
                fileInputStream = new FileInputStream(internalKeysFileForSession);
                try {
                    Map<String, String> mapJsonToKeysData = jsonToKeysData(CommonUtils.streamToString(fileInputStream));
                    CommonUtils.closeOrLog(fileInputStream, "Failed to close user metadata file.");
                    return mapJsonToKeysData;
                } catch (Exception e11) {
                    e3 = e11;
                    Logger.getLogger().w("Error deserializing user metadata.", e3);
                    safeDeleteCorruptFile(internalKeysFileForSession);
                    CommonUtils.closeOrLog(fileInputStream, "Failed to close user metadata file.");
                    return Collections.EMPTY_MAP;
                }
            } catch (Throwable th3) {
                th2 = th3;
                CommonUtils.closeOrLog(, "Failed to close user metadata file.");
                throw th2;
            }
        } catch (Exception e12) {
            fileInputStream = null;
            e3 = e12;
        } catch (Throwable th4) {
            ?? r12 = 0;
            th2 = th4;
            CommonUtils.closeOrLog(r12, "Failed to close user metadata file.");
            throw th2;
        }
    }

    public void writeKeyData(String str, Map<String, String> map, boolean z11) {
        String strKeysDataToJson;
        BufferedWriter bufferedWriter;
        File internalKeysFileForSession = z11 ? getInternalKeysFileForSession(str) : getKeysFileForSession(str);
        BufferedWriter bufferedWriter2 = null;
        try {
            try {
                strKeysDataToJson = keysDataToJson(map);
                bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(internalKeysFileForSession), UTF_8));
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e3) {
            e = e3;
        }
        try {
            bufferedWriter.write(strKeysDataToJson);
            bufferedWriter.flush();
            CommonUtils.closeOrLog(bufferedWriter, "Failed to close key/value metadata file.");
        } catch (Exception e11) {
            e = e11;
            bufferedWriter2 = bufferedWriter;
            Logger.getLogger().w("Error serializing key/value metadata.", e);
            safeDeleteCorruptFile(internalKeysFileForSession);
            CommonUtils.closeOrLog(bufferedWriter2, "Failed to close key/value metadata file.");
        } catch (Throwable th3) {
            th = th3;
            bufferedWriter2 = bufferedWriter;
            CommonUtils.closeOrLog(bufferedWriter2, "Failed to close key/value metadata file.");
            throw th;
        }
    }

    private static void safeDeleteCorruptFile(File file, String str) {
        if (file.exists() && file.delete()) {
            Logger.getLogger().i("Deleted corrupt file: " + file.getAbsolutePath() + "\nReason: " + str);
        }
    }
}
