.class public Lshf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfie;
.implements Lqvi;
.implements Lrr9;
.implements Lo7h;
.implements Ld94;
.implements Lr6l;


# static fields
.field public static d:Lshf;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lshf;->b:Ljava/lang/Object;

    .line 116
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lshf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Llkk;)V
    .registers 4

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lshf;->b:Ljava/lang/Object;

    .line 145
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    .line 146
    iput-object p2, p0, Lshf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lpde;Ltsd;)V
    .registers 5

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    .line 119
    iput-object p3, p0, Lshf;->b:Ljava/lang/Object;

    .line 120
    new-instance p1, Lpde;

    invoke-virtual {p0}, Lshf;->k()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 121
    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 122
    iput-object p1, p0, Lshf;->c:Ljava/lang/Object;

    .line 123
    new-instance p1, Lqzg;

    const/16 v0, 0x12

    invoke-direct {p1, p0, v0}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/ToolbarProgressBar;)V
    .registers 4

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    new-instance v0, Ln4h;

    invoke-direct {v0, p0}, Ln4h;-><init>(Lshf;)V

    iput-object v0, p0, Lshf;->c:Ljava/lang/Object;

    .line 137
    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    .line 138
    new-instance v0, Lwjh;

    .line 139
    invoke-direct {v0, p1}, Lwjh;-><init>(Lcom/opera/android/custom_views/ToolbarProgressBar;)V

    .line 140
    iput-object v0, p0, Lshf;->b:Ljava/lang/Object;

    .line 141
    new-instance v0, Lkkf;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 142
    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    iput-object p2, p0, Lshf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lshf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;B)V
    .registers 4

    packed-switch p2, :pswitch_data_30

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance p2, Lnj9;

    invoke-direct {p2}, Lnj9;-><init>()V

    .line 126
    const-string v0, "video/mp2t"

    invoke-static {v0}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lnj9;->l:Ljava/lang/String;

    .line 127
    invoke-static {p1}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p2, Lnj9;->m:Ljava/lang/String;

    .line 128
    new-instance p1, Loj9;

    .line 129
    invoke-direct {p1, p2}, Loj9;-><init>(Lnj9;)V

    .line 130
    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    return-void

    .line 131
    :pswitch_21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    .line 133
    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getEditableString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lshf;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 134
    iput-object p1, p0, Lshf;->c:Ljava/lang/Object;

    return-void

    :pswitch_data_30
    .packed-switch 0xd
        :pswitch_21
    .end packed-switch
.end method

