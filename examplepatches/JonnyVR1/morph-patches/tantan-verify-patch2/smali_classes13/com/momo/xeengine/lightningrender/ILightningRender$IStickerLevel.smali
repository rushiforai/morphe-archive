.class public interface abstract Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/lightningrender/ILightningRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IStickerLevel"
.end annotation


# virtual methods
.method public abstract add(Lcom/momo/xeengine/lightningrender/StickerModel;)V
.end method

.method public abstract addListener(Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)V
.end method

.method public abstract removeAll()V
.end method

.method public abstract removeByBusinessType(Ljava/lang/String;)V
.end method

.method public abstract removeByID(Ljava/lang/String;)V
.end method

.method public abstract setTextureData(Ljava/lang/String;[BII)V
.end method
