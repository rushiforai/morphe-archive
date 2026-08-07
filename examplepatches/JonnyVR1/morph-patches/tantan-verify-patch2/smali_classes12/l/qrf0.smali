.class public Ll/qrf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/momo/mcamera/mask/FaceLightingFilter;

.field private b:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

.field private c:Lcom/momo/mcamera/mask/AISkinWhiteningFilter;

.field private d:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qrf0;->c:Lcom/momo/mcamera/mask/AISkinWhiteningFilter;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/qrf0;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public b(Landroid/content/Context;I)Ll/jt2;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_1

    .line 4
    .line 5
    iget-object p2, p0, Ll/qrf0;->b:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/qrf0;->c:Lcom/momo/mcamera/mask/AISkinWhiteningFilter;

    .line 10
    .line 11
    sget-object v0, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType1:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 12
    .line 13
    invoke-virtual {p2, p1, v0}, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->getSkinWhiteningFilter(Landroid/content/Context;Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;)Ll/jt2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 18
    .line 19
    iput-object p1, p0, Ll/qrf0;->b:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Ll/qrf0;->b:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 22
    .line 23
    iput-object v1, p0, Ll/qrf0;->a:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 24
    .line 25
    return-object p1

    .line 26
    :cond_1
    iget-object p2, p0, Ll/qrf0;->a:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 27
    .line 28
    if-nez p2, :cond_2

    .line 29
    .line 30
    iget-object p2, p0, Ll/qrf0;->c:Lcom/momo/mcamera/mask/AISkinWhiteningFilter;

    .line 31
    .line 32
    sget-object v0, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType2:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 33
    .line 34
    invoke-virtual {p2, p1, v0}, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->getSkinWhiteningFilter(Landroid/content/Context;Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;)Ll/jt2;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 39
    .line 40
    iput-object p1, p0, Ll/qrf0;->a:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Ll/qrf0;->a:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 43
    .line 44
    iput-object v1, p0, Ll/qrf0;->b:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 45
    .line 46
    return-object p1
.end method

.method public c(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qrf0;->d:F

    .line 2
    .line 3
    iget-object p0, p0, Ll/qrf0;->c:Lcom/momo/mcamera/mask/AISkinWhiteningFilter;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->setSkinLightLevel(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
