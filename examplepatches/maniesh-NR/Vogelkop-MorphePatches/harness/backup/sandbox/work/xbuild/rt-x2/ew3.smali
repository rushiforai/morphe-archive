.class public final synthetic Lew3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lew3;->a:B

    iput-object p1, p0, Lew3;->b:Ltw3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lew3;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v0, v0, Lew3;->b:Ltw3;

    packed-switch v1, :pswitch_data_194

    sget v1, Leif;->a:I

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_18
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-string v1, "localize"

    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0

    :pswitch_21
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object v0

    return-object v0

    :pswitch_28
    new-instance v1, Loji;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-direct {v1, v0}, Loji;-><init>(Ljava/lang/Object;)V

    return-object v1

    :pswitch_32
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Lwc6;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lwc6;

    return-object v0

    :pswitch_3f
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lhjf;->u()Lnzk;

    move-result-object v0

    return-object v0

    :pswitch_46
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Lwre;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lwre;

    return-object v0

    :pswitch_53
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ldx3;->s:Ldxe;

    return-object v0

    :pswitch_58
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Lben;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lben;

    return-object v0

    :pswitch_65
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v0

    return-object v0

    :pswitch_6c
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Lg8j;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lg8j;

    return-object v0

    :pswitch_79
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_80
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :pswitch_88
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_8f
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    return-object v0

    :pswitch_99
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->c:Lz77;

    return-object v0

    :pswitch_a3
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lnr8;->e(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_ae
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_b5
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lwok;->t(Landroid/content/Context;)Lwok;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvok;

    iget v0, v0, Lvok;->a:I

    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_c8

    move v2, v3

    :cond_c8
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_cd
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->h0:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0

    :pswitch_db
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    return-object v0

    :pswitch_e5
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Lu2b;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lu2b;

    return-object v0

    :pswitch_f2
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    return-object v0

    :pswitch_fc
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v0

    return-object v0

    :pswitch_103
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Ljbf;->t(Landroid/content/Context;)Ljbf;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Libf;

    return-object v0

    :pswitch_110
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Lqr8;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lqr8;

    return-object v0

    :pswitch_11d
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_124

    const/4 v0, 0x0

    :cond_124
    return-object v0

    :pswitch_125
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v1, Ld8j;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Ld8j;

    return-object v0

    :pswitch_132
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->I:Lhw3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le4i;

    return-object v0

    :pswitch_13f
    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const v1, 0x7f0a01a3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    move-result-object v8

    const v1, 0x7f0a0b47

    invoke-virtual {v0, v1}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/StatusBarDrawingFrameLayout;

    const v1, 0x7f0a0b45

    invoke-virtual {v0, v1}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    move-result-object v6

    const v1, 0x7f0a0b46

    invoke-virtual {v0, v1}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    move-result-object v7

    new-instance v4, Lcwk;

    invoke-virtual {v0}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v9

    new-instance v10, Lwt3;

    const/4 v1, 0x2

    invoke-direct {v10, v0, v1}, Lwt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v11, Lli;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lcom/opera/android/OperaApplication;

    const/16 v16, 0x0

    const/16 v17, 0x16

    const-class v13, Lcom/opera/android/OperaApplication;

    const-string v14, "usageReporter"

    const-string v15, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v11 .. v17}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lwv1;

    invoke-direct {v1, v11, v2}, Lwv1;-><init>(Lb6h;B)V

    new-instance v12, Lxt3;

    invoke-direct {v12, v0, v3}, Lxt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object v11, v1

    invoke-direct/range {v4 .. v12}, Lcwk;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/opera/android/browser/chromium/ChromiumContainerView;Lwt3;Lwv1;Lxt3;)V

    return-object v4

    nop

    :pswitch_data_194
    .packed-switch 0x0
        :pswitch_13f
        :pswitch_132
        :pswitch_125
        :pswitch_11d
        :pswitch_110
        :pswitch_103
        :pswitch_fc
        :pswitch_f2
        :pswitch_e5
        :pswitch_db
        :pswitch_cd
        :pswitch_b5
        :pswitch_ae
        :pswitch_a3
        :pswitch_99
        :pswitch_8f
        :pswitch_88
        :pswitch_80
        :pswitch_79
        :pswitch_6c
        :pswitch_65
        :pswitch_58
        :pswitch_53
        :pswitch_46
        :pswitch_3f
        :pswitch_32
        :pswitch_28
        :pswitch_21
        :pswitch_18
    .end packed-switch
.end method
