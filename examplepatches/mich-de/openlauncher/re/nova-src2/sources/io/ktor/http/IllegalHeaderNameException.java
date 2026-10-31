package io.ktor.http;

import a2.c;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lio/ktor/http/IllegalHeaderNameException;", "Ljava/lang/IllegalArgumentException;", "Lkotlin/IllegalArgumentException;", "ktor-http"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class IllegalHeaderNameException extends IllegalArgumentException {
    public IllegalHeaderNameException(String headerName, int i5) {
        Intrinsics.g(headerName, "headerName");
        StringBuilder sb2 = new StringBuilder("Header name '");
        sb2.append(headerName);
        sb2.append("' contains illegal character '");
        sb2.append(headerName.charAt(i5));
        sb2.append("' (code ");
        super(c.m(sb2, headerName.charAt(i5) & 255, ')'));
    }
}
