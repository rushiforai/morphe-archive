package com.instabridge.ai.client;

import com.instabridge.ai.protocol.ProgressUpdate;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0002¨\u0006\u0003"}, d2 = {"toProgressUpdate", "Lcom/instabridge/ai/protocol/ProgressUpdate;", "Lcom/instabridge/ai/client/ProgressRaw;", "instabridge-ai-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiClientKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final ProgressUpdate toProgressUpdate(ProgressRaw progressRaw) {
        return new ProgressUpdate(progressRaw.getPhase(), progressRaw.getMessage(), progressRaw.getSequence());
    }
}
