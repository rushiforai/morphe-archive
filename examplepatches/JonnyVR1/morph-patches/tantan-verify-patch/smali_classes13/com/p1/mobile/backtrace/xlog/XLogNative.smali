.class public Lcom/p1/mobile/backtrace/xlog/XLogNative;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static setXLogger(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/backtrace/xlog/XLogNative;->setXLoggerNative(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native setXLoggerNative(Ljava/lang/String;)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method
