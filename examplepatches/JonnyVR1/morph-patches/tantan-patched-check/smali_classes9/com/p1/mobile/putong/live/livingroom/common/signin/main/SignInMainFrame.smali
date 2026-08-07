.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$b;
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Lv/VText;

.field public g:Landroidx/recyclerview/widget/RecyclerView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wbf0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->c:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    new-instance v0, Ll/tbf0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/tbf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->a:Lv/VImage;

    .line 14
    .line 15
    new-instance v0, Ll/ubf0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/ubf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->t4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->u4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->signInCount:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Od:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->f:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    new-instance v1, Ll/zcf0;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/zcf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public h(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->d:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;

    .line 16
    .line 17
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "https://auto.tancdn.com/v1/raw/1b67db46-ad43-43cd-ac40-2c0a403a30d111.so"

    .line 21
    .line 22
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ll/zvk;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Md:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "#f79533"

    .line 25
    .line 26
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const-string v2, "#f7c333"

    .line 31
    .line 32
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    filled-new-array {v1, v2}, [I

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/zvk;->e([I)Ll/zvk;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Ll/zvk;->k(Z)Ll/zvk;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/16 v1, 0xc

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/zvk;->t(I)Ll/zvk;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {v0, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget v1, Ll/qa00;->i:I

    .line 61
    .line 62
    sget v2, Ll/qa00;->f:I

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2, v1, v2}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/high16 v1, -0x3f000000    # -8.0f

    .line 69
    .line 70
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {v0, v1}, Ll/zvk;->o(I)Ll/zvk;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sget v1, Ll/zvk;->A:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ll/zvk;->i(I)Ll/zvk;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->c:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    invoke-virtual {v1, v0, p0}, Ll/fwk;->t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$b;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$b;-><init>(Ll/vbf0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
