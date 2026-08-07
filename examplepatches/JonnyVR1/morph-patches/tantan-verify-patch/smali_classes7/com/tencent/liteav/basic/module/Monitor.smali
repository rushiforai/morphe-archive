.class public Lcom/tencent/liteav/basic/module/Monitor;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a()V
    .locals 0

    .line 7
    invoke-static {}, Lcom/tencent/liteav/basic/module/Monitor;->nativeUnInit()V

    return-void
.end method

.method public static a(IILjava/lang/String;Ljava/lang/String;II)V
    .locals 0

    .line 6
    invoke-static/range {p0 .. p5}, Lcom/tencent/liteav/basic/module/Monitor;->nativeOnlineLogWithLimit(IILjava/lang/String;Ljava/lang/String;II)V

    return-void
.end method

.method public static a(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 5
    invoke-static {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/module/Monitor;->nativeOnlineLog(ILjava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public static a(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/tencent/liteav/basic/module/Monitor;->nativeInit(Ljava/lang/String;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativeInit(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private static native nativeOnlineLog(ILjava/lang/String;Ljava/lang/String;I)V
.end method

.method private static native nativeOnlineLogWithLimit(IILjava/lang/String;Ljava/lang/String;II)V
.end method

.method private static native nativeUnInit()V
.end method
