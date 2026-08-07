.class public abstract Lcom/momo/xeengine/xnative/XETouchDispatcherNative;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


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


# virtual methods
.method public native nativeGetWindowHeight(J)I
.end method

.method public native nativeGetWindowWidth(J)I
.end method

.method public native nativeHandleTouchHitTest(J)Z
.end method

.method public native nativeHandleTouchesBegin(JI[I[F[F)V
.end method

.method public native nativeHandleTouchesEnd(JI[I[F[F)V
.end method

.method public native nativeHandleTouchesMove(JI[I[F[F)V
.end method
