.class public Lcom/imomo/momo/mediaencoder/EncodeParam;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final RC_METHOD_CRF:I = 0x1

.field public static final RC_METHOD_DEFAULT:I = 0x0

.field public static final RC_METHOD_VBR:I = 0x2


# instance fields
.field public bFrameNum:I

.field public bitsRate:I

.field public enableCabac:I

.field public frameRate:I

.field public genThreads:I

.field public gopSize:I

.field public inputHeight:I

.field public inputWidth:I

.field public meMethod:I

.field public meRange:I

.field public multiSlice:I

.field public psnr:I

.field public qPMax:I

.field public qPMin:I

.field public rcMethod:I

.field public rfConstant:I

.field public slicedThreads:I

.field public subPelRefine:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->inputWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->inputHeight:I

    .line 8
    .line 9
    const/16 v1, 0x14

    .line 10
    .line 11
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->gopSize:I

    .line 12
    .line 13
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->frameRate:I

    .line 14
    .line 15
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->bFrameNum:I

    .line 16
    .line 17
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->qPMin:I

    .line 18
    .line 19
    const/16 v1, 0x32

    .line 20
    .line 21
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->qPMax:I

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->rcMethod:I

    .line 25
    .line 26
    const/high16 v2, 0x500000

    .line 27
    .line 28
    iput v2, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->bitsRate:I

    .line 29
    .line 30
    const/16 v2, 0x17

    .line 31
    .line 32
    iput v2, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->rfConstant:I

    .line 33
    .line 34
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->slicedThreads:I

    .line 35
    .line 36
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->multiSlice:I

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    iput v2, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->meRange:I

    .line 40
    .line 41
    iput v1, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->genThreads:I

    .line 42
    .line 43
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->subPelRefine:I

    .line 44
    .line 45
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->meMethod:I

    .line 46
    .line 47
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->enableCabac:I

    .line 48
    .line 49
    iput v0, p0, Lcom/imomo/momo/mediaencoder/EncodeParam;->psnr:I

    .line 50
    .line 51
    return-void
.end method
