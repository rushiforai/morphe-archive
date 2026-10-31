package com.amplitude.core.events;

import com.amplitude.common.jvm.ConsoleLogger;
import com.amplitude.core.utilities.JSONKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010#\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\u0010\u0007\n\u0002\u0010\b\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010 \n\u0002\u0010$\n\u0002\b\b\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u0000 )2\u00020\u0001:\u0001)B\u0005¢\u0006\u0002\u0010\u0002J\u0016\u0010\u000b\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\u000b\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010\u000b\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010\u000b\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J!\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010\u0012\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ\u0006\u0010\u001d\u001a\u00020\u0000J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010\u001e\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ!\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010\u001f\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ!\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010 \u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ!\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010!\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0001J!\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010\"\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0001J!\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013¢\u0006\u0002\u0010\u0015J!\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0013¢\u0006\u0002\u0010\u0016J!\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\u0010\u0017J!\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00100\u0013¢\u0006\u0002\u0010\u0018J!\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00110\u0013¢\u0006\u0002\u0010\u0019J!\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0013¢\u0006\u0002\u0010\u001aJ\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0014J\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000fJ\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0010J\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0011J\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005J\u001c\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00010\u001bJ\"\u0010#\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u00052\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\u001cJ\"\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020'2\u0006\u0010\f\u001a\u00020\u00052\b\u0010\r\u001a\u0004\u0018\u00010\u0001H\u0002J\u000e\u0010(\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u0005R\u001c\u0010\u0003\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001f\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00048F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006*"}, d2 = {"Lcom/amplitude/core/events/Identify;", b.f42142b, "()V", "_properties", b.f42142b, b.f42142b, "properties", "getProperties", "()Ljava/util/Map;", "propertySet", b.f42142b, "add", "property", "value", b.f42142b, b.f42142b, b.f42142b, b.f42142b, "append", b.f42142b, b.f42142b, "(Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/amplitude/core/events/Identify;", "(Ljava/lang/String;[Ljava/lang/Double;)Lcom/amplitude/core/events/Identify;", "(Ljava/lang/String;[Ljava/lang/Float;)Lcom/amplitude/core/events/Identify;", "(Ljava/lang/String;[Ljava/lang/Integer;)Lcom/amplitude/core/events/Identify;", "(Ljava/lang/String;[Ljava/lang/Long;)Lcom/amplitude/core/events/Identify;", "(Ljava/lang/String;[Ljava/lang/String;)Lcom/amplitude/core/events/Identify;", b.f42142b, b.f42142b, "clearAll", "postInsert", "preInsert", "prepend", "remove", "set", "setOnce", "setUserProperty", b.f42142b, "operation", "Lcom/amplitude/core/events/IdentifyOperation;", "unset", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class Identify {

    @NotNull
    public static final String UNSET_VALUE = "-";

    @NotNull
    private final Set<String> propertySet = new LinkedHashSet();

    @NotNull
    private final Map<String, Object> _properties = new LinkedHashMap();

    private final synchronized void setUserProperty(IdentifyOperation operation, String property, Object value) {
        if (property.length() == 0) {
            ConsoleLogger.INSTANCE.getLogger().warn("Attempting to perform operation " + operation.getOperationType() + " with a null or empty string property, ignoring");
            return;
        }
        if (value == null) {
            ConsoleLogger.INSTANCE.getLogger().warn("Attempting to perform operation " + operation.getOperationType() + " with null value for property " + property + ", ignoring");
            return;
        }
        if (this._properties.containsKey(IdentifyOperation.CLEAR_ALL.getOperationType())) {
            ConsoleLogger.INSTANCE.getLogger().warn("This Identify already contains a $clearAll operation, ignoring operation %s");
            return;
        }
        if (this.propertySet.contains(property)) {
            ConsoleLogger.INSTANCE.getLogger().warn("Already used property " + property + " in previous operation, ignoring operation " + operation.getOperationType());
            return;
        }
        if (!this._properties.containsKey(operation.getOperationType())) {
            this._properties.put(operation.getOperationType(), new LinkedHashMap());
        }
        Object obj = this._properties.get(operation.getOperationType());
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.MutableMap<kotlin.String, kotlin.Any>");
        TypeIntrinsics.c(obj).put(property, value);
        this.propertySet.add(property);
    }

    @NotNull
    public final Identify add(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.ADD, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.APPEND, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final synchronized Identify clearAll() {
        this._properties.clear();
        this._properties.put(IdentifyOperation.CLEAR_ALL.getOperationType(), UNSET_VALUE);
        return this;
    }

    @NotNull
    public final synchronized Map<String, Object> getProperties() {
        return JSONKt.deepCopy(this._properties);
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.POST_INSERT, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PREPEND, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.REMOVE, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, boolean value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET_ONCE, property, Boolean.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify unset(@NotNull String property) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.UNSET, property, UNSET_VALUE);
        return this;
    }

    @NotNull
    public final Identify add(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.ADD, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.APPEND, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.POST_INSERT, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PREPEND, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.REMOVE, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, double value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET_ONCE, property, Double.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify add(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.ADD, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.APPEND, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.POST_INSERT, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PREPEND, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.REMOVE, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, float value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET_ONCE, property, Float.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify add(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.ADD, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.APPEND, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.POST_INSERT, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PREPEND, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.REMOVE, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, int value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET_ONCE, property, Integer.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.APPEND, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.POST_INSERT, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.PREPEND, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.REMOVE, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, long value) {
        Intrinsics.g(property, "property");
        setUserProperty(IdentifyOperation.SET_ONCE, property, Long.valueOf(value));
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull String value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Map<String, ? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull List<? extends Object> value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Boolean[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Double[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Float[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Integer[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Long[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify append(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.APPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify postInsert(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.POST_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify preInsert(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PRE_INSERT, property, value);
        return this;
    }

    @NotNull
    public final Identify prepend(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.PREPEND, property, value);
        return this;
    }

    @NotNull
    public final Identify remove(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.REMOVE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull String[] value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }

    @NotNull
    public final Identify set(@NotNull String property, @NotNull Object value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET, property, value);
        return this;
    }

    @NotNull
    public final Identify setOnce(@NotNull String property, @NotNull Object value) {
        Intrinsics.g(property, "property");
        Intrinsics.g(value, "value");
        setUserProperty(IdentifyOperation.SET_ONCE, property, value);
        return this;
    }
}
