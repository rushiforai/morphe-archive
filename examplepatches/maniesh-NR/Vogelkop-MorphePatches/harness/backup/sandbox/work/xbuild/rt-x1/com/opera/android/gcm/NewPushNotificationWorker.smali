.class public final Lcom/opera/android/gcm/NewPushNotificationWorker;
.super Landroidx/work/CoroutineWorker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u000cB\'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/opera/android/gcm/NewPushNotificationWorker;",
        "Landroidx/work/CoroutineWorker;",
        "Landroid/content/Context;",
        "context",
        "Landroidx/work/WorkerParameters;",
        "workerParams",
        "Lnbh;",
        "pushFactory",
        "Lorm;",
        "usageReporter",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;Lnbh;Lorm;)V",
        "oup",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final g:Lnbh;

.field public final h:Lorm;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lnbh;Lorm;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lnbh;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lorm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/work/CoroutineWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    iput-object p3, p0, Lcom/opera/android/gcm/NewPushNotificationWorker;->g:Lnbh;

    iput-object p4, p0, Lcom/opera/android/gcm/NewPushNotificationWorker;->h:Lorm;

    return-void
.end method


# virtual methods
.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 10

    iget-object v0, p0, Lcom/opera/android/gcm/NewPushNotificationWorker;->h:Lorm;

    instance-of v1, p1, Lupe;

    if-eqz v1, :cond_15

    move-object v1, p1

    check-cast v1, Lupe;

    iget v2, v1, Lupe;->v:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lupe;->v:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lupe;

    invoke-direct {v1, p0, p1}, Lupe;-><init>(Lcom/opera/android/gcm/NewPushNotificationWorker;Lnt5;)V

    :goto_1a
    iget-object p1, v1, Lupe;->t:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lupe;->v:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_30

    if-ne v3, v5, :cond_2a

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_47

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Ls6d;->a:Ld7a;

    new-instance v3, Lbz1;

    const/16 v6, 0x14

    invoke-direct {v3, v6, v4, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v5, v1, Lupe;->v:I

    invoke-static {p1, v3, v1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_47

    return-object v2

    :cond_47
    :goto_47
    iget-object p1, p0, Lajc;->b:Landroidx/work/WorkerParameters;

    iget-object p1, p1, Landroidx/work/WorkerParameters;->b:Lib6;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object p1, p1, Lib6;->a:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_130

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_124

    instance-of v6, v2, Ljava/lang/Boolean;

    if-eqz v6, :cond_84

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_5e

    :cond_84
    instance-of v6, v2, Ljava/lang/String;

    if-eqz v6, :cond_8e

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5e

    :cond_8e
    instance-of v6, v2, Ljava/lang/Integer;

    if-eqz v6, :cond_9c

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    goto :goto_5e

    :cond_9c
    instance-of v6, v2, Ljava/lang/Short;

    if-eqz v6, :cond_aa

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->shortValue()S

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putShort(Ljava/lang/String;S)V

    goto :goto_5e

    :cond_aa
    instance-of v6, v2, Ljava/lang/Long;

    if-eqz v6, :cond_b8

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    invoke-virtual {v1, v3, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    goto :goto_5e

    :cond_b8
    instance-of v6, v2, Ljava/lang/Byte;

    if-eqz v6, :cond_c6

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->byteValue()B

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putByte(Ljava/lang/String;B)V

    goto :goto_5e

    :cond_c6
    instance-of v6, v2, [B

    if-eqz v6, :cond_d0

    check-cast v2, [B

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_5e

    :cond_d0
    instance-of v6, v2, Ljava/lang/Character;

    if-eqz v6, :cond_de

    check-cast v2, Ljava/lang/Character;

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putChar(Ljava/lang/String;C)V

    goto :goto_5e

    :cond_de
    instance-of v6, v2, [C

    if-eqz v6, :cond_e9

    check-cast v2, [C

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putCharArray(Ljava/lang/String;[C)V

    goto/16 :goto_5e

    :cond_e9
    instance-of v6, v2, Ljava/lang/CharSequence;

    if-eqz v6, :cond_f4

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    goto/16 :goto_5e

    :cond_f4
    instance-of v6, v2, Ljava/lang/Float;

    if-eqz v6, :cond_103

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    goto/16 :goto_5e

    :cond_103
    instance-of v6, v2, Landroid/os/Bundle;

    if-eqz v6, :cond_10e

    check-cast v2, Landroid/os/Bundle;

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto/16 :goto_5e

    :cond_10e
    instance-of v6, v2, Landroid/os/Parcelable;

    if-eqz v6, :cond_119

    check-cast v2, Landroid/os/Parcelable;

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto/16 :goto_5e

    :cond_119
    instance-of v6, v2, Ljava/io/Serializable;

    if-eqz v6, :cond_124

    check-cast v2, Ljava/io/Serializable;

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    goto/16 :goto_5e

    :cond_124
    const-string p0, "Type of property "

    const-string p1, " is not supported"

    invoke-static {p0, v3, p1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_130
    :try_start_130
    iget-object p1, p0, Lcom/opera/android/gcm/NewPushNotificationWorker;->g:Lnbh;

    iget-object p0, p0, Lajc;->a:Landroid/content/Context;

    invoke-virtual {p1, p0, v1, v5}, Lnbh;->a(Landroid/content/Context;Landroid/os/Bundle;Z)Lwbh;

    move-result-object p0

    invoke-static {p0, v0}, Lybh;->l(Lwbh;Lorm;)Z

    new-instance p0, Lyic;

    invoke-direct {p0}, Lyic;-><init>()V
    :try_end_140
    .catch Ljava/lang/IllegalArgumentException; {:try_start_130 .. :try_end_140} :catch_141

    return-object p0

    :catch_141
    move-exception p0

    invoke-static {v0, p0, v1}, Loup;->j0(Lorm;Ljava/lang/IllegalArgumentException;Landroid/os/Bundle;)V

    new-instance p0, Lwic;

    invoke-direct {p0}, Lwic;-><init>()V

    return-object p0
.end method
