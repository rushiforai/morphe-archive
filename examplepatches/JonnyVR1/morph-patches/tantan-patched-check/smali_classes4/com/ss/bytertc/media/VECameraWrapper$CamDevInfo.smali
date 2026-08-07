.class public Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CamDevInfo"
.end annotation


# instance fields
.field private id:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private pos:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;->name:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;->pos:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getID()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "CamDevInfo"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "CamDevInfo"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPosition()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "CamDevInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;->pos:I

    .line 2
    .line 3
    return p0
.end method
