.class public Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediaeffect/anim/IAnimListener;


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
.method public loadResError(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onFinished()V
    .locals 0

    return-void
.end method

.method public onLoadSuccess()V
    .locals 0

    .line 1
    return-void
.end method

.method public onLoadSuccess(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;)V
    .locals 0
    .param p1    # Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 2
    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onRepeat()V
    .locals 0

    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method

.method public onStep(ID)V
    .locals 0

    return-void
.end method
