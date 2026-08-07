.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/JNIUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final TAG:Ljava/lang/String; = "LightLiveCheck"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getTimeval(J)Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;
    .locals 5

    .line 1
    new-instance v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;

    .line 2
    .line 3
    const-wide/16 v1, 0x3e8

    .line 4
    .line 5
    div-long v3, p0, v1

    .line 6
    .line 7
    mul-long/2addr p0, v1

    .line 8
    const-wide/32 v1, 0xf4240

    .line 9
    .line 10
    .line 11
    rem-long/2addr p0, v1

    .line 12
    long-to-int p0, p0

    .line 13
    invoke-direct {v0, v3, v4, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;-><init>(JI)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
