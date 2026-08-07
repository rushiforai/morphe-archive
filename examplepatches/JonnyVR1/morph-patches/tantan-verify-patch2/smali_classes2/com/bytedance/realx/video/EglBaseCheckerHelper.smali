.class public Lcom/bytedance/realx/video/EglBaseCheckerHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static eglContextChecker:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/bytedance/realx/video/EglBase$EglContextChecker;",
            ">;"
        }
    .end annotation
.end field


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

.method public static EglContextDestoryEnd()V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->eglContextChecker:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->eglContextChecker:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/bytedance/realx/video/EglBase$EglContextChecker;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase$EglContextChecker;->EglContextDestoryEnd()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static EglContextDestoryStart()V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->eglContextChecker:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->eglContextChecker:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/bytedance/realx/video/EglBase$EglContextChecker;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase$EglContextChecker;->EglContextDestoryStart()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static setEglContextChecker(Lcom/bytedance/realx/video/EglBase$EglContextChecker;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->eglContextChecker:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method
