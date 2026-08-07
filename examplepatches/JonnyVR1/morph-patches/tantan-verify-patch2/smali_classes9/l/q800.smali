.class public Ll/q800;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rdz;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/rdz<",
        "Lcom/p1/mobile/putong/data/User;",
        "Ll/yxz;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VImage;

.field public B:Landroid/widget/FrameLayout;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Landroid/view/ViewStub;

.field public F:Landroid/view/ViewStub;

.field public G:Lv/VText;

.field public H:Lv/VText;

.field public I:Landroid/view/View;

.field public J:Ll/clz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/clz<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/yxz;",
            ">;"
        }
    .end annotation
.end field

.field public K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public L:Ll/iwl;

.field public M:Z

.field public N:Z

.field public O:Z

.field public P:Z

.field public Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

.field public R:I

.field public S:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

.field public T:Ll/x20;

.field public U:Z

.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VProgressBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

.field public l:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

.field public m:Lcom/p1/mobile/putong/core/ui/messages/view/MessageMarryHeaderLayout;

.field public n:Landroid/view/ViewStub;

.field public o:Landroid/view/ViewStub;

.field public p:Landroid/view/ViewStub;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/LinearLayout;

.field public s:Landroid/widget/TextView;

.field public t:Lv/VText;

.field public u:Landroid/widget/FrameLayout;

.field public v:Lv/VText;

