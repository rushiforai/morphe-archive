.class public interface abstract Lcom/immomo/momomediaext/filter/beauty/IBeautyAdapter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BEAUTY_VERSION_BYTE_DANCE:I = 0x2

.field public static final BEAUTY_VERSION_DOKI:I = 0x1

.field public static final BEAUTY_VERSION_ENGINE:I = 0x3

.field public static final BEAUTY_VERSION_NONE:I = -0x1

.field public static final BEAUTY_VERSION_OLD:I


# virtual methods
.method public abstract changeFaceWarp(IFF)V
.end method

.method public abstract changeLookupFilter(Ljava/lang/String;)V
.end method

.method public abstract changeWarpScaleFactor(F)V
.end method

.method public abstract enableDraw(Z)V
.end method

.method public abstract forbidBeauty(Z)V
.end method

.method public abstract isBeautyEnable()Z
.end method

.method public abstract isEnableDraw()Z
.end method

.method public abstract release()V
.end method

.method public abstract removeMakeup(Ljava/lang/String;)Z
.end method

.method public abstract removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V
.end method

.method public abstract switchBeauty(I)V
.end method

.method public abstract switchSmoothFilter(Z)V
.end method

.method public abstract updateByteDanceFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z
.end method

.method public abstract updateFaceBeautyValue(Ljava/lang/String;F)Z
.end method

.method public abstract updateLookupFilterIntensity(F)V
.end method

.method public abstract updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
.end method

.method public abstract updateMakeupValue(Ljava/lang/String;Ljava/lang/String;F)Z
.end method
