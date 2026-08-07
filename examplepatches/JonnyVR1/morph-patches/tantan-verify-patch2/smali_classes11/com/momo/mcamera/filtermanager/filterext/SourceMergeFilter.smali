.class public Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field private overlayFilter:Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;

.field private triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->overlayFilter:Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;

    .line 5
    .line 6
    new-instance v0, Lcom/momo/mcamera/mask/NormalFilter;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, v0, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v1, p1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public setOverlayPosition(FFLandroid/graphics/PointF;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->overlayFilter:Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/e950;->setOverlayPosition(FFLandroid/graphics/PointF;F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceMergeFilter;->overlayFilter:Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
