.class public Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigGroupFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private drawFaceRigSrcFilter:Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigGroupFilter;->drawFaceRigSrcFilter:Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigGroupFilter;->drawFaceRigSrcFilter:Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigGroupFilter;->drawFaceRigSrcFilter:Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigGroupFilter;->drawFaceRigSrcFilter:Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
