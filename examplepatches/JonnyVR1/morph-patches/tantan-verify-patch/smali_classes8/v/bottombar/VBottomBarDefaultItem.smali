.class public Lv/bottombar/VBottomBarDefaultItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lv/bottombar/VBottomBar$b;


# instance fields
.field public a:Lv/bottombar/a;

.field public b:Lv/VText;

.field public c:Lv/RedPointView;

.field public d:Lv/VOnlineIndicator;

.field public e:Lv/VImage;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/bottombar/VBottomBarDefaultItem;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lv/bottombar/VBottomBarDefaultItem;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lv/bottombar/VBottomBarDefaultItem;->c()V

    return-void
.end method


# virtual methods
.method public a(ZZ)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v1

    .line 11
    :goto_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    iget-boolean v2, p0, Lv/bottombar/VBottomBarDefaultItem;->f:Z

    .line 18
    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    :goto_1
    return-void

    .line 22
    :cond_2
    if-eqz v0, :cond_3

    .line 23
    .line 24
    move p2, v1

    .line 25
    :cond_3
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBarDefaultItem;->d(ZZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, v0, Lv/bottombar/a;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 15
    .line 16
    iget-object v2, v0, Lv/bottombar/a;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v1, v0, Lv/bottombar/a;->i:Lv/bottombar/a$a;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-object v1, v1, Lv/bottombar/a$a;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 34
    .line 35
    iget-object v0, v0, Lv/bottombar/a;->i:Lv/bottombar/a$a;

    .line 36
    .line 37
    iget-object v0, v0, Lv/bottombar/a$a;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    sget v0, Ll/vcc0;->k0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VText;

    .line 8
    .line 9
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 10
    .line 11
    sget v0, Ll/vcc0;->g:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/RedPointView;

    .line 18
    .line 19
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 20
    .line 21
    sget v0, Ll/vcc0;->Y:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VOnlineIndicator;

    .line 28
    .line 29
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->d:Lv/VOnlineIndicator;

    .line 30
    .line 31
    sget v0, Ll/vcc0;->G:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VImage;

    .line 38
    .line 39
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 40
    .line 41
    return-void
.end method

.method public d(ZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public getIconView()Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getInfo()Lv/bottombar/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoot()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getTabName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lv/bottombar/a;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public setDarkMode(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 2
    .line 3
    iget-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->d:Lv/VOnlineIndicator;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lv/VOnlineIndicator;->setDarkMode(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lv/RedPointView;->setDarkMode(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setGrey(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/bottombar/VBottomBarDefaultItem;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInfo(Lv/bottombar/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 2
    .line 3
    return-void
.end method
