.class public Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->k(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->l(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->o()V

    return-void
.end method

.method private getAct()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n810;->a(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/a0g;->E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/k810;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/k810;-><init>(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V

    .line 12
    .line 13
    .line 14
    const/16 v2, 0x5566

    .line 15
    .line 16
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment;->z4(ILandroid/content/Intent;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;)Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment;->A4(Landroidx/fragment/app/FragmentManager;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public j()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->q()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/fake/b;->q()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/m810;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/m810;-><init>(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->j:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method

.method public final synthetic k(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v1, v1, [Landroid/view/View;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput-object v0, v1, v2

    .line 14
    .line 15
    invoke-static {v1}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->a:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    new-instance v1, Ll/g810;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/g810;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->b:Lv/VImage;

    .line 29
    .line 30
    new-instance v1, Ll/h810;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/h810;-><init>(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->i:Lv/VText;

    .line 39
    .line 40
    new-instance v1, Ll/i810;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/i810;-><init>(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->h:Lv/VText;

    .line 49
    .line 50
    new-instance v1, Ll/j810;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/j810;-><init>(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_fake_alert_popup_example"

    .line 2
    .line 3
    const-string v0, "p_fake_alert_popup_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    new-instance v1, Ll/l810;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/l810;-><init>(Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-static {p1, v0, v1, p0}, Ll/ks90;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public q()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->d:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/e46;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/e46;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/d46;

    .line 28
    .line 29
    const-string v2, "\u8bf7\u66f4\u6362\u771f\u5b9e\u5934\u50cf"

    .line 30
    .line 31
    const/high16 v3, -0x34000000    # -3.3554432E7f

    .line 32
    .line 33
    invoke-direct {v1, v2, v3}, Ll/d46;-><init>(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ll/e46;->f(Ljava/lang/CharSequence;Ll/h46;)Ll/e46;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->f:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/e46;->h()Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/e46;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/e46;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v1, "\u63a2\u63a2\u662f\u4e00\u4e2a\u771f\u5b9e\u5934\u50cf\u793e\u533a\uff0c\u8bf7\u4e0a\u4f20"

    .line 54
    .line 55
    const/high16 v2, 0x66000000

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ll/e46;->a(Ljava/lang/CharSequence;I)Ll/e46;

    .line 58
    .line 59
    .line 60
    new-instance v1, Ll/d46;

    .line 61
    .line 62
    const-string v4, "\u672c\u4eba\u7684\u3001\u770b\u5f97\u6e05\u8138\u7684\u5934\u50cf\uff0c"

    .line 63
    .line 64
    invoke-direct {v1, v4, v3}, Ll/d46;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v4, v1}, Ll/e46;->f(Ljava/lang/CharSequence;Ll/h46;)Ll/e46;

    .line 68
    .line 69
    .line 70
    const-string v1, "\u8ba9\u7f18\u5206\u5feb\u901f\u627e\u5230\u4f60"

    .line 71
    .line 72
    invoke-virtual {v0, v1, v2}, Ll/e46;->e(Ljava/lang/CharSequence;I)Ll/e46;

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->g:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/e46;->h()Ljava/lang/CharSequence;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakebyconv/MsgTabFakeBubbleRoot;->j:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
