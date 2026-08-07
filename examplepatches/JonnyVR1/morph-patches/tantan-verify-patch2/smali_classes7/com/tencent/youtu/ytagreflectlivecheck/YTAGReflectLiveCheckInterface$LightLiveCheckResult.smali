.class public interface abstract Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LightLiveCheckResult"
.end annotation


# static fields
.field public static final AUTH_FAILED:I = 0x1

.field public static final COLOR_DATA_ERROR:I = 0x1f4

.field public static final FINISH_ERRORBASE:I = 0x12c

.field public static final INIT_ERROR:I = 0x190

.field public static final INIT_ERRORBASE:I = 0x64

.field public static final NOT_INIT_MODEL:I = 0x2

.field public static final NOT_SET_RGBREQUEST:I = 0x4

.field public static final NOT_SET_UPLOADREQUEST:I = 0x5

.field public static final REFLECT_ERRORBASE:I = 0xc8

.field public static final SUCCESS:I = 0x0

.field public static final USER_CANCEL:I = 0x3


# virtual methods
.method public abstract onFailed(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onReflectLiveImgData(Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;)V
.end method

.method public abstract onSuccess(Lcom/tencent/youtu/ytagreflectlivecheck/a;)V
.end method