.method public constructor <init>(Lkze;Lk6l;Lm3l;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p2, p0, Lshf;->a:Ljava/lang/Object;

    .line 149
    iput-object p3, p0, Lshf;->b:Ljava/lang/Object;

    .line 150
    iput-object p4, p0, Lshf;->c:Ljava/lang/Object;

    .line 151
    new-instance p3, Lk3l;

    invoke-direct {p3, p0}, Lk3l;-><init>(Lshf;)V

    .line 152
    new-instance p4, Ldnj;

    const/16 v0, 0x19

    invoke-direct {p4, p0, v0}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3, p4}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public constructor <init>(Lpde;Landroid/widget/ScrollView;)V
    .registers 4

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    .line 109
    iput-object p2, p0, Lshf;->b:Ljava/lang/Object;

    .line 110
    new-instance p1, Ld8d;

    const/16 v0, 0x12

    invoke-direct {p1, p0, v0}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lshf;->c:Ljava/lang/Object;

    .line 111
    new-instance p1, Lz61;

    const/16 v0, 0x11

    invoke-direct {p1, p0, v0}, Lz61;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    .line 112
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 113
    invoke-static {p2, p1}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public constructor <init>(Lxd4;Landroid/util/Size;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lshf;->a:Ljava/lang/Object;

    invoke-interface {p1}, Lud4;->c()I

    invoke-interface {p1}, Lud4;->j()I

    const/4 v0, 0x0

    if-eqz p2, :cond_1c

    new-instance v1, Landroid/util/Rational;

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result p2

    invoke-direct {v1, v2, p2}, Landroid/util/Rational;-><init>(II)V

    goto :goto_43

    :cond_1c
    const/16 p2, 0x100

    invoke-interface {p1, p2}, Lxd4;->t(I)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 p2, 0x0

    move-object v1, p2

    goto :goto_43

    :cond_2b
    new-instance v1, Luc5;

    invoke-direct {v1, v0, v0}, Luc5;-><init>(BZ)V

    invoke-static {p2, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/util/Size;

    new-instance v1, Landroid/util/Rational;

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result p2

    invoke-direct {v1, v2, p2}, Landroid/util/Rational;-><init>(II)V

    :goto_43
    iput-object v1, p0, Lshf;->b:Ljava/lang/Object;

    new-instance p2, Lw5a;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Lud4;->c()I

    move-result v2

    iput v2, p2, Lw5a;->a:I

    invoke-interface {p1}, Lud4;->j()I

    move-result p1

    iput p1, p2, Lw5a;->b:I

    iput-object v1, p2, Lw5a;->d:Ljava/io/Serializable;

    const/4 p1, 0x1

    if-eqz v1, :cond_65

    invoke-virtual {v1}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    invoke-virtual {v1}, Landroid/util/Rational;->getDenominator()I

    move-result v1

    if-lt v2, v1, :cond_66

    :cond_65
    move v0, p1

    :cond_66
    iput-boolean v0, p2, Lw5a;->c:Z

    iput-object p2, p0, Lshf;->c:Ljava/lang/Object;

    return-void
.end method

.method public static A(Ljava/util/ArrayList;)Ljava/util/HashMap;
    .registers 8

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0}, Lshf;->x(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_f
    if-ge v4, v2, :cond_22

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Landroid/util/Rational;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    :cond_22
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_26
    if-ge v3, v1, :cond_56

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v3, 0x1

    check-cast v2, Landroid/util/Size;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_38
    :goto_38
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_26

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Rational;

    sget-object v6, Lqpj;->c:Landroid/util/Size;

    invoke-static {v2, v5, v6}, Lua2;->a(Landroid/util/Size;Landroid/util/Rational;Landroid/util/Size;)Z

    move-result v6

    if-eqz v6, :cond_38

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_38

    :cond_56
    return-object v0
.end method

.method public static J(Ljava/util/List;Landroid/util/Size;Z)V
    .registers 8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_b
    if-ltz v1, :cond_2e

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-lt v3, v4, :cond_27

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-ge v3, v4, :cond_2e

    :cond_27
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_b

    :cond_2e
    invoke-interface {p0, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    invoke-static {p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    if-eqz p2, :cond_39

    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_39
    return-void
.end method

.method public static K(Ljava/util/List;Landroid/util/Size;Z)V
    .registers 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2d

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v5

    if-gt v4, v5, :cond_27

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v5

    if-le v4, v5, :cond_2d

    :cond_27
    invoke-virtual {v0, v1, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_2d
    invoke-interface {p0, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    if-eqz p2, :cond_35

    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_35
    return-void
.end method

.method public static M(Landroid/widget/ImageView;IZ)V
    .registers 8

    sget-object v0, Loel;->s:Lioj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lab5;->f(I)D

    move-result-wide v0

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_12

    const/high16 v0, -0x1000000

    goto :goto_13

    :cond_12
    const/4 v0, -0x1

    :goto_13
    if-nez p2, :cond_18

    move v4, v0

    move v0, p1

    move p1, v4

    :cond_18
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    return-void
.end method

.method public static d(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 4

    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-static {p0, v1, v2, v0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0
    :try_end_8
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_8} :catch_12
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_8} :catch_9

    return-object p0

    :catch_9
    move-exception p0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "SERVICE_NOT_AVAILABLE"

    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_12
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v1, v0, Ljava/io/IOException;

    if-nez v1, :cond_27

    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-nez v1, :cond_24

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0

    :cond_24
    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    :cond_27
    check-cast v0, Ljava/io/IOException;

    throw v0
.end method

.method public static o(Landroid/content/SharedPreferences;Ljava/util/concurrent/ScheduledThreadPoolExecutor;)Lshf;
    .registers 7

    new-instance v0, Lshf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, v0, Lshf;->b:Ljava/lang/Object;

    iput-object p0, v0, Lshf;->a:Ljava/lang/Object;

    iput-object p1, v0, Lshf;->c:Ljava/lang/Object;

    iget-object p0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayDeque;

    monitor-enter p0

    :try_start_15
    iget-object p1, v0, Lshf;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    iget-object p1, v0, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v1, "topic_operation_queue"

    const-string v2, ""

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_56

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_56

    const-string v1, ","

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_40
    if-ge v2, v1, :cond_54

    aget-object v3, p1, v2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_51

    iget-object v4, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayDeque;

    invoke-virtual {v4, v3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :cond_51
    add-int/lit8 v2, v2, 0x1

    goto :goto_40

    :cond_54
    monitor-exit p0

    return-object v0

    :cond_56
    monitor-exit p0

    return-object v0

    :goto_58
    monitor-exit p0
    :try_end_59
    .catchall {:try_start_15 .. :try_end_59} :catchall_5a

    throw p1

    :catchall_5a
    move-exception p1

    goto :goto_58
.end method

.method public static s(Larg;Lvzk;)Lzcm;
    .registers 9

    iget-object p0, p0, Larg;->e:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lyi4;->u(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_24

    new-instance v0, Lzcm;

    iget-object p0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lj1c;

    iget-object p0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast p0, Lvz;

    iget-object v1, p0, Lvz;->b:Ljava/lang/String;

    iget-object v2, p0, Lvz;->a:Ljava/lang/String;

    const/4 v4, 0x0

    const/16 v6, 0x2c

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v6}, Lzcm;-><init>(Ljava/lang/String;Ljava/lang/String;Llem;Ljava/util/ArrayList;Ljava/util/List;I)V

    return-object v0

    :cond_24
    const/4 p0, 0x0

    return-object p0
.end method

.method public static t(Larg;Lvzk;)Lzcm;
    .registers 9

    iget-object p0, p0, Larg;->g:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lyi4;->u(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_24

    new-instance v0, Lzcm;

    iget-object p0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lj1c;

    iget-object p0, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast p0, Lvz;

    iget-object v1, p0, Lvz;->b:Ljava/lang/String;

    iget-object v2, p0, Lvz;->a:Ljava/lang/String;

    const/4 v4, 0x0

    const/16 v6, 0x2c

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v6}, Lzcm;-><init>(Ljava/lang/String;Ljava/lang/String;Llem;Ljava/util/ArrayList;Ljava/util/List;I)V

    return-object v0

    :cond_24
    const/4 p0, 0x0

    return-object p0
.end method

.method public static u(Larg;Lvzk;)Lzcm;
    .registers 9

    iget-object p0, p0, Larg;->h:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lyi4;->u(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_22

    new-instance v0, Lzcm;

    iget-object p0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lj1c;

    iget-object p0, p0, Lj1c;->d:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    const/4 v4, 0x0

    const/16 v6, 0x2e

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v6}, Lzcm;-><init>(Ljava/lang/String;Ljava/lang/String;Llem;Ljava/util/ArrayList;Ljava/util/List;I)V

    return-object v0

    :cond_22
    const/4 p0, 0x0

    return-object p0
.end method

.method public static v(Larg;Lvzk;)Lxcm;
    .registers 8

    iget-object p0, p0, Larg;->o:Lyqg;

    const/4 v0, 0x0

    if-eqz p0, :cond_8

    iget-object p0, p0, Lyqg;->a:Ljava/util/ArrayList;

    goto :goto_9

    :cond_8
    move-object p0, v0

    :goto_9
    if-eqz p0, :cond_64

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_64

    iget-object v0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Lj1c;

    iget-object v0, v0, Lj1c;->f:Ljava/lang/Object;

    check-cast v0, Lvz;

    iget-object v0, v0, Lvz;->b:Ljava/lang/String;

    new-instance v1, Ltcd;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ltcd;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {p0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ltcd;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_30
    move-object v2, v1

    check-cast v2, Lq1i;

    iget-object v2, v2, Lq1i;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ListIterator;

    invoke-interface {v2}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v3

    if-eqz v3, :cond_52

    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhqg;

    new-instance v3, Ljcm;

    iget-boolean v4, v2, Lhqg;->a:Z

    iget-object v5, v2, Lhqg;->c:Ljava/lang/String;

    iget-object v2, v2, Lhqg;->b:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v2}, Ljcm;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :cond_52
    iget-object p1, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast p1, Lne5;

    iget-object v1, p1, Lne5;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p1, p1, Lne5;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    new-instance v2, Lxcm;

    invoke-direct {v2, v0, v1, p1, p0}, Lxcm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object v2

    :cond_64
    return-object v0
.end method

.method public static w(Larg;Lvzk;)Lzcm;
    .registers 12

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Larg;->j:Luqg;

    const/4 v1, 0x0

    if-eqz p0, :cond_d

    iget-object v2, p0, Luqg;->c:Ljava/lang/String;

    goto :goto_e

    :cond_d
    move-object v2, v1

    :goto_e
    if-eqz v2, :cond_19

    invoke-static {v2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_19
    if-eqz p0, :cond_1e

    iget-object p0, p0, Luqg;->a:Ljava/lang/String;

    goto :goto_1f

    :cond_1e
    move-object p0, v1

    :goto_1f
    if-eqz p0, :cond_35

    invoke-static {p0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_35

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_32

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_53

    new-instance v3, Lzcm;

    iget-object p0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lj1c;

    iget-object p0, p0, Lj1c;->h:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v9, 0x3c

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v9}, Lzcm;-><init>(Ljava/lang/String;Ljava/lang/String;Llem;Ljava/util/ArrayList;Ljava/util/List;I)V

    return-object v3

    :cond_53
    return-object v1
.end method

.method public static x(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 11

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lua2;->a:Landroid/util/Rational;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lua2;->c:Landroid/util/Rational;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_15
    :goto_15
    if-ge v3, v1, :cond_4e

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Landroid/util/Size;

    new-instance v5, Landroid/util/Rational;

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v6

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Rational;-><init>(II)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v2

    :cond_37
    if-ge v7, v6, :cond_4a

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Landroid/util/Rational;

    sget-object v9, Lqpj;->c:Landroid/util/Size;

    invoke-static {v4, v8, v9}, Lua2;->a(Landroid/util/Size;Landroid/util/Rational;Landroid/util/Size;)Z

    move-result v8

    if-eqz v8, :cond_37

    goto :goto_15

    :cond_4a
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_4e
    return-object v0
.end method

.method public static z(IZ)Landroid/util/Rational;
    .registers 3

    const/4 v0, -0x1

    if-eq p0, v0, :cond_12

    if-eqz p0, :cond_12

    const/4 v0, 0x1

    if-eq p0, v0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    if-eqz p1, :cond_f

    sget-object p0, Lua2;->c:Landroid/util/Rational;

    return-object p0

    :cond_f
    sget-object p0, Lua2;->d:Landroid/util/Rational;

    return-object p0

    :cond_12
    if-eqz p1, :cond_17

    sget-object p0, Lua2;->a:Landroid/util/Rational;

    return-object p0

    :cond_17
    sget-object p0, Lua2;->b:Landroid/util/Rational;

    return-object p0
.end method


# virtual methods
.method public final B(Landroid/view/textclassifier/SelectionEvent;)V
    .registers 2

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/textclassifier/TextClassifier;

    invoke-interface {p0, p1}, Landroid/view/textclassifier/TextClassifier;->onSelectionEvent(Landroid/view/textclassifier/SelectionEvent;)V

    return-void
.end method

.method public final C(Ljava/lang/Integer;)Z
    .registers 10

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/w;

    invoke-virtual {v0}, Landroidx/fragment/app/w;->J()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_17

    add-int/lit8 v3, v1, -0x1

    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_15

    :cond_14
    move p1, v3

    :goto_15
    if-gt v1, p1, :cond_18

    :cond_17
    return v2

    :cond_18
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p1}, Landroidx/fragment/app/w;->I(I)Landroidx/fragment/app/a;

    move-result-object v4

    iget v4, v4, Landroidx/fragment/app/a;->v:I

    move v5, p1

    :goto_24
    if-ge v5, v3, :cond_38

    invoke-virtual {v0, v5}, Landroidx/fragment/app/w;->I(I)Landroidx/fragment/app/a;

    move-result-object v6

    iget v6, v6, Landroidx/fragment/app/a;->v:I

    invoke-virtual {v0, v6}, Landroidx/fragment/app/w;->E(I)Landroidx/fragment/app/Fragment;

    move-result-object v6

    if-eqz v6, :cond_35

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_24

    :cond_38
    const/4 v3, 0x1

    sub-int/2addr p1, v3

    :goto_3a
    if-ltz p1, :cond_60

    invoke-virtual {v0, p1}, Landroidx/fragment/app/w;->I(I)Landroidx/fragment/app/a;

    move-result-object v5

    iget-object v6, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v6, Llrk;

    invoke-virtual {v6, v5}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_60

    iget v4, v5, Landroidx/fragment/app/a;->v:I

    iget-object v5, v5, Lym9;->k:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v5

    if-eqz v5, :cond_5d

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5d
    add-int/lit8 p1, p1, -0x1

    goto :goto_3a

    :cond_60
    iget-object p1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p1, Lp7l;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_71

    invoke-virtual {v0, v4, v2}, Landroidx/fragment/app/w;->W(IZ)V

    invoke-virtual {p1}, Lp7l;->invoke()Ljava/lang/Object;

    return v3

    :cond_71
    new-instance v5, Landroidx/fragment/app/a;

    invoke-direct {v5, v0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    iput v2, v5, Lym9;->h:I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v6, v2

    :goto_7d
    if-ge v6, v0, :cond_8b

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Landroidx/fragment/app/Fragment;

    invoke-virtual {v5, v7}, Landroidx/fragment/app/a;->m(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    goto :goto_7d

    :cond_8b
    new-instance v0, Lbr;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v4, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    iget-boolean p0, v5, Lym9;->i:Z

    if-nez p0, :cond_ad

    iput-boolean v2, v5, Lym9;->j:Z

    iget-object p0, v5, Lym9;->s:Ljava/util/ArrayList;

    if-nez p0, :cond_a3

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v5, Lym9;->s:Ljava/util/ArrayList;

    :cond_a3
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Landroidx/fragment/app/a;->h()I

    invoke-virtual {p1}, Lp7l;->invoke()Ljava/lang/Object;

    return v3

    :cond_ad
    const-string p0, "This transaction is already being added to the back stack"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return v2
.end method

.method public final D(Ljava/lang/String;IILvyi;)V
    .registers 7

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/textclassifier/TextClassifier;

    if-eqz v0, :cond_52

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Lizi;

    invoke-virtual {v0, p2, p1}, Lizi;->b(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lshf;->p()V

    return-void

    :cond_14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr p1, p2

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lizi;

    invoke-virtual {v1, p2, p1, v0}, Lizi;->a(II[I)Z

    move-result p1

    if-nez p1, :cond_2a

    invoke-virtual {p0}, Lshf;->p()V

    return-void

    :cond_2a
    const/4 p1, 0x1

    const/4 p2, 0x0

    if-eqz p4, :cond_3e

    iget-object p4, p4, Lvyi;->f:Landroid/view/textclassifier/TextClassification;

    if-eqz p4, :cond_3e

    aget p2, v0, p2

    aget p1, v0, p1

    invoke-static {p2, p1, p3, p4}, Landroid/view/textclassifier/SelectionEvent;->createSelectionActionEvent(IIILandroid/view/textclassifier/TextClassification;)Landroid/view/textclassifier/SelectionEvent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->B(Landroid/view/textclassifier/SelectionEvent;)V

    goto :goto_49

    :cond_3e
    aget p2, v0, p2

    aget p1, v0, p1

    invoke-static {p2, p1, p3}, Landroid/view/textclassifier/SelectionEvent;->createSelectionActionEvent(III)Landroid/view/textclassifier/SelectionEvent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->B(Landroid/view/textclassifier/SelectionEvent;)V

    :goto_49
    invoke-static {p3}, Landroid/view/textclassifier/SelectionEvent;->isTerminal(I)Z

    move-result p1

    if-eqz p1, :cond_52

    invoke-virtual {p0}, Lshf;->p()V

    :cond_52
    return-void
.end method

.method public final E(Ljava/lang/String;ILvyi;)V
    .registers 6

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/textclassifier/TextClassifier;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Lizi;

    invoke-virtual {v0, p2, p1}, Lizi;->b(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lshf;->p()V

    return-void

    :cond_15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr p1, p2

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lizi;

    invoke-virtual {v1, p2, p1, v0}, Lizi;->a(II[I)Z

    move-result p1

    if-nez p1, :cond_2b

    invoke-virtual {p0}, Lshf;->p()V

    return-void

    :cond_2b
    const/4 p1, 0x1

    const/4 p2, 0x0

    if-eqz p3, :cond_4f

    iget-object v1, p3, Lvyi;->g:Landroid/view/textclassifier/TextSelection;

    if-eqz v1, :cond_3f

    aget p2, v0, p2

    aget p1, v0, p1

    invoke-static {p2, p1, v1}, Landroid/view/textclassifier/SelectionEvent;->createSelectionModifiedEvent(IILandroid/view/textclassifier/TextSelection;)Landroid/view/textclassifier/SelectionEvent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->B(Landroid/view/textclassifier/SelectionEvent;)V

    return-void

    :cond_3f
    iget-object p3, p3, Lvyi;->f:Landroid/view/textclassifier/TextClassification;

    if-eqz p3, :cond_4f

    aget p2, v0, p2

    aget p1, v0, p1

    invoke-static {p2, p1, p3}, Landroid/view/textclassifier/SelectionEvent;->createSelectionModifiedEvent(IILandroid/view/textclassifier/TextClassification;)Landroid/view/textclassifier/SelectionEvent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->B(Landroid/view/textclassifier/SelectionEvent;)V

    return-void

    :cond_4f
    aget p2, v0, p2

    aget p1, v0, p1

    invoke-static {p2, p1}, Landroid/view/textclassifier/SelectionEvent;->createSelectionModifiedEvent(II)Landroid/view/textclassifier/SelectionEvent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->B(Landroid/view/textclassifier/SelectionEvent;)V

    return-void
.end method

.method public final F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Lr49;

    if-eqz p2, :cond_d4

    if-eqz p3, :cond_d4

    invoke-virtual {p0}, Lr49;->a()V

    iget-object v0, p0, Lr49;->c:Lj59;

    iget-object v1, v0, Lj59;->h:Ljava/lang/String;

    invoke-virtual {p0}, Lr49;->a()V

    iget-object p0, v0, Lj59;->a:Ljava/lang/String;

    if-eqz v1, :cond_ce

    new-instance v0, Ljava/net/URL;

    const-string v2, "/registrations/"

    const-string v3, "/topicSubscriptions/"

    const-string v4, "https://fcmregistrations.googleapis.com/v1/projects/"

    invoke-static {v4, v1, v2, p3, v3}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v1, ":"

    invoke-static {p3, p1, v1, p4}, Lp3p;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-string p1, "FirebaseMessaging"

    const/4 p3, 0x3

    invoke-static {p1, p3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_37

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_37
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    const-string p3, "POST"

    invoke-virtual {p1, p3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string p3, "x-goog-api-key"

    invoke-virtual {p1, p3, p0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "x-goog-firebase-installations-auth"

    invoke-virtual {p1, p0, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    :try_start_50
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object p2
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_58} :catch_ae
    .catchall {:try_start_50 .. :try_end_58} :catchall_b7

    :try_start_58
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p3

    if-eqz p3, :cond_61

    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_61} :catch_61

    :catch_61
    :cond_61
    :try_start_61
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object p3

    if-eqz p3, :cond_6a

    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_6a} :catch_6a

    :catch_6a
    :cond_6a
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    const/16 p1, 0xc8

    if-lt p0, p1, :cond_76

    const/16 p1, 0x12c

    if-ge p0, p1, :cond_76

    return-void

    :cond_76
    const/16 p1, 0x194

    const-string p3, "Topic "

    if-eq p0, p1, :cond_a4

    const/16 p1, 0x193

    if-eq p0, p1, :cond_a4

    const/16 p1, 0x1f4

    if-lt p0, p1, :cond_8a

    const-string p0, "INTERNAL_SERVER_ERROR"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-void

    :cond_8a
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " failed with status: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_a4
    const-string p0, " failed: "

    invoke-static {p3, p4, p0, p2}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-void

    :catch_ae
    move-exception p0

    :try_start_af
    new-instance p2, Ljava/io/IOException;

    const-string p3, "SERVICE_NOT_AVAILABLE"

    invoke-direct {p2, p3, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
    :try_end_b7
    .catchall {:try_start_af .. :try_end_b7} :catchall_b7

    :catchall_b7
    move-exception p0

    :try_start_b8
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2

    if-eqz p2, :cond_c1

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_c1
    .catch Ljava/io/IOException; {:try_start_b8 .. :try_end_c1} :catch_c1

    :catch_c1
    :cond_c1
    :try_start_c1
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object p2

    if-eqz p2, :cond_ca

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_ca
    .catch Ljava/io/IOException; {:try_start_c1 .. :try_end_ca} :catch_ca

    :catch_ca
    :cond_ca
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    :cond_ce
    const-string p0, "Project ID or API Key is missing"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-void

    :cond_d4
    const-string p0, "FIS auth token or FIS ID is empty"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-void
.end method

.method public final G(IJ)V
    .registers 7

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    iget-object v1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Ln4h;

    const/4 v2, 0x0

    if-nez v0, :cond_20

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p2, -0x1

    iput p2, v1, Ln4h;->a:I

    iput v2, v1, Ln4h;->b:I

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    iput-boolean v2, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setProgress(I)V

    return-void

    :cond_20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    iput v2, v1, Ln4h;->b:I

    iput p1, v1, Ln4h;->a:I

    iget-object p0, v1, Ln4h;->c:Lshf;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    if-gtz p1, :cond_4a

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result p1

    if-nez p1, :cond_4a

    iget-object p0, p0, Lcom/opera/android/custom_views/ToolbarProgressBar;->f:Landroid/animation/ObjectAnimator;

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Landroid/animation/Animator;->isStarted()Z

    move-result p0

    if-nez p0, :cond_4a

    :cond_46
    invoke-static {v1, p2, p3}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_4a
    invoke-virtual {v1}, Ln4h;->run()V

    return-void
.end method

.method public final H([B)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "com.opera.android.browser.DATA_VALUE"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-virtual {p0, v0}, Lshf;->I(Landroid/os/Message;)V

    return-void
.end method

.method public final I(Landroid/os/Message;)V
    .registers 4

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Llkk;

    iget-byte v0, v0, Llkk;->a:B

    iput v0, p1, Landroid/os/Message;->arg1:I

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.opera.android.osp.action.OSP_MSG"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.opera.android.osp.extra.MSG_DATA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-class p1, Lcom/opera/android/osp/OspCollectorService;

    const/16 v1, 0x3eb

    invoke-static {p0, p1, v1, v0}, Lilf;->a(Landroid/content/Context;Ljava/lang/Class;ILandroid/content/Intent;)V

    return-void
.end method

.method public final L(Lzqg;)Lzcm;
    .registers 10

    iget-object v0, p1, Lzqg;->b:Lfsp;

    check-cast v0, Lhrg;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, v0, Lhrg;->o:Lgrg;

    if-eqz v1, :cond_1e

    new-instance v2, Llem;

    iget-object v3, v1, Lgrg;->a:Ljava/lang/String;

    new-instance v4, Lm53;

    const/16 v6, 0xc

    invoke-direct {v4, p0, v1, v6}, Lm53;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3, v4}, Llem;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1e
    iget-object v1, v0, Lhrg;->p:Lxqg;

    if-eqz v1, :cond_33

    new-instance v2, Llem;

    iget-object v3, v1, Lxqg;->a:Ljava/lang/String;

    new-instance v4, Lm53;

    const/16 v6, 0xd

    invoke-direct {v4, p0, v1, v6}, Lm53;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3, v4}, Llem;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_33
    new-instance v1, Lzcm;

    iget-object v2, p1, Lzqg;->a:Ljava/lang/String;

    iget-object v3, v0, Lhrg;->n:Ljava/lang/String;

    const/4 v6, 0x0

    const/16 v7, 0x14

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v7}, Lzcm;-><init>(Ljava/lang/String;Ljava/lang/String;Llem;Ljava/util/ArrayList;Ljava/util/List;I)V

    return-object v1
.end method

.method public final N(Landroidx/fragment/app/r;)V
    .registers 9

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_f
    if-ge v4, v2, :cond_1e

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lpsf;

    iget-object v6, v5, Lpsf;->c:Landroidx/fragment/app/r;

    if-ne v6, p1, :cond_f

    goto :goto_1f

    :cond_1e
    const/4 v5, 0x0

    :goto_1f
    if-nez v5, :cond_23

    monitor-exit v0

    return-void

    :cond_23
    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_2b
    .catchall {:try_start_5 .. :try_end_2b} :catchall_35

    iput-boolean v3, v5, Lpsf;->b:Z

    iget-object p0, v5, Lpsf;->c:Landroidx/fragment/app/r;

    invoke-virtual {p0, v5}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-void

    :goto_33
    :try_start_33
    monitor-exit v0
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_35

    throw p0

    :catchall_35
    move-exception p0

    goto :goto_33
.end method

.method public final O()V
    .registers 12

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    iget-object v1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_e
    if-ge v4, v2, :cond_20

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lqck;

    iget-object v6, v5, Lqck;->a:Likc;

    iget-object v5, v5, Lqck;->b:Lhze;

    invoke-virtual {v6, v5}, Lekc;->p(Lf7f;)V

    goto :goto_e

    :cond_20
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Landroidx/fragment/app/w;

    iget-object v2, v2, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {v2}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    :cond_34
    :goto_34
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/fragment/app/Fragment;

    if-eqz v5, :cond_34

    instance-of v6, v5, Leak;

    if-eqz v6, :cond_73

    new-instance v6, Lqck;

    check-cast v5, Leak;

    invoke-interface {v5}, Leak;->T()Likc;

    move-result-object v7

    invoke-interface {v5}, Leak;->T()Likc;

    move-result-object v8

    new-instance v9, Lock;

    invoke-direct {v9, p0, v3}, Lock;-><init>(Lshf;B)V

    new-instance v10, Lhze;

    invoke-direct {v10, v8, v9}, Lhze;-><init>(Likc;Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v6, v7, v10}, Lqck;-><init>(Likc;Lhze;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7, v10}, Lekc;->k(Lf7f;)V

    invoke-interface {v5}, Leak;->T()Likc;

    move-result-object v5

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkl0;

    if-eqz v5, :cond_34

    move-object v4, v5

    goto :goto_34

    :cond_73
    instance-of v6, v5, Lx65;

    if-eqz v6, :cond_34

    check-cast v5, Lx65;

    iget-object v4, v5, Lx65;->o:Lpde;

    new-instance v5, Lr4k;

    const/4 v6, 0x5

    invoke-direct {v5, v6}, Lr4k;-><init>(B)V

    invoke-static {v4, v5}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v4

    invoke-static {v4}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v4

    new-instance v5, Lqck;

    new-instance v6, Lock;

    const/4 v7, 0x1

    invoke-direct {v6, p0, v7}, Lock;-><init>(Lshf;B)V

    new-instance v7, Lhze;

    invoke-direct {v7, v4, v6}, Lhze;-><init>(Likc;Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v5, v4, v7}, Lqck;-><init>(Likc;Lhze;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, v7}, Lekc;->k(Lf7f;)V

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    goto :goto_34

    :cond_a4
    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b1

    invoke-virtual {v0, v4}, Lekc;->r(Ljava/lang/Object;)V

    :cond_b1
    return-void
.end method

.method public final P(JZ)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    iput p3, v0, Landroid/os/Message;->arg2:I

    new-instance p3, Landroid/os/Bundle;

    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    const-string v1, "com.opera.android.browser.DATA_VALUE"

    invoke-virtual {p3, v1, p1, p2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {v0, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-virtual {p0, v0}, Lshf;->I(Landroid/os/Message;)V

    return-void
.end method

.method public final Q()V
    .registers 5

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lwjh;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object v1, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Lhr5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhr5;->l(Landroid/content/Context;)I

    move-result v1

    const v2, 0x7f0402ff

    const v3, 0x7f060b1b

    invoke-static {v2, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iget-object v2, v0, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v2, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v2, v0, Lwjh;->d:Ljava/lang/Object;

    check-cast v2, Lq4h;

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v0, v0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    return-void
.end method

.method public final R()V
    .registers 3

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v1, v0, Lk6l;->o:Lb2l;

    if-eqz v1, :cond_d

    invoke-interface {v1}, Lb9l;->T()Lp6l;

    move-result-object v1

    goto :goto_f

    :cond_d
    sget-object v1, Lp6l;->a:Lp6l;

    :goto_f
    invoke-virtual {v0, v1}, Lk6l;->s(Lp6l;)I

    move-result v0

    iget-object v1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Lm3l;

    invoke-virtual {v1, v0}, Lm3l;->a(I)V

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final S(Ljava/lang/Object;)V
    .registers 4

    new-instance v0, Lwr9;

    const/16 v1, 0x13

    invoke-direct {v0, p0, p1, v1}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    if-eqz p0, :cond_1d

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_1d
    return-void
.end method

.method public final a(Lg1g;)V
    .registers 15

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lpql;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ltym;->a:Ljava/lang/String;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lpql;

    monitor-enter v1

    :try_start_f
    iget-wide v2, v1, Lpql;->c:J

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v0, v2, v4

    if-eqz v0, :cond_1f

    iget-wide v6, v1, Lpql;->b:J

    add-long/2addr v2, v6

    :goto_1d
    move-wide v7, v2

    goto :goto_24

    :cond_1f
    invoke-virtual {v1}, Lpql;->d()J

    move-result-wide v2
    :try_end_23
    .catchall {:try_start_f .. :try_end_23} :catchall_72

    goto :goto_1d

    :goto_24
    monitor-exit v1

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lpql;

    monitor-enter v2

    :try_start_2b
    iget-wide v0, v2, Lpql;->b:J
    :try_end_2d
    .catchall {:try_start_2b .. :try_end_2d} :catchall_6d

    monitor-exit v2

    cmp-long v2, v7, v4

    if-eqz v2, :cond_6a

    cmp-long v2, v0, v4

    if-eqz v2, :cond_6a

    iget-object v2, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Loj9;

    iget-wide v3, v2, Loj9;->s:J

    cmp-long v3, v0, v3

    if-eqz v3, :cond_54

    invoke-virtual {v2}, Loj9;->a()Lnj9;

    move-result-object v2

    iput-wide v0, v2, Lnj9;->r:J

    new-instance v0, Loj9;

    invoke-direct {v0, v2}, Loj9;-><init>(Lnj9;)V

    iput-object v0, p0, Lshf;->a:Ljava/lang/Object;

    iget-object v1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lhyl;

    invoke-interface {v1, v0}, Lhyl;->g(Loj9;)V

    :cond_54
    invoke-virtual {p1}, Lg1g;->a()I

    move-result v10

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Lhyl;

    invoke-interface {v0, v10, p1}, Lhyl;->f(ILg1g;)V

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lhyl;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x1

    invoke-interface/range {v6 .. v12}, Lhyl;->a(JIIILgyl;)V

    :cond_6a
    return-void

    :goto_6b
    :try_start_6b
    monitor-exit v2
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_6d

    throw p0

    :catchall_6d
    move-exception v0

    move-object p0, v0

    goto :goto_6b

    :goto_70
    :try_start_70
    monitor-exit v1
    :try_end_71
    .catchall {:try_start_70 .. :try_end_71} :catchall_72

    throw p0

    :catchall_72
    move-exception v0

    move-object p0, v0

    goto :goto_70
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lnh4;

    sget-object v1, Lt0i;->b:Lp0i;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ldeg;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Ldeg;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lbp;

    invoke-virtual {p0}, Lbp;->W()V

    return-void
.end method

.method public final e(Lpql;Len8;Ls7m;)V
    .registers 4

    iput-object p1, p0, Lshf;->b:Ljava/lang/Object;

    invoke-virtual {p3}, Ls7m;->a()V

    invoke-virtual {p3}, Ls7m;->b()V

    iget p1, p3, Ls7m;->d:I

    const/4 p3, 0x5

    invoke-interface {p2, p1, p3}, Len8;->track(II)Lhyl;

    move-result-object p1

    iput-object p1, p0, Lshf;->c:Ljava/lang/Object;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Loj9;

    invoke-interface {p1, p0}, Lhyl;->g(Loj9;)V

    return-void
.end method

.method public final f(Landroidx/fragment/app/r;)V
    .registers 5

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_5
    new-instance v1, Lpsf;

    invoke-direct {v1, p1}, Lpsf;-><init>(Landroidx/fragment/app/r;)V

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_24

    const/4 p0, 0x1

    iput-boolean p0, v1, Lpsf;->b:Z

    iget-object p1, v1, Lpsf;->c:Landroidx/fragment/app/r;

    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/osp/OspCollectorService;

    invoke-direct {v0, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0, v1, p0}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void

    :goto_22
    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_24

    throw p0

    :catchall_24
    move-exception p0

    goto :goto_22
.end method

.method public final g(Lcm;)V
    .registers 3

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Lrhf;

    sget-object v0, Lv50;->b:Lv50;

    invoke-virtual {p0, p1, v0}, Lrn;->h(Lcm;Lv50;)V

    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lqh;

    iget-object v0, v0, Lqh;->a:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroid/content/Context;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lo7h;

    invoke-interface {v0}, Ln7h;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lydi;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ls16;

    invoke-virtual {p0}, Ls16;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lno2;

    new-instance v1, Lx77;

    const/16 v6, 0x12

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v6}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    return-object v1
.end method

.method public final h()Lpxh;
    .registers 4

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Ltxh;

    const v2, 0x7f120045

    invoke-direct {v1, p0, v2, v0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    return-object v1
.end method

.method public final i()Ldbi;
    .registers 5

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lvai;

    const/4 v1, 0x0

    if-eqz v0, :cond_a5

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/math/BigInteger;

    if-eqz v0, :cond_9f

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    iget-object v2, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Lvai;

    iget v3, v2, Lvai;->a:I

    if-ne v0, v3, :cond_91

    invoke-virtual {v2}, Lvai;->a()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_2b

    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_2b
    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lvai;

    invoke-virtual {v0}, Lvai;->a()Z

    move-result v0

    if-nez v0, :cond_41

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_41

    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_41
    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lvai;

    iget-object v0, v0, Lvai;->c:Luai;

    sget-object v2, Luai;->e:Luai;

    if-ne v0, v2, :cond_4e

    sget-object v0, Ljuf;->a:Lm54;

    goto :goto_7f

    :cond_4e
    sget-object v2, Luai;->d:Luai;

    if-eq v0, v2, :cond_73

    sget-object v2, Luai;->c:Luai;

    if-eq v0, v2, :cond_73

    sget-object v2, Luai;->b:Luai;

    if-ne v0, v2, :cond_67

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->b(I)Lm54;

    move-result-object v0

    goto :goto_7f

    :cond_67
    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lvai;

    iget-object p0, p0, Lvai;->c:Luai;

    const-string v0, "Unknown RsaSsaPssParameters.Variant: "

    invoke-static {p0, v0}, Lj9h;->u(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    :cond_73
    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->a(I)Lm54;

    move-result-object v0

    :goto_7f
    new-instance v1, Ldbi;

    iget-object v2, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Lvai;

    iget-object v3, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v3, Ljava/math/BigInteger;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-direct {v1, v2, v3, v0, p0}, Ldbi;-><init>(Lvai;Ljava/math/BigInteger;Lm54;Ljava/lang/Integer;)V

    return-object v1

    :cond_91
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v1, "Got modulus size "

    const-string v2, ", but parameters requires modulus size "

    invoke-static {v0, v3, v1, v2}, Lsko;->h(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9f
    const-string p0, "Cannot build without modulus"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_a5
    const-string p0, "Cannot build without parameters"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final j(JJLjava/lang/String;I)Ljava/lang/String;
    .registers 14

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    :goto_e
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    if-ge v3, v4, :cond_a4

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_32

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a0

    :cond_32
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_57

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a0

    :cond_57
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_7c

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a0

    :cond_7c
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_a0

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_a0
    :goto_a0
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_e

    :cond_a4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-virtual {v5, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final k()I
    .registers 7

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkl5;

    iget-object p0, p0, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    invoke-static {p0, v0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v2, :cond_40

    const/4 v5, 0x1

    if-eq v2, v5, :cond_38

    if-eq v2, v4, :cond_30

    const/4 v5, 0x3

    if-eq v2, v5, :cond_30

    invoke-static {}, Lh9o;->p()V

    return v3

    :cond_30
    const v2, 0x7f070978

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_47

    :cond_38
    const v2, 0x7f070979

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_47

    :cond_40
    const v2, 0x7f070977

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_47
    const v5, 0x7f070976

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sub-int/2addr p0, v1

    div-int/2addr p0, v4

    const v1, 0x7f0408e3

    invoke-static {v1, v0, v3}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v0

    if-ge p0, v0, :cond_5a

    move p0, v0

    :cond_5a
    if-ge v2, p0, :cond_5d

    return p0

    :cond_5d
    return v2
.end method

.method public final l()V
    .registers 13

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lfnh;

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lk6l;

    sget-object v8, Lh6l;->b:Lh6l;

    invoke-virtual {v7, v8}, Lk6l;->h(Lh6l;)V

    :try_start_15
    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v9, 0x0

    move v2, v9

    :goto_1f
    if-ge v2, v0, :cond_90

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v10, v2, 0x1

    check-cast v3, Lw6l;

    invoke-virtual {v3}, Lw6l;->a()I

    move-result v2

    iget-object v4, v7, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v2, v4, :cond_37

    move v5, v4

    goto :goto_38

    :cond_37
    move v5, v2

    :goto_38
    instance-of v2, v3, Lu6l;

    const/4 v4, 0x1

    if-eqz v2, :cond_3f

    move v2, v9

    goto :goto_46

    :cond_3f
    instance-of v2, v3, Lv6l;

    if-eqz v2, :cond_45

    move v2, v4

    goto :goto_46

    :cond_45
    const/4 v2, -0x2

    :goto_46
    if-eqz v2, :cond_66

    if-ne v2, v4, :cond_60

    move-object v2, v3

    check-cast v2, Lv6l;

    iget v2, v2, Lv6l;->b:I

    move-object v4, v3

    check-cast v4, Lv6l;

    iget-object v4, v4, Lv6l;->c:Ljava/lang/String;

    check-cast v3, Lv6l;

    iget-object v3, v3, Lv6l;->d:Lcom/opera/android/browser/TabInfo;

    const/4 v6, 0x0

    move-object v11, v4

    move-object v4, v3

    move-object v3, v11

    invoke-virtual/range {v1 .. v6}, Lfnh;->a(ILjava/lang/String;Lcom/opera/android/browser/TabInfo;IZ)V

    goto :goto_8e

    :cond_60
    new-instance p0, Loye;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :cond_66
    move-object v2, v3

    check-cast v2, Lu6l;

    iget-object v2, v2, Lu6l;->b:Ljava/lang/String;

    sget-object v6, Llqm;->d:Llqm;

    invoke-static {v2, v6, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v2

    invoke-virtual {v2, v4}, Lvx3;->c(Z)V

    iput v5, v2, Lvx3;->j:I

    invoke-virtual {v2, v4}, Lvx3;->e(Z)V

    check-cast v3, Lu6l;

    iget-object v3, v3, Lu6l;->c:Lcom/opera/android/browser/TabInfo;

    iput-object v3, v2, Lvx3;->h:Lcom/opera/android/browser/TabInfo;

    iput v4, v2, Lvx3;->d:I

    invoke-virtual {v2, v9}, Lvx3;->d(Z)V

    iput-boolean v9, v2, Lvx3;->f:Z

    new-instance v3, Lay3;

    invoke-direct {v3, v2}, Lay3;-><init>(Lvx3;)V

    invoke-static {v3}, Lac8;->a(Ljava/lang/Object;)V

    :goto_8e
    move v2, v10

    goto :goto_1f

    :cond_90
    invoke-static {v7}, Lexg;->d(Lk6l;)V
    :try_end_93
    .catchall {:try_start_15 .. :try_end_93} :catchall_97

    invoke-virtual {v7, v8}, Lk6l;->n(Lh6l;)V

    return-void

    :catchall_97
    move-exception v0

    move-object p0, v0

    invoke-virtual {v7, v8}, Lk6l;->n(Lh6l;)V

    throw p0
.end method

.method public final m(Lfvh;Ljava/lang/String;Lb94;I)V
    .registers 12

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    invoke-static {p1, v0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    new-instance v1, Lpyl;

    move-object v5, p0

    move-object v6, p1

    move-object v3, p2

    move-object v2, p3

    move v4, p4

    invoke-direct/range {v1 .. v6}, Lpyl;-><init>(Lb94;Ljava/lang/String;ILshf;Lfvh;)V

    invoke-interface {v0, v1}, Lv84;->enqueue(Lf94;)V

    return-void
.end method

.method public final n(Lu5;)V
    .registers 5

    iget-object v0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    iget-object v1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3d

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_38

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, p0}, Lu5;->b(Lshf;)V

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3d

    const-class p0, Lgw5;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_34

    const/4 p0, 0x0

    invoke-virtual {v1, p0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void

    :cond_34
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_38
    const-string p0, "Cyclic dependency chain found: "

    invoke-static {v0, p0}, Lpza;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3d
    return-void
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lbp;

    invoke-virtual {p0}, Lbp;->V()V

    return-void
.end method

.method public final onAdLoaded(Ljava/lang/Object;)V
    .registers 16

    move-object v9, p1

    check-cast v9, Lbie;

    iget-object p1, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p1, Lrhf;

    iget-object v6, p1, Lk43;->c:Ljava/lang/String;

    iget-object v7, p1, Lk43;->d:Ldl;

    sget v0, Loo8;->s:I

    add-int/lit8 v10, v0, 0x1

    sput v10, Loo8;->s:I

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Lbp;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Loo8;

    iget-object v12, p0, Lbqi;->h:Li3j;

    iget-object v13, p0, Lbqi;->i:Lap;

    new-instance v0, Lgnf;

    invoke-virtual {v9}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    const/4 v1, 0x0

    if-eqz p0, :cond_34

    iget-object p0, p0, Lc4p;->i:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_35

    :cond_34
    move-object p0, v1

    :goto_35
    const-string v2, ""

    if-nez p0, :cond_3a

    move-object p0, v2

    :cond_3a
    invoke-virtual {v9}, Lbie;->f()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_41

    move-object v3, v2

    :cond_41
    invoke-virtual {v9}, Lbie;->c()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_48

    move-object v2, v4

    :cond_48
    iget-object v4, v9, Lbie;->e:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqhe;

    if-eqz v4, :cond_5b

    iget-object v4, v4, Lqhe;->a:Landroid/net/Uri;

    if-eqz v4, :cond_5b

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_5c

    :cond_5b
    move-object v4, v1

    :goto_5c
    iget-object v5, v9, Lbie;->d:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqhe;

    if-eqz v5, :cond_6f

    iget-object v5, v5, Lqhe;->a:Landroid/net/Uri;

    if-eqz v5, :cond_6f

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_70

    :cond_6f
    move-object v5, v1

    :goto_70
    invoke-virtual {v9}, Lbie;->b()Lo7p;

    move-result-object v8

    invoke-virtual {v8}, Lo7p;->j()Lc4p;

    move-result-object v8

    if-eqz v8, :cond_82

    iget-object v1, v8, Lc4p;->n:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :cond_82
    move-object v8, v3

    move-object v3, v2

    move-object v2, v8

    move-object v8, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v13}, Lgnf;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lbie;ILbp;Li3j;Lap;)V

    invoke-virtual {p1, v0}, Lk43;->d(Laqi;)V

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 6

    iget-object p1, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p1, Lxwg;

    const/4 v0, 0x0

    iput-object v0, p1, Lxwg;->e:Lsr9;

    iget-object p1, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_16
    if-ge v1, v0, :cond_2a

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lrb4;

    iget-object v3, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v3, Lud4;

    check-cast v3, Lxd4;

    invoke-interface {v3, v2}, Lxd4;->v(Lrb4;)V

    goto :goto_16

    :cond_2a
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_2d
    return-void
.end method

.method public final onSuccess()V
    .registers 3

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lnh4;

    sget-object v1, Lt0i;->b:Lp0i;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ldeg;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Ldeg;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    .line 23
    check-cast p1, Ljava/lang/Void;

    .line 24
    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Lxwg;

    const/4 p1, 0x0

    iput-object p1, p0, Lxwg;->e:Lsr9;

    return-void
.end method

.method public final p()V
    .registers 2

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/textclassifier/TextClassifier;

    if-eqz v0, :cond_16

    invoke-interface {v0}, Landroid/view/textclassifier/TextClassifier;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/textclassifier/TextClassifier;

    invoke-interface {v0}, Landroid/view/textclassifier/TextClassifier;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lshf;->b:Ljava/lang/Object;

    :cond_16
    return-void
.end method

.method public final q()V
    .registers 3

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    if-eqz p0, :cond_1e

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_1e
    return-void
.end method

.method public final r(Z)V
    .registers 5

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ln4h;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v1, -0x1

    iput v1, p0, Ln4h;->a:I

    const/4 v2, 0x0

    iput v2, p0, Ln4h;->b:I

    if-eqz p1, :cond_32

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result p1

    if-nez p1, :cond_32

    iget p1, p0, Ln4h;->a:I

    const/16 v0, 0x64

    if-eq p1, v1, :cond_25

    iput v0, p0, Ln4h;->b:I

    return-void

    :cond_25
    iget-object p0, p0, Ln4h;->c:Lshf;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setProgress(I)V

    return-void

    :cond_32
    invoke-virtual {v0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->d()V

    return-void
.end method

.method public final y(Lqsm;)Ljava/util/ArrayList;
    .registers 16

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lxd4;

    move-object v1, p1

    check-cast v1, Lhya;

    sget-object v2, Lhya;->vp:Lan2;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_18

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_19

    :cond_18
    move-object v4, v3

    :goto_19
    if-eqz v4, :cond_1c

    return-object v4

    :cond_1c
    sget-object v2, Lhya;->up:Lan2;

    invoke-interface {v1, v2, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzxh;

    sget-object v4, Lhya;->tp:Lan2;

    invoke-interface {v1, v4, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {p1}, Ltxa;->m()I

    move-result v5

    if-eqz v4, :cond_51

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_36
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_51

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Pair;

    iget-object v7, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, v5, :cond_36

    iget-object v4, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, [Landroid/util/Size;

    goto :goto_52

    :cond_51
    move-object v4, v3

    :goto_52
    if-nez v4, :cond_56

    move-object v4, v3

    goto :goto_5a

    :cond_56
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    :goto_5a
    if-nez v4, :cond_60

    invoke-interface {v0, v5}, Lxd4;->t(I)Ljava/util/List;

    move-result-object v4

    :cond_60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v4, Luc5;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Luc5;-><init>(BZ)V

    invoke-static {v0, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    if-nez v2, :cond_206

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Lw5a;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7f

    return-object v0

    :cond_7f
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v0, Luc5;

    invoke-direct {v0, v5, v6}, Luc5;-><init>(BZ)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Lhya;

    sget-object v2, Lhya;->rp:Lan2;

    invoke-interface {p1, v2, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Size;

    if-eqz v2, :cond_b2

    invoke-static {v4}, Lqpj;->a(Landroid/util/Size;)I

    move-result v7

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v8

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v9

    mul-int/2addr v9, v8

    if-ge v7, v9, :cond_b3

    :cond_b2
    move-object v2, v4

    :cond_b3
    invoke-virtual {p0, p1}, Lw5a;->a(Lhya;)Landroid/util/Size;

    move-result-object v4

    sget-object v7, Lqpj;->c:Landroid/util/Size;

    invoke-static {v7}, Lqpj;->a(Landroid/util/Size;)I

    move-result v8

    invoke-static {v2}, Lqpj;->a(Landroid/util/Size;)I

    move-result v9

    if-ge v9, v8, :cond_c6

    sget-object v7, Lqpj;->a:Landroid/util/Size;

    goto :goto_d4

    :cond_c6
    if-eqz v4, :cond_d4

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v9

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v10

    mul-int/2addr v10, v9

    if-ge v10, v8, :cond_d4

    move-object v7, v4

    :cond_d4
    :goto_d4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v5

    :cond_d9
    :goto_d9
    if-ge v9, v8, :cond_10b

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Landroid/util/Size;

    invoke-static {v10}, Lqpj;->a(Landroid/util/Size;)I

    move-result v11

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v12

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v13

    mul-int/2addr v13, v12

    if-gt v11, v13, :cond_d9

    invoke-virtual {v10}, Landroid/util/Size;->getWidth()I

    move-result v11

    invoke-virtual {v10}, Landroid/util/Size;->getHeight()I

    move-result v12

    mul-int/2addr v12, v11

    invoke-static {v7}, Lqpj;->a(Landroid/util/Size;)I

    move-result v11

    if-lt v12, v11, :cond_d9

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_d9

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d9

    :cond_10b
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1e2

    sget-object v1, Lhya;->kp:Lan2;

    invoke-interface {p1, v1}, Lskh;->g(Lan2;)Z

    move-result v2

    if-eqz v2, :cond_12a

    invoke-interface {p1, v1}, Lskh;->i(Lan2;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-boolean v2, p0, Lw5a;->c:Z

    invoke-static {v1, v2}, Lshf;->z(IZ)Landroid/util/Rational;

    move-result-object v1

    goto :goto_15d

    :cond_12a
    invoke-virtual {p0, p1}, Lw5a;->a(Lhya;)Landroid/util/Size;

    move-result-object v1

    if-eqz v1, :cond_15c

    invoke-static {v0}, Lshf;->x(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v5

    :cond_139
    if-ge v8, v7, :cond_14d

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Landroid/util/Rational;

    sget-object v10, Lqpj;->c:Landroid/util/Size;

    invoke-static {v1, v9, v10}, Lua2;->a(Landroid/util/Size;Landroid/util/Rational;Landroid/util/Size;)Z

    move-result v10

    if-eqz v10, :cond_139

    move-object v1, v9

    goto :goto_15d

    :cond_14d
    new-instance v2, Landroid/util/Rational;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-direct {v2, v7, v1}, Landroid/util/Rational;-><init>(II)V

    move-object v1, v2

    goto :goto_15d

    :cond_15c
    move-object v1, v3

    :goto_15d
    if-nez v4, :cond_168

    sget-object v2, Lhya;->qp:Lan2;

    invoke-interface {p1, v2, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/util/Size;

    :cond_168
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/HashMap;

    if-nez v1, :cond_17a

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    if-eqz v4, :cond_1e1

    invoke-static {p1, v4, v6}, Lshf;->J(Ljava/util/List;Landroid/util/Size;Z)V

    return-object p1

    :cond_17a
    invoke-static {v0}, Lshf;->A(Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v0

    if-eqz v4, :cond_19e

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_188
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Rational;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-static {v3, v4, v6}, Lshf;->J(Ljava/util/List;Landroid/util/Size;Z)V

    goto :goto_188

    :cond_19e
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v3, Lta2;

    iget-object p0, p0, Lw5a;->d:Ljava/io/Serializable;

    check-cast p0, Landroid/util/Rational;

    invoke-direct {v3, v1, p0}, Lta2;-><init>(Landroid/util/Rational;Landroid/util/Rational;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    :cond_1b7
    if-ge v5, p0, :cond_1e1

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v5, v5, 0x1

    check-cast v1, Landroid/util/Rational;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1cb
    :goto_1cb
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1cb

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1cb

    :cond_1e1
    return-object p1

    :cond_1e2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "All supported output sizes are filtered out according to current resolution selection settings. \nminSize = "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\nmaxSize = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\ninitial size list: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_206
    move-object v2, p1

    check-cast v2, Lhya;

    sget-object v4, Lhya;->rp:Lan2;

    invoke-interface {v2, v4, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    invoke-interface {v1, v5}, Lhya;->u(I)I

    move-result v4

    sget-object v7, Lqsm;->Rp:Lan2;

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p1, v7, v8}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-nez v7, :cond_228

    invoke-interface {p1}, Ltxa;->m()I

    :cond_228
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    sget-object p1, Lhya;->up:Lan2;

    invoke-interface {v1, p1}, Lskh;->i(Lan2;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzxh;

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/Rational;

    iget-object v1, p1, Lzxh;->a:Lsa2;

    invoke-static {v0}, Lshf;->A(Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v0

    if-eqz p0, :cond_24e

    invoke-virtual {p0}, Landroid/util/Rational;->getNumerator()I

    move-result v7

    invoke-virtual {p0}, Landroid/util/Rational;->getDenominator()I

    move-result v8

    if-ge v7, v8, :cond_24e

    move v7, v5

    goto :goto_24f

    :cond_24e
    move v7, v6

    :goto_24f
    iget v1, v1, Lsa2;->b:I

    invoke-static {v1, v7}, Lshf;->z(IZ)Landroid/util/Rational;

    move-result-object v1

    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v8, Lta2;

    invoke-direct {v8, v1, p0}, Lta2;-><init>(Landroid/util/Rational;Landroid/util/Rational;)V

    invoke-static {v7, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v8, v5

    :goto_270
    if-ge v8, v1, :cond_284

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Landroid/util/Rational;

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-virtual {p0, v9, v10}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_270

    :cond_284
    if-eqz v2, :cond_2d1

    sget-object v0, Lqpj;->a:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v1

    mul-int/2addr v1, v0

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_299
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2b4
    :goto_2b4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2ca

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/util/Size;

    invoke-static {v9}, Lqpj;->a(Landroid/util/Size;)I

    move-result v10

    if-gt v10, v1, :cond_2b4

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2b4

    :cond_2ca
    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-interface {v2, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_299

    :cond_2d1
    iget-object v0, p1, Lzxh;->b:Layh;

    if-eqz v0, :cond_327

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2dd
    :goto_2dd
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_327

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2dd

    iget-boolean v7, v0, Layh;->b:Z

    sget-object v8, Layh;->c:Layh;

    if-eq v0, v8, :cond_2dd

    iget-object v8, v0, Layh;->a:Landroid/util/Size;

    if-eqz v7, :cond_31a

    if-eq v7, v6, :cond_316

    const/4 v9, 0x2

    if-eq v7, v9, :cond_312

    const/4 v9, 0x3

    if-eq v7, v9, :cond_30e

    const/4 v9, 0x4

    if-ne v7, v9, :cond_2dd

    invoke-static {v2, v8, v5}, Lshf;->K(Ljava/util/List;Landroid/util/Size;Z)V

    goto :goto_2dd

    :cond_30e
    invoke-static {v2, v8, v6}, Lshf;->K(Ljava/util/List;Landroid/util/Size;Z)V

    goto :goto_2dd

    :cond_312
    invoke-static {v2, v8, v5}, Lshf;->J(Ljava/util/List;Landroid/util/Size;Z)V

    goto :goto_2dd

    :cond_316
    invoke-static {v2, v8, v6}, Lshf;->J(Ljava/util/List;Landroid/util/Size;Z)V

    goto :goto_2dd

    :cond_31a
    invoke-interface {v2, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    invoke-interface {v2}, Ljava/util/List;->clear()V

    if-eqz v7, :cond_2dd

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2dd

    :cond_327
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_334
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_35a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_344
    :goto_344
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_334

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_344

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_344

    :cond_35a
    iget-object p0, p1, Lzxh;->c:Lbm8;

    if-nez p0, :cond_35f

    return-object v0

    :cond_35f
    invoke-static {v4}, Lkfo;->f0(I)I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/Size;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_37c

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_37c
    invoke-interface {v0, v1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_383

    return-object v1

    :cond_383
    const-string p0, "The returned sizes list of the resolution filter must be a subset of the provided sizes list."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3
.end method
