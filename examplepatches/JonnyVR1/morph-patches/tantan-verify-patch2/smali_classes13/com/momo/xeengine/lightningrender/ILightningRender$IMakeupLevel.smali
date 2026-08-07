.class public interface abstract Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;
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
    name = "IMakeupLevel"
.end annotation


# static fields
.field public static final MAKEUP_ALL:Ljava/lang/String; = "makeup_all"

.field public static final MAKEUP_BLUSH:Ljava/lang/String; = "makeup_blush"

.field public static final MAKEUP_EYEBROW:Ljava/lang/String; = "makeup_eyebrow"

.field public static final MAKEUP_EYES:Ljava/lang/String; = "makeup_eyes"

.field public static final MAKEUP_FACIAL:Ljava/lang/String; = "makeup_facial"

.field public static final MAKEUP_LIPS:Ljava/lang/String; = "makeup_lips"

.field public static final MAKEUP_LUT:Ljava/lang/String; = "makeup_lut"

.field public static final MAKEUP_PUPIL:Ljava/lang/String; = "makeup_pupil"

.field public static final MakeupLipsEffectBling:I = 0x4

.field public static final MakeupLipsEffectMatte:I = 0x2

.field public static final MakeupLipsEffectMirror:I = 0x3

.field public static final MakeupLipsEffectNone:I = 0x0

.field public static final MakeupLipsEffectWater:I = 0x1


# virtual methods
.method public abstract addEffect(Ljava/lang/String;)V
.end method

.method public abstract disableEffect(Ljava/lang/String;Z)V
.end method

.method public abstract getEnable()Z
.end method

.method public abstract isEffectActive()Z
.end method

.method public abstract isStickerEffectActive()Z
.end method

.method public abstract removeAll()V
.end method

.method public abstract removeWithType(Ljava/lang/String;)V
.end method

.method public abstract setEffectIntensity(Ljava/lang/String;F)V
.end method

.method public abstract setEnable(Z)V
.end method

.method public abstract setLipsEffect(I)V
.end method

.method public abstract setValue(Ljava/lang/String;F)V
.end method
