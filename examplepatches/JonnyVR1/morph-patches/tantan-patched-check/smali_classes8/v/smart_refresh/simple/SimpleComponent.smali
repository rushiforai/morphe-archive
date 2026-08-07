.class public abstract Lv/smart_refresh/simple/SimpleComponent;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/gvc0;


# instance fields
.field public a:Landroid/view/View;

.field public b:Ll/wwf0;

.field public c:Ll/gvc0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 66
    instance-of v0, p1, Ll/gvc0;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Ll/gvc0;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, Lv/smart_refresh/simple/SimpleComponent;-><init>(Landroid/view/View;Ll/gvc0;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ll/gvc0;)V
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/gvc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-direct {p0, v0, v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lv/smart_refresh/simple/SimpleComponent;->a:Landroid/view/View;

    .line 11
    .line 12
    iput-object p2, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 13
    .line 14
    instance-of p1, p0, Ll/jvc0;

    .line 15
    .line 16
    const/high16 v0, -0x40800000    # -1.0f

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    instance-of p1, p2, Ll/kvc0;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-interface {p2}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v1, Ll/wwf0;->h:Ll/wwf0;

    .line 29
    .line 30
    if-ne p1, v1, :cond_0

    .line 31
    .line 32
    invoke-interface {p2}, Ll/gvc0;->getView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    instance-of p1, p0, Ll/kvc0;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 45
    .line 46
    instance-of p1, p0, Ll/jvc0;

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget-object p1, Ll/wwf0;->h:Ll/wwf0;

    .line 55
    .line 56
    if-ne p0, p1, :cond_1

    .line 57
    .line 58
    invoke-interface {p2}, Ll/gvc0;->getView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method


# virtual methods
.method public b(Z)Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/jvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/jvc0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/jvc0;->b(Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public c(Ll/mvc0;II)V
    .locals 1
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1, p2, p3}, Ll/gvc0;->c(Ll/mvc0;II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public d(FII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1, p2, p3}, Ll/gvc0;->d(FII)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ll/gvc0;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, p1, :cond_1

    .line 3
    .line 4
    instance-of v1, p1, Ll/gvc0;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/gvc0;->getView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p1, Ll/gvc0;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    return v2

    .line 23
    :cond_1
    return v0
.end method

.method public f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V
    .locals 2
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    if-eq v0, p0, :cond_4

    .line 6
    .line 7
    instance-of v1, p0, Ll/jvc0;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    instance-of v1, v0, Ll/kvc0;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p2, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p2}, Lv/smart_refresh/constant/RefreshState;->toHeader()Lv/smart_refresh/constant/RefreshState;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    :cond_0
    iget-boolean v0, p3, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 24
    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    invoke-virtual {p3}, Lv/smart_refresh/constant/RefreshState;->toHeader()Lv/smart_refresh/constant/RefreshState;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    instance-of v1, p0, Ll/kvc0;

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    instance-of v0, v0, Ll/jvc0;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    iget-boolean v0, p2, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p2}, Lv/smart_refresh/constant/RefreshState;->toFooter()Lv/smart_refresh/constant/RefreshState;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    :cond_2
    iget-boolean v0, p3, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p3}, Lv/smart_refresh/constant/RefreshState;->toFooter()Lv/smart_refresh/constant/RefreshState;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    :cond_3
    :goto_0
    iget-object p0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 57
    .line 58
    if-eqz p0, :cond_4

    .line 59
    .line 60
    invoke-interface {p0, p1, p2, p3}, Ll/tn50;->f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    return-void
.end method

.method public g(Ll/mvc0;II)V
    .locals 1
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1, p2, p3}, Ll/gvc0;->g(Ll/mvc0;II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public getSpinnerStyle()Ll/wwf0;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    if-eq v0, p0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->a:Landroid/view/View;

    .line 18
    .line 19
    if-eqz v0, :cond_5

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v1, v0, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    move-object v1, v0

    .line 30
    check-cast v1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 31
    .line 32
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout$m;->b:Ll/wwf0;

    .line 33
    .line 34
    iput-object v1, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    return-object v1

    .line 39
    :cond_2
    if-eqz v0, :cond_5

    .line 40
    .line 41
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    if-ne v0, v1, :cond_5

    .line 47
    .line 48
    :cond_3
    sget-object v0, Ll/wwf0;->i:[Ll/wwf0;

    .line 49
    .line 50
    array-length v1, v0

    .line 51
    const/4 v2, 0x0

    .line 52
    :goto_0
    if-ge v2, v1, :cond_5

    .line 53
    .line 54
    aget-object v3, v0, v2

    .line 55
    .line 56
    iget-boolean v4, v3, Ll/wwf0;->c:Z

    .line 57
    .line 58
    if-eqz v4, :cond_4

    .line 59
    .line 60
    iput-object v3, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 61
    .line 62
    return-object v3

    .line 63
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_5
    sget-object v0, Ll/wwf0;->d:Ll/wwf0;

    .line 67
    .line 68
    iput-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 69
    .line 70
    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    return-object v0
.end method

.method public h(Ll/mvc0;Z)I
    .locals 1
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1, p2}, Ll/gvc0;->h(Ll/mvc0;Z)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public i(Ll/lvc0;II)V
    .locals 1
    .param p1    # Ll/lvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1, p2, p3}, Ll/gvc0;->i(Ll/lvc0;II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p2, p0, Lv/smart_refresh/simple/SimpleComponent;->a:Landroid/view/View;

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    instance-of p3, p2, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 20
    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    check-cast p2, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 24
    .line 25
    iget p2, p2, Lv/smart_refresh/SmartRefreshLayout$m;->a:I

    .line 26
    .line 27
    invoke-interface {p1, p0, p2}, Ll/lvc0;->b(Ll/gvc0;I)Ll/lvc0;

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public l(ZFIII)V
    .locals 1

    .line 1
    move-object v0, p0

    .line 2
    iget-object p0, v0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    invoke-interface/range {p0 .. p5}, Ll/gvc0;->l(ZFIII)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public varargs setPrimaryColors([I)V
    .locals 1
    .param p1    # [I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/simple/SimpleComponent;->c:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/gvc0;->setPrimaryColors([I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
