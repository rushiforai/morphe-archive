.class public Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;
.super Lcom/p1/mobile/putong/account/data/CameraSticker;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MakeupItem"
.end annotation


# static fields
.field public static final BACK:Ljava/lang/String; = "back"

.field public static final LOCAL:Ljava/lang/String; = "local"

.field public static final NONE:Ljava/lang/String; = "none"


# instance fields
.field public all:F

.field public beautyParameterMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public hasNeg:Z

.field public lut:F

.field public normalImgId:I

.field public selectedImgId:I

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/data/CameraSticker;Ljava/lang/String;)V
    .locals 1

    .line 62
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraSticker;-><init>()V

    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->resource:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->resource:Ljava/lang/String;

    .line 67
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->resourceMD5:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->resourceMD5:Ljava/lang/String;

    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->minVersion:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->minVersion:Ljava/lang/String;

    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->category:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->category:Ljava/lang/String;

    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 71
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 72
    iget p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    iput p1, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 73
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/account/data/CameraSticker;Ljava/lang/String;F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraSticker;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->resource:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->resource:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->resourceMD5:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->resourceMD5:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->minVersion:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->minVersion:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->category:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->category:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 35
    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 39
    .line 40
    iget p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 41
    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 43
    .line 44
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 45
    .line 46
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->all:F

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIF)V
    .locals 0

    .line 56
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraSticker;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 58
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 59
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 60
    iput p4, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->selectedImgId:I

    .line 61
    iput p5, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->all:F

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIZ)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraSticker;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 52
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 53
    iput p4, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->selectedImgId:I

    .line 54
    iput-boolean p5, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->hasNeg:Z

    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->F(Ljava/lang/String;)F

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->all:F

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;II)V"
        }
    .end annotation

    .line 74
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraSticker;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 76
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 77
    iput p4, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 78
    iput p5, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->selectedImgId:I

    .line 79
    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    return-void
.end method

.method public static none()Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/p1/mobile/putong/account/data/CameraSticker;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "none"

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;-><init>(Lcom/p1/mobile/putong/account/data/CameraSticker;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public isLocal()Z
    .locals 1

    .line 1
    const-string v0, "local"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isNone()Z
    .locals 1

    .line 1
    const-string v0, "none"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
