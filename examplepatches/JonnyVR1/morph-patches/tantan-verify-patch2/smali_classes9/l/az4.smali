.class public Ll/az4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VText;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VButton;

.field public g:Landroidx/recyclerview/widget/RecyclerView;

.field public h:Lv/VEditText;

.field public i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public j:Ll/flq;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/olq;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/t4f0;

.field public final m:Ll/mz4;

.field public n:Ljava/lang/Boolean;

.field public o:Ll/kcg0;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;


# direct methods
.method public constructor <init>(Ll/mz4;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/az4;->n:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object p1, p0, Ll/az4;->m:Ll/mz4;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/az4;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/az4;->x(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Ll/az4;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->t(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ll/az4;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->z(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Ll/az4;Ll/olq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->s(Ll/olq;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;[ZLl/olq;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/olq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    aput-boolean v1, p1, v0

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p2}, Ll/olq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p2, p0}, Ll/olq;->c(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic f(Ll/az4;Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/az4;->y(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/az4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/az4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/az4;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->A(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j(Ll/az4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->w(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/az4;->n:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/az4;->h:Lv/VEditText;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final B(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;I)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Ll/az4;->o(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/az4;->d:Lv/VText;

    .line 6
    .line 7
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->V9:I

    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/az4;->f:Lv/VButton;

    .line 31
    .line 32
    if-ge p2, p1, :cond_0

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p1, 0x0

    .line 37
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final C()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/az4;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/uy4;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/uy4;-><init>(Ll/az4;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/az4;->b:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/vy4;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/vy4;-><init>(Ll/az4;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/az4;->f:Lv/VButton;

    .line 22
    .line 23
    new-instance v1, Ll/wy4;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/wy4;-><init>(Ll/az4;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/az4;->h:Lv/VEditText;

    .line 32
    .line 33
    new-instance v1, Ll/xy4;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/xy4;-><init>(Ll/az4;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/az4;->h:Lv/VEditText;

    .line 42
    .line 43
    new-instance v1, Ll/yy4;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/yy4;-><init>(Ll/az4;)V

    .line 46
    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    aput-object v1, v2, v3

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/az4;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 58
    .line 59
    new-instance v1, Ll/zy4;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/zy4;-><init>(Ll/az4;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [Z

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    aput-boolean v2, v1, v2

    .line 6
    .line 7
    iget-object v3, p0, Ll/az4;->k:Ljava/util/List;

    .line 8
    .line 9
    new-instance v4, Ll/ty4;

    .line 10
    .line 11
    invoke-direct {v4, p1, v1}, Ll/ty4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;[Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    aget-boolean p1, v1, v2

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/az4;->k:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/olq;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/olq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string v3, "All"

    .line 44
    .line 45
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ll/olq;->c(Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Ll/az4;->j:Ll/flq;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/az4;->p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/az4;->q()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->shieldingWords:Ljava/util/List;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/az4;->l:Ll/t4f0;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/t4f0;->J(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->jailedType:Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/az4;->D(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/az4;->p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, p1, v0}, Ll/az4;->B(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/az4;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/az4;->o:Ll/kcg0;

    .line 38
    .line 39
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/az4;->m:Ll/mz4;

    .line 43
    .line 44
    iget-object v0, p0, Ll/az4;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/ynp0;->G(Landroid/view/View;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/py4;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/py4;-><init>(Ll/az4;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Ll/az4;->o:Ll/kcg0;

    .line 72
    .line 73
    return-void
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bz4;->b(Ll/az4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cd:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v0, p0, Ll/az4;->p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/az4;->o(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Ll/az4;->l:Ll/t4f0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/t4f0;->G()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lt v1, v0, :cond_2

    .line 42
    .line 43
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 44
    .line 45
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->p7:I

    .line 46
    .line 47
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    invoke-static {p1}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p0, v1}, Ll/az4;->m(I)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    iget-object v1, p0, Ll/az4;->l:Ll/t4f0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/t4f0;->G()Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const-string v2, ""

    .line 85
    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q6:I

    .line 89
    .line 90
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/az4;->h:Lv/VEditText;

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_4
    iget-object v1, p0, Ll/az4;->l:Ll/t4f0;

    .line 100
    .line 101
    invoke-virtual {v1}, Ll/t4f0;->G()Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/4 v3, 0x0

    .line 106
    invoke-interface {v1, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/az4;->l:Ll/t4f0;

    .line 110
    .line 111
    invoke-virtual {p1, v1}, Ll/t4f0;->J(Ljava/util/List;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/az4;->h:Lv/VEditText;

    .line 115
    .line 116
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/az4;->p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 120
    .line 121
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-virtual {p0, p1, v2}, Ll/az4;->B(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;I)V

    .line 126
    .line 127
    .line 128
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-ne p1, v0, :cond_5

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/az4;->p()V

    .line 135
    .line 136
    .line 137
    :cond_5
    :goto_0
    return-void
.end method

.method public final m(I)Z
    .locals 0

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    if-le p1, p0, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vj:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/az4;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/az4;->o:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->shieldingWordMaxCount:I

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return p0

    .line 9
    :cond_1
    :goto_0
    const/4 p0, 0x5

    .line 10
    return p0
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/az4;->n:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/az4;->m:Ll/mz4;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/az4;->h:Lv/VEditText;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/az4;->h:Lv/VEditText;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    iput-object v0, p0, Ll/az4;->n:Ljava/lang/Boolean;

    .line 30
    .line 31
    return-void
.end method

.method public final q()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/az4;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    iget-object v1, p0, Ll/az4;->m:Ll/mz4;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/az4;->m:Ll/mz4;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {p0, v2, v3}, Ll/az4;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/az4;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 32
    .line 33
    iget-object v0, p0, Ll/az4;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 34
    .line 35
    new-instance v1, Ll/guf0;

    .line 36
    .line 37
    sget v2, Ll/qa00;->j:I

    .line 38
    .line 39
    sget v3, Ll/qa00;->m:I

    .line 40
    .line 41
    invoke-direct {v1, v2, v3, v3}, Ll/guf0;-><init>(III)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/az4;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 48
    .line 49
    new-instance v1, Ll/guf0;

    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-direct {v1, v2, v4, v3}, Ll/guf0;-><init>(III)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/az4;->r()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/az4;->C()V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final r()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/az4;->k:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/olq;

    .line 9
    .line 10
    const-string v2, "All"

    .line 11
    .line 12
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v1, v2, v3}, Ll/olq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Z)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/az4;->k:Ljava/util/List;

    .line 24
    .line 25
    new-instance v1, Ll/olq;

    .line 26
    .line 27
    const-string v2, "FollowerAndManager"

    .line 28
    .line 29
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2, v3}, Ll/olq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Z)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/az4;->k:Ljava/util/List;

    .line 40
    .line 41
    new-instance v1, Ll/olq;

    .line 42
    .line 43
    const-string v2, "Manager"

    .line 44
    .line 45
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-direct {v1, v2, v3}, Ll/olq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Z)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/az4;->k:Ljava/util/List;

    .line 56
    .line 57
    new-instance v1, Ll/olq;

    .line 58
    .line 59
    const-string v2, "None"

    .line 60
    .line 61
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-direct {v1, v2, v3}, Ll/olq;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Z)V

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/flq;

    .line 72
    .line 73
    iget-object v1, p0, Ll/az4;->k:Ljava/util/List;

    .line 74
    .line 75
    new-instance v2, Ll/ry4;

    .line 76
    .line 77
    invoke-direct {v2, p0}, Ll/ry4;-><init>(Ll/az4;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {v0, v1, v2}, Ll/flq;-><init>(Ljava/util/List;Ll/y20;)V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Ll/az4;->j:Ll/flq;

    .line 84
    .line 85
    iget-object v1, p0, Ll/az4;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 86
    .line 87
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/t4f0;

    .line 91
    .line 92
    invoke-direct {v0}, Ll/t4f0;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Ll/az4;->l:Ll/t4f0;

    .line 96
    .line 97
    new-instance v1, Ll/sy4;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/sy4;-><init>(Ll/az4;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ll/t4f0;->K(Ll/y20;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/az4;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 106
    .line 107
    iget-object p0, p0, Ll/az4;->l:Ll/t4f0;

    .line 108
    .line 109
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final synthetic s(Ll/olq;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/olq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/az4;->D(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/az4;->l:Ll/t4f0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t4f0;->G()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/az4;->l:Ll/t4f0;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/t4f0;->J(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/az4;->p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/az4;->B(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/az4;->n:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/az4;->p()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/az4;->n()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "All"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/az4;->k:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/qy4;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/qy4;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/olq;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/olq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :cond_0
    iget-object v0, p0, Ll/az4;->m:Ll/mz4;

    .line 31
    .line 32
    iget-object p0, p0, Ll/az4;->l:Ll/t4f0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/t4f0;->G()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p1, p0}, Ll/mz4;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/az4;->f:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->p7:I

    .line 12
    .line 13
    iget-object v1, p0, Ll/az4;->p:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ll/az4;->o(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p1, p0, Ll/az4;->h:Lv/VEditText;

    .line 36
    .line 37
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object v0, p0, Ll/az4;->h:Lv/VEditText;

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/az4;->h:Lv/VEditText;

    .line 50
    .line 51
    invoke-static {p1}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/az4;->m:Ll/mz4;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p0, p0, Ll/az4;->h:Lv/VEditText;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Ll/az4;->l(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic x(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x6

    .line 2
    if-eq p2, p1, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0

    .line 6
    :cond_0
    iget-object p1, p0, Ll/az4;->h:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/az4;->l(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/az4;->p()V

    .line 26
    .line 27
    .line 28
    :cond_1
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public final synthetic y(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p4}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p2}, Ll/az4;->m(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object p1
.end method

.method public final synthetic z(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/az4;->h:Lv/VEditText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/az4;->h:Lv/VEditText;

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
