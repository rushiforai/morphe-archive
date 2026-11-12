.class public final Las2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lkd6;

.field public final b:Lumi;

.field public c:Lkotlin/jvm/functions/Function0;

.field public d:Lt3g;

.field public e:Lcom/opera/api/Callback;

.field public final f:Lq65;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lkd6;->a:Lkd6;

    iput-object v0, p0, Las2;->a:Lkd6;

    sget-object v0, Lvml;->d:Lumi;

    iput-object v0, p0, Las2;->b:Lumi;

    new-instance v0, Lq02;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lq02;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq65;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Las2;->f:Lq65;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/ContextWrapper;Lcom/opera/api/Callback;)V
    .registers 8

    iget-object v0, p0, Las2;->a:Lkd6;

    sget-object v1, Lkd6;->c:Lkd6;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_12

    iput-object v2, p0, Las2;->e:Lcom/opera/api/Callback;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p2, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_12
    iget-object v0, p0, Las2;->e:Lcom/opera/api/Callback;

    if-eqz v0, :cond_20

    sget-object v1, Ljd6;->c:Ljd6;

    new-instance v3, Lrw7;

    invoke-direct {v3, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_20
    iput-object p2, p0, Las2;->e:Lcom/opera/api/Callback;

    iget-object p2, p0, Las2;->f:Lq65;

    iget-object v0, p0, Las2;->b:Lumi;

    const-wide/16 v3, 0x3e8

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v0, v3, v4, v1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iget-object p2, p0, Las2;->a:Lkd6;

    sget-object v0, Lkd6;->a:Lkd6;

    if-ne p2, v0, :cond_6d

    sget-object p2, Lkd6;->b:Lkd6;

    iput-object p2, p0, Las2;->a:Lkd6;

    sget-object p2, Le7d;->a:Ljava/lang/Object;

    monitor-enter p2

    :try_start_3a
    sget v0, Le7d;->b:I

    monitor-exit p2
    :try_end_3d
    .catchall {:try_start_3a .. :try_end_3d} :catchall_6b

    const/4 p2, 0x1

    if-ne v0, p2, :cond_4f

    new-instance p2, Ltjc;

    sget-object v0, Lvml;->d:Lumi;

    new-instance v1, Lfx0;

    const/16 v2, 0x9

    invoke-direct {v1, p0, p1, v2}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, p1, v0, v1}, Ltjc;-><init>(Landroid/content/ContextWrapper;Lumi;Lfx0;)V

    return-void

    :cond_4f
    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    iget-object p2, p2, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-eqz p2, :cond_5c

    move-object v2, p2

    :cond_5c
    invoke-static {p1, v2}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance p2, Lzr2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lzr2;-><init>(Las2;B)V

    invoke-static {p1, p2}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void

    :goto_69
    :try_start_69
    monitor-exit p2
    :try_end_6a
    .catchall {:try_start_69 .. :try_end_6a} :catchall_6b

    throw p0

    :catchall_6b
    move-exception p0

    goto :goto_69

    :cond_6d
    return-void
.end method

.method public final b(Ltw7;)V
    .registers 3

    iget-object v0, p0, Las2;->f:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Las2;->e:Lcom/opera/api/Callback;

    if-eqz v0, :cond_c

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_c
    const/4 p1, 0x0

    iput-object p1, p0, Las2;->e:Lcom/opera/api/Callback;

    return-void
.end method
