.class public Lcom/p1/mobile/putong/core/view/CardLabelItemView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VText;

.field public g:I

.field public h:Lcom/p1/mobile/putong/core/data/DynamicLable;

.field public i:Ll/rql;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->g:I

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Ll/rql;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->i:Ll/rql;

    return-object p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)Lcom/p1/mobile/putong/core/data/DynamicLable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->h:Lcom/p1/mobile/putong/core/data/DynamicLable;

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/view/CardLabelItemView;Lcom/p1/mobile/putong/core/data/LabelStatistics;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->w(Lcom/p1/mobile/putong/core/data/LabelStatistics;)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/view/CardLabelItemView;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/view/CardLabelItemView$a;-><init>(Lcom/p1/mobile/putong/core/view/CardLabelItemView;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rl4;->a(Lcom/p1/mobile/putong/core/view/CardLabelItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/core/data/LabelStatistics;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LabelStatistics;->eid:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LabelStatistics;->params:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 39
    .line 40
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LabelParams;->value:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LabelStatistics;->eid:Ljava/lang/String;

    .line 49
    .line 50
    const-string p1, "p_suggest_users_home_view"

    .line 51
    .line 52
    invoke-static {p0, p1, v0}, Ll/sfj0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method
