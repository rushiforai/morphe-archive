.class public final Lfko;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lejo;

.field public static final b:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public static c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    sput-object v0, Lfko;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .registers 4

    sget-object v0, Lfko;->a:Lejo;

    instance-of v1, v0, Lbko;

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    check-cast v0, Lbko;

    goto :goto_b

    :cond_a
    move-object v0, v2

    :goto_b
    if-eqz v0, :cond_27

    sget-object v1, Lr8p;->a:Ljava/util/List;

    :goto_f
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_22

    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_1b

    move-object v2, p0

    check-cast v2, Landroid/app/Activity;

    goto :goto_22

    :cond_1b
    check-cast p0, Landroid/content/ContextWrapper;

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_f

    :cond_22
    :goto_22
    if-eqz v2, :cond_27

    invoke-virtual {v0, v2}, Lbko;->h(Landroid/app/Activity;)V

    :cond_27
    return-void
.end method

.method public static b(Landroid/view/ViewGroup;)V
    .registers 3

    sget-object v0, Lfko;->a:Lejo;

    instance-of v1, v0, Lbko;

    if-eqz v1, :cond_9

    check-cast v0, Lbko;

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    if-eqz v0, :cond_15

    invoke-static {p0}, Lxgh;->b(Landroid/view/ViewGroup;)Landroid/app/Activity;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {v0, p0}, Lbko;->h(Landroid/app/Activity;)V

    :cond_15
    return-void
.end method

.method public static final c(Ltcc;)V
    .registers 3

    check-cast p0, Lqdc;

    iget-object v0, p0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->c:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    sget-object v0, Lfko;->a:Lejo;

    instance-of v0, v0, Lzoo;

    if-nez v0, :cond_32

    sget-boolean v0, Lfko;->c:Z

    if-eqz v0, :cond_1d

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v0, Lqcc;->d:Lqcc;

    invoke-virtual {p0, v0}, Lqcc;->d(Lqcc;)Z

    move-result p0

    if-eqz p0, :cond_32

    :cond_1d
    sget-object p0, Lfko;->a:Lejo;

    if-eqz p0, :cond_24

    invoke-virtual {p0}, Lejo;->b()V

    :cond_24
    new-instance p0, Lzoo;

    new-instance v0, Lh9o;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lh9o;-><init>(B)V

    invoke-direct {p0, v0}, Lzoo;-><init>(Lh9o;)V

    sput-object p0, Lfko;->a:Lejo;

    :cond_32
    return-void
.end method

.method public static d(Z)V
    .registers 3

    sget-boolean v0, Lfko;->c:Z

    if-eq v0, p0, :cond_21

    sput-boolean p0, Lfko;->c:Z

    if-eqz p0, :cond_b

    sget-object p0, Lpgo;->a:Lpgo;

    goto :goto_d

    :cond_b
    sget-object p0, Lhho;->a:Lhho;

    :goto_d
    sget-object v0, Lfko;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    :cond_21
    return-void
.end method
