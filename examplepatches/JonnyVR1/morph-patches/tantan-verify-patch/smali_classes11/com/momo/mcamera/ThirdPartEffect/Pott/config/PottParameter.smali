.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MAP_TYPE_CHINA:Ljava/lang/String; = "china"

.field public static final MAP_TYPE_WORLD:Ljava/lang/String; = "world"


# instance fields
.field public chinaCityCnt:I

.field public chinaProvinceCnt:I

.field public configResourcePath:Ljava/lang/String;

.field public countryCnt:I

.field public imageList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mapType:Ljava/lang/String;

.field public traveledLocations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field public useLocationPath:Ljava/lang/String;

.field public userHeadIconBitmap:Landroid/graphics/Bitmap;

.field public userHeadIcondPath:Ljava/lang/String;

.field public userIdBitmap:Landroid/graphics/Bitmap;

.field public userIdPath:Ljava/lang/String;

.field public userLocationBmpList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public userLocationList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public userNickNameBitmap:Landroid/graphics/Bitmap;

.field public userNickNamePath:Ljava/lang/String;

.field public worldCityCnt:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->traveledLocations:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "world"

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->mapType:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->imageList:Ljava/util/List;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationList:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationBmpList:Ljava/util/List;

    .line 35
    .line 36
    return-void
.end method
