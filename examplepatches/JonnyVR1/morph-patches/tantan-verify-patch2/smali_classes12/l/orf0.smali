.class public Ll/orf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/momo/mcamera/mask/SkinChooseFilter;

.field private b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(I)Ll/jt2;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/orf0;->b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/orf0;->b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Ll/orf0;->b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 17
    .line 18
    iput-object v1, p0, Ll/orf0;->a:Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_1
    iget-object p1, p0, Ll/orf0;->a:Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    new-instance p1, Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    sget v2, Lcom/momo/mcamera/mask/SkinChooseFilter;->SKIN_TYPE_SMOOTH_DEFAULT:I

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-direct {p1, v3, v0, v2}, Lcom/momo/mcamera/mask/SkinChooseFilter;-><init>(ZFI)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/orf0;->a:Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 35
    .line 36
    :cond_2
    iget-object p1, p0, Ll/orf0;->a:Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 37
    .line 38
    iput-object v1, p0, Ll/orf0;->b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 39
    .line 40
    return-object p1
.end method

.method public b()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/orf0;->b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->getSmoothLevel()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/orf0;->a:Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/SkinChooseFilter;->getSkinLevel()F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public c(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/orf0;->a:Lcom/momo/mcamera/mask/SkinChooseFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/SkinChooseFilter;->setSmoothLevel(F)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/orf0;->b:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->setSmoothLevel(F)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method
