.class public abstract Lcom/ss/bytertc/ktv/IKTVPlayerEventHandler;
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


# virtual methods
.method public abstract onPlayProgress(Ljava/lang/String;J)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlayStateChanged(Ljava/lang/String;Lcom/ss/bytertc/ktv/data/PlayState;Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/bytertc/ktv/data/PlayState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
