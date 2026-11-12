.class public final Lwzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luu5;
.implements Lbnj;
.implements Lrr9;
.implements Lrba;
.implements Lhpf;
.implements Ldn;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lwzg;->a:B

    sparse-switch p1, :sswitch_data_3c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    new-instance p1, Lkze;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    return-void

    :sswitch_19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ldfe;

    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/ref/Reference;

    invoke-direct {p1, v0}, Ldfe;-><init>([Ljava/lang/Object;)V

    iput-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    new-instance p1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {p1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    return-void

    :sswitch_2f
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_3c
    .sparse-switch
        0x1 -> :sswitch_2f
        0xd -> :sswitch_19
    .end sparse-switch
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 67
    iput-byte p1, p0, Lwzg;->a:B

    iput-object p3, p0, Lwzg;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwzg;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Luu1;)V
    .registers 3

    const/4 p2, 0x3

    iput-byte p2, p0, Lwzg;->a:B

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const p2, 0x7f0a08e7

    .line 63
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lwzg;->b:Ljava/lang/Object;

    .line 64
    iput-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lwzg;->a:B

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld7h;Liu2;)V
    .registers 4

    const/16 v0, 0xb

    iput-byte v0, p0, Lwzg;->a:B

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwzg;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 60
    iput-byte p3, p0, Lwzg;->a:B

    iput-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwzg;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static b(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_11

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v0, 0x2f

    if-ne p0, v0, :cond_11

    const/4 p0, 0x1

    return p0

    :cond_11
    return v1
.end method


# virtual methods
.method public final F(Landroid/graphics/Bitmap;)V
    .registers 3

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/favorites/SpeedDialDataFetcher;->finalizeAndSetIcon(Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.method public final I(Lfpf;)V
    .registers 3

    iget-object v0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Ld7h;

    iget-object p1, p1, Lfpf;->d:Ljava/lang/String;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Liu2;

    invoke-virtual {v0, p1, p0}, Ld7h;->c(Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final a(Lnyb;Lmt5;)Ljava/io/Serializable;
    .registers 10

    instance-of v0, p2, Lx0i;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lx0i;

    iget v1, v0, Lx0i;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lx0i;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lx0i;

    invoke-direct {v0, p0, p2}, Lx0i;-><init>(Lwzg;Lmt5;)V

    :goto_18
    iget-object p2, v0, Lx0i;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lx0i;->x:I

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_3a

    if-eq v2, v5, :cond_32

    if-ne v2, v3, :cond_2c

    :try_start_27
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2a
    .catch Ljava/util/concurrent/CancellationException; {:try_start_27 .. :try_end_2a} :catch_b5
    .catchall {:try_start_27 .. :try_end_2a} :catchall_a7

    goto/16 :goto_a3

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    iget-object p0, v0, Lx0i;->u:Ls9m;

    iget-object p1, v0, Lx0i;->t:Lnyb;

    :try_start_36
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_39
    .catch Ljava/util/concurrent/CancellationException; {:try_start_36 .. :try_end_39} :catch_b5
    .catchall {:try_start_36 .. :try_end_39} :catchall_a7

    goto :goto_89

    :cond_3a
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    if-nez p1, :cond_41

    const/4 p2, -0x1

    goto :goto_4e

    :cond_41
    :try_start_41
    instance-of p2, p1, Lmyb;

    if-eqz p2, :cond_47

    const/4 p2, 0x0

    goto :goto_4e

    :cond_47
    instance-of p2, p1, Llyb;

    if-eqz p2, :cond_4d

    move p2, v5

    goto :goto_4e

    :cond_4d
    const/4 p2, -0x2

    :goto_4e
    if-eqz p2, :cond_64

    if-ne p2, v5, :cond_5e

    sget-object p0, Lt0i;->b:Lp0i;

    check-cast p1, Llyb;

    iget-object p0, p1, Llyb;->a:Ljava/lang/Throwable;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    goto :goto_af

    :cond_5e
    new-instance p0, Loye;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :cond_64
    iget-object p2, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p2, Ls9m;

    iget-object p2, p2, Ls9m;->b:Ljava/util/List;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ls9m;

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Ljyb;

    invoke-virtual {p0, p2}, Ljyb;->a(Ls9m;)Luu5;

    move-result-object p0

    if-eqz p0, :cond_8c

    iput-object p1, v0, Lx0i;->t:Lnyb;

    iput-object p2, v0, Lx0i;->u:Ls9m;

    iput v5, v0, Lx0i;->x:I

    invoke-interface {p0, p1, v0}, Luu5;->l(Lnyb;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_a2

    move-object v6, p2

    move-object p2, p0

    move-object p0, v6

    :goto_89
    if-nez p2, :cond_a3

    move-object p2, p0

    :cond_8c
    check-cast p1, Lmyb;

    iget-object p0, p1, Lmyb;->a:Lfr6;

    iget-object p1, p2, Ls9m;->c:Lx9m;

    iput-object v4, v0, Lx0i;->t:Lnyb;

    iput-object v4, v0, Lx0i;->u:Ls9m;

    iput v3, v0, Lx0i;->x:I

    invoke-virtual {p0}, Lfr6;->T()Ltna;

    move-result-object p0

    invoke-virtual {p0, p1, v0}, Ltna;->b(Lx9m;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_a3

    :cond_a2
    return-object v1

    :cond_a3
    :goto_a3
    sget-object p0, Lt0i;->b:Lp0i;
    :try_end_a5
    .catch Ljava/util/concurrent/CancellationException; {:try_start_41 .. :try_end_a5} :catch_b5
    .catchall {:try_start_41 .. :try_end_a5} :catchall_a7

    move-object p1, p2

    goto :goto_af

    :catchall_a7
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_af
    new-instance p0, Lt0i;

    invoke-direct {p0, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p0

    :catch_b5
    move-exception p0

    throw p0
.end method

.method public final c(Lw8k;I)V
    .registers 6

    iget-object v0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, La5o;

    new-instance v1, Lmjf;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Lt1h;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2, p2}, Lmjf;-><init>(Lt1h;Lw8k;ZI)V

    invoke-virtual {v0, v1}, La5o;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Lioc;

    iget-object p0, p0, Lioc;->e:Ljava/lang/Object;

    check-cast p0, La4m;

    iget-object v0, p0, La4m;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "translate_web_pages.tap_to_access_feature_hint.shown"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object v0, p0, La4m;->j:Lf6l;

    if-nez v0, :cond_24

    return-void

    :cond_24
    iget-object v1, p0, La4m;->c:Lk6l;

    invoke-virtual {v1, v0}, Lk6l;->x(Lj6l;)V

    const/4 v0, 0x0

    iput-object v0, p0, La4m;->j:Lf6l;

    return-void
.end method

.method public final f(Z)V
    .registers 4

    iget-object v0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_16

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_16

    iget p1, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->e:I

    invoke-static {v0, p0, p1}, LJ/N;->MF7CqBEc(Ljava/lang/Object;Ljava/lang/Object;I)V

    return-void

    :cond_16
    const/4 p0, 0x0

    invoke-virtual {v0, p0, p1}, Lcom/opera/android/favorites/SpeedDialDataFetcher;->finalizeAndSetIcon(Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 3

    iget-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p1, Ld7h;

    iget-object p1, p1, Ld7h;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Liu2;

    const v0, 0x7f08042e

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final i()V
    .registers 3

    iget-object v0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Ljoo;

    iget-object v0, v0, Ljoo;->o:Llxo;

    iget-object v0, v0, Llxo;->p:Ldcl;

    iget-object v0, v0, Ldcl;->a:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-object v0, v0, Ldzo;->c:Lnyo;

    const-string v1, "javascript:(function() {var css = \'body { display: flex; justify-content: center; align-items: center; }\';var style = document.createElement(\'style\');style.type = \'text/css\';style.appendChild(document.createTextNode(css));document.head.appendChild(style);})()"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Ldn;

    invoke-interface {p0}, Ldn;->i()V

    return-void
.end method

.method public final bridge synthetic l(Lnyb;Lmt5;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lwzg;->a(Lnyb;Lmt5;)Ljava/io/Serializable;

    move-result-object p0

    return-object p0
.end method

.method public final n(Lepf;)V
    .registers 3

    iget-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p1, Ld7h;

    iget-object p1, p1, Ld7h;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Liu2;

    const v0, 0x7f08042e

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    iget-byte p1, p0, Lwzg;->a:B

    packed-switch p1, :pswitch_data_32

    iget-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p1, Lsup;

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v0, p1, Lsup;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_10
    iget-object p1, p1, Lsup;->e:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_19

    throw p0

    :catchall_19
    move-exception p0

    goto :goto_17

    :pswitch_1b
    iget-object p1, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p1, Lvko;

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v0, p1, Lvko;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_26
    iget-object p1, p1, Lvko;->e:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_2d
    monitor-exit v0
    :try_end_2e
    .catchall {:try_start_26 .. :try_end_2e} :catchall_2f

    throw p0

    :catchall_2f
    move-exception p0

    goto :goto_2d

    nop

    :pswitch_data_32
    .packed-switch 0x10
        :pswitch_1b
    .end packed-switch
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 7

    iget-object v0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Lnbl;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Lyqa;

    iget-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Lxwh;

    iget-boolean v1, v1, Lxwh;->f:Z

    if-eqz v1, :cond_11

    return-void

    :cond_11
    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lai4;

    iget-object p0, p0, Lai4;->e:Lhbl;

    const-string v1, "CAPTURE_CONFIG_ID_KEY"

    iget-object p0, p0, Lhbl;->a:Landroid/util/ArrayMap;

    invoke-virtual {p0, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_2a

    const/4 p0, -0x1

    goto :goto_30

    :cond_2a
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    :goto_30
    instance-of v1, p1, Lgwa;

    iget-object v2, v0, Lnbl;->c:Lr9i;

    if-eqz v1, :cond_4d

    check-cast p1, Lgwa;

    new-instance v1, Lap2;

    invoke-direct {v1, p0, p1}, Lap2;-><init>(ILgwa;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iget-object p0, v2, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lxm2;

    iget-object p0, p0, Lxm2;->k:Lms7;

    invoke-virtual {p0, v1}, Lms7;->accept(Ljava/lang/Object;)V

    goto :goto_69

    :cond_4d
    new-instance v1, Lgwa;

    const/4 v3, 0x2

    const-string v4, "Failed to submit capture request"

    invoke-direct {v1, v3, v4, p1}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    new-instance p1, Lap2;

    invoke-direct {p1, p0, v1}, Lap2;-><init>(ILgwa;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iget-object p0, v2, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lxm2;

    iget-object p0, p0, Lxm2;->k:Lms7;

    invoke-virtual {p0, p1}, Lms7;->accept(Ljava/lang/Object;)V

    :goto_69
    iget-object p0, v0, Lnbl;->b:Leq6;

    invoke-virtual {p0}, Leq6;->P()V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Lnbl;

    iget-object p0, p0, Lnbl;->b:Leq6;

    invoke-virtual {p0}, Leq6;->P()V

    return-void
.end method

.method public final p(Lbm;)V
    .registers 2

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Ldn;

    invoke-interface {p0, p1}, Ldn;->p(Lbm;)V

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 3

    iget-object p1, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p1, Ld7h;

    iget-object p1, p1, Ld7h;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Liu2;

    const v0, 0x7f08042e

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Lioc;

    iget-object v0, v0, Lioc;->e:Ljava/lang/Object;

    check-cast v0, La4m;

    iget-object v0, v0, La4m;->f:Lkwf;

    const v1, 0x7f0a07fb

    iput v1, v0, Lo73;->i:I

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public final z()V
    .registers 1

    return-void
.end method
