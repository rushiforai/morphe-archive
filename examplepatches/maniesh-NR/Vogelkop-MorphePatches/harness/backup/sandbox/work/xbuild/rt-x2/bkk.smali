.class public final Lbkk;
.super Lbud;
.source "SourceFile"

# interfaces
.implements Landroid/view/SubMenu;


# instance fields
.field public final d:Lqtd;


# direct methods
.method public constructor <init>(Landroid/content/Context;IIILjava/lang/CharSequence;)V
    .registers 6

    invoke-direct {p0, p1}, Lbud;-><init>(Landroid/content/Context;)V

    move-object p1, p0

    new-instance p0, Lqtd;

    invoke-direct/range {p0 .. p5}, Lqtd;-><init>(Lbud;IIILjava/lang/CharSequence;)V

    iput-object p0, p1, Lbkk;->d:Lqtd;

    return-void
.end method


# virtual methods
.method public final clearHeader()V
    .registers 1

    return-void
.end method

.method public final getItem()Landroid/view/MenuItem;
    .registers 1

    iget-object p0, p0, Lbkk;->d:Lqtd;

    return-object p0
.end method

.method public final setHeaderIcon(I)Landroid/view/SubMenu;
    .registers 2

    return-object p0
.end method

.method public final setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .registers 2

    .line 1
    return-object p0
.end method

.method public final setHeaderTitle(I)Landroid/view/SubMenu;
    .registers 2

    return-object p0
.end method

.method public final setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 2

    .line 1
    return-object p0
.end method

.method public final setHeaderView(Landroid/view/View;)Landroid/view/SubMenu;
    .registers 2

    return-object p0
.end method

.method public final setIcon(I)Landroid/view/SubMenu;
    .registers 3

    iget-object v0, p0, Lbkk;->d:Lqtd;

    invoke-virtual {v0, p1}, Lqtd;->setIcon(I)Landroid/view/MenuItem;

    return-object p0
.end method

.method public final setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .registers 3

    .line 6
    iget-object v0, p0, Lbkk;->d:Lqtd;

    invoke-virtual {v0, p1}, Lqtd;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-object p0
.end method
