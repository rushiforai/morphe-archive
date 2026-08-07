.class public Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "NativeSingScoringEventHandler"


# instance fields
.field private mSingScoringManager:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/SingScoringManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/SingScoringManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;->mSingScoringManager:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCurrentScoringInfo(Lcom/ss/bytertc/engine/data/SingScoringRealtimeInfo;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;->mSingScoringManager:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/ss/bytertc/engine/SingScoringManager;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/SingScoringManager;->getSingScoringEventHandler()Lcom/ss/bytertc/engine/ISingScoringEventHandler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0, p1}, Lcom/ss/bytertc/engine/ISingScoringEventHandler;->onCurrentScoringInfo(Lcom/ss/bytertc/engine/data/SingScoringRealtimeInfo;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
