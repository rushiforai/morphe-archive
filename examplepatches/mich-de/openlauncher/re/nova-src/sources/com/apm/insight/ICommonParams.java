package com.apm.insight;

import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public interface ICommonParams {
    Map<String, Object> getCommonParams();

    String getDid();

    List<String> getPatchInfo();

    Map<String, Integer> getPluginInfo();

    String getSessionId();

    long getUserId();
}
