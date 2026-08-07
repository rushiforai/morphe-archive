.class public Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;
.super Lcom/momo/mcamera/mask/BaseSkinComposeFilter;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

.field private mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

.field private mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BaseSkinComposeFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 10
    .line 11
    new-instance v0, Ll/qv40;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/qv40;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 22
    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->setSkinSmoothScale(F)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 29
    .line 30
    const v3, 0x3f666666    # 0.9f

    .line 31
    .line 32
    .line 33
    invoke-direct {v1, v3}, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;-><init>(F)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 37
    .line 38
    const/high16 v3, 0x3f000000    # 0.5f

    .line 39
    .line 40
    invoke-virtual {v1, v3, v3, v3, v2}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 44
    .line 45
    invoke-direct {v1}, Lcom/momo/mcamera/mask/skin/AISkinMixFilter;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 56
    .line 57
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 77
    .line 78
    const/4 v3, 0x0

    .line 79
    invoke-virtual {v1, v2, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    invoke-virtual {v1, v0, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 89
    .line 90
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinMixFilter:Lcom/momo/mcamera/mask/skin/AISkinMixFilter;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method


# virtual methods
.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->setMMCVInfo(Ll/omw;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mSkinBlurFilter:Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->setMMCVInfo(Ll/omw;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setSmoothLevel(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->setSkinSmoothScale(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
