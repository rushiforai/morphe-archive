package com.bykv.vk.openvk.preload.geckox.net;

import android.util.Pair;
import com.bykv.vk.openvk.preload.geckox.buffer.stream.BufferOutputStream;
import java.util.List;

/* loaded from: classes2.dex */
public interface INetWork {
    Response doGet(String str) throws Exception;

    Response doPost(String str, String str2) throws Exception;

    Response doPost(String str, List<Pair<String, String>> list) throws Exception;

    void downloadFile(String str, long j11, BufferOutputStream bufferOutputStream) throws Exception;

    void syncDoGet(String str);
}
