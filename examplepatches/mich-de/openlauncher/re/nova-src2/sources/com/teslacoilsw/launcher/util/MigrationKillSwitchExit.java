package com.teslacoilsw.launcher.util;

import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/util/MigrationKillSwitchExit;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class MigrationKillSwitchExit extends RuntimeException {
    public MigrationKillSwitchExit(String str) {
        super("site=".concat(str));
    }
}
