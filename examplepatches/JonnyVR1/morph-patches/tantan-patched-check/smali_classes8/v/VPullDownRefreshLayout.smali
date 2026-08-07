.class public Lv/VPullDownRefreshLayout;
.super Lv/smart_refresh/SmartRefreshLayout;
.source "SourceFile"

# interfaces
.implements Ll/mvc0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, v0}, Lv/VPullDownRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/smart_refresh/SmartRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/high16 p2, 0x40000000    # 2.0f

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lv/smart_refresh/SmartRefreshLayout;->K(F)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lv/smart_refresh/SmartRefreshLayout;->J(F)Ll/mvc0;

    .line 10
    .line 11
    .line 12
    new-instance p2, Lv/smart_refresh/header/TTRefreshHeader;

    .line 13
    .line 14
    invoke-direct {p2, p1}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lv/VPullDownRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 18
    .line 19
    .line 20
    new-instance p2, Lv/smart_refresh/footer/TTRefreshFooter;

    .line 21
    .line 22
    invoke-direct {p2, p1}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lv/VPullDownRefreshLayout;->Q(Ll/jvc0;)Ll/mvc0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static setDefaultRefreshFooterCreator(Ll/srd;)V
    .locals 1
    .param p0    # Ll/srd;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lv/VPullDownRefreshLayout$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/VPullDownRefreshLayout$e;-><init>(Ll/srd;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lv/smart_refresh/SmartRefreshLayout;->setDefaultRefreshFooterCreator(Ll/srd;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static setDefaultRefreshHeaderCreator(Ll/trd;)V
    .locals 1
    .param p0    # Ll/trd;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lv/VPullDownRefreshLayout$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/VPullDownRefreshLayout$d;-><init>(Ll/trd;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lv/smart_refresh/SmartRefreshLayout;->setDefaultRefreshHeaderCreator(Ll/trd;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static setDefaultRefreshInitializer(Ll/urd;)V
    .locals 1
    .param p0    # Ll/urd;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lv/VPullDownRefreshLayout$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/VPullDownRefreshLayout$f;-><init>(Ll/urd;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lv/smart_refresh/SmartRefreshLayout;->setDefaultRefreshInitializer(Ll/urd;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public M(Ll/tm50;)Ll/mvc0;
    .locals 1

    .line 1
    new-instance v0, Lv/VPullDownRefreshLayout$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lv/VPullDownRefreshLayout$b;-><init>(Lv/VPullDownRefreshLayout;Ll/tm50;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public O(Ll/jn50;)Ll/mvc0;
    .locals 1

    .line 1
    new-instance v0, Lv/VPullDownRefreshLayout$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lv/VPullDownRefreshLayout$a;-><init>(Lv/VPullDownRefreshLayout;Ll/jn50;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public P(Ll/kn50;)Ll/mvc0;
    .locals 1

    .line 1
    new-instance v0, Lv/VPullDownRefreshLayout$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lv/VPullDownRefreshLayout$c;-><init>(Lv/VPullDownRefreshLayout;Ll/kn50;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->P(Ll/kn50;)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public Q(Ll/jvc0;)Ll/mvc0;
    .locals 2
    .param p1    # Ll/jvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, -0x2

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lv/VPullDownRefreshLayout;->R(Ll/jvc0;II)Ll/mvc0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public R(Ll/jvc0;II)Ll/mvc0;
    .locals 0
    .param p1    # Ll/jvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Lv/smart_refresh/SmartRefreshLayout;->R(Ll/jvc0;II)Ll/mvc0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public S(Ll/kvc0;)Ll/mvc0;
    .locals 2
    .param p1    # Ll/kvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, -0x2

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lv/VPullDownRefreshLayout;->T(Ll/kvc0;II)Ll/mvc0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public T(Ll/kvc0;II)Ll/mvc0;
    .locals 0
    .param p1    # Ll/kvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Lv/smart_refresh/SmartRefreshLayout;->T(Ll/kvc0;II)Ll/mvc0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public getRefreshFooter()Ll/jvc0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

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
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getRefreshHeader()Ll/kvc0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/kvc0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method
