.class public Lcom/momo/mcamera/mask/CXSkinBeautyManger;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

.field private mCXSkinVersion:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentLevel:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCurrentLevel:F

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mContext:Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    sget-object v0, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType2:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXSkinVersion:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mContext:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXSkinVersion:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getSkinBeautyFilter()Lcom/momo/mcamera/mask/BaseSkinComposeFilter;
    .locals 4

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/CXSkinBeautyManger$1;->$SwitchMap$com$momo$mcamera$mask$VersionType$CXSkinVersion:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXSkinVersion:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance v0, Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    sget v2, Lcom/momo/mcamera/mask/SkinChooseFilter;->SKIN_TYPE_SMOOTH_8_0:I

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-direct {v0, v3, v1, v2}, Lcom/momo/mcamera/mask/SkinChooseFilter;-><init>(ZFI)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 31
    .line 32
    :goto_0
    new-instance v0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance v0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    new-instance v0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 54
    .line 55
    :goto_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 56
    .line 57
    return-object p0
.end method

.method public getSkinLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCurrentLevel:F

    .line 2
    .line 3
    return p0
.end method

.method public setSkinLevel(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/BaseSkinComposeFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/BaseSkinComposeFilter;->setSmoothLevel(F)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Lcom/momo/mcamera/mask/CXSkinBeautyManger;->mCurrentLevel:F

    .line 9
    .line 10
    invoke-static {}, Ll/mpc0;->a()Ll/mpc0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Ll/mpc0;->b(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
