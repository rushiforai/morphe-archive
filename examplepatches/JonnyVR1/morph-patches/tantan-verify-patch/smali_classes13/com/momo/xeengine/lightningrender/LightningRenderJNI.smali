.class abstract Lcom/momo/xeengine/lightningrender/LightningRenderJNI;
.super Lcom/momo/xeengine/xnative/XEEngineInstanceJava;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field protected lightningRenderPointer:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public native nativeAddStickerModel(JJ)V
.end method

.method public native nativeClearAllEngineModel(J)V
.end method

.method public native nativeClearEngineModel(JLjava/lang/String;)V
.end method

.method public native nativeClearEngineModelWithId(JLjava/lang/String;)V
.end method

.method public native nativeClearLookup0(J)V
.end method

.method public native nativeClearLookup1(J)V
.end method

.method public native nativeDisableMakeupEffect(JLjava/lang/String;Z)V
.end method

.method public native nativeDrawFrame(JII)V
.end method

.method public native nativeGetBeautyBodyEnable(J)Z
.end method

.method public native nativeGetBeautyEnable(J)Z
.end method

.method public native nativeGetCartoonFaceEnable(J)Z
.end method

.method public native nativeGetEngineInstance(J)J
.end method

.method public native nativeGetLookupEnable(J)Z
.end method

.method public native nativeGetMakeupEnable(J)Z
.end method

.method public native nativeGetSmoothVersion(J)I
.end method

.method public native nativeGetWhiteVersion(J)I
.end method

.method public native nativeIsMakeupEffectActive(J)Z
.end method

.method public native nativeIsStickerMakeupEffectActive(J)Z
.end method

.method public native nativeLightningRenderCreate(ZLjava/lang/String;)J
.end method

.method public native nativeLightningRenderRelease(J)V
.end method

.method public native nativeLoadSticker(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J
.end method

.method public native nativeMakeupLevelAddEffect(JLjava/lang/String;)V
.end method

.method public native nativeMakeupLevelRemoveAll(J)V
.end method

.method public native nativeMakeupLevelRemoveWithType(JLjava/lang/String;)V
.end method

.method public native nativeMakeupLevelSetEffectIntensity(JLjava/lang/String;F)V
.end method

.method public native nativeMakeupLipsSetLipsEffect(JI)V
.end method

.method public native nativePreprocessor(J[BIIIILjava/util/Map;Ljava/util/Map;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J[BIIII",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation
.end method

.method public native nativeRenderTest(J)Z
.end method

.method public native nativeSetBeautyBodyEnable(JZ)V
.end method

.method public native nativeSetBeautyEnable(JZ)V
.end method

.method public native nativeSetCartoonFaceEnable(JZ)V
.end method

.method public native nativeSetFaceBeautyValue(JLjava/lang/String;F)V
.end method

.method public native nativeSetFullSmoothEnable(JZ)V
.end method

.method public native nativeSetLookup0Intensity(JF)V
.end method

.method public native nativeSetLookup0Path(JLjava/lang/String;)V
.end method

.method public native nativeSetLookup1Intensity(JF)V
.end method

.method public native nativeSetLookup1Path(JLjava/lang/String;)V
.end method

.method public native nativeSetLookupEnable(JZ)V
.end method

.method public native nativeSetMakeupEnable(JZ)V
.end method

.method public native nativeSetTextureData(JLjava/lang/String;[BII)V
.end method

.method public native nativeSwitchSkinSmooth(JI)V
.end method

.method public native nativeSwitchSkinV3WhiteVersion(JI)V
.end method

.method public native nativeSwitchSkinWhite(JI)V
.end method

.method public native nativeSwitchV3DegreeSubVersion(JI)V
.end method

.method public abstract onStickerPlayCompleted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JII)V
.end method
