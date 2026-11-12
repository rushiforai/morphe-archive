.class public abstract Lcbp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:J

.field public static volatile b:Landroid/app/Application;

.field public static c:Lt0i;

.field public static d:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcbp;->a:J

    :try_start_6
    sget-object v0, Lt0i;->b:Lp0i;

    sget-boolean v0, Lfcp;->b:Z

    if-eqz v0, :cond_f

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_37

    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Required min SDK API level 24, but current API is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2e
    .catchall {:try_start_6 .. :try_end_2e} :catchall_2e

    :catchall_2e
    move-exception v0

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    :goto_37
    new-instance v1, Lt0i;

    invoke-direct {v1, v0}, Lt0i;-><init>(Ljava/lang/Object;)V

    instance-of v0, v0, Lq0i;

    if-nez v0, :cond_41

    const/4 v1, 0x0

    :cond_41
    sput-object v1, Lcbp;->c:Lt0i;

    return-void
.end method

.method public static a(Landroid/app/Application;Lypi;)V
    .registers 8

    iget-object v0, p1, Lypi;->a:Ljava/lang/String;

    const/4 v1, 0x0

    move v2, v1

    :goto_4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_17

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v3

    if-nez v3, :cond_17

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_17
    new-instance v0, Lkotlin/text/Regex;

    const-string v2, "^(pub\\d+)/(ep\\d+)/(app\\d+)$"

    invoke-direct {v0, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    iget-object v2, p1, Lypi;->a:Ljava/lang/String;

    invoke-static {v2}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/text/Regex;->d(Lkotlin/text/Regex;Ljava/lang/CharSequence;)Lucd;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_59

    invoke-virtual {v0}, Lucd;->a()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_59

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->G(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x2

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v3, Lynh;->c:Ljava/lang/String;

    sput-object v4, Lynh;->f:Ljava/lang/String;

    sput-object v0, Lynh;->e:Ljava/lang/String;

    iget-object v0, p1, Lypi;->b:Ljava/lang/String;

    sput-object v0, Lynh;->d:Ljava/lang/String;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_5a

    :cond_59
    const/4 v0, 0x0

    :goto_5a
    if-eqz v0, :cond_7f

    iget-object v0, p1, Lypi;->c:Lc30;

    sput-object v0, Lfcp;->c:Lc30;

    iget-object p1, p1, Lypi;->d:Ljava/lang/Integer;

    sput-object p1, Lmzg;->a:Ljava/lang/Integer;

    sget-object p1, Lqb7;->h:Ltmj;

    invoke-virtual {p1, p0}, Ltmj;->f(Landroid/content/Context;)Lqb7;

    move-result-object v0

    new-instance v2, Lfto;

    invoke-direct {v2, v1}, Lfto;-><init>(B)V

    invoke-virtual {v0, v2}, Lqb7;->a(Ln1p;)V

    invoke-virtual {p1, p0}, Ltmj;->f(Landroid/content/Context;)Lqb7;

    move-result-object p0

    new-instance p1, Lfto;

    invoke-direct {p1, v1}, Lfto;-><init>(B)V

    invoke-virtual {p0, p1}, Lqb7;->c(Ln1p;)V

    return-void

    :cond_7f
    new-instance p0, Lvjo;

    const-string p1, "Initialization failed due to malformed application id"

    invoke-direct {p0, v2, p1}, Lvjo;-><init>(ILjava/lang/String;)V

    throw p0
.end method

.method public static b(Landroid/content/Context;)V
    .registers 5

    sget-object v0, Lcbp;->b:Landroid/app/Application;

    const/4 v1, 0x0

    if-nez v0, :cond_75

    sget-object v0, Lfcp;->a:Lzyk;

    instance-of v0, p0, Landroid/app/Application;

    if-eqz v0, :cond_f

    move-object v0, p0

    check-cast v0, Landroid/app/Application;

    goto :goto_10

    :cond_f
    move-object v0, v1

    :goto_10
    if-nez v0, :cond_1e

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v2, v0, Landroid/app/Application;

    if-eqz v2, :cond_1d

    check-cast v0, Landroid/app/Application;

    goto :goto_1e

    :cond_1d
    move-object v0, v1

    :cond_1e
    :goto_1e
    if-eqz v0, :cond_22

    move-object v1, v0

    goto :goto_49

    :cond_22
    move-object v0, p0

    :cond_23
    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_49

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_49

    instance-of v2, v0, Landroid/app/Application;

    if-eqz v2, :cond_37

    move-object v2, v0

    check-cast v2, Landroid/app/Application;

    goto :goto_38

    :cond_37
    move-object v2, v1

    :goto_38
    if-nez v2, :cond_46

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    instance-of v3, v2, Landroid/app/Application;

    if-eqz v3, :cond_45

    check-cast v2, Landroid/app/Application;

    goto :goto_46

    :cond_45
    move-object v2, v1

    :cond_46
    :goto_46
    if-eqz v2, :cond_23

    move-object v1, v2

    :cond_49
    :goto_49
    sput-object v1, Lcbp;->b:Landroid/app/Application;

    sget-boolean v0, Lfcp;->b:Z

    if-eqz v0, :cond_b6

    sget-object v0, Lcbp;->b:Landroid/app/Application;

    if-eqz v0, :cond_b6

    sget-object v1, Lfko;->a:Lejo;

    if-nez v1, :cond_b6

    sget-object v1, Lfko;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    new-instance v1, Lbko;

    new-instance v2, Lh9o;

    const/16 v3, 0x9

    invoke-direct {v2, v3}, Lh9o;-><init>(B)V

    invoke-direct {v1, v0, v2}, Lbko;-><init>(Landroid/app/Application;Lh9o;)V

    sput-object v1, Lfko;->a:Lejo;

    new-instance v0, Lbw1;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lbw1;-><init>(B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_b6

    :cond_75
    sget-object v0, Lfcp;->a:Lzyk;

    instance-of v0, p0, Landroid/app/Application;

    if-eqz v0, :cond_7f

    move-object v0, p0

    check-cast v0, Landroid/app/Application;

    goto :goto_80

    :cond_7f
    move-object v0, v1

    :goto_80
    if-nez v0, :cond_8e

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v2, v0, Landroid/app/Application;

    if-eqz v2, :cond_8d

    check-cast v0, Landroid/app/Application;

    goto :goto_8e

    :cond_8d
    move-object v0, v1

    :cond_8e
    :goto_8e
    if-nez v0, :cond_b6

    move-object v0, p0

    :cond_91
    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_b6

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_b6

    instance-of v2, v0, Landroid/app/Application;

    if-eqz v2, :cond_a5

    move-object v2, v0

    check-cast v2, Landroid/app/Application;

    goto :goto_a6

    :cond_a5
    move-object v2, v1

    :goto_a6
    if-nez v2, :cond_b4

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    instance-of v3, v2, Landroid/app/Application;

    if-eqz v3, :cond_b3

    check-cast v2, Landroid/app/Application;

    goto :goto_b4

    :cond_b3
    move-object v2, v1

    :cond_b4
    :goto_b4
    if-eqz v2, :cond_91

    :cond_b6
    :goto_b6
    sget-boolean v0, Lfcp;->b:Z

    if-eqz v0, :cond_c3

    sget-object v0, Lcbp;->b:Landroid/app/Application;

    if-eqz v0, :cond_c3

    sget-object v0, Lfko;->a:Lejo;

    invoke-static {p0}, Lfko;->a(Landroid/content/Context;)V

    :cond_c3
    return-void
.end method

.method public static c(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 4

    sget-object v0, Lcbp;->c:Lt0i;

    if-eqz v0, :cond_10

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_20

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_10
    sget-object v0, Lcbp;->d:Ljava/util/ArrayList;

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    new-instance v1, Lwap;

    invoke-direct {v1, p0, p1}, Lwap;-><init>(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_20
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method
