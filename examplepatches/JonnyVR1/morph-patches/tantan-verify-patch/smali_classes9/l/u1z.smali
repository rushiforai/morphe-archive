.class public Ll/u1z;
.super Ll/j3z;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/j3z<",
        "Ll/d3z;",
        ">;"
    }
.end annotation


# static fields
.field public static g:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static h:I

.field public static i:I

.field public static j:Ll/jxd0;

.field public static k:Ll/jxd0;


# instance fields
.field public b:I

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/l4g0;

.field public e:Z

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/u1z;->g:Lrx/subjects/b;

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    sput v0, Ll/u1z;->h:I

    .line 10
    .line 11
    const/16 v0, 0x14

    .line 12
    .line 13
    sput v0, Ll/u1z;->i:I

    .line 14
    .line 15
    new-instance v0, Ll/jxd0;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    const-string v2, "r_s_t_1_s"

    .line 20
    .line 21
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Ll/u1z;->j:Ll/jxd0;

    .line 25
    .line 26
    new-instance v0, Ll/jxd0;

    .line 27
    .line 28
    const-string v2, "r_s_t_2_s"

    .line 29
    .line 30
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Ll/u1z;->k:Ll/jxd0;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/j3z;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Ll/u1z;->b:I

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/u1z;->c:Lrx/subjects/a;

    .line 12
    .line 13
    new-instance p1, Ll/l4g0;

    .line 14
    .line 15
    new-instance v0, Ll/u1z$d;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/u1z$d;-><init>(Ll/u1z;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p1, v0}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/u1z;->d:Ll/l4g0;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Ll/u1z;->e:Z

    .line 27
    .line 28
    iput-boolean p1, p0, Ll/u1z;->f:Z

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic A0(Ll/u1z;Ljava/util/ArrayList;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->H1(Ljava/util/ArrayList;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C0(Ll/u1z;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u1z;->J1(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic D0(Ll/u1z;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/u1z;->Y1(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method private D1()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/clz;->J:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static synthetic E0(Ll/u1z;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->Q1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic F0(Ll/u1z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u1z;->V1()V

    return-void
.end method

.method public static synthetic G0(Ll/u1z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/u1z;->Z1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic H0(Ll/u1z;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->L1(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic I0(Ll/u1z;Ljava/io/File;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->h2(Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J0(Ll/u1z;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->P1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic L0(Ll/u1z;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->T1(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic N0(Ll/u1z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u1z;->U1()V

    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic P0(Ljava/io/File;)Ll/pf60;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/sogou/b;->c(Ljava/io/File;)Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic Q0(Ll/u1z;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->R1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic R0(Ll/u1z;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->j2(Ll/pf60;)V

    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic U0(Ll/u1z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->e2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic W0(Ll/u1z;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->c2(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic X0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y0(Ll/u1z;Landroid/net/Uri;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->l2(Landroid/net/Uri;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a1(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/t0z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/t0z;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p4, "message_id"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string p4, "message_send_status"

    .line 10
    .line 11
    invoke-static {p4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string p4, "message_receiver"

    .line 16
    .line 17
    invoke-static {p4, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string p0, "sensitiveword"

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string p0, "sensitive_text"

    .line 28
    .line 29
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "message_send_values"

    .line 34
    .line 35
    const-string p1, "reject"

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_chat_view_sensitiveword_block_popup"

    .line 46
    .line 47
    const-string p2, "p_chat_view_sensitiveword_block_popup_show"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3}, Ll/g1e;->dismiss()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic d1(Ll/u1z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/u1z;->d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e1(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f1(Ll/u1z;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->b2(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic g1(Ll/u1z;Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u1z;->I1(Ljava/util/ArrayList;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h1(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic i0(Ll/u1z;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->X1(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic j0(Ll/u1z;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->W1(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic k0(Ll/u1z;Ljava/io/File;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->i2(Ljava/io/File;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Ll/u1z;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->S1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ws()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic o0(Ll/u1z;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->O1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private o1(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_user_passive_show_chat:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, p1, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/v0z;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/v0z;-><init>(Ll/u1z;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/x0z;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/x0z;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;ZILjava/lang/String;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    add-int/2addr p2, p1

    .line 18
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    add-int/2addr p4, p1

    .line 23
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSelection(II)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    add-int/2addr p1, p2

    .line 32
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    add-int/2addr p2, p3

    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSelection(II)V

    .line 38
    .line 39
    .line 40
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 41
    .line 42
    const-string p1, "vibrator"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Landroid/os/Vibrator;

    .line 49
    .line 50
    const-wide/16 p1, 0x32

    .line 51
    .line 52
    invoke-virtual {p0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic q0(Ll/u1z;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->m2(Ll/pf60;)V

    return-void
.end method

.method public static synthetic r0(Ll/u1z;Landroid/net/Uri;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->k2(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s0(Ll/u1z;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u1z;->N1(Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Ll/u1z;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->f2(Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method public static synthetic u0(Landroid/net/Uri;Ljava/io/File;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/sogou/b;->b(Landroid/net/Uri;)Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private u1()V
    .locals 2

    .line 1
    new-instance v0, Ll/w0z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w0z;-><init>(Ll/u1z;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/h1z;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/h1z;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ll/r97;->l()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/o1z;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/o1z;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/p1z;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/p1z;-><init>(Ll/u1z;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public static synthetic x0()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->J3:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic y0(Ll/u1z;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/u1z;->a2(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic z0(Ll/u1z;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u1z;->g2(Ljava/util/List;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public B1(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/d3z;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public C1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "@"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, " "

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p1, Ll/d3z;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p2, Ll/d3z;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    const/4 v1, 0x0

    .line 68
    if-eq p1, p2, :cond_2

    .line 69
    .line 70
    if-gez p2, :cond_1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    move v4, v1

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    :goto_1
    const/4 v2, 0x1

    .line 76
    move v4, v2

    .line 77
    :goto_2
    if-gez p1, :cond_3

    .line 78
    .line 79
    move v5, v1

    .line 80
    goto :goto_3

    .line 81
    :cond_3
    move v5, p1

    .line 82
    :goto_3
    if-gez p2, :cond_4

    .line 83
    .line 84
    move v7, v1

    .line 85
    goto :goto_4

    .line 86
    :cond_4
    move v7, p2

    .line 87
    :goto_4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p0, Ll/d3z;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    add-int/2addr p0, v5

    .line 104
    invoke-virtual {v3, v0, v5, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p(Ljava/lang/String;II)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-interface {p0, v5, v6}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    new-instance v2, Ll/p0z;

    .line 122
    .line 123
    invoke-direct/range {v2 .. v7}, Ll/p0z;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;ZILjava/lang/String;I)V

    .line 124
    .line 125
    .line 126
    const-wide/16 p1, 0xa

    .line 127
    .line 128
    invoke-static {p0, v2, p1, p2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public E1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public F1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/u1z;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic H1(Ljava/util/ArrayList;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/net/Uri;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    :try_start_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 36
    .line 37
    .line 38
    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 39
    :try_start_1
    new-instance v4, Ljava/io/File;

    .line 40
    .line 41
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 42
    .line 43
    invoke-virtual {v5}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    new-instance v6, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v7

    .line 56
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v7, "_"

    .line 60
    .line 61
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v7

    .line 68
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v7, ".copy"

    .line 72
    .line 73
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance v5, Ljava/io/FileOutputStream;

    .line 84
    .line 85
    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 86
    .line 87
    .line 88
    :try_start_2
    invoke-static {v3, v5}, Ll/oki;->f(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 92
    .line 93
    .line 94
    :goto_1
    invoke-static {v3}, Ll/va5;->a(Ljava/io/Closeable;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v5}, Ll/va5;->a(Ljava/io/Closeable;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catchall_0
    move-exception p0

    .line 102
    :goto_2
    move-object v2, v3

    .line 103
    goto :goto_4

    .line 104
    :catch_0
    move-exception v2

    .line 105
    goto :goto_3

    .line 106
    :catchall_1
    move-exception p0

    .line 107
    move-object v5, v2

    .line 108
    goto :goto_2

    .line 109
    :catch_1
    move-exception v4

    .line 110
    move-object v5, v2

    .line 111
    move-object v2, v4

    .line 112
    goto :goto_3

    .line 113
    :catchall_2
    move-exception p0

    .line 114
    move-object v5, v2

    .line 115
    goto :goto_4

    .line 116
    :catch_2
    move-exception v3

    .line 117
    move-object v5, v2

    .line 118
    move-object v2, v3

    .line 119
    move-object v3, v5

    .line 120
    :goto_3
    :try_start_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :goto_4
    invoke-static {v2}, Ll/va5;->a(Ljava/io/Closeable;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v5}, Ll/va5;->a(Ljava/io/Closeable;)V

    .line 131
    .line 132
    .line 133
    throw p0

    .line 134
    :cond_0
    return-object v0
.end method

.method public final synthetic I1(Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/io/File;

    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "raw"

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 46
    .line 47
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-lez p2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, p1}, Ll/clz;->m6(Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->A2:I

    .line 70
    .line 71
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic J1(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p2, p0, p1}, Ll/r97;->W4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic L1(Ljava/util/ArrayList;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/net/Uri;

    .line 26
    .line 27
    invoke-static {v2}, Ll/h26;->g(Landroid/net/Uri;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    invoke-static {v3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    new-instance v3, Lcom/p1/mobile/putong/data/Picture;

    .line 42
    .line 43
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v2, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "raw"

    .line 49
    .line 50
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iput-object v2, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-string v3, "content"

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_0

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0, v0, v1}, Ll/u1z;->l1(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-lez p1, :cond_4

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, v0}, Ll/clz;->m6(Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->A2:I

    .line 105
    .line 106
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic N1(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 8

    .line 1
    new-instance p2, Ll/z0z;

    .line 2
    .line 3
    invoke-direct {p2, p0, p1}, Ll/z0z;-><init>(Ll/u1z;Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    new-instance v7, Ll/u1z$a;

    .line 7
    .line 8
    invoke-direct {v7, p0}, Ll/u1z$a;-><init>(Ll/u1z;)V

    .line 9
    .line 10
    .line 11
    new-instance v6, Ll/u1z$b;

    .line 12
    .line 13
    invoke-direct {v6, p0}, Ll/u1z$b;-><init>(Ll/u1z;)V

    .line 14
    .line 15
    .line 16
    new-instance v5, Ll/u1z$c;

    .line 17
    .line 18
    invoke-direct {v5, p0}, Ll/u1z$c;-><init>(Ll/u1z;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/wzx;->k()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    new-instance v0, Ll/wzx;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/wzx;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v3, Ll/a1z;

    .line 37
    .line 38
    invoke-direct {v3, p2}, Ll/a1z;-><init>(Ll/x20;)V

    .line 39
    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual/range {v0 .. v7}, Ll/wzx;->d(Landroid/app/Activity;Landroid/view/View;Ll/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 52
    .line 53
    filled-new-array {v0}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const/4 v0, 0x0

    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1, v7}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1, v6}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic O1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u1z;->i1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/u1z;->e:Z

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/u1z;->d:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-boolean p1, p0, Ll/u1z;->e:Z

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/u1z;->d:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->g()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final synthetic Q1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    iput p1, p0, Ll/u1z;->b:I

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/d3z;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/d3z;->B0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic R1(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/clz;->i3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Ll/d3z;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/d3z;->s0()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v0, Ll/d3z;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/d3z;->s0()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/d3z;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/d3z;->s0()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    invoke-static {}, Ll/pzi0;->o()J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    long-to-double v1, v1

    .line 78
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 79
    .line 80
    :cond_0
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 81
    .line 82
    new-instance p0, Ll/o0z;

    .line 83
    .line 84
    invoke-direct {p0, v0}, Ll/o0z;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method

.method public final synthetic S1(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d3z;->k0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T1(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/hcp;->b(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/d3z;

    .line 30
    .line 31
    new-instance p1, Ll/r0z;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/r0z;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/d3z;->V1(Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p1}, Ll/r97;->I0()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ws()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    const-wide/16 v2, 0x0

    .line 81
    .line 82
    cmp-long p1, v0, v2

    .line 83
    .line 84
    if-gtz p1, :cond_1

    .line 85
    .line 86
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 87
    .line 88
    check-cast p1, Ll/d3z;

    .line 89
    .line 90
    new-instance v0, Ll/s0z;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/s0z;-><init>(Ll/u1z;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/d3z;->V1(Ll/x20;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 100
    .line 101
    check-cast p0, Ll/d3z;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/d3z;->E1()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast p0, Ll/d3z;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/d3z;->E1()V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic U1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "intl_letter_reply"

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic V1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d3z;->f0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W1(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x5

    .line 6
    if-lt p1, v0, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/q0z;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/q0z;-><init>(Ll/u1z;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic X1(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->SHI_PAI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->b(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sget v2, Ll/u1z;->i:I

    .line 25
    .line 26
    if-lt v1, v2, :cond_1

    .line 27
    .line 28
    sget-object v1, Ll/u1z;->k:Ll/jxd0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/u1z;->n1()Lcom/p1/mobile/putong/core/data/Message;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "2"

    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 57
    .line 58
    .line 59
    sget-object p0, Ll/u1z;->k:Ll/jxd0;

    .line 60
    .line 61
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    sget v1, Ll/u1z;->h:I

    .line 72
    .line 73
    if-lt p1, v1, :cond_2

    .line 74
    .line 75
    sget-object p1, Ll/u1z;->j:Ll/jxd0;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_2

    .line 88
    .line 89
    sget-object p1, Ll/u1z;->k:Ll/jxd0;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_2

    .line 102
    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/u1z;->n1()Lcom/p1/mobile/putong/core/data/Message;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p1, "1"

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 112
    .line 113
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 116
    .line 117
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 118
    .line 119
    .line 120
    sget-object p0, Ll/u1z;->j:Ll/jxd0;

    .line 121
    .line 122
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    :cond_2
    return-void
.end method

.method public final synthetic Y1(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, -0x1

    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    const-string p3, "featureID"

    .line 12
    .line 13
    invoke-virtual {p4, p3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p4, p3, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-lt p3, p2, :cond_0

    .line 24
    .line 25
    const/4 p4, 0x4

    .line 26
    if-gt p3, p4, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/d3z;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p3}, Ll/d3z;->K0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return p2
.end method

.method public final synthetic Z1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    if-eqz v1, :cond_4

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/api/g;->Z2:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v6, "other_avatar_url"

    .line 82
    .line 83
    invoke-virtual {v1, v6, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 84
    .line 85
    .line 86
    const-string v4, "other_name"

    .line 87
    .line 88
    iget-object v6, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, v4, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 91
    .line 92
    .line 93
    const-string v4, "self_avatar_url"

    .line 94
    .line 95
    invoke-virtual {v1, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 96
    .line 97
    .line 98
    new-instance v4, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v5, ""

    .line 101
    .line 102
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ll/clz;->m3()D

    .line 106
    .line 107
    .line 108
    move-result-wide v6

    .line 109
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->b(D)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    const-string v4, "temperature"

    .line 121
    .line 122
    invoke-virtual {v1, v4, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 123
    .line 124
    .line 125
    new-instance v2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 131
    .line 132
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const-string v2, "mm"

    .line 140
    .line 141
    invoke-virtual {v1, v2, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    const-string p3, "0"

    .line 149
    .line 150
    const-string v2, "1"

    .line 151
    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    move-object p1, v2

    .line 155
    goto :goto_0

    .line 156
    :cond_2
    move-object p1, p3

    .line 157
    :goto_0
    const-string v4, "feature_available"

    .line 158
    .line 159
    invoke-virtual {v1, v4, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 160
    .line 161
    .line 162
    const-string p1, "source"

    .line 163
    .line 164
    invoke-virtual {v1, p1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_3

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_3
    move-object p3, v2

    .line 175
    :goto_1
    const-string p1, "isOtherUserMale"

    .line 176
    .line 177
    invoke-virtual {v1, p1, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 181
    .line 182
    check-cast p1, Ll/d3z;

    .line 183
    .line 184
    invoke-virtual {p1}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    if-eqz p2, :cond_4

    .line 193
    .line 194
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 195
    .line 196
    check-cast p2, Ll/d3z;

    .line 197
    .line 198
    invoke-virtual {p2}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    const/4 v8, 0x1

    .line 207
    const/4 v9, 0x0

    .line 208
    const-string v5, ""

    .line 209
    .line 210
    const/4 v7, 0x1

    .line 211
    invoke-static/range {v4 .. v9}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    const-string p3, "hideNotch"

    .line 216
    .line 217
    const/4 v0, 0x1

    .line 218
    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 219
    .line 220
    .line 221
    new-instance p3, Ll/y0z;

    .line 222
    .line 223
    invoke-direct {p3, p0, v3}, Ll/y0z;-><init>(Ll/u1z;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 227
    .line 228
    .line 229
    :cond_4
    :goto_2
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/u1z;->u1()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u1z;->s1()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/u1z;->q1()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/u1z;->v1()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/u1z;->x1()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/u1z;->z1()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/u1z;->t1()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/u1z;->r1()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic a2(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p5

    .line 9
    invoke-virtual {v0, p5}, Lcom/p1/mobile/putong/core/api/g;->Np(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 13
    .line 14
    .line 15
    move-result-object p5

    .line 16
    invoke-interface {p5}, Ll/mzl;->l()Ll/clz;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-virtual {p5, p1, p2}, Ll/clz;->T6(Ljava/lang/String;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p2, "message_id"

    .line 36
    .line 37
    const-string p5, ""

    .line 38
    .line 39
    invoke-static {p2, p5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string p2, "message_send_status"

    .line 44
    .line 45
    invoke-static {p2, p5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string p2, "message_receiver"

    .line 50
    .line 51
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string p2, "sensitiveword"

    .line 56
    .line 57
    invoke-static {p2, p4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string p2, "sensitive_text"

    .line 62
    .line 63
    invoke-static {p2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const-string p1, "message_send_values"

    .line 68
    .line 69
    const-string p2, "send"

    .line 70
    .line 71
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    filled-new-array/range {v0 .. v5}, [Ll/sfj0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string p2, "e_chat_view_sensitive_words_send_tips"

    .line 80
    .line 81
    invoke-static {p2, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic b2(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/u1z;->d:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->c()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/u1z;->d:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/l4g0;->r()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/u1z;->e:Z

    .line 13
    .line 14
    return-void
.end method

.method public final synthetic c2(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/u1z;->d:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->g()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/u1z;->d:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/l4g0;->e()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/u1z;->e:Z

    .line 13
    .line 14
    return-void
.end method

.method public final synthetic d2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p5, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p5, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p5}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    .line 8
    move-result-object p5

    .line 9
    invoke-virtual {p5}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 10
    .line 11
    .line 12
    move-result-object p5

    .line 13
    const-string v0, ""

    .line 14
    .line 15
    invoke-virtual {p5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string p0, "message_id"

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string p0, "message_send_status"

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string p0, "message_receiver"

    .line 42
    .line 43
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string p0, "sensitiveword"

    .line 48
    .line 49
    invoke-static {p0, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    const-string p0, "sensitive_text"

    .line 54
    .line 55
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    const-string p0, "message_send_values"

    .line 60
    .line 61
    const-string p1, "send"

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "e_chat_view_sensitiveword_block_popup"

    .line 72
    .line 73
    const-string p2, "p_chat_view_sensitiveword_block_popup_show"

    .line 74
    .line 75
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p4}, Ll/g1e;->dismiss()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-interface {p1, v0}, Ll/r97;->C5(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/d3z;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p1, Ll/d3z;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p1, Ll/d3z;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/d3z;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/widget/TextView;->getInputType()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    const/high16 v0, 0x20000

    .line 74
    .line 75
    xor-int/2addr p0, v0

    .line 76
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setInputType(I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic f2(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/u1z;->j1(Lcom/p1/mobile/putong/data/Media;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 33
    .line 34
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 39
    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    :cond_2
    const/16 v2, 0xbe

    .line 43
    .line 44
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 45
    .line 46
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 v0, 0x1

    .line 58
    invoke-virtual {p0, p1, v0}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic g2(Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/oki;->m(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic h2(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, "/sogou/gif/"

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1, p0}, Ll/oki;->c(Ljava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    new-instance p1, Ljava/io/File;

    .line 38
    .line 39
    invoke-direct {p1, p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object p1
.end method

.method public final i1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "input_method"

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {p0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final synthetic i2(Ljava/io/File;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/e1z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/e1z;-><init>(Ll/u1z;Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final j1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 5

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "image/gif"

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_6

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "image/webp"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_6

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "image/jpg"

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_6

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 32
    .line 33
    const-string v3, "image/png"

    .line 34
    .line 35
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 43
    .line 44
    const-string v4, ".gif"

    .line 45
    .line 46
    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string v0, ".webp"

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    const-string v0, ".jpep"

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_5

    .line 73
    .line 74
    const-string v0, ".jpg"

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    const-string v0, ".png"

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_4

    .line 90
    .line 91
    iput-object v3, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 92
    .line 93
    return-void

    .line 94
    :cond_4
    const-string p0, "image/*"

    .line 95
    .line 96
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 97
    .line 98
    return-void

    .line 99
    :cond_5
    :goto_0
    iput-object v2, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 100
    .line 101
    :cond_6
    :goto_1
    return-void
.end method

.method public final synthetic j2(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->u2(Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic k2(Landroid/net/Uri;)Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, "/sogou"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/sogou/b;->a(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/File;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final l1(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/f1z;

    .line 11
    .line 12
    invoke-direct {v0, p0, p2}, Ll/f1z;-><init>(Ll/u1z;Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v0, Ll/g1z;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1}, Ll/g1z;-><init>(Ll/u1z;Ljava/util/ArrayList;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic l2(Landroid/net/Uri;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/n1z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/n1z;-><init>(Ll/u1z;Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public m1(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/u1z;->E1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-le p0, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic m2(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u1z;->u2(Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n1()Lcom/p1/mobile/putong/core/data/Message;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "local_real_shot_tips"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 43
    .line 44
    long-to-double v3, v1

    .line 45
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 46
    .line 47
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 48
    .line 49
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 50
    .line 51
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    invoke-static {p0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 92
    .line 93
    return-object v0
.end method

.method public n2(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ll/cn7;->w3(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/m0z;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0, p1}, Ll/m0z;-><init>(Ll/u1z;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/n0z;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/n0z;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public o2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d3z;->A0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p1(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->T5:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->k:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/u0z;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/u0z;-><init>(Ll/u1z;Ljava/util/ArrayList;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public p2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/u1z;->f:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/d3z;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/d3z;->E0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hzd;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/a0z;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/a0z;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/l0z;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/l0z;-><init>(Ll/u1z;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public q2(Landroid/text/Editable;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/Editable;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/u1z;->r2(Landroid/text/Editable;Ljava/util/List;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final r1()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->si()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-interface {p0, v0}, Ll/r97;->S5(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public r2(Landroid/text/Editable;Ljava/util/List;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/Editable;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Ll/r97;->E()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x1

    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const-class v4, Landroid/text/style/ForegroundColorSpan;

    .line 43
    .line 44
    invoke-interface {p1, v3, v1, v4}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, [Landroid/text/style/ForegroundColorSpan;

    .line 49
    .line 50
    new-instance v4, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    move v5, v3

    .line 56
    :goto_0
    array-length v6, v1

    .line 57
    if-ge v5, v6, :cond_1

    .line 58
    .line 59
    aget-object v6, v1, v5

    .line 60
    .line 61
    invoke-interface {p1, v6}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-interface {p1, v6}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-static {v7, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    add-int/lit8 v5, v5, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    array-length v5, v1

    .line 88
    sub-int/2addr v5, v2

    .line 89
    :goto_1
    if-ltz v5, :cond_2

    .line 90
    .line 91
    aget-object v6, v1, v5

    .line 92
    .line 93
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    check-cast v7, Ll/pf60;

    .line 98
    .line 99
    invoke-interface {p1, v6}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    add-int/lit8 v5, v5, -0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 108
    .line 109
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/g;->Np(Z)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 121
    .line 122
    invoke-virtual {v0, v6}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_4

    .line 127
    .line 128
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 129
    .line 130
    invoke-virtual {v0, v6}, Ll/a4j;->M(Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_3

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_3
    move v0, v3

    .line 138
    goto :goto_3

    .line 139
    :cond_4
    :goto_2
    move v0, v2

    .line 140
    :goto_3
    const-string v1, ""

    .line 141
    .line 142
    if-eqz v0, :cond_7

    .line 143
    .line 144
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 157
    .line 158
    invoke-virtual {p1, v6}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v8

    .line 162
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p1}, Ll/clz;->e4()Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_6

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 189
    .line 190
    .line 191
    move-result-object p3

    .line 192
    invoke-interface {p3}, Ll/mzl;->l()Ll/clz;

    .line 193
    .line 194
    .line 195
    move-result-object p3

    .line 196
    invoke-virtual {p3}, Ll/clz;->i3()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 201
    .line 202
    check-cast v4, Ll/d3z;

    .line 203
    .line 204
    invoke-virtual {v4}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    if-eqz v0, :cond_5

    .line 216
    .line 217
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 218
    .line 219
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 220
    .line 221
    invoke-virtual {v0, p1, p3, v6}, Lcom/p1/mobile/putong/core/api/g;->zh(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    new-instance v4, Ll/e0z;

    .line 230
    .line 231
    move-object v5, p0

    .line 232
    move-object v9, v8

    .line 233
    move-object v8, v7

    .line 234
    move-object v7, p2

    .line 235
    invoke-direct/range {v4 .. v9}, Ll/e0z;-><init>(Ll/u1z;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    move-object v7, v8

    .line 239
    new-instance p0, Ll/f0z;

    .line 240
    .line 241
    invoke-direct {p0}, Ll/f0z;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-static {v4, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 249
    .line 250
    .line 251
    goto/16 :goto_4

    .line 252
    .line 253
    :cond_5
    move-object v5, p0

    .line 254
    move-object p0, p2

    .line 255
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 256
    .line 257
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/api/g;->Np(Z)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v5}, Ll/j3z;->e0()Ll/mzl;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-virtual {p1, v6, p0}, Ll/clz;->T6(Ljava/lang/String;Ljava/util/List;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    new-array p1, v3, [Ll/sfj0$a;

    .line 282
    .line 283
    const-string p2, "e_wechat_notice"

    .line 284
    .line 285
    invoke-static {p2, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 286
    .line 287
    .line 288
    goto :goto_4

    .line 289
    :cond_6
    move-object v5, p0

    .line 290
    iget-object p0, v5, Ll/u1z;->d:Ll/l4g0;

    .line 291
    .line 292
    const-string p1, "sensitiveword"

    .line 293
    .line 294
    invoke-static {p1, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    const-string p2, "message_id"

    .line 299
    .line 300
    invoke-static {p2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 301
    .line 302
    .line 303
    move-result-object p2

    .line 304
    const-string p3, "message_send_status"

    .line 305
    .line 306
    invoke-static {p3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 307
    .line 308
    .line 309
    move-result-object p3

    .line 310
    const-string v0, "message_receiver"

    .line 311
    .line 312
    invoke-static {v0, v7}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    const-string v1, "sensitive_text"

    .line 317
    .line 318
    invoke-static {v1, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    filled-new-array {p1, p2, p3, v0, v1}, [Ll/pf60;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    sget p1, Ll/qec0;->v:I

    .line 338
    .line 339
    const/4 p2, 0x0

    .line 340
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    new-instance p2, Ll/g0z;

    .line 357
    .line 358
    invoke-direct {p2, v5}, Ll/g0z;-><init>(Ll/u1z;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->B0(Landroid/content/DialogInterface$OnShowListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    new-instance p2, Ll/h0z;

    .line 366
    .line 367
    invoke-direct {p2, v5}, Ll/h0z;-><init>(Ll/u1z;)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 375
    .line 376
    .line 377
    move-result-object v9

    .line 378
    sget p1, Ll/edc0;->r3:I

    .line 379
    .line 380
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    new-instance v4, Ll/i0z;

    .line 385
    .line 386
    invoke-direct/range {v4 .. v9}, Ll/i0z;-><init>(Ll/u1z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {p1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    .line 391
    .line 392
    sget p1, Ll/edc0;->G2:I

    .line 393
    .line 394
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    new-instance p1, Ll/j0z;

    .line 399
    .line 400
    invoke-direct {p1, v7, v8, v6, v9}, Ll/j0z;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;)V

    .line 401
    .line 402
    .line 403
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v9}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 407
    .line 408
    .line 409
    :goto_4
    new-instance p0, Ljava/util/HashSet;

    .line 410
    .line 411
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 412
    .line 413
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    check-cast p1, Ljava/util/Collection;

    .line 418
    .line 419
    invoke-direct {p0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 426
    .line 427
    invoke-virtual {p1, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    return-void

    .line 431
    :cond_7
    move-object v5, p0

    .line 432
    move-object p0, p2

    .line 433
    invoke-direct {v5, v6}, Ll/u1z;->o1(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s:Ll/jxd0;

    .line 437
    .line 438
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object p2

    .line 442
    check-cast p2, Ljava/lang/Boolean;

    .line 443
    .line 444
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 445
    .line 446
    .line 447
    move-result p2

    .line 448
    if-nez p2, :cond_8

    .line 449
    .line 450
    if-eqz p3, :cond_8

    .line 451
    .line 452
    new-instance p2, Ll/th0$a;

    .line 453
    .line 454
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 455
    .line 456
    .line 457
    move-result-object p3

    .line 458
    invoke-direct {p2, p3}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 459
    .line 460
    .line 461
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 462
    .line 463
    .line 464
    move-result-object p3

    .line 465
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 466
    .line 467
    .line 468
    move-result-object p3

    .line 469
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->G5:I

    .line 470
    .line 471
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object p3

    .line 475
    invoke-virtual {p2, p3}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 476
    .line 477
    .line 478
    move-result-object p2

    .line 479
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 480
    .line 481
    .line 482
    move-result-object p3

    .line 483
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 484
    .line 485
    .line 486
    move-result-object p3

    .line 487
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->F5:I

    .line 488
    .line 489
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object p3

    .line 493
    invoke-virtual {p2, p3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 494
    .line 495
    .line 496
    move-result-object p2

    .line 497
    invoke-virtual {p2, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 498
    .line 499
    .line 500
    move-result-object p2

    .line 501
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 502
    .line 503
    .line 504
    move-result-object p3

    .line 505
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 506
    .line 507
    .line 508
    move-result-object p3

    .line 509
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->f:I

    .line 510
    .line 511
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p3

    .line 515
    invoke-virtual {p2, p3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 516
    .line 517
    .line 518
    move-result-object p2

    .line 519
    new-instance p3, Ll/k0z;

    .line 520
    .line 521
    invoke-direct {p3, v5}, Ll/k0z;-><init>(Ll/u1z;)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {p2, p3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 525
    .line 526
    .line 527
    move-result-object p2

    .line 528
    invoke-virtual {v5}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 529
    .line 530
    .line 531
    move-result-object p3

    .line 532
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 533
    .line 534
    .line 535
    move-result-object p3

    .line 536
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->e:I

    .line 537
    .line 538
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object p3

    .line 542
    invoke-virtual {p2, p3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 543
    .line 544
    .line 545
    move-result-object p2

    .line 546
    invoke-virtual {p2}, Ll/th0$a;->a()Ll/th0;

    .line 547
    .line 548
    .line 549
    move-result-object p2

    .line 550
    invoke-virtual {p2}, Ll/th0;->g()V

    .line 551
    .line 552
    .line 553
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s:Ll/jxd0;

    .line 554
    .line 555
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 556
    .line 557
    invoke-virtual {p2, p3}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 558
    .line 559
    .line 560
    :cond_8
    iget-object p2, v5, Ll/ar2;->viewModel:Ll/iam;

    .line 561
    .line 562
    check-cast p2, Ll/d3z;

    .line 563
    .line 564
    invoke-virtual {p2}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 565
    .line 566
    .line 567
    move-result-object p2

    .line 568
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 569
    .line 570
    .line 571
    move-result-object p2

    .line 572
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 573
    .line 574
    .line 575
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 576
    .line 577
    .line 578
    move-result-object p1

    .line 579
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object p1

    .line 583
    invoke-virtual {v5}, Ll/j3z;->e0()Ll/mzl;

    .line 584
    .line 585
    .line 586
    move-result-object p2

    .line 587
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 588
    .line 589
    .line 590
    move-result-object p2

    .line 591
    invoke-virtual {p2, p1, p0}, Ll/clz;->T6(Ljava/lang/String;Ljava/util/List;)V

    .line 592
    .line 593
    .line 594
    return-void
.end method

.method public final s1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/t1z;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/t1z;-><init>(Ll/u1z;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final s2(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    const-string v1, "sogoutest"

    .line 15
    .line 16
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/g;->Lo(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/i1z;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/i1z;-><init>(Ll/u1z;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/j1z;

    .line 30
    .line 31
    invoke-direct {v2, p0, p1}, Ll/j1z;-><init>(Ll/u1z;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final t1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v0}, Ll/clz;->w3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public t2(Landroid/net/Uri;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    const-string v1, ".hotexp"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    const-string v3, "sougou_gif_type"

    .line 22
    .line 23
    const-string v4, "e_sougou_gif"

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    check-cast v2, Ll/d3z;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v3, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v4, v1, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    check-cast v2, Ll/d3z;

    .line 51
    .line 52
    invoke-virtual {v2}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-static {v3, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v4, v1, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 73
    .line 74
    const/16 v2, 0x1e

    .line 75
    .line 76
    if-lt v1, v2, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/u1z;->v2(Landroid/net/Uri;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    const-string p1, "/externalshare"

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    const/16 v1, 0xe

    .line 95
    .line 96
    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :cond_3
    new-instance p1, Ljava/io/File;

    .line 101
    .line 102
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 116
    .line 117
    .line 118
    move-result-wide v0

    .line 119
    const-wide/16 v2, 0x0

    .line 120
    .line 121
    cmp-long v0, v0, v2

    .line 122
    .line 123
    if-nez v0, :cond_4

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    new-instance v0, Ll/b1z;

    .line 127
    .line 128
    invoke-direct {v0, p0}, Ll/b1z;-><init>(Ll/u1z;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Lrx/c;

    .line 136
    .line 137
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance v0, Ll/c1z;

    .line 146
    .line 147
    invoke-direct {v0}, Ll/c1z;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    new-instance v0, Ll/d1z;

    .line 167
    .line 168
    invoke-direct {v0, p0}, Ll/d1z;-><init>(Ll/u1z;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 176
    .line 177
    .line 178
    :cond_5
    :goto_1
    return-void
.end method

.method public final u2(Ll/pf60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/sogou/ImageHeaderParser$ImageType;

    .line 13
    .line 14
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/io/File;

    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->nullCheck()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 35
    .line 36
    const-string p1, "raw"

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 43
    .line 44
    new-instance p1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget-object v2, Ll/u1z$e;->a:[I

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    aget v0, v2, v0

    .line 59
    .line 60
    packed-switch v0, :pswitch_data_0

    .line 61
    .line 62
    .line 63
    :goto_0
    return-void

    .line 64
    :pswitch_0
    const-string v0, "image/webp"

    .line 65
    .line 66
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/u1z;->s2(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :pswitch_1
    const-string v0, "image/gif"

    .line 73
    .line 74
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/u1z;->s2(Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :pswitch_2
    const-string v0, "image/png"

    .line 81
    .line 82
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Ll/u1z;->w2(Ljava/util/List;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :pswitch_3
    const-string v0, "image/jpg"

    .line 89
    .line 90
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ll/u1z;->w2(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    nop

    .line 97
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final v1()V
    .locals 2

    .line 1
    sget-object v0, Ll/u1z;->g:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/q1z;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/q1z;-><init>(Ll/u1z;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final v2(Landroid/net/Uri;)V
    .locals 2

    .line 1
    new-instance v0, Ll/k1z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k1z;-><init>(Ll/u1z;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lrx/c;

    .line 11
    .line 12
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/l1z;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ll/l1z;-><init>(Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/m1z;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/m1z;-><init>(Ll/u1z;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final w2(Ljava/util/List;)V
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 12
    .line 13
    const-string p1, "picture"

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0}, Ll/clz;->A6(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final x1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->B()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/b0z;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/b0z;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ll/clz;->r3()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/c0z;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/c0z;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/d0z;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/d0z;-><init>(Ll/u1z;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public x2(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u1z;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public y2(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d3z;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/d3z;->c2(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final z1()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/u1z;->D1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pe(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/r1z;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/r1z;-><init>(Ll/u1z;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "live_message_guide_tip_threshold"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-string v0, "live_message_guide_tip_threshold_1"

    .line 59
    .line 60
    const/16 v2, 0xa

    .line 61
    .line 62
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    sput v0, Ll/u1z;->h:I

    .line 67
    .line 68
    const-string v0, "live_message_guide_tip_threshold_2"

    .line 69
    .line 70
    const/16 v2, 0x14

    .line 71
    .line 72
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    sput v0, Ll/u1z;->i:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    :catch_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pe(Ljava/lang/String;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/s1z;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/s1z;-><init>(Ll/u1z;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    return-void
.end method
