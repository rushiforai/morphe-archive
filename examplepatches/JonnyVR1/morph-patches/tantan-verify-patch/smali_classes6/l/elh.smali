.class public Ll/elh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/umh;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public a:Ll/umh;

.field public b:Z

.field public c:Landroid/widget/TextView;

.field public d:Lv/VRecyclerView;

.field public e:Ll/s8h;

.field public f:Lv/VLinear;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VPullDownRefreshLayout;

.field public k:Ll/b370;

.field public l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

.field public m:Landroid/widget/FrameLayout;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/elh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/elh;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c(Ll/elh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/elh;->p()V

    return-void
.end method

.method public static synthetic d()V
    .locals 3

    .line 1
    sget-object v0, Ll/umg;->h:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    const-string v0, "all_read_remind_popup_option"

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/tfj0$a;->f(Ljava/lang/String;I)Ll/tfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ll/tfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "e_all_read_remind_popup"

    .line 26
    .line 27
    const-string v2, "p_activity"

    .line 28
    .line 29
    invoke-static {v1, v2, v0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic e(Ll/elh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/elh;->q()V

    return-void
.end method

.method public static synthetic f(Ll/elh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/elh;->s(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u70b9\u51fb\u5168\u90e8\u5df2\u8bfb\uff0c\u6279\u91cf\u6e05\u9664\u672a\u8bfb\u6d88\u606f"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Ll/k9c0;->n:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    filled-new-array {v1}, [I

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/high16 v1, 0x41500000    # 13.0f

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Ll/qa00;->i:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->z(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-wide/16 v2, 0x1388

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 62
    .line 63
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 64
    .line 65
    or-int/2addr v2, v3

    .line 66
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 71
    .line 72
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget v1, Ll/qa00;->c:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v2, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 87
    .line 88
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Ll/elh;->n:Ljava/lang/String;

    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    new-array p0, p0, [Ll/tfj0$a;

    .line 96
    .line 97
    const-string v0, "e_all_read_bubble"

    .line 98
    .line 99
    const-string v1, "p_activity"

    .line 100
    .line 101
    invoke-static {v0, v1, p0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u63d0\u793a"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "\u4f60\u6709\u8fc7\u591a\u5386\u53f2\u4e92\u52a8\u6d88\u606f\u672a\u8bfb\uff0c\u4f60\u53ef\u4ee5\u70b9\u51fb\u5168\u90e8\u5df2\u8bfb\u4e00\u952e\u6e05\u9664\uff0c\u957f\u65f6\u95f4\u672a\u5904\u7406\u7cfb\u7edf\u53ef\u80fd\u4f1a\u81ea\u52a8\u6e05\u9664"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/clh;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/clh;-><init>(Ll/elh;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "\u5168\u90e8\u5df2\u8bfb"

    .line 28
    .line 29
    invoke-virtual {v0, p0, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/dlh;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/dlh;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v1, "\u6682\u65f6\u5ffd\u7565"

    .line 39
    .line 40
    invoke-virtual {p0, v1, v0}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    new-array p0, p0, [Ll/tfj0$a;

    .line 49
    .line 50
    const-string v0, "e_all_read_remind_popup"

    .line 51
    .line 52
    const-string v1, "p_activity"

    .line 53
    .line 54
    invoke-static {v0, v1, p0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public C(I)V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "\u6709"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/16 v2, 0x63

    .line 23
    .line 24
    if-le p1, v2, :cond_0

    .line 25
    .line 26
    const-string p1, "99+"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, "\u4e2a\u4eba\u901a\u8fc7\u52a8\u6001\u5bf9\u4f60\u611f\u5174\u8da3\uff0c\u8981\u4e0d\u8981\u770b\u770b\u4ed6\u4eec\u90fd\u662f\u8c01\uff1f"

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "\u53bb\u770b\u770b"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/alh;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/alh;-><init>(Ll/elh;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string v0, "\u5168\u90e8\u5df2\u8bfb"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v0, Ll/blh;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ll/blh;-><init>(Ll/elh;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public F(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 10
    .line 11
    .line 12
    :cond_1
    :goto_0
    return-void
.end method

.method public H(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/elh;->m:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/elh;->m:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public I(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/elh;->f:Lv/VLinear;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->l()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/umh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/elh;->l(Ll/umh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public l(Ll/umh;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/elh;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/elh;->n:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/elh;->n:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/elh;->e:Ll/s8h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/elh;->e:Ll/s8h;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zzk;->D()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 23
    .line 24
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object p0, p0, Ll/elh;->k:Ll/b370;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic p()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollTo(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    instance-of v0, p0, Ll/zmh;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/zmh;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/zmh;->b2()Ll/hnh;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/hnh;->Z()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/umh;->R1()V

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-static {}, Ll/umg;->a()V

    .line 21
    .line 22
    .line 23
    const-string p0, "all_read_remind_popup_option"

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p0, v0}, Ll/tfj0$a;->f(Ljava/lang/String;I)Ll/tfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p0}, [Ll/tfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "e_all_read_remind_popup"

    .line 35
    .line 36
    const-string v1, "p_activity"

    .line 37
    .line 38
    invoke-static {v0, v1, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Jn()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    sget p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->i:I

    .line 23
    .line 24
    invoke-virtual {p1, v0, p0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    instance-of p1, p0, Ll/zmh;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/zmh;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/zmh;->b2()Ll/hnh;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/hnh;->Z()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/umh;->R1()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/umh;->O1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/zkh;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/zkh;-><init>(Ll/elh;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public x(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/elh;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Ll/elh;->f:Lv/VLinear;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 25
    .line 26
    iget-object v0, p0, Ll/elh;->g:Lv/VDraweeView;

    .line 27
    .line 28
    sget v1, Ll/lbc0;->f1:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/cmg;->W()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, p0, Ll/elh;->a:Ll/umh;

    .line 42
    .line 43
    iget-object v0, v0, Ll/umh;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Ll/elh;->h:Lv/VText;

    .line 52
    .line 53
    const-string p1, "\u8fd8\u6ca1\u6709\u6536\u5230\u70b9\u8d5e\uff0c\u5feb\u53bb\u53d1\u5e03\u52a8\u6001"

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    iget-object p0, p0, Ll/elh;->h:Lv/VText;

    .line 60
    .line 61
    const-string p1, "\u4f60\u6ca1\u6709\u6536\u5230\u4efb\u4f55\u6d88\u606f"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iput-boolean v1, p0, Ll/elh;->b:Z

    .line 68
    .line 69
    iget-object v0, p0, Ll/elh;->f:Lv/VLinear;

    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/elh;->j:Lv/VPullDownRefreshLayout;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/elh;->k:Ll/b370;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/b370;->G(Ljava/util/List;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public y(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->W(Ljava/util/List;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/elh;->a:Ll/umh;

    .line 9
    .line 10
    iget-object v0, v0, Ll/umh;->c:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 27
    .line 28
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Ll/ykh;

    .line 31
    .line 32
    invoke-direct {v3, v2}, Ll/ykh;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 42
    .line 43
    const-string v3, "comment_reply"

    .line 44
    .line 45
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 52
    .line 53
    const-string v3, "comment"

    .line 54
    .line 55
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_1

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget-object p1, p0, Ll/elh;->k:Ll/b370;

    .line 66
    .line 67
    iget-object p0, p0, Ll/elh;->a:Ll/umh;

    .line 68
    .line 69
    iget-object p0, p0, Ll/umh;->c:Ljava/util/List;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ll/b370;->G(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
