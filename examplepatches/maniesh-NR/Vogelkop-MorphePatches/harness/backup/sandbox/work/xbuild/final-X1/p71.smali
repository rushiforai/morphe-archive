.class public final Lp71;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public v:Ljava/lang/Object;

.field public final synthetic w:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLmt5;Ljava/lang/Object;)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lp71;->t:B

    iput-object p3, p0, Lp71;->w:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lfr6;Lmt5;Lbd5;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lp71;->t:B

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    iput-object p3, p0, Lp71;->w:Ljava/lang/Object;

    invoke-direct {p0, v0, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V
    .registers 5

    .line 12
    iput-byte p4, p0, Lp71;->t:B

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    iput-object p2, p0, Lp71;->w:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method private final o(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-object v0, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v0, Ljoc;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, p0, Lp71;->u:B

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_21

    if-eq v2, v6, :cond_1c

    if-ne v2, v5, :cond_16

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5d

    :cond_16
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_1c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v12, p0

    goto :goto_41

    :cond_21
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lp71;->v:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Lo0i;

    new-instance v11, Lm0i;

    const/4 p1, 0x0

    invoke-direct {v11, v7, v0, v4, p1}, Lm0i;-><init>(Lo0i;Ljoc;Lmt5;B)V

    iput-byte v6, p0, Lp71;->u:B

    sget-object p1, Lpn7;->b:Lon7;

    sget-object p1, Lun7;->e:Lun7;

    invoke-static {v3, p1}, Lcs5;->x0(ILun7;)J

    move-result-wide v9

    const/4 v8, 0x4

    move-object v12, p0

    invoke-virtual/range {v7 .. v12}, Lo0i;->a(IJLkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_5c

    :goto_41
    iget-object p0, v12, Lp71;->v:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Lo0i;

    new-instance v11, Lm0i;

    invoke-direct {v11, v7, v0, v4, v6}, Lm0i;-><init>(Lo0i;Ljoc;Lmt5;B)V

    iput-byte v5, v12, Lp71;->u:B

    sget-object p0, Lpn7;->b:Lon7;

    sget-object p0, Lun7;->e:Lun7;

    invoke-static {v3, p0}, Lcs5;->x0(ILun7;)J

    move-result-wide v9

    const/4 v8, 0x4

    invoke-virtual/range {v7 .. v12}, Lo0i;->a(IJLkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_5d

    :cond_5c
    return-object v1

    :cond_5d
    :goto_5d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final p(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-object v0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lrth;

    iget-object v1, v0, Lrth;->f:Landroid/os/Bundle;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-byte v3, p0, Lp71;->u:B

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v3, :cond_22

    if-eq v3, v6, :cond_1e

    if-ne v3, v5, :cond_18

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_9a

    :cond_18
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_1e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_22
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Ls6d;->a:Ld7a;

    new-instance v3, Lbz1;

    iget-object v7, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    const/16 v8, 0x1b

    invoke-direct {v3, v8, v4, v7}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-byte v6, p0, Lp71;->u:B

    invoke-static {p1, v3, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v2, :cond_99

    :goto_3c
    check-cast p1, Ly3i;

    invoke-virtual {v0}, Lrth;->getData()Ljava/util/Map;

    move-result-object v0

    sget-object v3, Lebb;->c:Lebb;

    const-string v3, "google.sent_time"

    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/lang/Long;

    if-eqz v4, :cond_55

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    goto :goto_62

    :cond_55
    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_60

    :try_start_59
    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3
    :try_end_5f
    .catch Ljava/lang/NumberFormatException; {:try_start_59 .. :try_end_5f} :catch_60

    goto :goto_62

    :catch_60
    :cond_60
    const-wide/16 v3, 0x0

    :goto_62
    invoke-static {v3, v4}, Lj06;->m(J)Lebb;

    move-result-object v3

    sget-object v4, Lpn7;->b:Lon7;

    const-string v4, "google.ttl"

    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v4, v1, Ljava/lang/Integer;

    if-eqz v4, :cond_79

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_85

    :cond_79
    instance-of v4, v1, Ljava/lang/String;

    if-eqz v4, :cond_84

    :try_start_7d
    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_83
    .catch Ljava/lang/NumberFormatException; {:try_start_7d .. :try_end_83} :catch_84

    goto :goto_85

    :catch_84
    :cond_84
    const/4 v1, 0x0

    :goto_85
    sget-object v4, Lun7;->e:Lun7;

    invoke-static {v1, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Lebb;->h(J)Lebb;

    move-result-object v1

    iput-byte v5, p0, Lp71;->u:B

    check-cast v0, Ljava/util/HashMap;

    invoke-interface {p1, v0, v1, p0}, Ly3i;->a(Ljava/util/HashMap;Lebb;Lp71;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_9a

    :cond_99
    return-object v2

    :cond_9a
    :goto_9a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final q(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v0, Lr4i;

    iget-object v1, v0, Lr4i;->h:Lua7;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-byte v3, p0, Lp71;->u:B

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v3, :cond_21

    if-eq v3, v6, :cond_19

    if-eq v3, v5, :cond_19

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_19
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_5c

    :cond_21
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p1, Lq4i;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_49

    if-ne p1, v6, :cond_45

    iget-object p1, v0, Lr4i;->f:Lr2i;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lt4i;

    iget-object v1, v1, Lt4i;->a:Lk15;

    iget-object v1, v1, Lk15;->a:Ljava/lang/String;

    iput-byte v5, p0, Lp71;->u:B

    invoke-virtual {p1, v1, p0}, Lr2i;->b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_5c

    goto :goto_5b

    :cond_45
    invoke-static {}, Lh9o;->p()V

    return-object v4

    :cond_49
    iget-object p1, v0, Lr4i;->e:Lx4i;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lt4i;

    iget-object v1, v1, Lt4i;->a:Lk15;

    iput-byte v6, p0, Lp71;->u:B

    invoke-virtual {p1, v1, p0}, Lx4i;->a(Lk15;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_5c

    :goto_5b
    return-object v2

    :cond_5c
    :goto_5c
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_99

    instance-of v1, p1, Looa;

    iget-object v2, v0, Lr4i;->g:Lorm;

    const/16 v3, 0x17

    if-eqz v1, :cond_94

    check-cast p1, Looa;

    iget v1, p1, Looa;->a:I

    iget-object p1, p1, Looa;->c:Lji1;

    if-eqz p1, :cond_75

    iget-object p1, p1, Lji1;->b:Ljava/lang/String;

    goto :goto_76

    :cond_75
    move-object p1, v4

    :goto_76
    if-nez p1, :cond_7a

    const-string p1, ""

    :cond_7a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    check-cast v2, Lx5f;

    invoke-virtual {v2, v3, p1}, Lx5f;->R(ILjava/lang/String;)V

    goto :goto_99

    :cond_94
    check-cast v2, Lx5f;

    invoke-virtual {v2, v3, v4}, Lx5f;->R(ILjava/lang/String;)V

    :cond_99
    :goto_99
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    iput-object p1, v0, Lr4i;->k:Lt0i;

    instance-of p0, p0, Lq0i;

    iget-object p1, v0, Lr4i;->i:Lpt1;

    if-nez p1, :cond_a7

    move-object p1, v4

    :cond_a7
    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    if-nez p0, :cond_bf

    sget-object p0, Ls4i;->a:Ls4i;

    iput-object p0, v0, Lr4i;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Landroidx/fragment/app/i;->getDialog()Landroid/app/Dialog;

    move-result-object p0

    if-eqz p0, :cond_110

    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    goto :goto_110

    :cond_bf
    iget-object p0, v0, Lr4i;->i:Lpt1;

    if-nez p0, :cond_c4

    move-object p0, v4

    :cond_c4
    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    const p1, 0x7f140800

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lr4i;->i:Lpt1;

    if-nez p0, :cond_d7

    move-object p0, v4

    :cond_d7
    iget-object p0, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    const p1, 0x7f140eca

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lr4i;->i:Lpt1;

    if-nez p0, :cond_ea

    move-object p0, v4

    :cond_ea
    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const p1, 0x7f140ebc

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lr4i;->i:Lpt1;

    if-nez p0, :cond_fd

    move-object p0, v4

    :cond_fd
    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Lr4i;->i:Lpt1;

    if-eqz p0, :cond_109

    move-object v4, p0

    :cond_109
    iget-object p0, v4, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_110
    :goto_110
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final r(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v0, Lwjj;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, p0, Lp71;->u:B

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_23

    if-eq v2, v5, :cond_1b

    if-ne v2, v4, :cond_15

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5c

    :cond_15
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_1b
    iget-object v2, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lr3;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_51

    :cond_23
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast p1, Leme;

    iget-object p1, p1, Leme;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    if-lez p1, :cond_6d

    :cond_34
    iget-object p1, v0, Lwjj;->a:Ljava/lang/Object;

    check-cast p1, Lnx5;

    invoke-static {p1}, Lsgb;->w(Lnx5;)V

    iget-object p1, v0, Lwjj;->b:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Lr3;

    iget-object p1, v0, Lwjj;->c:Ljava/lang/Object;

    check-cast p1, Lp04;

    iput-object v2, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v5, p0, Lp71;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, p0}, Lp04;->O(Lp04;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_5b

    :goto_51
    iput-object v3, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v4, p0, Lp71;->u:B

    invoke-interface {v2, p1, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_5c

    :cond_5b
    return-object v1

    :cond_5c
    :goto_5c
    iget-object p1, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast p1, Leme;

    iget-object p1, p1, Leme;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p1

    if-nez p1, :cond_34

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_6d
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3
.end method

.method private final s(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-object v0, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v0, Lslk;

    iget-object v1, v0, Lslk;->c:Lpy9;

    iget-object v2, v0, Lslk;->b:Ltmk;

    sget-object v3, Lpx5;->a:Lpx5;

    iget-byte v4, p0, Lp71;->u:B

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v4, :cond_3a

    if-eq v4, v8, :cond_36

    if-eq v4, v7, :cond_2e

    if-eq v4, v6, :cond_26

    if-ne v4, v5, :cond_20

    :try_start_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_e1

    goto/16 :goto_93

    :cond_20
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_26
    iget-object v4, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v4, Lh0d;

    :try_start_2a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_e1

    goto :goto_6f

    :cond_2e
    iget-object v4, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v4, Lh0d;

    :try_start_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_65

    :cond_36
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_39
    .catchall {:try_start_32 .. :try_end_39} :catchall_e1

    goto :goto_47

    :cond_3a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_3d
    iget-object p1, v0, Lslk;->h:Lode;

    iput-byte v8, p0, Lp71;->u:B

    invoke-static {p1, p0}, Lxf8;->v(Lekc;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v3, :cond_92

    :goto_47
    check-cast p1, Lh0d;

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v7, p0, Lp71;->u:B

    sget-object v4, Lh0d;->c:Lh0d;

    if-ne p1, v4, :cond_5a

    invoke-virtual {v2, p0}, Ltmk;->j(Lnt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v3, :cond_62

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_62

    :cond_5a
    invoke-virtual {v2, p0}, Ltmk;->i(Lnt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v3, :cond_62

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_62
    :goto_62
    if-eq v4, v3, :cond_92

    move-object v4, p1

    :goto_65
    iput-object v4, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v6, p0, Lp71;->u:B

    invoke-virtual {v0, v4, p0}, Lslk;->a(Lh0d;Lp71;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v3, :cond_92

    :goto_6f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_93

    iput-object v9, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v5, p0, Lp71;->u:B

    sget-object p1, Lh0d;->c:Lh0d;

    if-ne v4, p1, :cond_88

    invoke-virtual {v2, p0}, Ltmk;->j(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v3, :cond_90

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_90

    :cond_88
    invoke-virtual {v2, p0}, Ltmk;->i(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v3, :cond_90

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_90
    :goto_90
    if-ne p0, v3, :cond_93

    :cond_92
    return-object v3

    :cond_93
    :goto_93
    iget-object p0, v2, Ltmk;->g:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwvg;

    invoke-virtual {p0}, Lwvg;->b()Z

    move-result p1

    if-eqz p1, :cond_b6

    iget-object p0, p0, Lwvg;->a:Ljava/lang/String;

    invoke-virtual {v1}, Lpy9;->a()Lwvg;

    move-result-object p1

    iget-object p1, p1, Lwvg;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b6

    iget-object p0, v1, Lpy9;->a:Lmcj;

    const-string p1, ""

    invoke-virtual {p0, p1}, Lmcj;->m(Ljava/lang/String;)V

    :cond_b6
    iget-object p0, v1, Lpy9;->f:Lkze;

    invoke-virtual {v1}, Lpy9;->a()Lwvg;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    iget-object p0, v0, Lslk;->j:Li7f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lg7f;

    invoke-direct {p1, p0}, Lg7f;-><init>(Li7f;)V

    :goto_c9
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d9

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_c9

    :cond_d9
    invoke-virtual {p0}, Li7f;->clear()V
    :try_end_dc
    .catchall {:try_start_3d .. :try_end_dc} :catchall_e1

    iput-object v9, v0, Lslk;->k:Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_e1
    move-exception p0

    iput-object v9, v0, Lslk;->k:Ld3k;

    throw p0
.end method

.method private final t(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v0, Ln1f;

    iget-object v1, v0, Ln1f;->d:Ljava/lang/Object;

    check-cast v1, Ld3k;

    sget-object v2, Lpx5;->a:Lpx5;

    iget-byte v3, p0, Lp71;->u:B

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v3, :cond_28

    if-eq v3, v5, :cond_24

    if-ne v3, v4, :cond_1d

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Ln1f;

    :try_start_19
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_4e

    goto :goto_40

    :cond_1d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_24
    :try_start_24
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_34

    goto :goto_48

    :cond_28
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_2b
    iput-byte v5, p0, Lp71;->u:B

    invoke-virtual {v0, p0}, Ln1f;->f(Lmt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_31
    .catchall {:try_start_2b .. :try_end_31} :catchall_34

    if-ne p0, v2, :cond_48

    goto :goto_3f

    :catchall_34
    move-exception p1

    :try_start_35
    iput-object v0, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v4, p0, Lp71;->u:B

    invoke-virtual {v0, p1, p0}, Ln1f;->d(Ljava/lang/Throwable;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_40

    :goto_3f
    return-object v2

    :cond_40
    :goto_40
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    iput-boolean p0, v0, Ln1f;->a:Z
    :try_end_48
    .catchall {:try_start_35 .. :try_end_48} :catchall_4e

    :cond_48
    :goto_48
    invoke-virtual {v1}, Lxob;->start()Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_4e
    move-exception p0

    invoke-virtual {v1}, Lxob;->start()Z

    throw p0
.end method

.method private final u(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, p0, Lp71;->u:B

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_1b

    if-eq v1, v3, :cond_17

    if-ne v1, v2, :cond_10

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_37

    :cond_10
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_17
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p1, Lunb;

    iput-byte v3, p0, Lp71;->u:B

    invoke-interface {p1, p0}, Lunb;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_36

    :goto_2a
    iget-object p1, p0, Lp71;->w:Ljava/lang/Object;

    check-cast p1, Llwg;

    iput-byte v2, p0, Lp71;->u:B

    invoke-virtual {p1, p0}, Llwg;->d(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_37

    :cond_36
    return-object v0

    :cond_37
    :goto_37
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final v(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-object v0, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v0, Lqdl;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, p0, Lp71;->u:B

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_32

    if-eq v2, v5, :cond_2a

    if-eq v2, v4, :cond_22

    if-ne v2, v3, :cond_1b

    iget-object v2, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lk04;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3f

    :cond_1b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_22
    iget-object v2, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lk04;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5e

    :cond_2a
    iget-object v2, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lk04;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_49

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v0, Lqdl;->d:Lp04;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lk04;

    invoke-direct {v2, p1}, Lk04;-><init>(Lp04;)V

    :cond_3f
    :goto_3f
    iput-object v2, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v5, p0, Lp71;->u:B

    invoke-virtual {v2, p0}, Lk04;->b(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_6a

    :goto_49
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_6b

    invoke-virtual {v2}, Lk04;->c()Ljava/lang/Object;

    iput-object v2, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v4, p0, Lp71;->u:B

    invoke-virtual {v0, p0}, Lqdl;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_6a

    :goto_5e
    sget-wide v6, Lrdl;->a:J

    iput-object v2, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v3, p0, Lp71;->u:B

    invoke-static {v6, v7, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3f

    :cond_6a
    return-object v1

    :cond_6b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final w(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, p0, Lp71;->u:B

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_1f

    if-eq v1, v4, :cond_17

    if-ne v1, v3, :cond_11

    :try_start_d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_10
    .catch Landroid/database/SQLException; {:try_start_d .. :try_end_10} :catch_57

    goto :goto_54

    :cond_11
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_17
    iget-object v1, p0, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Lj3g;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_31

    :cond_1f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lp71;->v:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lj3g;

    iput-object v1, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v4, p0, Lp71;->u:B

    invoke-virtual {v1, p0}, Lj3g;->c(Lmt5;)Ljava/lang/Boolean;

    move-result-object p1

    if-eq p1, v0, :cond_53

    :goto_31
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3c

    sget-object p0, Lv08;->a:Lv08;

    return-object p0

    :cond_3c
    :try_start_3c
    sget-object p1, Ls1m;->b:Ls1m;

    new-instance v4, Lr8h;

    iget-object v5, p0, Lp71;->w:Ljava/lang/Object;

    check-cast v5, Lg7m;

    const/16 v6, 0x1c

    invoke-direct {v4, v6, v2, v5}, Lr8h;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object v2, p0, Lp71;->v:Ljava/lang/Object;

    iput-byte v3, p0, Lp71;->u:B

    invoke-virtual {v1, p1, v4, p0}, Lj3g;->e(Ls1m;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_54

    :cond_53
    return-object v0

    :cond_54
    :goto_54
    check-cast p1, Ljava/util/Set;
    :try_end_56
    .catch Landroid/database/SQLException; {:try_start_3c .. :try_end_56} :catch_57

    return-object p1

    :catch_57
    sget-object p0, Lv08;->a:Lv08;

    return-object p0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lp71;->t:B

    iget-object v1, p0, Lp71;->w:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_17e

    new-instance p0, Lp71;

    check-cast v1, Lmvm;

    const/16 v0, 0x1d

    invoke-direct {p0, v0, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    return-object p0

    :pswitch_13
    new-instance p0, Lp71;

    check-cast v1, Lg7m;

    const/16 v0, 0x1c

    invoke-direct {p0, v0, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    return-object p0

    :pswitch_1f
    new-instance p0, Lp71;

    check-cast v1, Lqdl;

    const/16 p1, 0x1b

    invoke-direct {p0, p1, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_29
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lunb;

    check-cast v1, Llwg;

    const/16 v0, 0x1a

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_37
    new-instance p0, Lp71;

    check-cast v1, Ln1f;

    const/16 p1, 0x19

    invoke-direct {p0, p1, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_41
    new-instance p0, Lp71;

    check-cast v1, Lslk;

    const/16 p1, 0x18

    invoke-direct {p0, p1, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_4b
    new-instance p0, Lp71;

    check-cast v1, Lwjj;

    const/16 p1, 0x17

    invoke-direct {p0, p1, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_55
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lq4i;

    check-cast v1, Lr4i;

    const/16 v0, 0x16

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_63
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lrth;

    check-cast v1, Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    const/16 v0, 0x15

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_71
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lo0i;

    check-cast v1, Ljoc;

    const/16 v0, 0x14

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_7f
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lghf;

    check-cast v1, Lkvh;

    const/16 v0, 0x13

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_8d
    new-instance p0, Lp71;

    check-cast v1, Lb3h;

    const/16 v0, 0x12

    invoke-direct {p0, v0, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    return-object p0

    :pswitch_99
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lece;

    check-cast v1, Lqfb;

    const/16 v0, 0x11

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_a7
    new-instance p0, Lp71;

    check-cast v1, Lsae;

    const/16 v0, 0x10

    invoke-direct {p0, v0, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    return-object p0

    :pswitch_b3
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Ld3k;

    check-cast v1, Lacd;

    const/16 v0, 0xf

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_c1
    new-instance p0, Lp71;

    check-cast v1, Llxa;

    const/16 p1, 0xe

    invoke-direct {p0, p1, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_cb
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lunb;

    check-cast v1, Lpca;

    const/16 v0, 0xd

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_d9
    new-instance p0, Lp71;

    check-cast v1, Lekc;

    const/16 v0, 0xc

    invoke-direct {p0, v0, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    return-object p0

    :pswitch_e5
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    check-cast v1, Landroidx/emoji2/emojipicker/EmojiPickerView;

    const/16 v0, 0xb

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_f3
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lx47;

    check-cast v1, Lby5;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_101
    new-instance p0, Lp71;

    check-cast v1, Lx47;

    const/16 v0, 0x9

    invoke-direct {p0, v0, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, p0, Lp71;->v:Ljava/lang/Object;

    return-object p0

    :pswitch_10d
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lg47;

    check-cast v1, Lh47;

    const/16 v0, 0x8

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_11b
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lggb;

    check-cast v1, Ljava/lang/String;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_128
    new-instance p0, Lp71;

    check-cast v1, Lmg6;

    const/4 p1, 0x6

    invoke-direct {p0, p1, p2, v1}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    return-object p0

    :pswitch_131
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lie6;

    check-cast v1, Ldvd;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_13e
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lunb;

    check-cast v1, Lp46;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_14b
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast v1, Ltj4;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_158
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lfr6;

    check-cast v1, Lbd5;

    invoke-direct {p1, p0, p2, v1}, Lp71;-><init>(Lfr6;Lmt5;Lbd5;)V

    return-object p1

    :pswitch_164
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_171
    new-instance p1, Lp71;

    iget-object p0, p0, Lp71;->v:Ljava/lang/Object;

    check-cast p0, Lt71;

    check-cast v1, Lz8b;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v1, p2, v0}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    return-object p1

    :pswitch_data_17e
    .packed-switch 0x0
        :pswitch_171
        :pswitch_164
        :pswitch_158
        :pswitch_14b
        :pswitch_13e
        :pswitch_131
        :pswitch_128
        :pswitch_11b
        :pswitch_10d
        :pswitch_101
        :pswitch_f3
        :pswitch_e5
        :pswitch_d9
        :pswitch_cb
        :pswitch_c1
        :pswitch_b3
        :pswitch_a7
        :pswitch_99
        :pswitch_8d
        :pswitch_7f
        :pswitch_71
        :pswitch_63
        :pswitch_55
        :pswitch_4b
        :pswitch_41
        :pswitch_37
        :pswitch_29
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lp71;->t:B

    packed-switch v0, :pswitch_data_206

    check-cast p1, Ll99;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lj3g;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_49
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7c
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9e
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_af
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c0
    check-cast p1, Ll99;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_d1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_f3
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_104
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_115
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_126
    check-cast p1, Lz1h;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_138
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_149
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_15a
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16b
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_17c
    check-cast p1, Lyuk;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_18d
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_19e
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1af
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_1c1
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1d2
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1e3
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1f4
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lp71;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lp71;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lp71;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_206
    .packed-switch 0x0
        :pswitch_1f4
        :pswitch_1e3
        :pswitch_1d2
        :pswitch_1c1
        :pswitch_1af
        :pswitch_19e
        :pswitch_18d
        :pswitch_17c
        :pswitch_16b
        :pswitch_15a
        :pswitch_149
        :pswitch_138
        :pswitch_126
        :pswitch_115
        :pswitch_104
        :pswitch_f3
        :pswitch_e2
        :pswitch_d1
        :pswitch_c0
        :pswitch_af
        :pswitch_9e
        :pswitch_8d
        :pswitch_7c
        :pswitch_6b
        :pswitch_5a
        :pswitch_49
        :pswitch_38
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 35

    move-object/from16 v6, p0

    iget-byte v0, v6, Lp71;->t:B

    const/high16 v7, 0x3f800000    # 1.0f

    const/16 v2, 0x11

    const/4 v3, 0x4

    const/4 v4, 0x0

    const/4 v5, 0x3

    const-string v8, "call to \'resume\' before \'invoke\' with coroutine"

    iget-object v9, v6, Lp71;->w:Ljava/lang/Object;

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    packed-switch v0, :pswitch_data_ae4

    check-cast v9, Lmvm;

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_33

    if-eq v2, v11, :cond_2d

    if-ne v2, v10, :cond_29

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_8a

    :cond_29
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_8c

    :cond_2d
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto :goto_63

    :cond_33
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v9, Lmvm;->g:La2e;

    iput-object v0, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v11, v6, Lp71;->u:B

    move-object v15, v2

    check-cast v15, Lw5e;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lt1e;->n:Lh58;

    new-instance v3, Ld82;

    invoke-direct {v3, v2, v11}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v13, Ls2e;

    const/16 v19, 0x0

    const/16 v20, 0x4

    const/4 v14, 0x1

    const-class v16, Lw5e;

    const-string v17, "isMissionSupported"

    const-string v18, "isMissionSupported(Lcom/opera/momi/clientsdk/Mission$Type;)Z"

    invoke-direct/range {v13 .. v20}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v3, v13}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v2

    invoke-static {v2}, Ly1j;->h(Lkotlin/sequences/Sequence;)Ljava/util/Set;

    move-result-object v2

    if-eq v2, v1, :cond_88

    :goto_63
    check-cast v2, Ljava/util/Set;

    iget-object v3, v9, Lmvm;->d:Lmg6;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lte6;

    const/16 v5, 0x9

    invoke-direct {v4, v3, v5}, Lte6;-><init>(Lmg6;B)V

    invoke-virtual {v3, v4}, Lmg6;->b(Lkotlin/jvm/functions/Function1;)Lxd6;

    move-result-object v3

    invoke-static {v3}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v3

    new-instance v4, Lya9;

    invoke-direct {v4, v3, v9, v2, v10}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v12, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v10, v6, Lp71;->u:B

    invoke-static {v0, v4, v6}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_8a

    :cond_88
    move-object v12, v1

    goto :goto_8c

    :cond_8a
    :goto_8a
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_8c
    return-object v12

    :pswitch_8d
    invoke-direct/range {p0 .. p1}, Lp71;->w(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_92
    invoke-direct/range {p0 .. p1}, Lp71;->v(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_97
    invoke-direct/range {p0 .. p1}, Lp71;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_9c
    invoke-direct/range {p0 .. p1}, Lp71;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_a1
    invoke-direct/range {p0 .. p1}, Lp71;->s(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_a6
    invoke-direct/range {p0 .. p1}, Lp71;->r(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_ab
    invoke-direct/range {p0 .. p1}, Lp71;->q(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_b0
    invoke-direct/range {p0 .. p1}, Lp71;->p(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_b5
    invoke-direct/range {p0 .. p1}, Lp71;->o(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_ba
    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lghf;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_e0

    if-eq v2, v11, :cond_d6

    if-ne v2, v10, :cond_d2

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    goto :goto_124

    :cond_d2
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_129

    :cond_d6
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    goto :goto_fb

    :cond_e0
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v0, v0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v9, Lkvh;

    invoke-virtual {v0, v9}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    iput-byte v11, v6, Lp71;->u:B

    invoke-static {v0, v6}, Lvtp;->p(Lokhttp3/internal/connection/RealCall;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_122

    :goto_fb
    new-instance v2, Lu4h;

    const/16 v3, 0xe

    invoke-direct {v2, v3}, Lu4h;-><init>(B)V

    iput-byte v10, v6, Lp71;->u:B

    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    if-nez v3, :cond_11b

    :try_start_10a
    invoke-virtual {v2, v0}, Lu4h;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_10e
    .catch Ljava/util/concurrent/CancellationException; {:try_start_10a .. :try_end_10e} :catch_119
    .catchall {:try_start_10a .. :try_end_10e} :catchall_10f

    goto :goto_120

    :catchall_10f
    move-exception v0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    goto :goto_120

    :catch_119
    move-exception v0

    throw v0

    :cond_11b
    new-instance v0, Lq0i;

    invoke-direct {v0, v3}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_120
    if-ne v0, v1, :cond_124

    :cond_122
    move-object v12, v1

    goto :goto_129

    :cond_124
    :goto_124
    new-instance v12, Lt0i;

    invoke-direct {v12, v0}, Lt0i;-><init>(Ljava/lang/Object;)V

    :goto_129
    return-object v12

    :pswitch_12a
    check-cast v9, Lb3h;

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Ll99;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v3, v6, Lp71;->u:B

    if-eqz v3, :cond_148

    if-eq v3, v11, :cond_142

    if-ne v3, v10, :cond_13e

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_19b

    :cond_13e
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_19d

    :cond_142
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v3, p1

    goto :goto_17a

    :cond_148
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v3, v9, Lb3h;->c:Li2h;

    iput-object v0, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v11, v6, Lp71;->u:B

    move-object v15, v3

    check-cast v15, Ll8e;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lc2h;->i:Lh58;

    new-instance v4, Ld82;

    invoke-direct {v4, v3, v11}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v13, Ls2e;

    const/16 v19, 0x0

    const/16 v20, 0x5

    const/4 v14, 0x1

    const-class v16, Ll8e;

    const-string v17, "isProductTypeSupported"

    const-string v18, "isProductTypeSupported(Lcom/opera/momi/clientsdk/Product$Type;)Z"

    invoke-direct/range {v13 .. v20}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v4, v13}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v3

    invoke-static {v3}, Ly1j;->h(Lkotlin/sequences/Sequence;)Ljava/util/Set;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    if-eq v3, v1, :cond_199

    :goto_17a
    check-cast v3, Ljava/util/Set;

    iget-object v4, v9, Lb3h;->b:Lmg6;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lte6;

    invoke-direct {v7, v4, v5}, Lte6;-><init>(Lmg6;B)V

    invoke-virtual {v4, v7}, Lmg6;->b(Lkotlin/jvm/functions/Function1;)Lxd6;

    move-result-object v4

    new-instance v5, Lcw;

    invoke-direct {v5, v4, v3, v2}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v12, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v10, v6, Lp71;->u:B

    invoke-static {v0, v5, v6}, Lj14;->F(Ll99;Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_19b

    :cond_199
    move-object v12, v1

    goto :goto_19d

    :cond_19b
    :goto_19b
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_19d
    return-object v12

    :pswitch_19e
    check-cast v9, Lqfb;

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lece;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    const/4 v7, 0x5

    if-eqz v2, :cond_1d9

    if-eq v2, v11, :cond_1d3

    if-eq v2, v10, :cond_1cd

    if-eq v2, v5, :cond_1c7

    if-eq v2, v3, :cond_1c1

    if-ne v2, v7, :cond_1bc

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto/16 :goto_222

    :cond_1bc
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_225

    :cond_1c1
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto :goto_216

    :cond_1c7
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto :goto_202

    :cond_1cd
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto :goto_1f8

    :cond_1d3
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto :goto_1e6

    :cond_1d9
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lece;->d:Lyin;

    iput-byte v11, v6, Lp71;->u:B

    iget-object v2, v2, Lyin;->a:Lnle;

    iget-object v2, v2, Lnle;->b:Ljava/lang/String;

    if-eq v2, v1, :cond_220

    :goto_1e6
    check-cast v2, Ljava/lang/String;

    const-string v8, "wss://"

    invoke-static {v2, v8, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_206

    iput-byte v10, v6, Lp71;->u:B

    invoke-virtual {v0, v2, v6}, Lece;->e(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_220

    :goto_1f8
    check-cast v0, Ldwn;

    iput-byte v5, v6, Lp71;->u:B

    invoke-virtual {v0, v9, v6}, Ldwn;->f(Lqfb;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_220

    :goto_202
    move-object v12, v0

    check-cast v12, Ljava/lang/String;

    goto :goto_225

    :cond_206
    const-string v5, "ws://"

    invoke-static {v2, v5, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_226

    iput-byte v3, v6, Lp71;->u:B

    invoke-virtual {v0, v2, v6}, Lece;->d(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_220

    :goto_216
    check-cast v0, Lfra;

    iput-byte v7, v6, Lp71;->u:B

    invoke-virtual {v0, v9, v6}, Lfra;->a(Lqfb;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_222

    :cond_220
    move-object v12, v1

    goto :goto_225

    :cond_222
    :goto_222
    move-object v12, v0

    check-cast v12, Ljava/lang/String;

    :goto_225
    return-object v12

    :cond_226
    new-instance v0, Lhth;

    const-string v1, "Refusing to use insecure remote node endpoint, wss:// is required"

    invoke-direct {v0, v1, v12}, Lhth;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_22e
    move-object v1, v9

    check-cast v1, Lsae;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_252

    if-eq v2, v11, :cond_247

    if-ne v2, v10, :cond_243

    iget-object v2, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lnx5;

    :try_start_23f
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_242
    .catchall {:try_start_23f .. :try_end_242} :catchall_29b

    goto :goto_259

    :cond_243
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_29a

    :cond_247
    iget-object v2, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lnx5;

    :try_start_24b
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_24e
    .catchall {:try_start_24b .. :try_end_24e} :catchall_29b

    move-object/from16 v3, p1

    :cond_250
    move-object v8, v2

    goto :goto_270

    :cond_252
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Lnx5;

    :goto_259
    :try_start_259
    invoke-interface {v2}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object v3

    invoke-static {v3}, Lo0g;->c0(Lkotlin/coroutines/CoroutineContext;)Z

    move-result v3

    if-eqz v3, :cond_296

    iget-object v3, v1, Lsae;->g:Lp04;

    iput-object v2, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v11, v6, Lp71;->u:B

    invoke-static {v3, v6}, Lp04;->O(Lp04;Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_250

    goto :goto_292

    :goto_270
    check-cast v3, Loae;

    iget-object v2, v1, Lzm9;->d:Ljava/lang/Object;

    check-cast v2, Ln27;

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-interface {v2, v4}, Ln27;->o0(F)F

    move-result v4

    iget-object v2, v1, Lzm9;->d:Ljava/lang/Object;

    check-cast v2, Ln27;

    invoke-interface {v2, v7}, Ln27;->o0(F)F

    move-result v5

    iget-object v2, v1, Lzm9;->b:Ljava/lang/Object;

    check-cast v2, Lspi;

    iput-object v8, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v10, v6, Lp71;->u:B

    invoke-virtual/range {v1 .. v6}, Lsae;->g(Lspi;Loae;FFLnt5;)Ljava/lang/Object;

    move-result-object v2
    :try_end_290
    .catchall {:try_start_259 .. :try_end_290} :catchall_29b

    if-ne v2, v0, :cond_294

    :goto_292
    move-object v12, v0

    goto :goto_29a

    :cond_294
    move-object v2, v8

    goto :goto_259

    :cond_296
    iput-object v12, v1, Lsae;->h:Ld3k;

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_29a
    return-object v12

    :catchall_29b
    move-exception v0

    iput-object v12, v1, Lsae;->h:Ld3k;

    throw v0

    :pswitch_29f
    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_2b5

    if-eq v1, v11, :cond_2b1

    if-ne v1, v10, :cond_2ad

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2e4

    :cond_2ad
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2e6

    :cond_2b1
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2c6

    :cond_2b5
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Ld3k;

    if-eqz v1, :cond_2c6

    iput-byte v11, v6, Lp71;->u:B

    invoke-virtual {v1, v6}, Lxob;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_2e2

    :cond_2c6
    :goto_2c6
    check-cast v9, Lacd;

    iput-byte v10, v6, Lp71;->u:B

    iget-byte v1, v9, Lacd;->o:B

    if-gtz v1, :cond_2d1

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_2e0

    :cond_2d1
    new-instance v1, Lagb;

    invoke-direct {v1, v3, v12, v9}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object v2, Lg69;->a:Lg69;

    invoke-static {v2, v1, v6}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_2e0

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_2e0
    :goto_2e0
    if-ne v1, v0, :cond_2e4

    :cond_2e2
    move-object v12, v0

    goto :goto_2e6

    :cond_2e4
    :goto_2e4
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2e6
    return-object v12

    :pswitch_2e7
    check-cast v9, Llxa;

    iget-object v0, v9, Llxa;->d:Lqie;

    iget-object v2, v9, Llxa;->c:Landroid/content/Context;

    iget-object v3, v9, Llxa;->t:Ldya;

    iget-object v7, v9, Llxa;->r:Lluf;

    sget-object v13, Lpx5;->a:Lpx5;

    iget-byte v14, v6, Lp71;->u:B

    if-eqz v14, :cond_317

    if-eq v14, v11, :cond_310

    if-eq v14, v10, :cond_30b

    if-ne v14, v5, :cond_306

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Landroid/content/Intent;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_4ad

    :cond_306
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_4b7

    :cond_30b
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_447

    :cond_310
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto/16 :goto_3a4

    :cond_317
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v8, v9, Llxa;->l:Lnak;

    sget-object v14, Lcxa;->c:Lcxa;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8, v12, v14}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v8

    invoke-virtual {v3, v8, v4}, Ldya;->writeToParcel(Landroid/os/Parcel;I)V

    invoke-virtual {v8, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    new-instance v14, Ldya;

    invoke-direct {v14, v8}, Ldya;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {v8}, Landroid/os/Parcel;->recycle()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iget-object v15, v14, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_345
    :goto_345
    if-ge v5, v4, :cond_36c

    invoke-virtual {v15, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v5, v5, 0x1

    move-object v1, v10

    check-cast v1, Lfya;

    instance-of v12, v1, Loel;

    if-eqz v12, :cond_345

    check-cast v1, Loel;

    iget-object v12, v1, Loel;->k:Landroid/graphics/PointF;

    if-eqz v12, :cond_345

    invoke-virtual {v1}, Lba3;->f()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_368

    iget-boolean v1, v1, Loel;->l:Z

    if-eqz v1, :cond_345

    :cond_368
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_345

    :cond_36c
    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_374
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_384

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfya;

    invoke-virtual {v14, v4}, Ldya;->c(Lfya;)V

    goto :goto_374

    :cond_384
    iput-byte v11, v6, Lp71;->u:B

    new-instance v1, Lxbf;

    new-instance v4, Lbm8;

    const/16 v5, 0x15

    invoke-direct {v4, v9, v5}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v14, v2, v0, v4}, Lxbf;-><init>(Ldya;Landroid/content/Context;Lqie;Lbm8;)V

    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    sget-object v0, Lbb7;->a:Lcv6;

    new-instance v4, Lfg6;

    const/16 v5, 0x1a

    const/4 v8, 0x0

    invoke-direct {v4, v1, v9, v8, v5}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v4, v6}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v13, :cond_4ab

    :goto_3a4
    check-cast v0, Landroid/graphics/Bitmap;

    if-nez v0, :cond_3ac

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_4b7

    :cond_3ac
    sget-object v1, Ltza;->h:Landroid/graphics/Bitmap$CompressFormat;

    new-instance v1, Lnza;

    invoke-direct {v1, v0}, Lnza;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v21, Ltza;

    sget-object v24, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    sget-object v0, Lnb6;->j:Lqie;

    if-eqz v0, :cond_3be

    move-object/from16 v22, v0

    goto :goto_3c0

    :cond_3be
    const/16 v22, 0x0

    :goto_3c0
    const/16 v26, 0x64

    sget-object v27, Ln08;->a:Ln08;

    const/16 v25, 0x0

    move-object/from16 v23, v1

    invoke-direct/range {v21 .. v27}, Ltza;-><init>(Lqie;Lnza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/Map;)V

    iget-object v0, v7, Lluf;->a:Landroid/graphics/Bitmap$CompressFormat;

    iget v1, v7, Lluf;->b:I

    const/16 v26, 0x9f

    const/16 v22, 0x0

    move-object/from16 v23, v0

    move/from16 v24, v1

    invoke-static/range {v21 .. v26}, Ltza;->b(Ltza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/LinkedHashMap;I)Ltza;

    move-result-object v0

    iget-object v1, v7, Lluf;->d:Ljava/lang/String;

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_401

    iget-object v1, v7, Lluf;->d:Ljava/lang/String;

    iget-object v4, v0, Ltza;->f:Ljava/util/Map;

    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5, v4}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    const-string v4, "ImageDescription"

    invoke-interface {v5, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v32, 0x7f

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v27, v0

    move-object/from16 v31, v5

    invoke-static/range {v27 .. v32}, Ltza;->b(Ltza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/LinkedHashMap;I)Ltza;

    move-result-object v0

    :cond_401
    iget-object v1, v7, Lluf;->e:Ljava/lang/String;

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_42a

    iget-object v1, v7, Lluf;->e:Ljava/lang/String;

    iget-object v4, v0, Ltza;->f:Ljava/util/Map;

    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5, v4}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    const-string v4, "UserComment"

    invoke-interface {v5, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v24, 0x7f

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v19, v0

    move-object/from16 v23, v5

    invoke-static/range {v19 .. v24}, Ltza;->b(Ltza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/LinkedHashMap;I)Ltza;

    move-result-object v0

    move-object/from16 v20, v0

    goto :goto_42e

    :cond_42a
    move-object/from16 v19, v0

    move-object/from16 v20, v19

    :goto_42e
    iget-object v0, v9, Llxa;->q:Landroid/net/Uri;

    const/16 v24, 0x0

    const/16 v25, 0xfb

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v21, v0

    invoke-static/range {v20 .. v25}, Ltza;->b(Ltza;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;ILjava/util/LinkedHashMap;I)Ltza;

    move-result-object v0

    const/4 v1, 0x2

    iput-byte v1, v6, Lp71;->u:B

    invoke-virtual {v0, v2, v6}, Ltza;->a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v13, :cond_4ab

    :goto_447
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, v6, Lp71;->v:Ljava/lang/Object;

    const/4 v1, 0x3

    iput-byte v1, v6, Lp71;->u:B

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v17, Lbxa;

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v17 .. v22}, Lbxa;-><init>(ZZZZZ)V

    move-object/from16 v1, v17

    iget-object v2, v3, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :cond_46c
    :goto_46c
    if-ge v4, v3, :cond_49b

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lfya;

    if-eqz v5, :cond_46c

    instance-of v6, v5, Lf76;

    if-eqz v6, :cond_47f

    iput-boolean v11, v1, Lbxa;->e:Z

    goto :goto_46c

    :cond_47f
    instance-of v6, v5, Lok3;

    if-eqz v6, :cond_486

    iput-boolean v11, v1, Lbxa;->a:Z

    goto :goto_46c

    :cond_486
    instance-of v6, v5, Lbb5;

    if-eqz v6, :cond_48d

    iput-boolean v11, v1, Lbxa;->b:Z

    goto :goto_46c

    :cond_48d
    instance-of v6, v5, Lox7;

    if-eqz v6, :cond_494

    iput-boolean v11, v1, Lbxa;->c:Z

    goto :goto_46c

    :cond_494
    instance-of v5, v5, Loel;

    if-eqz v5, :cond_46c

    iput-boolean v11, v1, Lbxa;->d:Z

    goto :goto_46c

    :cond_49b
    const-string v2, "image-editor-stats"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "image-editor-output"

    iget-object v2, v9, Llxa;->q:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    if-ne v1, v13, :cond_4ad

    :cond_4ab
    move-object v12, v13

    goto :goto_4b7

    :cond_4ad
    :goto_4ad
    new-instance v1, Lexa;

    invoke-direct {v1, v0}, Lexa;-><init>(Landroid/content/Intent;)V

    invoke-virtual {v9, v1}, Lx7n;->f(Ljava/lang/Object;)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4b7
    return-object v12

    :pswitch_4b8
    check-cast v9, Lpca;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_4e5

    if-eq v1, v11, :cond_4e1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_4d7

    const/4 v2, 0x3

    if-ne v1, v2, :cond_4d2

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    goto :goto_510

    :cond_4d2
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_512

    :cond_4d7
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_501

    :cond_4e1
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4f4

    :cond_4e5
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Lunb;

    iput-byte v11, v6, Lp71;->u:B

    invoke-interface {v1, v6}, Lunb;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_50e

    :goto_4f4
    iget-object v1, v9, Lpca;->d:Lt3e;

    const/4 v2, 0x2

    iput-byte v2, v6, Lp71;->u:B

    check-cast v1, Lh5e;

    invoke-virtual {v1, v6}, Lh5e;->D(Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_50e

    :goto_501
    iget-object v1, v9, Lpca;->d:Lt3e;

    const/4 v2, 0x3

    iput-byte v2, v6, Lp71;->u:B

    check-cast v1, Lh5e;

    invoke-virtual {v1, v6}, Lh5e;->w(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_510

    :cond_50e
    move-object v12, v0

    goto :goto_512

    :cond_510
    :goto_510
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_512
    return-object v12

    :pswitch_513
    check-cast v9, Lekc;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v0, v6, Lp71;->u:B

    if-eqz v0, :cond_547

    if-eq v0, v11, :cond_53e

    const/4 v2, 0x2

    if-eq v0, v2, :cond_530

    const/4 v2, 0x3

    if-eq v0, v2, :cond_528

    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_599

    :cond_528
    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_59a

    :cond_530
    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lf7f;

    :try_start_535
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lpxb;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
    :try_end_53e
    .catchall {:try_start_535 .. :try_end_53e} :catchall_576

    :cond_53e
    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lf7f;

    :try_start_543
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_546
    .catchall {:try_start_543 .. :try_end_546} :catchall_576

    goto :goto_56d

    :cond_547
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lz1h;

    new-instance v2, Lks6;

    const/16 v3, 0xd

    invoke-direct {v2, v0, v3}, Lks6;-><init>(Ljava/lang/Object;B)V

    :try_start_555
    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Ls6d;->a:Ld7a;

    iget-object v0, v0, Ld7a;->e:Ld7a;

    new-instance v3, Lvr;

    const/16 v4, 0x1d

    const/4 v8, 0x0

    invoke-direct {v3, v9, v2, v8, v4}, Lvr;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v2, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v11, v6, Lp71;->u:B

    invoke-static {v0, v3, v6}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v1, :cond_598

    :goto_56d
    iput-object v2, v6, Lp71;->v:Ljava/lang/Object;

    const/4 v0, 0x2

    iput-byte v0, v6, Lp71;->u:B

    invoke-static {v6}, Lnb6;->f(Lnt5;)V
    :try_end_575
    .catchall {:try_start_555 .. :try_end_575} :catchall_576

    goto :goto_598

    :catchall_576
    move-exception v0

    sget-object v3, Lbb7;->a:Lcv6;

    sget-object v3, Ls6d;->a:Ld7a;

    iget-object v3, v3, Ld7a;->e:Ld7a;

    sget-object v4, Ldze;->b:Ldze;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, v4}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v3

    new-instance v4, Lfb9;

    const/4 v5, 0x0

    const/4 v8, 0x0

    invoke-direct {v4, v9, v2, v8, v5}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v0, v6, Lp71;->v:Ljava/lang/Object;

    const/4 v2, 0x3

    iput-byte v2, v6, Lp71;->u:B

    invoke-static {v3, v4, v6}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_59a

    :cond_598
    :goto_598
    move-object v12, v1

    :goto_599
    return-object v12

    :cond_59a
    :goto_59a
    throw v0

    :pswitch_59b
    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_5b3

    if-eq v1, v11, :cond_5af

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5aa

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5dc

    :cond_5aa
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_5de

    :cond_5af
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5c4

    :cond_5b3
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v1, Ln9a;->c:Ln9a;

    iget-object v2, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iput-byte v11, v6, Lp71;->u:B

    invoke-virtual {v1, v2, v6}, Ln9a;->v(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_5da

    :goto_5c4
    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Ls6d;->a:Ld7a;

    new-instance v2, Lsy7;

    check-cast v9, Landroidx/emoji2/emojipicker/EmojiPickerView;

    const/4 v5, 0x0

    const/4 v8, 0x0

    invoke-direct {v2, v9, v8, v5}, Lsy7;-><init>(Landroidx/emoji2/emojipicker/EmojiPickerView;Lmt5;B)V

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-static {v1, v2, v6}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_5dc

    :cond_5da
    move-object v12, v0

    goto :goto_5de

    :cond_5dc
    :goto_5dc
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5de
    return-object v12

    :pswitch_5df
    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lx47;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_5fc

    if-eq v2, v11, :cond_5f7

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5f2

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_623

    :cond_5f2
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_625

    :cond_5f7
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    :cond_5fa
    const/4 v2, 0x2

    goto :goto_619

    :cond_5fc
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lx47;->d:Lur1;

    check-cast v9, Lby5;

    iget-object v3, v9, Lby5;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_60d

    move-object v12, v3

    goto :goto_60e

    :cond_60d
    const/4 v12, 0x0

    :goto_60e
    iput-byte v11, v6, Lp71;->u:B

    check-cast v2, Les1;

    invoke-virtual {v2, v12, v6}, Les1;->c(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_5fa

    goto :goto_621

    :goto_619
    iput-byte v2, v6, Lp71;->u:B

    invoke-virtual {v0, v6}, Lx47;->f(Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_623

    :goto_621
    move-object v12, v1

    goto :goto_625

    :cond_623
    :goto_623
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_625
    return-object v12

    :pswitch_626
    check-cast v9, Lx47;

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lnx5;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_64d

    if-eq v2, v11, :cond_643

    const/4 v3, 0x2

    if-ne v2, v3, :cond_63d

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto :goto_698

    :cond_63d
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto/16 :goto_6f6

    :cond_643
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    check-cast v2, Lt0i;

    iget-object v2, v2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_65e

    :cond_64d
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v9, Lx47;->h:Lt3e;

    iput-object v0, v6, Lp71;->v:Ljava/lang/Object;

    iput-byte v11, v6, Lp71;->u:B

    check-cast v2, Lh5e;

    invoke-virtual {v2, v6}, Lh5e;->v(Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_696

    :goto_65e
    invoke-static {v0}, Lsgb;->w(Lnx5;)V

    invoke-static {v2}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_683

    iget-object v3, v9, Lx47;->l:Lnak;

    :cond_669
    invoke-virtual {v3}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lfum;

    const-string v1, "Failed to load items"

    invoke-static {v1}, Lynh;->j(Ljava/lang/String;)Lwdk;

    move-result-object v1

    invoke-static {v1, v2}, Lhn9;->v(Lsdk;Ljava/lang/Throwable;)Ldum;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_669

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_6f6

    :cond_683
    iget-object v2, v9, Lx47;->h:Lt3e;

    check-cast v2, Lh5e;

    invoke-virtual {v2}, Lh5e;->c()Lo47;

    move-result-object v2

    iput-object v0, v6, Lp71;->v:Ljava/lang/Object;

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-static {v2, v6}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_698

    :cond_696
    move-object v12, v1

    goto :goto_6f6

    :cond_698
    :goto_698
    move-object v1, v2

    check-cast v1, Ljava/util/List;

    invoke-static {v0}, Lsgb;->w(Lnx5;)V

    iget-object v0, v9, Lx47;->l:Lnak;

    :cond_6a0
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lfum;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v4, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_6bd
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6cf

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb2h;

    iget-object v6, v6, Lb2h;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6bd

    :cond_6cf
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Loaded "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " items: "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lynh;->j(Ljava/lang/String;)Lwdk;

    move-result-object v3

    new-instance v4, Leum;

    invoke-direct {v4, v3}, Leum;-><init>(Lwdk;)V

    invoke-virtual {v0, v2, v4}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6a0

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_6f6
    return-object v12

    :pswitch_6f7
    check-cast v9, Lh47;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_718

    if-eq v1, v11, :cond_714

    const/4 v4, 0x2

    if-eq v1, v4, :cond_70f

    const/4 v2, 0x3

    if-eq v1, v2, :cond_70f

    if-eq v1, v3, :cond_70f

    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    :goto_70c
    const/4 v12, 0x0

    goto/16 :goto_7bc

    :cond_70f
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_7ba

    :cond_714
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_725

    :cond_718
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-byte v11, v6, Lp71;->u:B

    const-wide/16 v4, 0x1388

    invoke-static {v4, v5, v6}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_7b8

    :goto_725
    iget-object v1, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Lg47;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string v4, "momi://ui"

    const-string v5, "1"

    if-eqz v1, :cond_7a4

    if-eq v1, v11, :cond_778

    const/4 v7, 0x2

    if-eq v1, v7, :cond_766

    const/4 v4, 0x3

    if-ne v1, v4, :cond_762

    iget-object v0, v9, Lh47;->c:Lt3e;

    new-instance v1, Llrl;

    const-string v3, "This is a test toast notification"

    invoke-static {v3}, Lynh;->j(Ljava/lang/String;)Lwdk;

    move-result-object v3

    new-instance v4, Lki5;

    invoke-direct {v4, v2}, Lki5;-><init>(B)V

    invoke-direct {v1, v3, v4, v7}, Llrl;-><init>(Lsdk;Lki5;I)V

    check-cast v0, Lh5e;

    iget-object v0, v0, Lh5e;->m:Ljrl;

    check-cast v0, Lkrl;

    iget-object v2, v0, Lkrl;->a:Lnx5;

    new-instance v3, Lr8h;

    const/16 v5, 0x1a

    const/4 v8, 0x0

    invoke-direct {v3, v0, v1, v8, v5}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v1, 0x3

    invoke-static {v2, v8, v8, v3, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_7ba

    :cond_762
    invoke-static {}, Lh9o;->p()V

    goto :goto_70c

    :cond_766
    iget-object v1, v9, Lh47;->b:Ly5e;

    new-instance v2, Ll0f;

    const-string v4, "+40"

    invoke-direct {v2, v5, v4}, Ll0f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-byte v3, v6, Lp71;->u:B

    invoke-virtual {v1, v2, v6}, Ly5e;->a(Lj14;Lnt5;)Ljava/lang/Enum;

    move-result-object v1

    if-ne v1, v0, :cond_7ba

    goto :goto_7b8

    :cond_778
    iget-object v1, v9, Lh47;->b:Ly5e;

    new-instance v7, Ln0f;

    new-instance v14, Lm0f;

    const-string v2, "Got it"

    const/4 v8, 0x0

    invoke-direct {v14, v2, v8}, Lm0f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v15, Lm0f;

    const-string v2, "Go to rewards"

    invoke-direct {v15, v2, v4}, Lm0f;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v16, 0x1

    const-string v8, "1"

    const-string v9, "You earned points!"

    const-string v10, "You just earned points for setting a custom wallpaper! Great job!"

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-string v13, "You earned: <coin><b>15</b>"

    invoke-direct/range {v7 .. v16}, Ln0f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lm0f;Lm0f;Z)V

    const/4 v2, 0x3

    iput-byte v2, v6, Lp71;->u:B

    invoke-virtual {v1, v7, v6}, Ly5e;->a(Lj14;Lnt5;)Ljava/lang/Enum;

    move-result-object v1

    if-ne v1, v0, :cond_7ba

    goto :goto_7b8

    :cond_7a4
    iget-object v1, v9, Lh47;->b:Ly5e;

    new-instance v2, Lp0f;

    const-string v3, "Keep your streak alive"

    const-string v7, "Check in now and stay on track"

    invoke-direct {v2, v5, v3, v7, v4}, Lp0f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-virtual {v1, v2, v6}, Ly5e;->a(Lj14;Lnt5;)Ljava/lang/Enum;

    move-result-object v1

    if-ne v1, v0, :cond_7ba

    :cond_7b8
    :goto_7b8
    move-object v12, v0

    goto :goto_7bc

    :cond_7ba
    :goto_7ba
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_7bc
    return-object v12

    :pswitch_7bd
    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lggb;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_7d9

    if-eq v2, v11, :cond_7d5

    const/4 v3, 0x2

    if-ne v2, v3, :cond_7d0

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7f5

    :cond_7d0
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_7f7

    :cond_7d5
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7e6

    :cond_7d9
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lggb;->l:Lrr1;

    iput-byte v11, v6, Lp71;->u:B

    invoke-virtual {v2, v6}, Lrr1;->I0(Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_7f3

    :goto_7e6
    iget-object v0, v0, Lggb;->l:Lrr1;

    check-cast v9, Ljava/lang/String;

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-virtual {v0, v9, v6}, Lrr1;->W0(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_7f5

    :cond_7f3
    move-object v12, v1

    goto :goto_7f7

    :cond_7f5
    :goto_7f5
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_7f7
    return-object v12

    :pswitch_7f8
    check-cast v9, Lmg6;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_816

    if-eq v1, v11, :cond_810

    const/4 v3, 0x2

    if-ne v1, v3, :cond_80b

    iget-object v12, v6, Lp71;->v:Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_83c

    :cond_80b
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_83c

    :cond_810
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    goto :goto_823

    :cond_816
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v9, Lmg6;->e:Lpv;

    iput-byte v11, v6, Lp71;->u:B

    invoke-virtual {v1, v6}, Lpv;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_839

    :goto_823
    move-object v2, v1

    check-cast v2, Lggb;

    iput-object v1, v6, Lp71;->v:Ljava/lang/Object;

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    iget-object v3, v2, Lggb;->j:Lrr1;

    new-instance v4, Lt3;

    const/4 v8, 0x0

    invoke-direct {v4, v9, v2, v8}, Lt3;-><init>(Lmg6;Lggb;Lmt5;)V

    invoke-static {v3, v4, v6}, Lupj;->B(Lwuk;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_83b

    :cond_839
    move-object v12, v0

    goto :goto_83c

    :cond_83b
    move-object v12, v1

    :goto_83c
    return-object v12

    :pswitch_83d
    check-cast v9, Ldvd;

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lie6;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    const/16 v25, 0x0

    if-eqz v2, :cond_865

    if-eq v2, v11, :cond_85e

    const/4 v3, 0x2

    if-eq v2, v3, :cond_85a

    const/4 v4, 0x3

    if-eq v2, v4, :cond_85e

    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    :goto_856
    const/16 v20, 0x0

    goto/16 :goto_8e3

    :cond_85a
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_8be

    :cond_85e
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v20, p1

    goto/16 :goto_8e3

    :cond_865
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lie6;->h:Lje6;

    invoke-virtual {v2}, Lje6;->b()Lfak;

    move-result-object v2

    instance-of v3, v2, Ljb6;

    if-eqz v3, :cond_892

    iget-object v2, v9, Ldvd;->a:Lkotlin/jvm/functions/Function2;

    iget-object v3, v9, Ldvd;->d:Lkotlin/coroutines/CoroutineContext;

    iput-byte v11, v6, Lp71;->u:B

    invoke-virtual {v0}, Lie6;->c()Lylj;

    move-result-object v4

    new-instance v21, Ldj2;

    const/16 v26, 0x3

    move-object/from16 v22, v0

    move-object/from16 v24, v2

    move-object/from16 v23, v3

    invoke-direct/range {v21 .. v26}, Ldj2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0, v6}, Lylj;->b(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_8e1

    goto :goto_8de

    :cond_892
    instance-of v3, v2, Lokh;

    if-nez v3, :cond_8b1

    instance-of v3, v2, Lvjm;

    if-nez v3, :cond_8b1

    instance-of v0, v2, Lw39;

    if-nez v0, :cond_8ac

    instance-of v0, v2, Llye;

    if-eqz v0, :cond_8a8

    const-string v0, "This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_856

    :cond_8a8
    invoke-static {}, Lh9o;->p()V

    goto :goto_856

    :cond_8ac
    check-cast v2, Lw39;

    iget-object v0, v2, Lw39;->b:Ljava/lang/Throwable;

    throw v0

    :cond_8b1
    iget-object v3, v9, Ldvd;->c:Lfak;

    if-ne v2, v3, :cond_8e4

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-virtual {v0, v6}, Lie6;->f(Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_8de

    :goto_8be
    iget-object v2, v9, Ldvd;->a:Lkotlin/jvm/functions/Function2;

    iget-object v3, v9, Ldvd;->d:Lkotlin/coroutines/CoroutineContext;

    const/4 v4, 0x3

    iput-byte v4, v6, Lp71;->u:B

    invoke-virtual {v0}, Lie6;->c()Lylj;

    move-result-object v4

    new-instance v21, Ldj2;

    const/16 v26, 0x3

    move-object/from16 v22, v0

    move-object/from16 v24, v2

    move-object/from16 v23, v3

    invoke-direct/range {v21 .. v26}, Ldj2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0, v6}, Lylj;->b(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_8e1

    :cond_8de
    :goto_8de
    move-object/from16 v20, v1

    goto :goto_8e3

    :cond_8e1
    move-object/from16 v20, v0

    :goto_8e3
    return-object v20

    :cond_8e4
    check-cast v2, Lokh;

    iget-object v0, v2, Lokh;->b:Ljava/lang/Throwable;

    throw v0

    :pswitch_8e9
    check-cast v9, Lp46;

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    const/4 v2, 0x0

    const-wide/16 v4, 0x1f4

    if-eqz v1, :cond_918

    if-eq v1, v11, :cond_914

    const/4 v10, 0x2

    if-eq v1, v10, :cond_90b

    const/4 v10, 0x3

    if-eq v1, v10, :cond_907

    if-ne v1, v3, :cond_902

    :try_start_8fe
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_901
    .catchall {:try_start_8fe .. :try_end_901} :catchall_95f

    goto :goto_958

    :cond_902
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v12, 0x0

    goto :goto_957

    :cond_907
    :try_start_907
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_949

    :cond_90b
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lpxb;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
    :try_end_914
    .catchall {:try_start_907 .. :try_end_914} :catchall_95f

    :cond_914
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_931

    :cond_918
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Lunb;

    if-eqz v1, :cond_931

    iput-byte v11, v6, Lp71;->u:B

    const/4 v10, 0x0

    invoke-interface {v1, v10}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    invoke-interface {v1, v6}, Lunb;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_92f

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_92f
    if-eq v1, v0, :cond_956

    :cond_931
    :goto_931
    :try_start_931
    iget-object v1, v9, Lp46;->c:Lp0g;

    invoke-virtual {v1, v7}, Lp0g;->i(F)V

    iget-boolean v1, v9, Lp46;->a:Z

    if-nez v1, :cond_95d

    const/4 v1, 0x2

    iput-byte v1, v6, Lp71;->u:B

    invoke-static {v6}, Lnb6;->f(Lnt5;)V

    goto :goto_956

    :goto_941
    iput-byte v1, v6, Lp71;->u:B

    invoke-static {v4, v5, v6}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_956

    :goto_949
    iget-object v1, v9, Lp46;->c:Lp0g;

    invoke-virtual {v1, v2}, Lp0g;->i(F)V

    iput-byte v3, v6, Lp71;->u:B

    invoke-static {v4, v5, v6}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_958

    :cond_956
    :goto_956
    move-object v12, v0

    :goto_957
    return-object v12

    :cond_958
    :goto_958
    iget-object v1, v9, Lp46;->c:Lp0g;

    invoke-virtual {v1, v7}, Lp0g;->i(F)V
    :try_end_95d
    .catchall {:try_start_931 .. :try_end_95d} :catchall_95f

    :cond_95d
    const/4 v1, 0x3

    goto :goto_941

    :catchall_95f
    move-exception v0

    iget-object v1, v9, Lp46;->c:Lp0g;

    invoke-virtual {v1, v2}, Lp0g;->i(F)V

    throw v0

    :pswitch_966
    move-object v10, v12

    check-cast v9, Ltj4;

    iget-object v0, v9, Ltj4;->c:Lkwl;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    const/4 v3, 0x6

    if-eqz v2, :cond_98d

    if-eq v2, v11, :cond_988

    const/4 v4, 0x2

    if-eq v2, v4, :cond_983

    const/4 v4, 0x3

    if-ne v2, v4, :cond_97e

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_9bb

    :cond_97e
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    move-object v12, v10

    goto :goto_9bd

    :cond_983
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    const/4 v4, 0x2

    goto :goto_9ac

    :cond_988
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    :cond_98b
    const/4 v5, 0x0

    goto :goto_99f

    :cond_98d
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    iput-byte v11, v6, Lp71;->u:B

    invoke-static {v2, v6}, Lcs5;->b0(Ljava/util/Collection;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_98b

    goto :goto_9b9

    :goto_99f
    invoke-static {v0, v5, v3}, Lkwl;->d(Lkwl;II)Lcd5;

    move-result-object v2

    const/4 v4, 0x2

    iput-byte v4, v6, Lp71;->u:B

    invoke-virtual {v2, v6}, Lxob;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_9b9

    :goto_9ac
    invoke-static {v0, v4, v3}, Lkwl;->d(Lkwl;II)Lcd5;

    move-result-object v0

    const/4 v2, 0x3

    iput-byte v2, v6, Lp71;->u:B

    invoke-virtual {v0, v6}, Lxob;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_9bb

    :cond_9b9
    :goto_9b9
    move-object v12, v1

    goto :goto_9bd

    :cond_9bb
    :goto_9bb
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9bd
    return-object v12

    :pswitch_9be
    move-object v10, v12

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_9d9

    if-eq v1, v11, :cond_9d3

    const/4 v3, 0x2

    if-ne v1, v3, :cond_9ce

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a29

    :cond_9ce
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    :goto_9d1
    move-object v12, v10

    goto :goto_a32

    :cond_9d3
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    goto :goto_9fd

    :cond_9d9
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v1, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Lfr6;

    invoke-virtual {v1}, Lfr6;->T()Ltna;

    move-result-object v1

    const-class v2, Lan6;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    :try_start_9ea
    invoke-static {v2}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v8
    :try_end_9ee
    .catchall {:try_start_9ea .. :try_end_9ee} :catchall_9ef

    goto :goto_9f0

    :catchall_9ef
    move-object v8, v10

    :goto_9f0
    new-instance v2, Lx9m;

    invoke-direct {v2, v3, v8}, Lx9m;-><init>(Litb;Lcam;)V

    iput-byte v11, v6, Lp71;->u:B

    invoke-virtual {v1, v2, v6}, Ltna;->b(Lx9m;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_a27

    :goto_9fd
    if-eqz v1, :cond_a2c

    check-cast v1, Lan6;

    new-instance v2, Lcd5;

    invoke-direct {v2}, Lcd5;-><init>()V

    check-cast v9, Lbd5;

    check-cast v9, Lcd5;

    invoke-virtual {v9, v1}, Lxob;->j0(Ljava/lang/Object;)Z

    iget-object v1, v1, Lan6;->a:Lqz6;

    invoke-interface {v1}, Luvn;->r()Lc1j;

    move-result-object v1

    new-instance v3, Lv91;

    const/4 v4, 0x3

    invoke-direct {v3, v2, v4}, Lv91;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v1, v3}, Lc1j;->a(Lkotlin/jvm/functions/Function1;)V

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-virtual {v2, v6}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lpx5;->a:Lpx5;

    if-ne v1, v0, :cond_a29

    :cond_a27
    move-object v12, v0

    goto :goto_a32

    :cond_a29
    :goto_a29
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_a32

    :cond_a2c
    const-string v0, "null cannot be cast to non-null type io.ktor.client.plugins.websocket.DefaultClientWebSocketSession"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_9d1

    :goto_a32
    return-object v12

    :pswitch_a33
    move-object v10, v12

    iget-object v0, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/OperaApplication;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, v6, Lp71;->u:B

    if-eqz v2, :cond_a52

    if-eq v2, v11, :cond_a4c

    const/4 v3, 0x2

    if-ne v2, v3, :cond_a47

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a88

    :cond_a47
    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    move-object v12, v10

    goto :goto_a8a

    :cond_a4c
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto :goto_a69

    :cond_a52
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lk3i;

    invoke-virtual {v2}, Lk3i;->a()Likc;

    move-result-object v2

    iput-byte v11, v6, Lp71;->u:B

    invoke-static {v2, v6}, Lxf8;->v(Lekc;Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_a86

    :goto_a69
    sget-object v3, Lm18;->b:Lm18;

    if-ne v2, v3, :cond_a88

    check-cast v9, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v9}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v2

    if-eqz v2, :cond_a88

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->G:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly3i;

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    invoke-interface {v0, v6}, Ly3i;->j(Lp71;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_a88

    :cond_a86
    move-object v12, v1

    goto :goto_a8a

    :cond_a88
    :goto_a88
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_a8a
    return-object v12

    :pswitch_a8b
    move-object v10, v12

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, v6, Lp71;->u:B

    if-eqz v1, :cond_aa7

    if-eq v1, v11, :cond_aa3

    const/4 v3, 0x2

    if-eq v1, v3, :cond_a9c

    invoke-static {v8}, Lqp2;->n(Ljava/lang/String;)V

    :goto_a9a
    move-object v12, v10

    goto :goto_ae3

    :cond_a9c
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lt3p;->v()V

    goto :goto_a9a

    :cond_aa3
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_ac6

    :cond_aa7
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v1, Lk51;

    invoke-direct {v1, v11}, Lk51;-><init>(B)V

    iput-byte v11, v6, Lp71;->u:B

    invoke-interface {v6}, Lmt5;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v2

    invoke-static {v2}, Lzi4;->C(Lkotlin/coroutines/CoroutineContext;)Ld9e;

    move-result-object v2

    new-instance v3, Lkz9;

    invoke-direct {v3, v1, v11}, Lkz9;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {v2, v3, v6}, Ld9e;->t(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_ac6

    :goto_ac4
    move-object v12, v0

    goto :goto_ae3

    :cond_ac6
    :goto_ac6
    iget-object v1, v6, Lp71;->v:Ljava/lang/Object;

    check-cast v1, Lt71;

    invoke-virtual {v1}, Lt71;->i()Lxee;

    move-result-object v1

    if-eqz v1, :cond_ae1

    new-instance v2, Lo71;

    check-cast v9, Lz8b;

    const/4 v5, 0x0

    invoke-direct {v2, v9, v5}, Lo71;-><init>(Ljava/lang/Object;B)V

    const/4 v3, 0x2

    iput-byte v3, v6, Lp71;->u:B

    check-cast v1, Ljdj;

    invoke-static {v1, v2, v6}, Ljdj;->k(Ljdj;Ll99;Lmt5;)V

    goto :goto_ac4

    :cond_ae1
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ae3
    return-object v12

    :pswitch_data_ae4
    .packed-switch 0x0
        :pswitch_a8b
        :pswitch_a33
        :pswitch_9be
        :pswitch_966
        :pswitch_8e9
        :pswitch_83d
        :pswitch_7f8
        :pswitch_7bd
        :pswitch_6f7
        :pswitch_626
        :pswitch_5df
        :pswitch_59b
        :pswitch_513
        :pswitch_4b8
        :pswitch_2e7
        :pswitch_29f
        :pswitch_22e
        :pswitch_19e
        :pswitch_12a
        :pswitch_ba
        :pswitch_b5
        :pswitch_b0
        :pswitch_ab
        :pswitch_a6
        :pswitch_a1
        :pswitch_9c
        :pswitch_97
        :pswitch_92
        :pswitch_8d
    .end packed-switch
.end method
