.class public final synthetic Ln42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Ln42;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Ln42;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/view/View;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p0, p0, Ln42;->a:B

    packed-switch p0, :pswitch_data_b6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->b1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsom;

    iget-object p0, p0, Lsom;->f:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xa4cb800

    sub-long/2addr v0, v2

    const-string p1, "last_signin"

    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :pswitch_39
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->Q()Lorm;

    return-void

    :pswitch_49
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {v0, p1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    if-eqz p1, :cond_63

    new-instance v2, Lqxh;

    invoke-direct {v2, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_64

    :cond_63
    move-object v2, v1

    :goto_64
    new-instance p1, Lgkj;

    const/4 v3, 0x0

    invoke-direct {p1, v3, v3}, Lnz0;-><init>(ZZ)V

    iput-object v1, p1, Lgkj;->a:Ljava/lang/String;

    iput-object v1, p1, Lgkj;->b:Ljava/lang/String;

    iput-object v1, p1, Lgkj;->c:Ljava/lang/String;

    const-string v4, "Install Referrer"

    iput-object v4, p1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v1, p1, Lgkj;->e:Lekj;

    iput-object v1, p1, Lgkj;->f:Lfkj;

    iput-object v1, p1, Lgkj;->g:Lqp2;

    iput-object v1, p1, Lgkj;->h:Ldkj;

    iput-object v1, p1, Lgkj;->i:Ldkj;

    iput-object v1, p1, Lgkj;->j:Lql;

    iput v3, p1, Lgkj;->k:I

    iput v3, p1, Lgkj;->l:I

    iput v3, p1, Lgkj;->m:I

    iput-boolean v0, p1, Lgkj;->n:Z

    iput-object v2, p1, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_93
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Lrxh;

    const v0, 0x7f140932

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    const-string v0, "https://opera.com/features/flow"

    invoke-static {p0, v0, p1}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    return-void

    :pswitch_a5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lna2;->T(Landroid/content/Context;)V

    return-void

    :pswitch_ad
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lna2;->T(Landroid/content/Context;)V

    :pswitch_b4
    return-void

    nop

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_b4
        :pswitch_ad
        :pswitch_a5
        :pswitch_93
        :pswitch_49
        :pswitch_39
    .end packed-switch
.end method
