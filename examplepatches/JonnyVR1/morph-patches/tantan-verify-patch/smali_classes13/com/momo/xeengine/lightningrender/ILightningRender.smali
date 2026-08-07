.class public interface abstract Lcom/momo/xeengine/lightningrender/ILightningRender;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/IXEngine;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;,
        Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;,
        Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;,
        Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;,
        Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;
    }
.end annotation


# virtual methods
.method public abstract getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;
.end method

.method public abstract getCartoonFaceEnable()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;
.end method

.method public abstract getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;
.end method

.method public abstract getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;
.end method

.method public abstract getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;
.end method

.method public abstract init()V
.end method

.method public abstract preprocessor([BILandroid/util/Size;ILjava/util/Map;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroid/util/Size;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract render(II)V
.end method

.method public abstract renderTest()Z
.end method

.method public abstract renderTest(II)Z
.end method

.method public abstract runOnRenderThread(Ljava/lang/Runnable;)V
.end method

.method public abstract setCartoonFaceEnable(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
