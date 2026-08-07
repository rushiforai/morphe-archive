.class public Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;
.super Lcom/momo/mcamera/mask/BaseSkinComposeFilter;
.source "SourceFile"


# instance fields
.field private mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

.field private mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BaseSkinComposeFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 8
    .line 9
    new-instance v0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput v1, v0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinStep:I

    .line 18
    .line 19
    new-instance v0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    iput v1, v0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinStep:I

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setMMCVInfo(Ll/omw;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setMMCVInfo(Ll/omw;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setSmoothLevel(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setSkinParameter(FF)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setSkinParameter(FF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setSmoothingPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setMaskPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setMaskPath(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setType(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilter:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setType(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinComposeFilter;->mFaceSkinSmoothFilterMask:Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setType(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
