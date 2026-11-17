package com.ss.android.ugc.aweme.commerce;

/** Compile/test fixture only; this class is supplied by TikTok at runtime. */
public class AwemeCommerceStruct {
    public long brandedContentType;
    public long brandOrganicType;
    public boolean isBrandedContent() { return brandedContentType > 0; }
    public boolean isBrandOrganicContent() { return brandOrganicType > 0; }
}
