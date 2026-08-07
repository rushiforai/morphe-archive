.class public Lv/navigationbar/NavigationTabItem;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:Landroid/graphics/drawable/Drawable;

.field public final c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, p1, v0}, Lv/navigationbar/NavigationTabItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object v1, Ll/hhc0;->f2:[I

    .line 8
    .line 9
    invoke-static {p1, p2, v1}, Ll/t0j0;->t(Landroid/content/Context;Landroid/util/AttributeSet;[I)Ll/t0j0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/hhc0;->i2:I

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ll/t0j0;->p(I)Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Lv/navigationbar/NavigationTabItem;->a:Ljava/lang/CharSequence;

    .line 20
    .line 21
    sget p2, Ll/hhc0;->g2:I

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ll/t0j0;->g(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iput-object p2, p0, Lv/navigationbar/NavigationTabItem;->b:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    sget p2, Ll/hhc0;->h2:I

    .line 30
    .line 31
    invoke-virtual {p1, p2, v0}, Ll/t0j0;->n(II)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Lv/navigationbar/NavigationTabItem;->c:I

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/t0j0;->v()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Lv/navigationbar/NavigationTabItem;->a:Ljava/lang/CharSequence;

    .line 43
    .line 44
    iput-object p1, p0, Lv/navigationbar/NavigationTabItem;->b:Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    iput v0, p0, Lv/navigationbar/NavigationTabItem;->c:I

    .line 47
    .line 48
    return-void
.end method
