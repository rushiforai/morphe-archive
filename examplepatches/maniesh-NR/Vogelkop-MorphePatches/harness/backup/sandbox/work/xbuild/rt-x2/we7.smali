.class public final Lwe7;
.super Lhkg;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Leig;B)V
    .registers 4

    iput-byte p3, p0, Lwe7;->c:B

    iput-object p1, p0, Lwe7;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhkg;->b:Leig;

    return-void
.end method


# virtual methods
.method public final d(Lgig;)V
    .registers 4

    iget-byte v0, p0, Lwe7;->c:B

    iget-object p0, p0, Lwe7;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5a

    check-cast p0, Lcom/opera/android/media/PlayerService;

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->c:Lqkg;

    invoke-interface {p1}, Lgig;->e0()Z

    move-result v1

    invoke-virtual {v0, v1}, Lqkg;->P(Z)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->b:Lgkg;

    if-eqz v0, :cond_1e

    new-instance v1, Lrkg;

    invoke-direct {v1, p0, p1}, Lrkg;-><init>(Lcom/opera/android/media/PlayerService;Lgig;)V

    invoke-virtual {v0, v1}, Lgkg;->b(Lgk9;)V

    :cond_1e
    return-void

    :pswitch_1f
    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_29
    check-cast p0, Lakg;

    invoke-virtual {p0}, Lakg;->w()V

    return-void

    :pswitch_2f
    check-cast p0, Lcom/opera/android/media/PlayerContainerView;

    sget p1, Lcom/opera/android/media/PlayerContainerView;->k:I

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->f()V

    return-void

    :pswitch_37
    check-cast p0, Lzld;

    invoke-virtual {p0}, Lzld;->H()V

    return-void

    :pswitch_3d
    check-cast p0, Lp12;

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_47
    check-cast p0, Lgld;

    invoke-virtual {p0}, Lgld;->J0()V

    return-void

    :pswitch_4d
    check-cast p0, Lzkd;

    invoke-virtual {p0}, Lzkd;->T()V

    return-void

    :pswitch_53
    check-cast p0, Lze7;

    invoke-virtual {p0}, Lze7;->K()V

    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_53
        :pswitch_4d
        :pswitch_47
        :pswitch_3d
        :pswitch_37
        :pswitch_2f
        :pswitch_29
        :pswitch_1f
    .end packed-switch
.end method
