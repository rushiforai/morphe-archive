.class public Ll/bh4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rg4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VEditText;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public final h:Lcom/p1/mobile/putong/app/PutongAct;

.field public i:Ll/rg4;

.field public j:Landroid/view/MenuItem;

.field public k:Ll/e90;

.field public l:Landroid/widget/TextView;

.field public m:Lcom/p1/mobile/android/app/Dialog;

.field public n:Ll/nlm;

.field public o:Landroidx/recyclerview/widget/LinearLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bh4;->h:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    new-instance p1, Ll/nlm;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/nlm;-><init>(Ll/bh4;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/bh4;->n:Ll/nlm;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/bh4;->k:Ll/e90;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/e90;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Ll/e90;-><init>(Ll/bh4;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/bh4;->k:Ll/e90;

    .line 11
    .line 12
    iget-object p1, p0, Ll/bh4;->i:Ll/rg4;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/rg4;->n0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Ll/bh4;->k:Ll/e90;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->p(Landroid/widget/ListAdapter;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/zg4;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/zg4;-><init>(Ll/bh4;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    iget-object p1, p0, Ll/bh4;->i:Ll/rg4;

    .line 47
    .line 48
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-wide/16 v1, 0x3

    .line 55
    .line 56
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance v0, Ll/ah4;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Ll/ah4;-><init>(Ll/bh4;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static synthetic a(Ll/bh4;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bh4;->z(Lrx/Notification;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ll/bh4;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bh4;->C(Landroid/widget/TextView;)V

    return-void
.end method

.method public static synthetic d(Ll/bh4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bh4;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/bh4;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bh4;->y(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic f(Ll/bh4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bh4;->E()V

    return-void
.end method

.method public static synthetic i(Ll/bh4;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bh4;->x(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic j(Ll/bh4;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bh4;->B(Ll/x20;)V

    return-void
.end method

.method private n(ZLandroid/widget/TextView;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p0, p2, p1}, Ll/jfh;->a(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Z)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/jka;->Pb()Ll/jfh;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0, p2, p1}, Ll/jfh;->d(Landroid/widget/TextView;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic x(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bh4;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic B(Ll/x20;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/bri0;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v1, 0x64

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic C(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bh4;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0, p1}, Ll/bh4;->n(ZLandroid/widget/TextView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bh4;->h:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->i:Ll/rg4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rg4;->t0()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F()Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bh4;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

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
    iget-object p0, p0, Ll/bh4;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/bh4;->o:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .line 24
    return-object v0
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

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
    iget-object p0, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->h3:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public H(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/bh4;->i:Ll/rg4;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rg4;->p0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance v0, Ll/mxg;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->E3:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/mxg;->j(I)Ll/mxg;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->D3:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/mxg;->d(I)Ll/mxg;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->r:I

    .line 51
    .line 52
    new-instance v2, Ll/wg4;

    .line 53
    .line 54
    invoke-direct {v2, p0, p1}, Ll/wg4;-><init>(Ll/bh4;Ll/x20;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/mxg;->g(I)Ll/mxg;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public I(Landroid/view/Menu;)Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1, p1}, Ll/jfh;->f(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;)Landroid/view/MenuItem;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/bh4;->j:Landroid/view/MenuItem;

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/jka;->Pb()Ll/jfh;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/bh4;->j:Landroid/view/MenuItem;

    .line 28
    .line 29
    new-instance v2, Ll/ug4;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/ug4;-><init>(Ll/bh4;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v0, v1, v2}, Ll/jfh;->e(Lcom/p1/mobile/android/app/Act;Landroid/view/MenuItem;Ll/y20;)Landroid/widget/TextView;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/bh4;->l:Landroid/widget/TextView;

    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/jka;->Pb()Ll/jfh;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Ll/bh4;->j:Landroid/view/MenuItem;

    .line 51
    .line 52
    iget-object v2, p0, Ll/bh4;->l:Landroid/widget/TextView;

    .line 53
    .line 54
    new-instance v3, Ll/vg4;

    .line 55
    .line 56
    invoke-direct {v3, p0}, Ll/vg4;-><init>(Ll/bh4;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1, v0, v1, v2, v3}, Ll/jfh;->k(Lcom/p1/mobile/android/app/Act;Landroid/view/MenuItem;Landroid/widget/TextView;Ll/x20;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/bh4;->O()V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0
.end method

.method public J()Ll/rg4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->i:Ll/rg4;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->g:Lv/VText;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bh4;->n:Ll/nlm;

    .line 2
    .line 3
    new-instance v1, Ll/tg4;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/tg4;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Ll/nlm;->O(Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bh4;->F()Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/bh4;->n:Ll/nlm;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/nlm;->getItemCount()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/lit8 v0, v0, -0x1

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/bh4;->O()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public N(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

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
    iget-object v0, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/bh4;->g:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bh4;->j:Landroid/view/MenuItem;

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
    iget-object v0, p0, Ll/bh4;->j:Landroid/view/MenuItem;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bh4;->q()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/bh4;->l:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/bh4;->q()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Ll/bh4;->l:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-direct {p0, v0, v1}, Ll/bh4;->n(ZLandroid/widget/TextView;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public P(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bh4;->k:Ll/e90;

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
    iput-boolean v0, p0, Ll/e90;->d:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rg4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bh4;->m(Ll/rg4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bh4;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ch4;->b(Ll/bh4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bh4;->h:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/rg4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bh4;->i:Ll/rg4;

    .line 2
    .line 3
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public q()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bh4;->c:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/bh4;->c:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v3, 0x8

    .line 18
    .line 19
    if-ne v0, v3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    move v0, v2

    .line 25
    :goto_1
    iget-object v3, p0, Ll/bh4;->b:Lv/VEditText;

    .line 26
    .line 27
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    iget-object v3, p0, Ll/bh4;->b:Lv/VEditText;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    const/4 v3, 0x0

    .line 49
    :goto_2
    if-eqz v0, :cond_4

    .line 50
    .line 51
    iget-object p0, p0, Ll/bh4;->i:Ll/rg4;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/rg4;->p0()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_4

    .line 64
    .line 65
    :cond_3
    return v2

    .line 66
    :cond_4
    return v1
.end method

.method public s()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/bh4;->b:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

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
    iget-object v0, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/bh4;->i:Ll/rg4;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/rg4;->i0()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/bh4;->g:Lv/VText;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public w(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->G3:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/bh4;->b:Lv/VEditText;

    .line 11
    .line 12
    const/16 v0, 0x7d0

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lv/VEditText;->setMaxLength(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/bh4;->b:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/bh4$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/bh4$a;-><init>(Ll/bh4;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/zt40;->b()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/bh4;->f:Lv/VText;

    .line 38
    .line 39
    const/16 v0, 0x8

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget v0, Ll/lbc0;->g6:I

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/high16 v0, 0x41800000    # 16.0f

    .line 60
    .line 61
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/4 v2, 0x0

    .line 70
    invoke-virtual {p1, v2, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/bh4;->f:Lv/VText;

    .line 74
    .line 75
    const/4 v1, 0x0

    .line 76
    invoke-virtual {v0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object p1, p0, Ll/bh4;->b:Lv/VEditText;

    .line 80
    .line 81
    invoke-virtual {p1}, Lv/VEditText;->h()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v0, Ll/xg4;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/xg4;-><init>(Ll/bh4;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/bh4;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/bh4;->F()Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/bh4;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 107
    .line 108
    iget-object v0, p0, Ll/bh4;->n:Ll/nlm;

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/bh4;->F()Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object v0, p0, Ll/bh4;->n:Ll/nlm;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/nlm;->getItemCount()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/lit8 v0, v0, -0x1

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/bh4;->g:Lv/VText;

    .line 129
    .line 130
    new-instance v0, Ll/yg4;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Ll/yg4;-><init>(Ll/bh4;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/bh4;->b:Lv/VEditText;

    .line 139
    .line 140
    new-instance v0, Ll/bh4$b;

    .line 141
    .line 142
    invoke-direct {v0, p0}, Ll/bh4$b;-><init>(Ll/bh4;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public final synthetic y(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Lrx/Notification;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/bh4;->i:Ll/rg4;

    .line 8
    .line 9
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/rg4;->j0(Lcom/p1/mobile/putong/location/Location;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->i()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    :try_start_0
    iget-object p1, p0, Ll/bh4;->m:Lcom/p1/mobile/android/app/Dialog;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/g1e;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception p1

    .line 40
    new-instance v0, Ljava/lang/Exception;

    .line 41
    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v2, "CaptionAct exception:"

    .line 45
    .line 46
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-direct {v0, v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    iget-object p0, p0, Ll/bh4;->h:Lcom/p1/mobile/putong/app/PutongAct;

    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    invoke-static {p0, p1}, Ll/k3h;->E0(Lcom/p1/mobile/android/app/Act;I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method
