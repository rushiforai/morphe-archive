.class public Ll/ww20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/m1i0$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mw20;",
        ">;",
        "Ll/m1i0$a;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Landroid/view/View;

.field public d:Lv/VText;

.field public e:Lv/VScroll;

.field public f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VLinear;

.field public o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

.field public p:Ll/mw20;

.field public q:Ll/lz20;

.field public r:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tw20;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/tw20;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ww20;->r:Ljava/util/Comparator;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;->finish()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ww20;->p:Ll/mw20;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/mw20;->k1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;->finish()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ww20;->p:Ll/mw20;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/mw20;->k1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Ll/ww20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ww20;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/ww20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ww20;->F()V

    return-void
.end method

.method public static synthetic f(Ll/ww20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ww20;->H()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->getBindViewData()Ll/t2i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Ll/t2i0;->a:I

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->getBindViewData()Ll/t2i0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget p1, p1, Ll/t2i0;->a:I

    .line 12
    .line 13
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static synthetic j(Ll/ww20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ww20;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic l(Ll/ww20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ww20;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/ww20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ww20;->E()V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ww20;->a:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/rw20;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rw20;-><init>(Ll/ww20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ww20;->d:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/sw20;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/sw20;-><init>(Ll/ww20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ww20;->A()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ww20;->d:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ww20;->b:Lv/VText;

    .line 35
    .line 36
    iget-object p0, p0, Ll/ww20;->d:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 2

    .line 1
    new-instance v0, Ll/lz20;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lz20;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ww20;->q:Ll/lz20;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/m1i0;->l(Ll/m1i0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ww20;->k:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setCanAdjustChildHeight(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ww20;->k:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setIsSquare(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ww20;->k:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 24
    .line 25
    iget-object v1, p0, Ll/ww20;->q:Ll/lz20;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->setAdapter(Ll/j1i0;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/ww20;->q:Ll/lz20;

    .line 31
    .line 32
    sget-object v0, Ll/xve0;->e:[Ll/t2i0;

    .line 33
    .line 34
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/lz20;->p(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ww20;->e:Lv/VScroll;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ww20;->g:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->scrollTo(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ww20;->e:Lv/VScroll;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ww20;->m:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1, p0}, Landroid/view/View;->scrollTo(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ww20;->e:Lv/VScroll;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->scrollTo(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic H()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/t;->g3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/t;->h3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/t;->l3(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/jl80$a;

    .line 31
    .line 32
    iget-object p0, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "\u670d\u52a1\u66f4\u65b0"

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "\u4eb2\u7231\u7684\u7528\u6237\uff0c\u4e3a\u63d0\u5347\u670d\u52a1\u8d28\u91cf\u3010\u4e0d\u8ba9\u8ddd\u79bb\u592a\u8fd1\u7684\u4eba\u770b\u5230\u6211\u3011\u5c06\u4e8e7\u5929\u540e\u53d8\u66f4\u4e3a\u4f1a\u5458\u4e13\u5c5e\u670d\u52a1\u3002\u5230\u671f\u524d\uff0c\u529f\u80fd\u6b63\u5e38\u514d\u8d39\u4f7f\u7528\u3002\u611f\u8c22\u7406\u89e3\u4e0e\u652f\u6301\u3002"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance v0, Ll/uw20;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/uw20;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v1, "\u77e5\u9053\u4e86"

    .line 59
    .line 60
    invoke-virtual {p0, v1, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->t0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    new-instance p1, Ll/ow20;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/ow20;-><init>(Ll/ww20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ww20;->s(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x2

    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    new-instance p1, Ll/pw20;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/pw20;-><init>(Ll/ww20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/ww20;->s(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 v0, 0x3

    .line 26
    if-ne p1, v0, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->getLocationTitle()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/view/View;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    new-instance v0, Ll/qw20;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Ll/qw20;-><init>(Ll/ww20;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/ww20;->s(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ww20;->q:Ll/lz20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/m1i0;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/ww20;->r:Ljava/util/Comparator;

    .line 8
    .line 9
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->getBindViewData()Ll/t2i0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Ll/t2i0;->b:Ljava/lang/Object;

    .line 38
    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->getBindViewData()Ll/t2i0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Ll/t2i0;->c:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->getBindViewData()Ll/t2i0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Ll/t2i0;->b:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 59
    .line 60
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->setHiddenNearByView(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M(Ll/pf60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/ProfileZodiac;",
            ">;",
            "Lcom/p1/mobile/putong/data/ProfileZodiac;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Ll/ww20;->q:Ll/lz20;

    .line 34
    .line 35
    invoke-virtual {v3}, Ll/m1i0;->j()Ljava/util/HashMap;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;

    .line 48
    .line 49
    if-nez v3, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->getBindViewData()Ll/t2i0;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    iput-object v2, v3, Ll/t2i0;->b:Ljava/lang/Object;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v1, p0, Ll/ww20;->q:Ll/lz20;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ll/m1i0;->m(Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-static {}, Ll/yra;->b()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iget-object v1, p0, Ll/ww20;->l:Lv/VText;

    .line 79
    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    const-string v0, "Best match today"

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    const-string v0, "\u4eca\u65e5\u6700\u914d"

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object v0, p0, Ll/ww20;->q:Ll/lz20;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/m1i0;->j()Ljava/util/HashMap;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Landroid/view/View;

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/ww20$a;

    .line 114
    .line 115
    invoke-direct {v1, p0, p1}, Ll/ww20$a;-><init>(Ll/ww20;Landroid/view/View;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_3
    iget-object p0, p0, Ll/ww20;->l:Lv/VText;

    .line 123
    .line 124
    const/4 p1, 0x0

    .line 125
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final N()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->id(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public O()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 2
    .line 3
    new-instance v1, Ll/nw20;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nw20;-><init>(Ll/ww20;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x12c

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public P(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->R0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Landroid/view/View;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ww20;->p:Ll/mw20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mw20;->h1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const-string v2, "is_selected"

    .line 9
    .line 10
    const-string v3, "p_advanced_filter_page"

    .line 11
    .line 12
    const-string v4, "e_advanced_filter_constellation"

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/joa;->z3()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    filled-new-array {p1}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {v4, v3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ww20;->N()V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    xor-int/2addr p0, v1

    .line 50
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    filled-new-array {p0}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v4, v3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return p0
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ww20;->q:Ll/lz20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/m1i0;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "is_selected"

    .line 12
    .line 13
    const-string v2, "p_advanced_filter_page"

    .line 14
    .line 15
    const-string v3, "e_advanced_filter_constellation"

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v3, v2, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Ll/ww20;->p:Ll/mw20;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/mw20;->h1()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v3, v2, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
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
    check-cast p1, Ll/mw20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ww20;->q(Ll/mw20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ww20;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/ww20;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xw20;->b(Ll/ww20;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->l0(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Ll/mw20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ww20;->p:Ll/mw20;

    .line 2
    .line 3
    return-void
.end method

.method public final s(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    new-instance p0, Ll/vw20;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/vw20;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->h:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->n:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->c:Lv/VListCell;

    .line 4
    .line 5
    invoke-static {p0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public x(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dx6;->t3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/ww20;->M(Ll/pf60;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ww20;->p:Ll/mw20;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mw20;->O0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ww20;->f:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ww20;->o:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterAct;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