.field public w:Landroid/widget/FrameLayout;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/q800;->M:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/q800;->N:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/q800;->O:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/q800;->P:Z

    .line 12
    .line 13
    const v0, 0x7fffffff

    .line 14
    .line 15
    .line 16
    iput v0, p0, Ll/q800;->R:I

    .line 17
    .line 18
    new-instance v0, Ll/j800;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/j800;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/q800;->T:Ll/x20;

    .line 24
    .line 25
    iput-boolean p1, p0, Ll/q800;->U:Z

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->D1:Ll/vxd0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic l(Ll/q800;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q800;->z(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m(Ll/q800;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q800;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n()V
    .locals 0

    .line 1
    invoke-static {}, Ll/o3z;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ll/q800;[ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/q800;->y([ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q([ZLcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    aget-boolean p0, p0, v1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q800;->J:Ll/clz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "header"

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/q800;->U:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    const-string v1, "quickchatPeek"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 35
    .line 36
    iget v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    move v0, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v0, 0x0

    .line 43
    :goto_0
    iget-object v1, p0, Ll/q800;->J:Ll/clz;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v3, "is_privileged"

    .line 50
    .line 51
    invoke-static {v3, v0}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v3, "moments_user_id"

    .line 56
    .line 57
    invoke-static {v3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    filled-new-array {v0, p1}, [Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v0, "e_quickchat_peek"

    .line 66
    .line 67
    invoke-static {v0, v1, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 68
    .line 69
    .line 70
    iput-boolean v2, p0, Ll/q800;->U:Z

    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q800;->u:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/iwl;Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ll/iwl;",
            "Ll/clz<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/yxz;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Ll/q800;->J:Ll/clz;

    .line 2
    .line 3
    iput-object p1, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    iput-object p2, p0, Ll/q800;->L:Ll/iwl;

    .line 6
    .line 7
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p2}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0, p1, p2}, Ll/q800;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/q800;->I:Landroid/view/View;

    .line 20
    .line 21
    iget-object p1, p0, Ll/q800;->h:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/q800;->i:Lv/VText;

    .line 28
    .line 29
    const/4 p2, 0x2

    .line 30
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/q800;->j:Lv/VText;

    .line 38
    .line 39
    const/16 p2, 0x8

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 45
    .line 46
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U(Ll/clz;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->H:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

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
    iget-object v0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 10
    .line 11
    iget-object v1, p0, Ll/q800;->J:Ll/clz;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/q800;->J:Ll/clz;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->t0(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public f()Landroid/view/ViewStub;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->o:Landroid/view/ViewStub;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->I:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/vg60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q800;->J:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/q800;->b:Lv/VProgressBar;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/q800;->d:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/q800;->d:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    xor-int/2addr p1, v2

    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q800;->u:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    iget-object v1, p0, Ll/q800;->v:Lv/VText;

    .line 10
    .line 11
    iget-object v2, p0, Ll/q800;->J:Ll/clz;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/clz;->r3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v1, v2}, Ll/o3z;->l(Landroid/content/Context;Lv/VText;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/q800;->u:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    new-instance v1, Ll/p800;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/p800;-><init>(Ll/q800;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public j()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/q800;->m:Lcom/p1/mobile/putong/core/ui/messages/view/MessageMarryHeaderLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->D2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/q800;->m:Lcom/p1/mobile/putong/core/ui/messages/view/MessageMarryHeaderLayout;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Ll/q800;->J:Ll/clz;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/clz;->q3()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Ll/q800;->n:Landroid/view/ViewStub;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

    .line 72
    .line 73
    iput-object v0, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 74
    .line 75
    :cond_1
    iget-object v0, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 76
    .line 77
    iget-object v1, p0, Ll/q800;->J:Ll/clz;

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v2, p0, Ll/q800;->J:Ll/clz;

    .line 84
    .line 85
    invoke-virtual {v2}, Ll/clz;->q3()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    iget-object v3, p0, Ll/q800;->J:Ll/clz;

    .line 92
    .line 93
    invoke-virtual {v3}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    iget-object v0, p0, Ll/q800;->J:Ll/clz;

    .line 116
    .line 117
    iget-object v0, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_4

    .line 124
    .line 125
    iget-object v0, p0, Ll/q800;->J:Ll/clz;

    .line 126
    .line 127
    iget-object v0, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 130
    .line 131
    const-string v2, "lovebuzz"

    .line 132
    .line 133
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    iget-object v0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 140
    .line 141
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/q800;->S:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

    .line 145
    .line 146
    if-nez v0, :cond_3

    .line 147
    .line 148
    iget-object v0, p0, Ll/q800;->p:Landroid/view/ViewStub;

    .line 149
    .line 150
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

    .line 155
    .line 156
    iput-object v0, p0, Ll/q800;->S:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

    .line 157
    .line 158
    :cond_3
    iget-object v0, p0, Ll/q800;->S:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

    .line 159
    .line 160
    iget-object v1, p0, Ll/q800;->J:Ll/clz;

    .line 161
    .line 162
    invoke-virtual {v1}, Ll/clz;->q3()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iget-object v3, p0, Ll/q800;->J:Ll/clz;

    .line 177
    .line 178
    iget-object v3, v3, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 179
    .line 180
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->v6(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v3}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    iget-object v4, p0, Ll/q800;->J:Ll/clz;

    .line 193
    .line 194
    iget-object v4, v4, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 195
    .line 196
    invoke-interface {v3, v4}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;->m(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 201
    .line 202
    .line 203
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/q800;->A:Lv/VImage;

    .line 204
    .line 205
    sget v1, Ll/ibc0;->j1:I

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Ll/q800;->z:Landroid/widget/LinearLayout;

    .line 211
    .line 212
    sget v0, Ll/ibc0;->U0:I

    .line 213
    .line 214
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public k()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/q800;->J:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/clz;->q3()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object v1, p0, Ll/q800;->J:Ll/clz;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x0

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/q800;->x()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    iget-object v2, p0, Ll/q800;->J:Ll/clz;

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/clz;->q3()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 60
    .line 61
    if-nez v2, :cond_1

    .line 62
    .line 63
    iget-object v2, p0, Ll/q800;->l:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 64
    .line 65
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v2, p0, Ll/q800;->l:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 70
    .line 71
    const/4 v5, 0x2

    .line 72
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->setPage(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/q800;->l:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/q800;->x()Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    xor-int/2addr v5, v3

    .line 82
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->setLocked(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Ll/q800;->l:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 86
    .line 87
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 88
    .line 89
    invoke-virtual {v5}, Ll/clz;->q3()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 96
    .line 97
    iget-object v6, p0, Ll/q800;->J:Ll/clz;

    .line 98
    .line 99
    invoke-virtual {v6}, Ll/clz;->q3()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    check-cast v6, Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    invoke-virtual {v2, v5, v6}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->g(Lcom/p1/mobile/putong/data/UserActivityInfo;Z)V

    .line 110
    .line 111
    .line 112
    :cond_2
    :goto_0
    iget-object v2, p0, Ll/q800;->i:Lv/VText;

    .line 113
    .line 114
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 115
    .line 116
    invoke-virtual {v5}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    sget v6, Ll/g9c0;->k:I

    .line 121
    .line 122
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Ll/q800;->j:Lv/VText;

    .line 130
    .line 131
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 132
    .line 133
    invoke-virtual {v5}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    sget v6, Ll/g9c0;->k:I

    .line 138
    .line 139
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    iget-object v2, p0, Ll/q800;->h:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 149
    .line 150
    .line 151
    iget-object v2, p0, Ll/q800;->J:Ll/clz;

    .line 152
    .line 153
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    check-cast v2, Ll/yxz;

    .line 166
    .line 167
    iget-boolean v2, v2, Ll/yxz;->M1:Z

    .line 168
    .line 169
    if-eqz v2, :cond_3

    .line 170
    .line 171
    iget-object v2, p0, Ll/q800;->h:Landroid/widget/LinearLayout;

    .line 172
    .line 173
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 174
    .line 175
    sget v6, Ll/ibc0;->R4:I

    .line 176
    .line 177
    invoke-virtual {v5, v6}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v2, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 182
    .line 183
    .line 184
    iget-object v2, p0, Ll/q800;->i:Lv/VText;

    .line 185
    .line 186
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 187
    .line 188
    invoke-virtual {v5}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    sget v6, Ll/g9c0;->a0:I

    .line 193
    .line 194
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 199
    .line 200
    .line 201
    iget-object v2, p0, Ll/q800;->j:Lv/VText;

    .line 202
    .line 203
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 204
    .line 205
    invoke-virtual {v5}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    sget v6, Ll/g9c0;->a0:I

    .line 210
    .line 211
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 216
    .line 217
    .line 218
    :cond_3
    iget-object v2, p0, Ll/q800;->J:Ll/clz;

    .line 219
    .line 220
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-interface {v2}, Ll/mzl;->F()Ll/ruy;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {v2, v0}, Ll/ruy;->x0(Lcom/p1/mobile/putong/data/User;)V

    .line 229
    .line 230
    .line 231
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 232
    .line 233
    .line 234
    move-result-object v5

    .line 235
    invoke-virtual {v5}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    if-eqz v5, :cond_4

    .line 244
    .line 245
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 246
    .line 247
    iget-object v5, v5, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 248
    .line 249
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v5

    .line 253
    if-eqz v5, :cond_4

    .line 254
    .line 255
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 256
    .line 257
    iget-object v5, v5, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 258
    .line 259
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 260
    .line 261
    const-string v6, "lovebuzz"

    .line 262
    .line 263
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v5

    .line 267
    if-eqz v5, :cond_4

    .line 268
    .line 269
    iget-object v5, p0, Ll/q800;->S:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

    .line 270
    .line 271
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v5

    .line 275
    if-eqz v5, :cond_4

    .line 276
    .line 277
    iget-object v5, p0, Ll/q800;->S:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;

    .line 278
    .line 279
    invoke-virtual {v2}, Ll/ruy;->k0()I

    .line 280
    .line 281
    .line 282
    move-result v6

    .line 283
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 284
    .line 285
    .line 286
    move-result-object v7

    .line 287
    invoke-virtual {v7}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    iget-object v8, p0, Ll/q800;->J:Ll/clz;

    .line 292
    .line 293
    iget-object v8, v8, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 294
    .line 295
    invoke-interface {v7, v8}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 296
    .line 297
    .line 298
    move-result v7

    .line 299
    invoke-virtual {v5, v0, v6, v7}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMessageHeadView;->h(Lcom/p1/mobile/putong/data/User;IZ)V

    .line 300
    .line 301
    .line 302
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 303
    .line 304
    .line 305
    move-result-object v5

    .line 306
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 307
    .line 308
    .line 309
    move-result-object v5

    .line 310
    invoke-interface {v5}, Ll/r97;->c()Z

    .line 311
    .line 312
    .line 313
    move-result v5

    .line 314
    if-eqz v5, :cond_6

    .line 315
    .line 316
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 317
    .line 318
    .line 319
    move-result v5

    .line 320
    if-eqz v5, :cond_6

    .line 321
    .line 322
    invoke-virtual {v2}, Ll/ruy;->l0()I

    .line 323
    .line 324
    .line 325
    move-result v2

    .line 326
    iget-object v5, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 327
    .line 328
    invoke-virtual {v5, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F0(Lcom/p1/mobile/putong/data/User;I)V

    .line 329
    .line 330
    .line 331
    iget-object v5, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 332
    .line 333
    if-eqz v5, :cond_5

    .line 334
    .line 335
    invoke-virtual {v5, v1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 336
    .line 337
    .line 338
    iget-object v5, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 339
    .line 340
    invoke-virtual {v5, v0, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 341
    .line 342
    .line 343
    :cond_5
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p0, v2}, Ll/q800;->B(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    goto :goto_1

    .line 349
    :cond_6
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 350
    .line 351
    invoke-virtual {v5}, Ll/clz;->P2()Z

    .line 352
    .line 353
    .line 354
    move-result v5

    .line 355
    if-eqz v5, :cond_7

    .line 356
    .line 357
    invoke-virtual {v2}, Ll/ruy;->l0()I

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    iget-object v5, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 362
    .line 363
    invoke-virtual {v5, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G0(Lcom/p1/mobile/putong/data/User;I)V

    .line 364
    .line 365
    .line 366
    iget-object v5, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 367
    .line 368
    if-eqz v5, :cond_8

    .line 369
    .line 370
    invoke-virtual {v5, v1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 371
    .line 372
    .line 373
    iget-object v5, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 374
    .line 375
    invoke-virtual {v5, v0, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 376
    .line 377
    .line 378
    goto :goto_1

    .line 379
    :cond_7
    iget-object v2, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 380
    .line 381
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setFpAnonymityIncludeSelfImage(Lcom/p1/mobile/putong/data/User;)V

    .line 382
    .line 383
    .line 384
    iget-object v2, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 385
    .line 386
    if-eqz v2, :cond_8

    .line 387
    .line 388
    invoke-virtual {v2, v1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 389
    .line 390
    .line 391
    iget-object v2, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 392
    .line 393
    const/16 v5, 0x64

    .line 394
    .line 395
    invoke-virtual {v2, v0, v5}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 396
    .line 397
    .line 398
    :cond_8
    :goto_1
    iget-object v2, p0, Ll/q800;->J:Ll/clz;

    .line 399
    .line 400
    invoke-virtual {v2}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 401
    .line 402
    .line 403
    move-result-object v2

    .line 404
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 405
    .line 406
    .line 407
    move-result v5

    .line 408
    iget-object v6, p0, Ll/q800;->i:Lv/VText;

    .line 409
    .line 410
    if-eqz v5, :cond_9

    .line 411
    .line 412
    iget-wide v7, v2, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 413
    .line 414
    invoke-static {v7, v8}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v5

    .line 418
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 419
    .line 420
    .line 421
    goto :goto_2

    .line 422
    :cond_9
    sget-object v5, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 423
    .line 424
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 425
    .line 426
    .line 427
    move-result-wide v7

    .line 428
    long-to-double v7, v7

    .line 429
    invoke-static {v7, v8}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v5

    .line 433
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 434
    .line 435
    .line 436
    :goto_2
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 437
    .line 438
    invoke-virtual {v5}, Ll/clz;->r3()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v5

    .line 442
    invoke-static {v5}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 443
    .line 444
    .line 445
    move-result v5

    .line 446
    if-nez v5, :cond_15

    .line 447
    .line 448
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 449
    .line 450
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 451
    .line 452
    invoke-virtual {v5, v0}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 453
    .line 454
    .line 455
    move-result v5

    .line 456
    const-string v6, "-"

    .line 457
    .line 458
    if-eqz v5, :cond_a

    .line 459
    .line 460
    :goto_3
    move-object v5, v6

    .line 461
    goto :goto_4

    .line 462
    :cond_a
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 463
    .line 464
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    .line 465
    .line 466
    iget-object v8, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 467
    .line 468
    invoke-virtual {v8}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 469
    .line 470
    .line 471
    move-result-object v8

    .line 472
    sget v9, Ll/g9c0;->V:I

    .line 473
    .line 474
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 475
    .line 476
    .line 477
    move-result v8

    .line 478
    invoke-direct {v7, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 479
    .line 480
    .line 481
    invoke-static {v5, v3, v7}, Ll/q8g0;->S(Lcom/p1/mobile/putong/data/Location;ZLandroid/text/style/CharacterStyle;)Ljava/lang/CharSequence;

    .line 482
    .line 483
    .line 484
    move-result-object v5

    .line 485
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 486
    .line 487
    .line 488
    move-result v7

    .line 489
    if-eqz v7, :cond_b

    .line 490
    .line 491
    goto :goto_3

    .line 492
    :cond_b
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 493
    .line 494
    .line 495
    move-result-object v7

    .line 496
    invoke-virtual {v7}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 497
    .line 498
    .line 499
    move-result-object v7

    .line 500
    iget-object v8, p0, Ll/q800;->J:Ll/clz;

    .line 501
    .line 502
    invoke-virtual {v8}, Ll/clz;->q3()Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v8

    .line 506
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 507
    .line 508
    invoke-interface {v7, v8}, Ll/r97;->I1(Lcom/p1/mobile/putong/data/User;)Z

    .line 509
    .line 510
    .line 511
    move-result v7

    .line 512
    if-eqz v7, :cond_c

    .line 513
    .line 514
    iget-object v7, p0, Ll/q800;->J:Ll/clz;

    .line 515
    .line 516
    invoke-virtual {v7}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 517
    .line 518
    .line 519
    move-result-object v7

    .line 520
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 521
    .line 522
    .line 523
    move-result v7

    .line 524
    if-eqz v7, :cond_c

    .line 525
    .line 526
    iget-object v7, p0, Ll/q800;->J:Ll/clz;

    .line 527
    .line 528
    invoke-virtual {v7}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 529
    .line 530
    .line 531
    move-result-object v7

    .line 532
    iget-object v7, v7, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 533
    .line 534
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 535
    .line 536
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 537
    .line 538
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 539
    .line 540
    .line 541
    move-result v7

    .line 542
    if-nez v7, :cond_c

    .line 543
    .line 544
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 545
    .line 546
    invoke-virtual {v5}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 547
    .line 548
    .line 549
    move-result-object v5

    .line 550
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 551
    .line 552
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 553
    .line 554
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 555
    .line 556
    :cond_c
    iget-boolean v7, p0, Ll/q800;->M:Z

    .line 557
    .line 558
    if-nez v7, :cond_e

    .line 559
    .line 560
    iput-boolean v3, p0, Ll/q800;->M:Z

    .line 561
    .line 562
    iget-object v7, p0, Ll/q800;->J:Ll/clz;

    .line 563
    .line 564
    invoke-virtual {v7}, Ll/clz;->pageId()Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v7

    .line 568
    const-string v8, "moments_user_id"

    .line 569
    .line 570
    iget-object v9, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 571
    .line 572
    invoke-static {v8, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 573
    .line 574
    .line 575
    move-result-object v8

    .line 576
    new-instance v9, Ljava/lang/StringBuilder;

    .line 577
    .line 578
    const-string v10, ""

    .line 579
    .line 580
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    iget-object v10, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 584
    .line 585
    iget v10, v10, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 586
    .line 587
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 591
    .line 592
    .line 593
    move-result-object v9

    .line 594
    const-string v10, "distance"

    .line 595
    .line 596
    invoke-static {v10, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 597
    .line 598
    .line 599
    move-result-object v9

    .line 600
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 601
    .line 602
    .line 603
    move-result-object v5

    .line 604
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 605
    .line 606
    .line 607
    move-result v5

    .line 608
    if-eqz v5, :cond_d

    .line 609
    .line 610
    const-string v5, "1"

    .line 611
    .line 612
    goto :goto_5

    .line 613
    :cond_d
    const-string v5, "0"

    .line 614
    .line 615
    :goto_5
    const-string v6, "is_hidden"

    .line 616
    .line 617
    invoke-static {v6, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 618
    .line 619
    .line 620
    move-result-object v5

    .line 621
    sget-object v6, Ll/c17;->h:Ljava/text/DecimalFormat;

    .line 622
    .line 623
    iget-object v10, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 624
    .line 625
    iget-wide v10, v10, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 626
    .line 627
    invoke-virtual {v6, v10, v11}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v6

    .line 631
    const-string v10, "lastactivity_time"

    .line 632
    .line 633
    invoke-static {v10, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 634
    .line 635
    .line 636
    move-result-object v6

    .line 637
    filled-new-array {v8, v9, v5, v6}, [Ll/pf60;

    .line 638
    .line 639
    .line 640
    move-result-object v5

    .line 641
    const-string v6, "e_distance_and_active_info"

    .line 642
    .line 643
    invoke-static {v6, v7, v5}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 644
    .line 645
    .line 646
    :cond_e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 647
    .line 648
    .line 649
    move-result-object v5

    .line 650
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 651
    .line 652
    .line 653
    move-result-object v5

    .line 654
    invoke-interface {v5}, Ll/r97;->G1()Z

    .line 655
    .line 656
    .line 657
    move-result v5

    .line 658
    if-eqz v5, :cond_f

    .line 659
    .line 660
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 661
    .line 662
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 663
    .line 664
    .line 665
    move-result-object v5

    .line 666
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 667
    .line 668
    sget v6, Ll/qa00;->F:I

    .line 669
    .line 670
    sget v7, Ll/qa00;->q:I

    .line 671
    .line 672
    sget v8, Ll/qa00;->j:I

    .line 673
    .line 674
    invoke-virtual {v5, v6, v7, v6, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 675
    .line 676
    .line 677
    iget-object v6, p0, Ll/q800;->t:Lv/VText;

    .line 678
    .line 679
    invoke-virtual {v6, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 680
    .line 681
    .line 682
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 683
    .line 684
    const/4 v6, 0x3

    .line 685
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 686
    .line 687
    .line 688
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 689
    .line 690
    const/16 v6, 0x11

    .line 691
    .line 692
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 693
    .line 694
    .line 695
    :cond_f
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 696
    .line 697
    .line 698
    move-result v5

    .line 699
    if-eqz v5, :cond_11

    .line 700
    .line 701
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 702
    .line 703
    .line 704
    move-result-object v5

    .line 705
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 706
    .line 707
    .line 708
    move-result-object v5

    .line 709
    invoke-interface {v5}, Ll/r97;->x()Z

    .line 710
    .line 711
    .line 712
    move-result v5

    .line 713
    if-eqz v5, :cond_11

    .line 714
    .line 715
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 716
    .line 717
    const-string v6, "dismissed"

    .line 718
    .line 719
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 720
    .line 721
    .line 722
    move-result v5

    .line 723
    if-eqz v5, :cond_11

    .line 724
    .line 725
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 726
    .line 727
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 728
    .line 729
    .line 730
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 731
    .line 732
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 733
    .line 734
    .line 735
    move-result v6

    .line 736
    if-eqz v6, :cond_10

    .line 737
    .line 738
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->t2:I

    .line 739
    .line 740
    goto :goto_6

    .line 741
    :cond_10
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->s2:I

    .line 742
    .line 743
    :goto_6
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 744
    .line 745
    .line 746
    goto/16 :goto_7

    .line 747
    .line 748
    :cond_11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 749
    .line 750
    .line 751
    move-result v5

    .line 752
    const/16 v6, 0x8

    .line 753
    .line 754
    if-nez v5, :cond_14

    .line 755
    .line 756
    iget-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 757
    .line 758
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 759
    .line 760
    .line 761
    move-result-wide v7

    .line 762
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 763
    .line 764
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 765
    .line 766
    .line 767
    move-result v5

    .line 768
    const-string v9, "matched"

    .line 769
    .line 770
    if-eqz v5, :cond_12

    .line 771
    .line 772
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 773
    .line 774
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 775
    .line 776
    invoke-static {v5, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 777
    .line 778
    .line 779
    move-result v5

    .line 780
    if-eqz v5, :cond_12

    .line 781
    .line 782
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 783
    .line 784
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 785
    .line 786
    const-string v10, "boosted"

    .line 787
    .line 788
    invoke-static {v10}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 789
    .line 790
    .line 791
    move-result-object v10

    .line 792
    invoke-interface {v5, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 793
    .line 794
    .line 795
    move-result v5

    .line 796
    if-eqz v5, :cond_12

    .line 797
    .line 798
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 799
    .line 800
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 801
    .line 802
    .line 803
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 804
    .line 805
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->C6:I

    .line 806
    .line 807
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 808
    .line 809
    .line 810
    move-result-object v5

    .line 811
    iget-object v6, p0, Ll/q800;->t:Lv/VText;

    .line 812
    .line 813
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 814
    .line 815
    .line 816
    goto :goto_7

    .line 817
    :cond_12
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 818
    .line 819
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 820
    .line 821
    .line 822
    move-result v5

    .line 823
    if-eqz v5, :cond_13

    .line 824
    .line 825
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 826
    .line 827
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 828
    .line 829
    invoke-static {v5, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 830
    .line 831
    .line 832
    move-result v5

    .line 833
    if-eqz v5, :cond_13

    .line 834
    .line 835
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 836
    .line 837
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 838
    .line 839
    const-string v9, "boostBadge"

    .line 840
    .line 841
    invoke-static {v9}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 842
    .line 843
    .line 844
    move-result-object v9

    .line 845
    invoke-interface {v5, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 846
    .line 847
    .line 848
    move-result v5

    .line 849
    if-eqz v5, :cond_13

    .line 850
    .line 851
    const-wide/16 v9, 0x3

    .line 852
    .line 853
    rem-long/2addr v7, v9

    .line 854
    const-wide/16 v9, 0x0

    .line 855
    .line 856
    cmp-long v5, v7, v9

    .line 857
    .line 858
    if-nez v5, :cond_13

    .line 859
    .line 860
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 861
    .line 862
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 863
    .line 864
    .line 865
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 866
    .line 867
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->q6:I

    .line 868
    .line 869
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 870
    .line 871
    .line 872
    move-result-object v5

    .line 873
    iget-object v6, p0, Ll/q800;->t:Lv/VText;

    .line 874
    .line 875
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 876
    .line 877
    .line 878
    goto :goto_7

    .line 879
    :cond_13
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 880
    .line 881
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 882
    .line 883
    .line 884
    goto :goto_7

    .line 885
    :cond_14
    iget-object v5, p0, Ll/q800;->t:Lv/VText;

    .line 886
    .line 887
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 888
    .line 889
    .line 890
    :cond_15
    :goto_7
    iget-object v5, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 891
    .line 892
    iget-object v6, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 893
    .line 894
    iget-object v7, p0, Ll/q800;->J:Ll/clz;

    .line 895
    .line 896
    invoke-virtual {v5, v6, v7, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->y0(Lcom/p1/mobile/android/app/Act;Ll/clz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 897
    .line 898
    .line 899
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 900
    .line 901
    .line 902
    move-result-object v5

    .line 903
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 904
    .line 905
    .line 906
    move-result-object v5

    .line 907
    invoke-interface {v5}, Ll/r97;->c()Z

    .line 908
    .line 909
    .line 910
    move-result v5

    .line 911
    if-eqz v5, :cond_17

    .line 912
    .line 913
    iget-object v5, p0, Ll/q800;->L:Ll/iwl;

    .line 914
    .line 915
    invoke-interface {v5}, Ll/iwl;->getHeaderViewsCountHook()I

    .line 916
    .line 917
    .line 918
    move-result v5

    .line 919
    if-eqz v5, :cond_17

    .line 920
    .line 921
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 922
    .line 923
    invoke-virtual {v5}, Ll/clz;->r3()Ljava/lang/String;

    .line 924
    .line 925
    .line 926
    move-result-object v6

    .line 927
    invoke-virtual {v5, v6}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 928
    .line 929
    .line 930
    move-result v5

    .line 931
    if-nez v5, :cond_17

    .line 932
    .line 933
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 934
    .line 935
    .line 936
    move-result v5

    .line 937
    if-eqz v5, :cond_16

    .line 938
    .line 939
    iget-object v5, p0, Ll/q800;->r:Landroid/widget/LinearLayout;

    .line 940
    .line 941
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 942
    .line 943
    .line 944
    iget-object v5, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 945
    .line 946
    if-eqz v5, :cond_17

    .line 947
    .line 948
    invoke-virtual {v5, v3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->d(Z)V

    .line 949
    .line 950
    .line 951
    goto :goto_8

    .line 952
    :cond_16
    iget-object v5, p0, Ll/q800;->Q:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;

    .line 953
    .line 954
    if-eqz v5, :cond_17

    .line 955
    .line 956
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;->d(Z)V

    .line 957
    .line 958
    .line 959
    :cond_17
    :goto_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 960
    .line 961
    .line 962
    move-result-object v5

    .line 963
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 964
    .line 965
    .line 966
    move-result-object v5

    .line 967
    invoke-interface {v5}, Ll/r97;->s4()Z

    .line 968
    .line 969
    .line 970
    move-result v5

    .line 971
    if-eqz v5, :cond_18

    .line 972
    .line 973
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 974
    .line 975
    invoke-virtual {v5}, Ll/clz;->r3()Ljava/lang/String;

    .line 976
    .line 977
    .line 978
    move-result-object v6

    .line 979
    invoke-virtual {v5, v6}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 980
    .line 981
    .line 982
    move-result v5

    .line 983
    if-nez v5, :cond_18

    .line 984
    .line 985
    iget-object v5, p0, Ll/q800;->r:Landroid/widget/LinearLayout;

    .line 986
    .line 987
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 988
    .line 989
    .line 990
    :cond_18
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->n()Z

    .line 991
    .line 992
    .line 993
    move-result v5

    .line 994
    if-eqz v5, :cond_1a

    .line 995
    .line 996
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 997
    .line 998
    invoke-virtual {v5}, Ll/clz;->j7()Lrx/subjects/a;

    .line 999
    .line 1000
    .line 1001
    move-result-object v5

    .line 1002
    invoke-virtual {v5}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v5

    .line 1006
    check-cast v5, Ljava/lang/Boolean;

    .line 1007
    .line 1008
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1009
    .line 1010
    .line 1011
    move-result v6

    .line 1012
    if-eqz v6, :cond_19

    .line 1013
    .line 1014
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1015
    .line 1016
    .line 1017
    move-result v5

    .line 1018
    if-eqz v5, :cond_19

    .line 1019
    .line 1020
    iget-object v5, p0, Ll/q800;->z:Landroid/widget/LinearLayout;

    .line 1021
    .line 1022
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1023
    .line 1024
    .line 1025
    iget-boolean v5, p0, Ll/q800;->P:Z

    .line 1026
    .line 1027
    if-nez v5, :cond_1a

    .line 1028
    .line 1029
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 1030
    .line 1031
    invoke-virtual {v5}, Ll/clz;->t7()Ll/qzz;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v5

    .line 1035
    check-cast v5, Ll/yxz;

    .line 1036
    .line 1037
    iget-object v6, p0, Ll/q800;->T:Ll/x20;

    .line 1038
    .line 1039
    invoke-virtual {v5, v6}, Ll/yxz;->L3(Ll/x20;)V

    .line 1040
    .line 1041
    .line 1042
    iput-boolean v3, p0, Ll/q800;->P:Z

    .line 1043
    .line 1044
    goto :goto_9

    .line 1045
    :cond_19
    iget-object v5, p0, Ll/q800;->z:Landroid/widget/LinearLayout;

    .line 1046
    .line 1047
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1048
    .line 1049
    .line 1050
    :cond_1a
    :goto_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1051
    .line 1052
    .line 1053
    move-result-object v5

    .line 1054
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v5

    .line 1058
    invoke-interface {v5}, Ll/r97;->B()Z

    .line 1059
    .line 1060
    .line 1061
    move-result v5

    .line 1062
    if-eqz v5, :cond_1d

    .line 1063
    .line 1064
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v5

    .line 1068
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1069
    .line 1070
    .line 1071
    move-result-object v5

    .line 1072
    invoke-interface {v5, v2}, Ll/r97;->o4(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 1073
    .line 1074
    .line 1075
    move-result v5

    .line 1076
    if-eqz v5, :cond_1c

    .line 1077
    .line 1078
    iget-object v5, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 1079
    .line 1080
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H0()V

    .line 1081
    .line 1082
    .line 1083
    iget-object v5, p0, Ll/q800;->B:Landroid/widget/FrameLayout;

    .line 1084
    .line 1085
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1086
    .line 1087
    .line 1088
    iget-object v5, p0, Ll/q800;->C:Lv/VText;

    .line 1089
    .line 1090
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 1091
    .line 1092
    .line 1093
    move-result v6

    .line 1094
    if-eqz v6, :cond_1b

    .line 1095
    .line 1096
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->K3:I

    .line 1097
    .line 1098
    goto :goto_a

    .line 1099
    :cond_1b
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->L3:I

    .line 1100
    .line 1101
    :goto_a
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 1102
    .line 1103
    .line 1104
    goto :goto_b

    .line 1105
    :cond_1c
    iget-object v5, p0, Ll/q800;->B:Landroid/widget/FrameLayout;

    .line 1106
    .line 1107
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1108
    .line 1109
    .line 1110
    :cond_1d
    :goto_b
    iget v5, p0, Ll/q800;->R:I

    .line 1111
    .line 1112
    const/4 v6, 0x5

    .line 1113
    const-string v7, "#fe7e1d"

    .line 1114
    .line 1115
    if-ge v5, v6, :cond_20

    .line 1116
    .line 1117
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 1118
    .line 1119
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 1120
    .line 1121
    .line 1122
    move-result v5

    .line 1123
    if-nez v5, :cond_20

    .line 1124
    .line 1125
    iget v5, v2, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 1126
    .line 1127
    if-nez v5, :cond_20

    .line 1128
    .line 1129
    iget-boolean v5, v2, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 1130
    .line 1131
    if-nez v5, :cond_20

    .line 1132
    .line 1133
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 1134
    .line 1135
    const-string v6, "default"

    .line 1136
    .line 1137
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1138
    .line 1139
    .line 1140
    move-result v5

    .line 1141
    if-eqz v5, :cond_20

    .line 1142
    .line 1143
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1144
    .line 1145
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1146
    .line 1147
    .line 1148
    move-result v5

    .line 1149
    if-eqz v5, :cond_20

    .line 1150
    .line 1151
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1152
    .line 1153
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1154
    .line 1155
    .line 1156
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1157
    .line 1158
    sget v6, Ll/qa00;->o:I

    .line 1159
    .line 1160
    invoke-virtual {v5, v6, v4, v6, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 1161
    .line 1162
    .line 1163
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 1164
    .line 1165
    .line 1166
    move-result-object v5

    .line 1167
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 1168
    .line 1169
    .line 1170
    move-result-object v5

    .line 1171
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ak()Z

    .line 1172
    .line 1173
    .line 1174
    move-result v6

    .line 1175
    if-nez v6, :cond_1e

    .line 1176
    .line 1177
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 1178
    .line 1179
    .line 1180
    move-result v6

    .line 1181
    if-nez v6, :cond_1e

    .line 1182
    .line 1183
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ua()Z

    .line 1184
    .line 1185
    .line 1186
    move-result v5

    .line 1187
    if-eqz v5, :cond_1f

    .line 1188
    .line 1189
    :cond_1e
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 1190
    .line 1191
    .line 1192
    move-result v5

    .line 1193
    if-nez v5, :cond_1f

    .line 1194
    .line 1195
    const-string v5, "\u804a\u5929\u8fc7\u7a0b\u4e2d\u8bf7\u9075\u5b88\u5e73\u53f0\u89c4\u8303\u548c\u793e\u4ea4\u793c\u4eea\uff0c\u5171\u540c\u7ef4\u62a4\u300a\u63a2\u63a2\u5e73\u53f0\u884c\u4e3a\u89c4\u8303\u300b\uff0c\u540c\u65f6\u6ce8\u610f\u8bc6\u522b\u5bf9\u65b9\u4fe1\u606f\u771f\u5b9e\u6027\uff0c\u611f\u8c22\u4f60\u7684\u7406\u89e3\u548c\u652f\u6301"

    .line 1196
    .line 1197
    goto :goto_c

    .line 1198
    :cond_1f
    const-string v5, "\u804a\u5929\u8fc7\u7a0b\u4e2d\u8bf7\u9075\u5b88\u5e73\u53f0\u89c4\u8303\u548c\u793e\u4ea4\u793c\u4eea\uff0c\u5171\u540c\u7ef4\u62a4\u300a\u63a2\u63a2\u5e73\u53f0\u884c\u4e3a\u89c4\u8303\u300b\uff0c\u611f\u8c22\u4f60\u7684\u7406\u89e3\u548c\u652f\u6301"

    .line 1199
    .line 1200
    :goto_c
    iget-object v6, p0, Ll/q800;->G:Lv/VText;

    .line 1201
    .line 1202
    iget-object v8, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 1203
    .line 1204
    const-string v9, "http://lp.tantanapp.com/rule_zh_cn/"

    .line 1205
    .line 1206
    invoke-static {v9}, Ll/ebe0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v9

    .line 1210
    const-string v10, "\u300a\u63a2\u63a2\u5e73\u53f0\u884c\u4e3a\u89c4\u8303\u300b"

    .line 1211
    .line 1212
    filled-new-array {v10, v9}, [Ljava/lang/String;

    .line 1213
    .line 1214
    .line 1215
    move-result-object v9

    .line 1216
    invoke-static {v8, v5, v9}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v5

    .line 1220
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1221
    .line 1222
    .line 1223
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1224
    .line 1225
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1226
    .line 1227
    .line 1228
    move-result v6

    .line 1229
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 1230
    .line 1231
    .line 1232
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1233
    .line 1234
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v6

    .line 1238
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 1239
    .line 1240
    .line 1241
    sget-object v5, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->messageSensitiveTipsShowUser:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 1242
    .line 1243
    iget-object v6, p0, Ll/q800;->J:Ll/clz;

    .line 1244
    .line 1245
    invoke-virtual {v6}, Ll/clz;->r3()Ljava/lang/String;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v6

    .line 1249
    invoke-virtual {v5, v6, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 1250
    .line 1251
    .line 1252
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1253
    .line 1254
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 1255
    .line 1256
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/g;->C1:Ll/byd0;

    .line 1257
    .line 1258
    invoke-static {}, Ll/pzi0;->o()J

    .line 1259
    .line 1260
    .line 1261
    move-result-wide v6

    .line 1262
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1263
    .line 1264
    .line 1265
    move-result-object v6

    .line 1266
    invoke-virtual {v5, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 1267
    .line 1268
    .line 1269
    iget v5, p0, Ll/q800;->R:I

    .line 1270
    .line 1271
    add-int/2addr v5, v3

    .line 1272
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1273
    .line 1274
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 1275
    .line 1276
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/g;->D1:Ll/vxd0;

    .line 1277
    .line 1278
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v5

    .line 1282
    invoke-virtual {v6, v5}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 1283
    .line 1284
    .line 1285
    goto/16 :goto_d

    .line 1286
    .line 1287
    :cond_20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1288
    .line 1289
    .line 1290
    move-result-object v5

    .line 1291
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1292
    .line 1293
    .line 1294
    move-result-object v5

    .line 1295
    invoke-interface {v5}, Ll/r97;->A1()Z

    .line 1296
    .line 1297
    .line 1298
    move-result v5

    .line 1299
    if-eqz v5, :cond_21

    .line 1300
    .line 1301
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1302
    .line 1303
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1304
    .line 1305
    invoke-virtual {v5}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 1306
    .line 1307
    .line 1308
    move-result-object v5

    .line 1309
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 1310
    .line 1311
    .line 1312
    move-result v5

    .line 1313
    if-nez v5, :cond_21

    .line 1314
    .line 1315
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 1316
    .line 1317
    invoke-virtual {v5}, Ll/clz;->r3()Ljava/lang/String;

    .line 1318
    .line 1319
    .line 1320
    move-result-object v5

    .line 1321
    invoke-static {v5}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 1322
    .line 1323
    .line 1324
    move-result v5

    .line 1325
    if-nez v5, :cond_21

    .line 1326
    .line 1327
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1328
    .line 1329
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1330
    .line 1331
    .line 1332
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1333
    .line 1334
    const-string v6, "\u7acb\u5373\u6d4b\u8bd5"

    .line 1335
    .line 1336
    filled-new-array {v6}, [Ljava/lang/String;

    .line 1337
    .line 1338
    .line 1339
    move-result-object v6

    .line 1340
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1341
    .line 1342
    .line 1343
    move-result-object v6

    .line 1344
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1345
    .line 1346
    .line 1347
    move-result v7

    .line 1348
    sget-object v8, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 1349
    .line 1350
    const-string v9, "\u6d4b\u6d4b\u793e\u4ea4\u6027\u683c\uff0c\u5e2e\u4f60\u5339\u914d\u6700\u5951\u5408\u7684\u4f19\u4f34\uff01\n\u7acb\u5373\u6d4b\u8bd5"

    .line 1351
    .line 1352
    invoke-static {v9, v6, v7, v8}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v6

    .line 1356
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1357
    .line 1358
    .line 1359
    const-string v5, "guide_type"

    .line 1360
    .line 1361
    const-string v6, "word"

    .line 1362
    .line 1363
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 1364
    .line 1365
    .line 1366
    move-result-object v5

    .line 1367
    filled-new-array {v5}, [Ll/pf60;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v5

    .line 1371
    const-string v6, "e_character_guide"

    .line 1372
    .line 1373
    const-string v7, "p_chat_view"

    .line 1374
    .line 1375
    invoke-static {v6, v7, v5}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 1376
    .line 1377
    .line 1378
    new-array v5, v3, [Z

    .line 1379
    .line 1380
    aput-boolean v4, v5, v4

    .line 1381
    .line 1382
    iget-object v6, p0, Ll/q800;->G:Lv/VText;

    .line 1383
    .line 1384
    new-instance v7, Ll/k800;

    .line 1385
    .line 1386
    invoke-direct {v7, p0, v5, v0}, Ll/k800;-><init>(Ll/q800;[ZLcom/p1/mobile/putong/data/User;)V

    .line 1387
    .line 1388
    .line 1389
    invoke-static {v6, v7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 1390
    .line 1391
    .line 1392
    iget-object v6, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 1393
    .line 1394
    invoke-virtual {v6}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 1395
    .line 1396
    .line 1397
    move-result-object v6

    .line 1398
    new-instance v7, Ll/l800;

    .line 1399
    .line 1400
    invoke-direct {v7, v5}, Ll/l800;-><init>([Z)V

    .line 1401
    .line 1402
    .line 1403
    invoke-virtual {v6, v7}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 1404
    .line 1405
    .line 1406
    move-result-object v5

    .line 1407
    new-instance v6, Ll/m800;

    .line 1408
    .line 1409
    invoke-direct {v6}, Ll/m800;-><init>()V

    .line 1410
    .line 1411
    .line 1412
    invoke-virtual {v5, v6}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 1413
    .line 1414
    .line 1415
    move-result-object v5

    .line 1416
    invoke-virtual {v5, v3}, Lrx/c;->take(I)Lrx/c;

    .line 1417
    .line 1418
    .line 1419
    move-result-object v5

    .line 1420
    new-instance v6, Ll/n800;

    .line 1421
    .line 1422
    invoke-direct {v6, p0}, Ll/n800;-><init>(Ll/q800;)V

    .line 1423
    .line 1424
    .line 1425
    new-instance v7, Ll/o800;

    .line 1426
    .line 1427
    invoke-direct {v7}, Ll/o800;-><init>()V

    .line 1428
    .line 1429
    .line 1430
    invoke-static {v6, v7}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v6

    .line 1434
    invoke-virtual {v5, v6}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 1435
    .line 1436
    .line 1437
    goto :goto_d

    .line 1438
    :cond_21
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1439
    .line 1440
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1441
    .line 1442
    .line 1443
    :goto_d
    iget-object v5, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 1444
    .line 1445
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->D2()Z

    .line 1446
    .line 1447
    .line 1448
    move-result v5

    .line 1449
    if-eqz v5, :cond_22

    .line 1450
    .line 1451
    iget-object v5, p0, Ll/q800;->G:Lv/VText;

    .line 1452
    .line 1453
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1454
    .line 1455
    .line 1456
    :cond_22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1457
    .line 1458
    .line 1459
    move-result-object v5

    .line 1460
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1461
    .line 1462
    .line 1463
    move-result-object v5

    .line 1464
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 1465
    .line 1466
    .line 1467
    move-result v5

    .line 1468
    if-eqz v5, :cond_23

    .line 1469
    .line 1470
    iget-object v5, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 1471
    .line 1472
    invoke-virtual {v5, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->x0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 1473
    .line 1474
    .line 1475
    :cond_23
    iget-object v1, p0, Ll/q800;->m:Lcom/p1/mobile/putong/core/ui/messages/view/MessageMarryHeaderLayout;

    .line 1476
    .line 1477
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 1478
    .line 1479
    .line 1480
    move-result v1

    .line 1481
    if-eqz v1, :cond_24

    .line 1482
    .line 1483
    iget-object v1, p0, Ll/q800;->m:Lcom/p1/mobile/putong/core/ui/messages/view/MessageMarryHeaderLayout;

    .line 1484
    .line 1485
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageMarryHeaderLayout;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 1486
    .line 1487
    .line 1488
    :cond_24
    iget-object v0, p0, Ll/q800;->J:Ll/clz;

    .line 1489
    .line 1490
    invoke-virtual {v0}, Ll/clz;->k7()Z

    .line 1491
    .line 1492
    .line 1493
    move-result v0

    .line 1494
    if-eqz v0, :cond_25

    .line 1495
    .line 1496
    iget-object v0, p0, Ll/q800;->e:Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;

    .line 1497
    .line 1498
    iget-object v1, p0, Ll/q800;->J:Ll/clz;

    .line 1499
    .line 1500
    invoke-virtual {v1}, Ll/clz;->q3()Ljava/lang/Object;

    .line 1501
    .line 1502
    .line 1503
    move-result-object v1

    .line 1504
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 1505
    .line 1506
    iget-object v5, p0, Ll/q800;->J:Ll/clz;

    .line 1507
    .line 1508
    invoke-virtual {v5}, Ll/clz;->W5()Lcom/p1/mobile/putong/data/User;

    .line 1509
    .line 1510
    .line 1511
    move-result-object v5

    .line 1512
    invoke-virtual {v0, v2, v1, v5}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->V(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 1513
    .line 1514
    .line 1515
    iget-object v0, p0, Ll/q800;->f:Landroid/widget/LinearLayout;

    .line 1516
    .line 1517
    invoke-static {v0, v4}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 1518
    .line 1519
    .line 1520
    iget-object p0, p0, Ll/q800;->e:Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;

    .line 1521
    .line 1522
    invoke-static {p0, v3}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 1523
    .line 1524
    .line 1525
    return-void

    .line 1526
    :cond_25
    iget-object v0, p0, Ll/q800;->f:Landroid/widget/LinearLayout;

    .line 1527
    .line 1528
    invoke-static {v0, v3}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 1529
    .line 1530
    .line 1531
    iget-object p0, p0, Ll/q800;->e:Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;

    .line 1532
    .line 1533
    invoke-static {p0, v4}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 1534
    .line 1535
    .line 1536
    return-void
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/r800;->b(Ll/q800;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public t(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/q800;->r:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/q800;->r:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public u()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public v()Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->l:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getTickleAnimContent()Landroid/widget/FrameLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final x()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->C3()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-static {}, Ll/joa;->M3()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final synthetic y([ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p3, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    aput-boolean p3, p1, v0

    .line 4
    .line 5
    const-string p1, "guide_type"

    .line 6
    .line 7
    const-string p3, "word"

    .line 8
    .line 9
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p1}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p3, "e_character_guide"

    .line 18
    .line 19
    const-string v1, "p_chat_view"

    .line 20
    .line 21
    invoke-static {p3, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/q800;->K:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 25
    .line 26
    sget-object p1, Lcom/p1/mobile/putong/core/api/o;->U:Ljava/lang/String;

    .line 27
    .line 28
    const-string p3, ""

    .line 29
    .line 30
    const-string v1, "im_word"

    .line 31
    .line 32
    invoke-static {p1, p3, v0, v1}, Lcom/p1/mobile/putong/core/api/o;->s3(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/core/api/o;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic z(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q800;->G:Lv/VText;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/o;->m3(Lcom/p1/mobile/putong/data/User;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    xor-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
