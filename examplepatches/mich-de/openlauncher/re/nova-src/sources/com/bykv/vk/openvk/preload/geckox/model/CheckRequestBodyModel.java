package com.bykv.vk.openvk.preload.geckox.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class CheckRequestBodyModel {
    private Common common;
    private Map<String, Map<String, Object>> custom;
    private Map<String, List<ChannelInfo>> deployment;
    private Map<String, Object> deployments;
    private Map<String, Map<String, LocalChannel>> local;

    public static class Channel {
        String channelName;
        public String localVersion;

        public Channel(String str) {
            this.channelName = str;
        }

        public JSONObject toJson() {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("c", this.channelName);
                jSONObject.put("l_v", this.localVersion);
                return jSONObject;
            } catch (Throwable unused) {
                return null;
            }
        }
    }

    public static class ChannelInfo {
        private String channel;
        private long localVersion;

        public ChannelInfo(String str, long j11) {
            this.channel = str;
            this.localVersion = j11;
        }

        public JSONObject toJson() {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("channel", this.channel);
                jSONObject.put("local_version", this.localVersion);
                return jSONObject;
            } catch (Throwable unused) {
                return null;
            }
        }
    }

    public static class Channels {
        public List<Channel> channels = new ArrayList();

        public JSONObject toJson() {
            JSONObject jSONObject = new JSONObject();
            try {
                if (this.channels != null) {
                    JSONArray jSONArray = new JSONArray();
                    for (int i5 = 0; i5 < this.channels.size(); i5++) {
                        jSONArray.put(this.channels.get(i5).toJson());
                    }
                    jSONObject.put("channels", jSONArray);
                }
            } catch (Throwable unused) {
            }
            return jSONObject;
        }
    }

    public static class Group {
        public String groupName;
        public List<TargetChannel> targetChannels;

        public JSONObject toJson() {
            try {
                JSONObject jSONObject = new JSONObject();
                List<TargetChannel> list = this.targetChannels;
                if (list != null && !list.isEmpty()) {
                    JSONArray jSONArray = new JSONArray();
                    for (int i5 = 0; i5 < this.targetChannels.size(); i5++) {
                        jSONArray.put(this.targetChannels.get(i5).toJson());
                    }
                    jSONObject.put("target_channels", jSONArray);
                }
                jSONObject.put("group_name", this.groupName);
                return jSONObject;
            } catch (Throwable unused) {
                return null;
            }
        }
    }

    public enum GroupType {
        NORMAL("normal"),
        HIGHPRIORITY("high_priority");

        private String value;

        GroupType(String str) {
            this.value = str;
        }

        public final String getValue() {
            return this.value;
        }
    }

    public static class LocalChannel {
        public Long localVersion;

        public JSONObject toJson() {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("l_v", this.localVersion);
                return jSONObject;
            } catch (Throwable unused) {
                return null;
            }
        }
    }

    public static class ProcessorParams {
        public String domain;
    }

    public static class TargetChannel {
        public String channelName;
        public Long targetVersion;

        public TargetChannel() {
        }

        public JSONObject toJson() {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("c", this.channelName);
                jSONObject.put("t_v", this.targetVersion);
                return jSONObject;
            } catch (Throwable unused) {
                return null;
            }
        }

        public TargetChannel(String str) {
            this.channelName = str;
        }

        public TargetChannel(String str, Long l9) {
            this.channelName = str;
            this.targetVersion = l9;
        }
    }

    public void putChannelInfo(String str, List<ChannelInfo> list) {
        if (this.deployment == null) {
            this.deployment = new HashMap();
        }
        this.deployment.put(str, list);
    }

    public void setCommon(Common common) {
        this.common = common;
    }

    public void setCustom(Map<String, Map<String, Object>> map) {
        this.custom = map;
    }

    public void setDeployments(Map<String, Object> map) {
        this.deployments = map;
    }

    public void setLocal(Map<String, Map<String, LocalChannel>> map) {
        this.local = map;
    }

    public String toJson() {
        try {
            JSONObject jSONObject = new JSONObject();
            Common common = this.common;
            if (common != null) {
                jSONObject.put("common", common.toJson());
            }
            Map<String, List<ChannelInfo>> map = this.deployment;
            if (map != null && !map.isEmpty()) {
                JSONObject jSONObject2 = new JSONObject();
                for (Map.Entry<String, List<ChannelInfo>> entry : this.deployment.entrySet()) {
                    JSONArray jSONArray = new JSONArray();
                    Iterator<ChannelInfo> it = entry.getValue().iterator();
                    while (it.hasNext()) {
                        JSONObject json = it.next().toJson();
                        if (json != null) {
                            jSONArray.put(json);
                        }
                    }
                    jSONObject2.put(entry.getKey(), jSONArray);
                }
                jSONObject.put("deployment", jSONObject2);
            }
            Map<String, Object> map2 = this.deployments;
            if (map2 != null && !map2.isEmpty()) {
                JSONObject jSONObject3 = new JSONObject();
                for (Map.Entry<String, Object> entry2 : this.deployments.entrySet()) {
                    Object value = entry2.getValue();
                    if (value != null) {
                        if (value instanceof Channels) {
                            jSONObject3.put(entry2.getKey(), ((Channels) value).toJson());
                        } else if (value instanceof Group) {
                            jSONObject3.put(entry2.getKey(), ((Group) value).toJson());
                        }
                    }
                }
                jSONObject.put("deployments", jSONObject3);
            }
            Map<String, Map<String, LocalChannel>> map3 = this.local;
            if (map3 != null && !map3.isEmpty()) {
                JSONObject jSONObject4 = new JSONObject();
                for (Map.Entry<String, Map<String, LocalChannel>> entry3 : this.local.entrySet()) {
                    String key = entry3.getKey();
                    Map<String, LocalChannel> value2 = entry3.getValue();
                    if (value2 != null && !value2.isEmpty()) {
                        JSONObject jSONObject5 = new JSONObject();
                        for (Map.Entry<String, LocalChannel> entry4 : value2.entrySet()) {
                            jSONObject5.put(entry4.getKey(), entry4.getValue().toJson());
                        }
                        jSONObject4.put(key, jSONObject5);
                    }
                }
                jSONObject.put("local", jSONObject4);
            }
            Map<String, Map<String, Object>> map4 = this.custom;
            if (map4 != null && !map4.isEmpty()) {
                JSONObject jSONObject6 = new JSONObject();
                for (Map.Entry<String, Map<String, Object>> entry5 : this.custom.entrySet()) {
                    String key2 = entry5.getKey();
                    Map<String, Object> value3 = entry5.getValue();
                    if (value3 != null && !value3.isEmpty()) {
                        JSONObject jSONObject7 = new JSONObject();
                        for (Map.Entry<String, Object> entry6 : value3.entrySet()) {
                            Object value4 = entry6.getValue();
                            if (value4 instanceof String) {
                                jSONObject7.put(entry6.getKey(), value4);
                            }
                        }
                        jSONObject6.put(key2, jSONObject7);
                    }
                }
                jSONObject.put("custom", jSONObject6);
            }
            return jSONObject.toString();
        } catch (Throwable unused) {
            return null;
        }
    }
}
