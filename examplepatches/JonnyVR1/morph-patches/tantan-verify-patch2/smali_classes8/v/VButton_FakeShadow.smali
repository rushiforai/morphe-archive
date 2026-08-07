.class public Lv/VButton_FakeShadow;
.super Lv/VButton;
.source "SourceFile"


# instance fields
.field public c:Ll/oqh0;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VButton;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oqh0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/oqh0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lv/VButton_FakeShadow;->c:Ll/oqh0;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lv/VButton_FakeShadow;->d:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, v0, v1}, Lv/VButton_FakeShadow;->e(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 20
    invoke-direct {p0, p1, p2}, Lv/VButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance v0, Ll/oqh0;

    invoke-direct {v0}, Ll/oqh0;-><init>()V

    iput-object v0, p0, Lv/VButton_FakeShadow;->c:Ll/oqh0;

    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lv/VButton_FakeShadow;->d:Z

    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, p2, v0}, Lv/VButton_FakeShadow;->e(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lv/VButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    new-instance v0, Ll/oqh0;

    invoke-direct {v0}, Ll/oqh0;-><init>()V

    iput-object v0, p0, Lv/VButton_FakeShadow;->c:Ll/oqh0;

    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lv/VButton_FakeShadow;->d:Z

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lv/VButton_FakeShadow;->e(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lv/VButton_FakeShadow;->c:Ll/oqh0;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Lv/VButton_FakeShadow;->f()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2, p0}, Ll/oqh0;->a(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    sget p0, Ll/abc0;->l6:I

    .line 2
    .line 3
    return p0
.end method

.method public setDrawShadow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VButton_FakeShadow;->d:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
