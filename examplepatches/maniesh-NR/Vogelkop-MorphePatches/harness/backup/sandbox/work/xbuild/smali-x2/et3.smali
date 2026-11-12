.class public final synthetic Let3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Let3;->a:B

    iput-object p1, p0, Let3;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Let3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Let3;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_c8

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_d
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    new-instance v0, Lfl5;

    invoke-direct {v0}, Lfl5;-><init>()V

    const/16 v2, 0x3e8

    iput v2, v0, Lfl5;->a:I

    const/4 v2, 0x6

    iput-byte v2, v0, Lfl5;->b:B

    new-instance v2, Lw17;

    invoke-direct {v2}, Lw17;-><init>()V

    new-instance v3, Lpkh;

    iget-object v4, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v5, v4, Lxv1;->B0:Lj4c;

    iget-object v4, v4, Lxv1;->D0:Lj4c;

    invoke-direct {v3, v5, v4}, Lpkh;-><init>(Lj4c;Lj4c;)V

    iget-object v4, v2, Lw17;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lju9;

    sget-object v5, Lvml;->d:Lumi;

    new-instance v6, Lfif;

    invoke-direct {v6, p0, v1}, Lfif;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v1, Lfif;

    const/4 v7, 0x1

    invoke-direct {v1, p0, v7}, Lfif;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {v3, v5, v6, v1}, Lju9;-><init>(Lumi;Lfif;Lfif;)V

    invoke-virtual {v4, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lw17;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->v:Lj4c;

    invoke-direct {v1, p0}, Lw17;-><init>(Lj4c;)V

    invoke-virtual {v4, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    iput-object v2, v0, Lfl5;->c:Ljava/lang/Object;

    new-instance p0, Lz67;

    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lz67;-><init>(B)V

    iput-object p0, v0, Lfl5;->d:Ljava/lang/Object;

    new-instance p0, Ljl5;

    invoke-direct {p0, v0}, Ljl5;-><init>(Lfl5;)V

    return-object p0

    :pswitch_61
    sget-object v0, Lme6;->d:Lke6;

    sget-object v2, Lme6;->a:[Lxtb;

    aget-object v1, v2, v1

    invoke-virtual {v0, p0}, Lke6;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqd6;

    return-object p0

    :pswitch_6e
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object p0

    iget-object p0, p0, Lslk;->c:Lpy9;

    iget-object p0, p0, Lpy9;->g:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtg;

    return-object p0

    :pswitch_7d
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_84
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->I:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu8k;

    return-object p0

    :pswitch_8d
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_92
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->W:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsnc;

    iget-object p0, p0, Lsnc;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrnc;

    return-object p0

    :pswitch_a5
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->y:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lize;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leri;

    return-object p0

    :pswitch_b6
    iget-object p0, p0, Lcom/opera/android/OperaApplication;->I:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu8k;

    invoke-virtual {p0}, Lu8k;->b()Lt8k;

    move-result-object p0

    return-object p0

    :pswitch_c3
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object p0

    return-object p0

    :pswitch_data_c8
    .packed-switch 0x0
        :pswitch_c3
        :pswitch_b6
        :pswitch_a5
        :pswitch_92
        :pswitch_8d
        :pswitch_84
        :pswitch_7d
        :pswitch_6e
        :pswitch_61
        :pswitch_d
    .end packed-switch
.end method
