.class public Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field private final dynamicNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

.field private final textureChangeFilter:Lcom/momo/mcamera/mask/hotdance/TextureChangeFilter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/mask/hotdance/TextureChangeFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/mcamera/mask/hotdance/TextureChangeFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->textureChangeFilter:Lcom/momo/mcamera/mask/hotdance/TextureChangeFilter;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->dynamicNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->dynamicNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMusicBeatDetect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->dynamicNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->onMusicBeatDetect(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
