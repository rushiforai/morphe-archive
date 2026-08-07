.class public Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/iyf;->a(Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ll/x20;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;->c:Lv/VDraweeView;

    .line 4
    .line 5
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlE0RlNZSklHVFdTSEM0QVAyWUdZREMyN0VBNVNKVTEzIiwidyI6MTA3NywiaCI6MTgwMCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjEzODM1MDU4MDk4MjMxODY5NTM2fQ.png"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;->g:Lv/VDraweeView;

    .line 13
    .line 14
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFPRjVPREU0S1VaRUJISkxORjc0Q0RRRlVWUTMzUDEzIiwidyI6MTA3NywiaCI6ODU5LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTA4MTAzNTM0NjQyODYzMTY0NjZ9.png"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;->h:Landroid/widget/TextView;

    .line 20
    .line 21
    new-instance v1, Ll/eyf;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Ll/eyf;-><init>(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/pf7;->h()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;->a:Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/fakecard/FakeDailogCard;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
