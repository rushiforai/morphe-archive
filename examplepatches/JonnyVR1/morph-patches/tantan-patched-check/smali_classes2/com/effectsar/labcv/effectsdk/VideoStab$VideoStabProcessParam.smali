.class public Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/VideoStab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoStabProcessParam"
.end annotation


# instance fields
.field public fmt:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;

.field public frameType:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;

.field public frame_idx:I

.field public height:I

.field public open:Z

.field public step:I

.field public width:I


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
