.class public Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;,
        Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;
    }
.end annotation


# static fields
.field public static final AUDIO_INPUT_FLAG_FAST:I = 0x1

.field public static final AUDIO_INPUT_FLAG_ROW:I = 0x4

.field public static final AUDIO_OUTPUT_FLAG_DEEP_BUFFER:I = 0x8

.field public static final AUDIO_OUTPUT_FLAG_FAST:I = 0x4


# instance fields
.field public playParamsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;",
            ">;"
        }
    .end annotation
.end field

.field public recordParamsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;",
            ">;"
        }
    .end annotation
.end field


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
