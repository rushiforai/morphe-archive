.class public Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private drawBodyWarpDstFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

.field private drawBodyWarpSrcFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpSrcFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpDstFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpSrcFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpSrcFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpDstFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpDstFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpDstFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpSrcFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpGroupFilter;->drawBodyWarpDstFilter:Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->setMMCVInfo(Ll/omw;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
