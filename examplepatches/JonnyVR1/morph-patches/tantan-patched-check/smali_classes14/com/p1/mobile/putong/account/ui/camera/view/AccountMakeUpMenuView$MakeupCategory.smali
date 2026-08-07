.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;
.super Lcom/p1/mobile/putong/account/data/CameraCategory;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MakeupCategory"
.end annotation


# static fields
.field public static final MAKEUP_BLUSH:Ljava/lang/String; = "\u816e\u7ea2"

.field public static final MAKEUP_EYEBROW:Ljava/lang/String; = "\u7709\u6bdb"

.field public static final MAKEUP_EYESHADOW:Ljava/lang/String; = "\u773c\u5986"

.field public static final MAKEUP_FACIAL:Ljava/lang/String; = "\u4fee\u5bb9"

.field public static final MAKEUP_LIP:Ljava/lang/String; = "\u53e3\u7ea2"

.field public static final MAKEUP_PUPIL:Ljava/lang/String; = "\u7f8e\u77b3"

.field public static final NONE:I = -0x1

.field public static final TYPE_MAKEUP_ALL_MAKEUP:I = 0x3ec

.field public static final TYPE_MAKEUP_BEAUTYAUTO:I = 0x3e8

.field public static final TYPE_MAKEUP_BEAUTYFACE:I = 0x3e9

.field public static final TYPE_MAKEUP_MICROPLASTIC:I = 0x3ea

.field public static final TYPE_MAKEUP_STYLE_MAKEUP:I = 0x3eb


# instance fields
.field public all:F

.field public extType:I

.field public normalImgId:I

.field public selectedImgId:I

.field public subMenu:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/data/CameraCategory;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraCategory;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 6
    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->subMenu:Ljava/util/List;

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->normalImgId:I

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->selectedImgId:I

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->id:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->id:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->category:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->category:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->cameraUpdateTime:D

    .line 31
    .line 32
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->cameraUpdateTime:D

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->type:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->type:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->status:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->status:Ljava/lang/String;

    .line 41
    .line 42
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 43
    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/account/data/CameraCategory;Ljava/lang/String;II)V
    .locals 1

    const/16 v0, 0x3ec

    .line 59
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;-><init>(Lcom/p1/mobile/putong/account/data/CameraCategory;I)V

    .line 60
    iput-object p2, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->type:Ljava/lang/String;

    .line 61
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->normalImgId:I

    .line 62
    iput p4, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->selectedImgId:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2

    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraCategory;-><init>()V

    const/4 v0, -0x1

    .line 53
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 54
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->subMenu:Ljava/util/List;

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->normalImgId:I

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->selectedImgId:I

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->name:Ljava/lang/String;

    .line 58
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 1

    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraCategory;-><init>()V

    const/4 v0, -0x1

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->subMenu:Ljava/util/List;

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraCategory;->name:Ljava/lang/String;

    .line 49
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 50
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->normalImgId:I

    .line 51
    iput p4, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->selectedImgId:I

    return-void
.end method


# virtual methods
.method public isNone()Z
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;->extType:I

    .line 3
    .line 4
    if-ne v0, p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method
