.class public Ll/ez50;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/IntlOperationArticles;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationArticles;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ez50;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ez50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/ez50;Lcom/p1/mobile/putong/data/IntlOperationArticles;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ez50;->H(Lcom/p1/mobile/putong/data/IntlOperationArticles;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ez50;->F(Landroid/view/View;Lcom/p1/mobile/putong/data/IntlOperationArticles;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ez50;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ez50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->w8:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/data/IntlOperationArticles;II)V
    .locals 1

    .line 1
    sget p3, Ll/adc0;->N5:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lv/VDraweeView;

    .line 8
    .line 9
    sget p4, Ll/adc0;->Sd:I

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    check-cast p4, Lv/VText;

    .line 16
    .line 17
    iget-object v0, p2, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p4, p2, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 23
    .line 24
    iget-object p4, p4, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p3, p4}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ll/dz50;

    .line 30
    .line 31
    invoke-direct {p3, p0, p2}, Ll/dz50;-><init>(Ll/ez50;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/ez50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;->pageId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "intl_story_id"

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, p2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "e_tantan_story"

    .line 52
    .line 53
    invoke-static {p2, p0, p1}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/data/IntlOperationArticles;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ez50;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/data/IntlOperationArticles;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/ez50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "intl_story_id"

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_tantan_story"

    .line 22
    .line 23
    invoke-static {v1, p2, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/ez50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 27
    .line 28
    const-string v0, ""

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p2, v0, p1}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p0, p0, Ll/ez50;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationArticles;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ez50;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ez50;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ez50;->G(I)Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
