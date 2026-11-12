.class public final synthetic Lgv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lgv3;->a:B

    iput-object p1, p0, Lgv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lgv3;->a:B

    iget-object p0, p0, Lgv3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_38

    invoke-static {p0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object p0

    return-object p0

    :pswitch_c
    sget-object v0, Lz7f;->k:Lrqd;

    invoke-static {p0}, Lipe;->E(Landroid/content/Context;)Lz7f;

    move-result-object p0

    return-object p0

    :pswitch_13
    const-class v0, Lkxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    return-object p0

    :pswitch_1e
    iget-object p0, p0, Ldx3;->o:Lqim;

    iget-object p0, p0, Lqim;->f:Laal;

    return-object p0

    :pswitch_23
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    return-object p0

    :pswitch_28
    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    return-object p0

    :pswitch_2d
    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_32
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_32
        :pswitch_2d
        :pswitch_28
        :pswitch_23
        :pswitch_1e
        :pswitch_13
        :pswitch_c
    .end packed-switch
.end method
