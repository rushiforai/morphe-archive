.class public abstract Lcom/momo/mcamera/mask/FaceDetectFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;
    }
.end annotation


# instance fields
.field public parentFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract cancelDraw()V
.end method

.method public abstract clearPoints()V
.end method

.method public lockTexture()V
    .locals 0

    return-void
.end method

.method public pauseBitmapCache()V
    .locals 0

    return-void
.end method

.method public abstract resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
.end method

.method public resumeBitmapCache()V
    .locals 0

    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 0

    return-void
.end method

.method public abstract setMMCVInfo(Ll/omw;)V
.end method

.method public unlockTexture()V
    .locals 0

    return-void
.end method
