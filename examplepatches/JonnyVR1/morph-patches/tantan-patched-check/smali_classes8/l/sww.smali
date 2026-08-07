.class public Ll/sww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/eww;",
        ">;"
    }
.end annotation


# static fields
.field public static final F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Z

.field public B:Ll/eww;

.field public C:Landroid/content/Context;

.field public D:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public E:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ll/bf3;",
            "Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;",
            ">;"
        }
    .end annotation
.end field

.field public a:Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VFrame_Anim;

.field public e:Lv/VProgressBar;

.field public f:Lv/VText;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lcom/baidu/mapapi/map/MapView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lv/VList;

.field public q:Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;

.field public r:Landroidx/appcompat/widget/SearchView;

.field public s:Landroid/view/MenuItem;

.field public t:Landroid/view/View;

.field public u:Lcom/baidu/mapapi/search/sug/SuggestionSearch;

.field public v:Z

.field public w:Landroid/view/View;

.field public x:Landroid/widget/TextView;

.field public y:Ljava/lang/String;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 29

    .line 1
    const-string v27, "\u897f\u85cf\u81ea\u6cbb\u533a"

    .line 2
    .line 3
    const-string v28, "\u5e7f\u897f\u58ee\u65cf\u81ea\u6cbb\u533a"

    .line 4
    .line 5
    const-string v1, "\u9ed1\u9f99\u6c5f\u7701"

    .line 6
    .line 7
    const-string v2, "\u5409\u6797\u7701"

    .line 8
    .line 9
    const-string v3, "\u8fbd\u5b81\u7701"

    .line 10
    .line 11
    const-string v4, "\u6cb3\u5317\u7701"

    .line 12
    .line 13
    const-string v5, "\u6cb3\u5357\u7701"

    .line 14
    .line 15
    const-string v6, "\u6e56\u5317\u7701"

    .line 16
    .line 17
    const-string v7, "\u6e56\u5357\u7701"

    .line 18
    .line 19
    const-string v8, "\u5c71\u4e1c\u7701"

    .line 20
    .line 21
    const-string v9, "\u5c71\u897f\u7701"

    .line 22
    .line 23
    const-string v10, "\u9655\u897f\u7701"

    .line 24
    .line 25
    const-string v11, "\u7518\u8083\u7701"

    .line 26
    .line 27
    const-string v12, "\u9752\u6d77\u7701"

    .line 28
    .line 29
    const-string v13, "\u6c5f\u82cf\u7701"

    .line 30
    .line 31
    const-string v14, "\u5b89\u5fbd\u7701"

    .line 32
    .line 33
    const-string v15, "\u6d59\u6c5f\u7701"

    .line 34
    .line 35
    const-string v16, "\u798f\u5efa\u7701"

    .line 36
    .line 37
    const-string v17, "\u6c5f\u897f\u7701"

    .line 38
    .line 39
    const-string v18, "\u5e7f\u4e1c\u7701"

    .line 40
    .line 41
    const-string v19, "\u53f0\u6e7e\u7701"

    .line 42
    .line 43
    const-string v20, "\u6d77\u5357\u7701"

    .line 44
    .line 45
    const-string v21, "\u56db\u5ddd\u7701"

    .line 46
    .line 47
    const-string v22, "\u4e91\u5357\u7701"

    .line 48
    .line 49
    const-string v23, "\u8d35\u5dde\u7701"

    .line 50
    .line 51
    const-string v24, "\u5185\u8499\u53e4\u81ea\u6cbb\u533a"

    .line 52
    .line 53
    const-string v25, "\u5b81\u590f\u56de\u65cf\u81ea\u6cbb\u533a"

    .line 54
    .line 55
    const-string v26, "\u65b0\u7586\u7ef4\u543e\u5c14\u81ea\u6cbb\u533a"

    .line 56
    .line 57
    filled-new-array/range {v1 .. v28}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Ll/sww;->F:Ljava/util/List;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/sww;->y:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v0, Ll/fww;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/fww;-><init>(Ll/sww;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/sww;->D:Ll/y20;

    .line 13
    .line 14
    new-instance v0, Ll/jww;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/jww;-><init>(Ll/sww;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/sww;->E:Ll/z20;

    .line 20
    .line 21
    iput-object p1, p0, Ll/sww;->C:Landroid/content/Context;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic M(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->key:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic a(Ll/sww;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sww;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/sww;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sww;->U(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic c(Ll/sww;Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sww;->N(Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V

    return-void
.end method

.method public static synthetic d(Ll/sww;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sww;->R()V

    return-void
.end method

.method public static synthetic e(Ll/sww;Landroid/app/SearchableInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sww;->Q(Landroid/app/SearchableInfo;)V

    return-void
.end method

.method public static synthetic f(Ll/sww;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sww;->S(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/sww;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sww;->L(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j(Ll/sww;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sww;->V(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Ll/sww;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sww;->P()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Ll/sww;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sww;->T()Z

    move-result p0

    return p0
.end method

.method public static synthetic m(Ll/sww;Ll/bf3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sww;->K(Ll/bf3;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sww;->M(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic p(Ll/sww;)Ll/eww;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->B:Ll/eww;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/sww;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->t:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic s(Ll/sww;)Landroid/view/MenuItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->s:Landroid/view/MenuItem;

    return-object p0
.end method

.method public static bridge synthetic u(Ll/sww;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->w:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic v(Ll/sww;)Lcom/baidu/mapapi/search/sug/SuggestionSearch;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->u:Lcom/baidu/mapapi/search/sug/SuggestionSearch;

    return-object p0
.end method

.method public static bridge synthetic w(Ll/sww;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/sww;->z:Z

    return-void
.end method

.method public static bridge synthetic x(Ll/sww;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/sww;->v:Z

    return-void
.end method


# virtual methods
.method public A(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vww;->b(Ll/sww;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/www;->b(Ll/sww;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public C(Ll/eww;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 2
    .line 3
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sww;->C:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sww;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Mh:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Nh:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/sww;->n:Lv/VText;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ph:I

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Qh:I

    .line 21
    .line 22
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sww;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sww;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public H(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/sww;->a0(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/sww;->t:Landroid/view/View;

    .line 30
    .line 31
    const/16 v1, 0x8

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 45
    .line 46
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/sww;->w:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public I(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->Ud:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object p0, p0, Ll/sww;->c:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    return-object p0
.end method

.method public J(ILl/bf3;Ll/l3h0;Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    instance-of v0, p4, Lcom/p1/mobile/android/app/c$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->setConvertActivityFromTranslucentEnable(Z)V

    .line 11
    .line 12
    .line 13
    const/4 p4, 0x1

    .line 14
    if-ne p1, p4, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Q1:I

    .line 25
    .line 26
    invoke-virtual {p4, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p4, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 42
    .line 43
    invoke-virtual {p0, p1, p4}, Ll/sww;->B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 52
    .line 53
    iget-object p4, p0, Ll/sww;->a:Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;

    .line 54
    .line 55
    invoke-virtual {p1, p4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget p4, Ll/kec0;->Ud:I

    .line 67
    .line 68
    iget-object v1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 69
    .line 70
    invoke-virtual {p1, p4, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;

    .line 75
    .line 76
    iput-object p1, p0, Ll/sww;->q:Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;

    .line 77
    .line 78
    iget-object p4, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 79
    .line 80
    invoke-virtual {p4, p1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object p4, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 92
    .line 93
    invoke-virtual {p0, p1, p4}, Ll/sww;->A(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 97
    .line 98
    iget-object p4, p0, Ll/sww;->b:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p1, p4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p4, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 112
    .line 113
    invoke-virtual {p0, p1, p4}, Ll/sww;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 122
    .line 123
    new-instance p4, Ll/sww$a;

    .line 124
    .line 125
    invoke-direct {p4, p0}, Ll/sww$a;-><init>(Ll/sww;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, p4}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Lcom/baidu/mapapi/map/MapView;->showZoomControls(Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 137
    .line 138
    iget-object p4, p0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 139
    .line 140
    invoke-virtual {p4}, Lcom/baidu/mapapi/map/MapView;->getMap()Lcom/baidu/mapapi/map/BaiduMap;

    .line 141
    .line 142
    .line 143
    move-result-object p4

    .line 144
    iput-object p4, p1, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 145
    .line 146
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 147
    .line 148
    iget-object p1, p1, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 149
    .line 150
    const/high16 p4, 0x41880000    # 17.0f

    .line 151
    .line 152
    invoke-static {p4}, Lcom/baidu/mapapi/map/MapStatusUpdateFactory;->zoomTo(F)Lcom/baidu/mapapi/map/MapStatusUpdate;

    .line 153
    .line 154
    .line 155
    move-result-object p4

    .line 156
    invoke-virtual {p1, p4}, Lcom/baidu/mapapi/map/BaiduMap;->setMapStatus(Lcom/baidu/mapapi/map/MapStatusUpdate;)V

    .line 157
    .line 158
    .line 159
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 165
    .line 166
    iget-object p4, p1, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 167
    .line 168
    invoke-virtual {p4, p1}, Lcom/baidu/mapapi/map/BaiduMap;->setOnMapStatusChangeListener(Lcom/baidu/mapapi/map/BaiduMap$OnMapStatusChangeListener;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 172
    .line 173
    invoke-static {}, Lcom/baidu/mapapi/search/geocode/GeoCoder;->newInstance()Lcom/baidu/mapapi/search/geocode/GeoCoder;

    .line 174
    .line 175
    .line 176
    move-result-object p4

    .line 177
    iput-object p4, p1, Ll/eww;->k:Lcom/baidu/mapapi/search/geocode/GeoCoder;

    .line 178
    .line 179
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 180
    .line 181
    invoke-static {}, Lcom/baidu/mapapi/search/poi/PoiSearch;->newInstance()Lcom/baidu/mapapi/search/poi/PoiSearch;

    .line 182
    .line 183
    .line 184
    move-result-object p4

    .line 185
    iput-object p4, p1, Ll/eww;->l:Lcom/baidu/mapapi/search/poi/PoiSearch;

    .line 186
    .line 187
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 188
    .line 189
    iget-object p1, p1, Ll/eww;->k:Lcom/baidu/mapapi/search/geocode/GeoCoder;

    .line 190
    .line 191
    invoke-virtual {p1, p2}, Lcom/baidu/mapapi/search/geocode/GeoCoder;->setOnGetGeoCodeResultListener(Lcom/baidu/mapapi/search/geocode/OnGetGeoCoderResultListener;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 195
    .line 196
    iget-object p1, p1, Ll/eww;->l:Lcom/baidu/mapapi/search/poi/PoiSearch;

    .line 197
    .line 198
    invoke-virtual {p1, p2}, Lcom/baidu/mapapi/search/poi/PoiSearch;->setOnGetPoiSearchResultListener(Lcom/baidu/mapapi/search/poi/OnGetPoiSearchResultListener;)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/sww;->g:Landroid/widget/FrameLayout;

    .line 202
    .line 203
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 208
    .line 209
    iget p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 210
    .line 211
    const/high16 v0, 0x42000000    # 32.0f

    .line 212
    .line 213
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    sub-int/2addr p4, v1

    .line 218
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 219
    .line 220
    iget p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 221
    .line 222
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    sub-int/2addr p4, v0

    .line 227
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 228
    .line 229
    iget-object p1, p0, Ll/sww;->n:Lv/VText;

    .line 230
    .line 231
    new-instance p4, Ll/rww;

    .line 232
    .line 233
    invoke-direct {p4, p0, p2}, Ll/rww;-><init>(Ll/sww;Ll/bf3;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Ll/sww;->p:Lv/VList;

    .line 240
    .line 241
    invoke-virtual {p1, p3}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Lcom/baidu/mapapi/search/sug/SuggestionSearch;->newInstance()Lcom/baidu/mapapi/search/sug/SuggestionSearch;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    iput-object p1, p0, Ll/sww;->u:Lcom/baidu/mapapi/search/sug/SuggestionSearch;

    .line 249
    .line 250
    new-instance p2, Ll/gww;

    .line 251
    .line 252
    invoke-direct {p2, p0}, Ll/gww;-><init>(Ll/sww;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p1, p2}, Lcom/baidu/mapapi/search/sug/SuggestionSearch;->setOnGetSuggestionResultListener(Lcom/baidu/mapapi/search/sug/OnGetSuggestionResultListener;)V

    .line 256
    .line 257
    .line 258
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 259
    .line 260
    const/16 p2, 0x18

    .line 261
    .line 262
    if-eq p1, p2, :cond_1

    .line 263
    .line 264
    const/16 p2, 0x19

    .line 265
    .line 266
    if-ne p1, p2, :cond_6

    .line 267
    .line 268
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    new-instance p2, Ll/sww$b;

    .line 273
    .line 274
    invoke-direct {p2, p0}, Ll/sww$b;-><init>(Ll/sww;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 278
    .line 279
    .line 280
    return-void

    .line 281
    :cond_2
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 282
    .line 283
    if-ne p4, p1, :cond_3

    .line 284
    .line 285
    iget-object p0, p0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 286
    .line 287
    invoke-virtual {p0}, Lcom/baidu/mapapi/map/MapView;->onResume()V

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_3
    sget-object p1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 292
    .line 293
    if-ne p4, p1, :cond_4

    .line 294
    .line 295
    iget-object p0, p0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 296
    .line 297
    invoke-virtual {p0}, Lcom/baidu/mapapi/map/MapView;->onPause()V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_4
    sget-object p1, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 302
    .line 303
    if-ne p4, p1, :cond_6

    .line 304
    .line 305
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 306
    .line 307
    iget-object p1, p1, Ll/eww;->h:Lcom/baidu/mapapi/map/BaiduMap;

    .line 308
    .line 309
    invoke-virtual {p1}, Lcom/baidu/mapapi/map/BaiduMap;->clear()V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 313
    .line 314
    invoke-virtual {p1}, Lcom/baidu/mapapi/map/MapView;->onDestroy()V

    .line 315
    .line 316
    .line 317
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 318
    .line 319
    iget-object p1, p1, Ll/eww;->k:Lcom/baidu/mapapi/search/geocode/GeoCoder;

    .line 320
    .line 321
    invoke-virtual {p1}, Lcom/baidu/mapapi/search/geocode/GeoCoder;->destroy()V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 325
    .line 326
    iget-object p1, p1, Ll/eww;->l:Lcom/baidu/mapapi/search/poi/PoiSearch;

    .line 327
    .line 328
    invoke-virtual {p1}, Lcom/baidu/mapapi/search/poi/PoiSearch;->destroy()V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Ll/sww;->u:Lcom/baidu/mapapi/search/sug/SuggestionSearch;

    .line 332
    .line 333
    invoke-virtual {p1}, Lcom/baidu/mapapi/search/sug/SuggestionSearch;->destroy()V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 337
    .line 338
    iget-object p1, p1, Ll/eww;->m:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 339
    .line 340
    if-eqz p1, :cond_5

    .line 341
    .line 342
    invoke-virtual {p1}, Lcom/baidu/mapapi/map/BitmapDescriptor;->recycle()V

    .line 343
    .line 344
    .line 345
    :cond_5
    iget-object p0, p0, Ll/sww;->B:Ll/eww;

    .line 346
    .line 347
    iget-object p0, p0, Ll/eww;->i:Lcom/baidu/mapapi/map/BitmapDescriptor;

    .line 348
    .line 349
    if-eqz p0, :cond_6

    .line 350
    .line 351
    invoke-virtual {p0}, Lcom/baidu/mapapi/map/BitmapDescriptor;->recycle()V

    .line 352
    .line 353
    .line 354
    :cond_6
    return-void
.end method

.method public final synthetic K(Ll/bf3;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/sww;->B:Ll/eww;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/eww;->q0()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0}, Ll/sww;->b0(ZLl/bf3;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic L(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->p:Lv/VList;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic N(Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->key:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p2, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->city:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    sget-object v0, Ll/sww;->F:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/iww;

    .line 20
    .line 21
    invoke-direct {v1, p2}, Ll/iww;-><init>(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p2, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->key:Ljava/lang/String;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p1, p2, v0, v1}, Ll/bf3;->I(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v0, p1, Ll/bf3;->h:Lcom/baidu/mapapi/search/core/PoiInfo;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, v0, Lcom/baidu/mapapi/search/core/PoiInfo;->city:Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v0, 0x0

    .line 45
    :goto_0
    invoke-virtual {p1, p2, v0, v2}, Ll/bf3;->I(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    iget-object v0, p2, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;->city:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, p2, v0, v2}, Ll/bf3;->I(Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    :goto_1
    invoke-virtual {p0, v2}, Ll/sww;->H(Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->B:Ll/eww;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eww;->L0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P()Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sww;->w:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x42600000    # 56.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/high16 v2, 0x42900000    # 72.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    sub-int/2addr v1, v2

    .line 30
    sub-int/2addr v1, v0

    .line 31
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/SearchView;->setMaxWidth(I)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    return-object p0
.end method

.method public final synthetic Q(Landroid/app/SearchableInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView;->setSearchableInfo(Landroid/app/SearchableInfo;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic R()V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "search"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/app/SearchManager;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/app/SearchManager;->getSearchableInfo(Landroid/content/ComponentName;)Landroid/app/SearchableInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ll/hww;

    .line 30
    .line 31
    invoke-direct {v2, p0, v0}, Ll/hww;-><init>(Ll/sww;Landroid/app/SearchableInfo;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic S(ILandroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/sww;->x:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->v:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/core/R$string;->b:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget v1, Lcom/p1/mobile/putong/core/R$string;->v:I

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget v1, Lcom/p1/mobile/putong/core/R$string;->b:I

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    :goto_1
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-interface {p2, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 66
    .line 67
    const/4 p2, 0x0

    .line 68
    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/sww;->w:Landroid/view/View;

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 79
    .line 80
    .line 81
    const/4 p1, 0x1

    .line 82
    invoke-virtual {p0, p1}, Ll/sww;->a0(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/sww;->t:Landroid/view/View;

    .line 86
    .line 87
    const/16 p1, 0x8

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic T()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/sww;->a0(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Ll/sww;->p:Lv/VList;

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/sww;->w:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 19
    .line 20
    .line 21
    return v0
.end method

.method public final synthetic U(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/sww;->a0(Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/sww;->t:Landroid/view/View;

    .line 9
    .line 10
    const/16 p1, 0x8

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic V(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p1, :cond_2

    .line 7
    .line 8
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0, p2}, Ll/sww;->a0(Z)V

    .line 36
    .line 37
    .line 38
    return v0

    .line 39
    :cond_2
    return p2
.end method

.method public W(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/AbsListView;->smoothScrollToPosition(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sww;->d:Lv/VFrame_Anim;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sww;->e:Lv/VProgressBar;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y(Ljava/util/List;Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/baidu/mapapi/search/core/PoiInfo;",
            ">;",
            "Lcom/baidu/mapapi/search/core/PoiInfo;",
            "IIZ)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/sww;->q:Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;

    .line 8
    .line 9
    invoke-virtual {v0, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->R(Lcom/baidu/mapapi/search/core/PoiInfo;IIZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public Z(ILl/bf3;Ll/l3h0;Landroid/view/Menu;)Z
    .locals 4

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/lfc0;->d:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p4}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/adc0;->o8:I

    .line 15
    .line 16
    invoke-interface {p4, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 21
    .line 22
    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/sww;->w:Landroid/view/View;

    .line 27
    .line 28
    sget v1, Ll/adc0;->p8:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/widget/TextView;

    .line 35
    .line 36
    iput-object v0, p0, Ll/sww;->x:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/sww;->x:Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/ux0;->j(Landroid/widget/TextView;)V

    .line 49
    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Ll/sww;->x:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {v2}, Ll/eu9;->c()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    iget-object v0, p0, Ll/sww;->x:Landroid/widget/TextView;

    .line 85
    .line 86
    if-nez p1, :cond_1

    .line 87
    .line 88
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget v2, Lcom/p1/mobile/putong/core/R$string;->v:I

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    goto :goto_0

    .line 99
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    sget v2, Lcom/p1/mobile/putong/core/R$string;->b:I

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 113
    .line 114
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    if-nez p1, :cond_2

    .line 119
    .line 120
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    sget v3, Lcom/p1/mobile/putong/core/R$string;->v:I

    .line 125
    .line 126
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    goto :goto_1

    .line 131
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    sget v3, Lcom/p1/mobile/putong/core/R$string;->b:I

    .line 136
    .line 137
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    :goto_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/sww;->s:Landroid/view/MenuItem;

    .line 149
    .line 150
    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    new-instance v1, Ll/lww;

    .line 155
    .line 156
    invoke-direct {v1, p0}, Ll/lww;-><init>(Ll/sww;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    sget v0, Ll/adc0;->m8:I

    .line 163
    .line 164
    invoke-interface {p4, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 165
    .line 166
    .line 167
    move-result-object p4

    .line 168
    invoke-interface {p4}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p4

    .line 172
    check-cast p4, Landroidx/appcompat/widget/SearchView;

    .line 173
    .line 174
    iput-object p4, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 175
    .line 176
    iget-object p4, p0, Ll/sww;->w:Landroid/view/View;

    .line 177
    .line 178
    new-instance v0, Ll/mww;

    .line 179
    .line 180
    invoke-direct {v0, p0}, Ll/mww;-><init>(Ll/sww;)V

    .line 181
    .line 182
    .line 183
    invoke-static {p4, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 184
    .line 185
    .line 186
    new-instance p4, Ll/nww;

    .line 187
    .line 188
    invoke-direct {p4, p0}, Ll/nww;-><init>(Ll/sww;)V

    .line 189
    .line 190
    .line 191
    invoke-static {p4}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 192
    .line 193
    .line 194
    const/4 p4, 0x1

    .line 195
    :try_start_0
    const-class v0, Landroidx/appcompat/widget/SearchView;

    .line 196
    .line 197
    const-string v1, "mCloseButton"

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v0, p4}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 204
    .line 205
    .line 206
    iget-object v1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Landroid/view/View;

    .line 213
    .line 214
    iput-object v0, p0, Ll/sww;->t:Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    .line 216
    goto :goto_5

    .line 217
    :catch_0
    move-exception v0

    .line 218
    goto :goto_2

    .line 219
    :catch_1
    move-exception v0

    .line 220
    goto :goto_3

    .line 221
    :catch_2
    move-exception v0

    .line 222
    goto :goto_4

    .line 223
    :goto_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    goto :goto_5

    .line 227
    :goto_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 228
    .line 229
    .line 230
    goto :goto_5

    .line 231
    :goto_4
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    :goto_5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 243
    .line 244
    invoke-virtual {v0, v1}, Ll/ux0;->l(Landroidx/appcompat/widget/SearchView;)V

    .line 245
    .line 246
    .line 247
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 248
    .line 249
    new-instance v1, Ll/oww;

    .line 250
    .line 251
    invoke-direct {v1, p0, p1}, Ll/oww;-><init>(Ll/sww;I)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 258
    .line 259
    new-instance v0, Ll/sww$d;

    .line 260
    .line 261
    invoke-direct {v0, p0, p2, p3}, Ll/sww$d;-><init>(Ll/sww;Ll/bf3;Ll/l3h0;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$m;)V

    .line 265
    .line 266
    .line 267
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 268
    .line 269
    new-instance p2, Ll/pww;

    .line 270
    .line 271
    invoke-direct {p2, p0}, Ll/pww;-><init>(Ll/sww;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$l;)V

    .line 275
    .line 276
    .line 277
    iget-object p1, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 278
    .line 279
    new-instance p2, Ll/qww;

    .line 280
    .line 281
    invoke-direct {p2, p0}, Ll/qww;-><init>(Ll/sww;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 285
    .line 286
    .line 287
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pendChangeActionButtonTypeface()V

    .line 292
    .line 293
    .line 294
    return p4
.end method

.method public a0(Z)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/sww$e;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/sww$e;-><init>(Ll/sww;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    new-instance v0, Ll/kww;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/kww;-><init>(Ll/sww;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    if-nez p1, :cond_1

    .line 59
    .line 60
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v0, Ll/sww$f;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/sww$f;-><init>(Ll/sww;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/sww;->o:Landroid/widget/FrameLayout;

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method

.method public b0(ZLl/bf3;Z)V
    .locals 2

    .line 1
    if-eq p3, p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ll/sww;->B:Ll/eww;

    .line 4
    .line 5
    invoke-virtual {p1, p3}, Ll/eww;->o0(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/sww;->m:Lv/VLinear;

    .line 9
    .line 10
    const/high16 v0, 0x42440000    # 49.0f

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    int-to-float p2, p2

    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/sww;->m:Lv/VLinear;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Ll/gt0$j;

    .line 34
    .line 35
    invoke-direct {p2}, Ll/gt0$j;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 46
    .line 47
    const/4 p2, 0x0

    .line 48
    invoke-virtual {p1, p2}, Landroid/widget/AbsListView;->smoothScrollToPosition(I)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget p2, Ll/cac0;->b:I

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget-object p2, p0, Ll/sww;->m:Lv/VLinear;

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    sub-int/2addr p1, p2

    .line 72
    iget-object p2, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    int-to-float p3, p1

    .line 79
    invoke-virtual {p2, p3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/sww;->g:Landroid/widget/FrameLayout;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    div-int/lit8 p1, p1, 0x2

    .line 93
    .line 94
    int-to-float p1, p1

    .line 95
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result p3

    .line 111
    int-to-float p3, p3

    .line 112
    invoke-virtual {p1, p3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    new-instance p3, Ll/sww$c;

    .line 117
    .line 118
    invoke-direct {p3, p0}, Ll/sww$c;-><init>(Ll/sww;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/sww;->l:Lcom/p1/mobile/putong/core/ui/map/MapListView;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/sww;->g:Landroid/widget/FrameLayout;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2}, Ll/bf3;->F()V

    .line 155
    .line 156
    .line 157
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eww;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sww;->C(Ll/eww;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sww;->y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 27
    .line 28
    const-string v2, ""

    .line 29
    .line 30
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/sww;->r:Landroidx/appcompat/widget/SearchView;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return v1

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tww;->b(Ll/sww;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uww;->b(Ll/sww;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
