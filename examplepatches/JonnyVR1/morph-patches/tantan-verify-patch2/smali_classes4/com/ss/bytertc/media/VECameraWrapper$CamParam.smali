.class public Lcom/ss/bytertc/media/VECameraWrapper$CamParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CamParam"
.end annotation


# instance fields
.field public antiShake:Z

.field public camera2:Z

.field public camid:Ljava/lang/String;

.field public enable_dynamic_fps:Z

.field public faceAE:Z

.field public fps:I

.field public height:I

.field public min_dynamic_fps:I

.field public pos:I

.field public useTexture:Z

.field public wideAngle:Z

.field public width:I


# direct methods
.method public constructor <init>(IIIILjava/lang/String;ZZZZZZI)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "CamParam"
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->pos:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camid:Ljava/lang/String;

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 15
    .line 16
    iput-boolean p7, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camera2:Z

    .line 17
    .line 18
    iput-boolean p8, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->faceAE:Z

    .line 19
    .line 20
    iput-boolean p9, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->wideAngle:Z

    .line 21
    .line 22
    iput-boolean p10, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->antiShake:Z

    .line 23
    .line 24
    iput-boolean p11, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->enable_dynamic_fps:Z

    .line 25
    .line 26
    iput p12, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->min_dynamic_fps:I

    .line 27
    .line 28
    return-void
.end method
