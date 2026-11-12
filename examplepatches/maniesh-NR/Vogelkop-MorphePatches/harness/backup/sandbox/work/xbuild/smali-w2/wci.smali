.class public final Lwci;
.super Ljava/lang/Object;

# interfaces
.implements Lrr9;
.implements Lcom/opera/android/browser/dialog/DialogDelegate;
.implements Lcpp;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    const/4 v0, 0x3

    iput-byte v0, p0, Lwci;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwci;->b:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwci;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    .line 22
    iput-byte p1, p0, Lwci;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/16 v0, 0x9

    iput-byte v0, p0, Lwci;->a:B

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lwci;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 21
    iput-byte p3, p0, Lwci;->a:B

    iput-object p1, p0, Lwci;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwci;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)V
    .registers 3

    const/16 v0, 0xa

    iput-byte v0, p0, Lwci;->a:B

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lwci;->b:Ljava/lang/Object;

    .line 25
    new-instance p1, Ltvk;

    invoke-direct {p1, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lwci;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzkl;Landroid/graphics/SurfaceTexture;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Lwci;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwci;->c:Ljava/lang/Object;

    iput-object p2, p0, Lwci;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lnz0;)V
    .registers 3

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, p1, p0}, Laal;->Q(Lb87;Lb2l;)V

    return-void
.end method

.method public final b(Lqq6;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    new-instance v1, Lmpb;

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lmpb;-><init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, v1, p0}, Laal;->Q(Lb87;Lb2l;)V

    return-void
.end method

.method public final c(Ljava/util/List;Ljava/util/List;Lu59;)V
    .registers 5

    new-instance v0, Lgi4;

    invoke-direct {v0, p1, p2, p3}, Lgi4;-><init>(Ljava/util/List;Ljava/util/List;Lu59;)V

    invoke-virtual {p0, v0}, Lwci;->a(Lnz0;)V

    return-void
.end method

.method public final d(Lcej;)V
    .registers 3

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, p1, p0}, Laal;->R(Lcej;Lb2l;)V

    return-void
.end method

.method public final e(Lo93;)V
    .registers 4

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Laal;->S(Lo93;Lb2l;Z)V

    return-void
.end method

.method public final f(Lqq6;Z)V
    .registers 5

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    new-instance v1, Lkpb;

    invoke-direct {v1, p1, p2}, Lkpb;-><init>(Lqq6;Z)V

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, v1, p0}, Laal;->Q(Lb87;Lb2l;)V

    return-void
.end method

.method public final g(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V
    .registers 12

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    new-instance v1, Ljpb;

    const/4 v6, 0x0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Ljpb;-><init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;B)V

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, v1, p0}, Laal;->Q(Lb87;Lb2l;)V

    return-void
.end method

.method public final h(ILjava/lang/String;Lole;)V
    .registers 6

    if-eqz p1, :cond_5

    const/4 p1, 0x0

    move v0, p1

    goto :goto_b

    :cond_5
    const p1, 0x7f140d79

    const v0, 0x7f140d78

    :goto_b
    new-instance v1, Lu9g;

    invoke-direct {v1, p1, v0, p2, p3}, Lu9g;-><init>(IILjava/lang/String;Lole;)V

    invoke-virtual {p0, v1}, Lwci;->a(Lnz0;)V

    return-void
.end method

.method public final i()V
    .registers 2

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, p0}, Laal;->T(Lb2l;)V

    return-void
.end method

.method public final j(Ls2f;)V
    .registers 6

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lz9l;

    const/4 v2, 0x4

    const/4 v3, 0x1

    invoke-direct {v1, p0, v2, p1, v3}, Lz9l;-><init>(Lb2l;ILjjm;Z)V

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final k(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V
    .registers 12

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    new-instance v1, Ljpb;

    const/4 v6, 0x1

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Ljpb;-><init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;B)V

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, v1, p0}, Laal;->Q(Lb87;Lb2l;)V

    return-void
.end method

.method public final l(Lb87;)V
    .registers 2

    sget-object p0, Lhjm;->b:Lhjm;

    invoke-interface {p1, p0}, Ljjm;->finish(Lhjm;)V

    return-void
.end method

.method public final m()V
    .registers 2

    iget-object v0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v0, Laal;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ld7l;

    invoke-virtual {v0, p0}, Laal;->T(Lb2l;)V

    return-void
.end method

.method public final n(Ljava/lang/String;Z)V
    .registers 4

    iget-object v0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast v0, Lxho;

    iput-object p1, v0, Lxho;->s:Ljava/lang/String;

    if-nez p2, :cond_23

    iget-object p0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    if-eqz p0, :cond_23

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_23

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/4 p2, 0x7

    invoke-static {p1, p2}, Lphj;->t(Ljava/lang/String;I)V

    goto :goto_12

    :cond_23
    return-void
.end method

.method public final o(Lrjf;)V
    .registers 6

    sget-object v0, Lrjf;->f:Lrjf;

    if-eq p1, v0, :cond_5a

    iget-object v0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast v0, Lnw3;

    iget-object v0, v0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "tab_gallery.tabui2_selection_menu_hint_bubble_shown"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object p0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast p0, Loji;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_45

    sget-object v0, Lkf0;->b:Lkf0;

    if-eq p1, v3, :cond_47

    const/4 v1, 0x2

    if-eq p1, v1, :cond_42

    const/4 v1, 0x3

    if-eq p1, v1, :cond_47

    const/4 v0, 0x4

    if-eq p1, v0, :cond_3f

    const/4 v0, 0x5

    if-ne p1, v0, :cond_3b

    const/4 v0, 0x0

    goto :goto_47

    :cond_3b
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_3f
    sget-object v0, Lkf0;->d:Lkf0;

    goto :goto_47

    :cond_42
    sget-object v0, Lkf0;->e:Lkf0;

    goto :goto_47

    :cond_45
    sget-object v0, Lkf0;->c:Lkf0;

    :cond_47
    :goto_47
    if-eqz v0, :cond_5a

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lnw3;

    invoke-virtual {p0}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    sget-object p1, Lmf0;->l:Lmf0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0, p1}, Lx5f;->W(Lkf0;Lmf0;)V

    :cond_5a
    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 3

    iget-byte v0, p0, Lwci;->a:B

    packed-switch v0, :pswitch_data_2c

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "SurfaceReleaseFuture did not complete nicely."

    invoke-direct {p0, v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :pswitch_d
    instance-of p1, p1, Lztk;

    const/4 v0, 0x0

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast p0, Lo94;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lo94;->cancel(Z)Z

    move-result p0

    invoke-static {v0, p0}, Ljpo;->n(Ljava/lang/String;Z)V

    goto :goto_2a

    :cond_1f
    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ll94;

    invoke-virtual {p0, v0}, Ll94;->b(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {v0, p0}, Ljpo;->n(Ljava/lang/String;Z)V

    :goto_2a
    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x5
        :pswitch_d
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lwci;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_38

    check-cast p1, Lxo2;

    iget-byte p1, p1, Lxo2;->a:B

    const/4 v0, 0x3

    if-eq p1, v0, :cond_f

    const/4 p1, 0x1

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    const-string v0, "Unexpected result from SurfaceRequest. Surface was provided twice."

    invoke-static {v0, p1}, Ljpo;->n(Ljava/lang/String;Z)V

    iget-object p1, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    iget-object p0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast p0, Lzkl;

    iget-object p0, p0, Lzkl;->a:Lall;

    iget-object p1, p0, Lall;->j:Landroid/graphics/SurfaceTexture;

    if-eqz p1, :cond_28

    iput-object v1, p0, Lall;->j:Landroid/graphics/SurfaceTexture;

    :cond_28
    return-void

    :pswitch_29
    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Ll94;

    invoke-virtual {p0, v1}, Ll94;->b(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {v1, p0}, Ljpo;->n(Ljava/lang/String;Z)V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x5
        :pswitch_29
    .end packed-switch
.end method

.method public final declared-synchronized p(ZZ)V
    .registers 7

    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_3e

    :try_start_5
    iget-object v2, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v2, Landroid/os/PowerManager$WakeLock;

    if-nez v2, :cond_3e

    iget-object v2, p0, Lwci;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    const-string v3, "android.permission.WAKE_LOCK"

    invoke-virtual {v2, v3}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_1e

    const-string p1, "WAKE_LOCK permission not granted, can\'t acquire wake lock for playback"

    invoke-static {p1}, Lw7d;->K(Ljava/lang/String;)V
    :try_end_1c
    .catchall {:try_start_5 .. :try_end_1c} :catchall_58

    monitor-exit p0

    return-void

    :cond_1e
    :try_start_1e
    iget-object v2, p0, Lwci;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    const-string v3, "power"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    if-nez v2, :cond_33

    const-string p1, "PowerManager is null, therefore not creating the WakeLock."

    invoke-static {p1}, Lw7d;->K(Ljava/lang/String;)V
    :try_end_31
    .catchall {:try_start_1e .. :try_end_31} :catchall_58

    monitor-exit p0

    return-void

    :cond_33
    :try_start_33
    const-string v3, "ExoPlayer:WakeLockManager"

    invoke-virtual {v2, v1, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lwci;->c:Ljava/lang/Object;

    invoke-virtual {v2, v0}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_3e
    iget-object v2, p0, Lwci;->c:Ljava/lang/Object;

    check-cast v2, Landroid/os/PowerManager$WakeLock;
    :try_end_42
    .catchall {:try_start_33 .. :try_end_42} :catchall_58

    if-nez v2, :cond_46

    monitor-exit p0

    return-void

    :cond_46
    if-eqz p1, :cond_4b

    if-eqz p2, :cond_4b

    move v0, v1

    :cond_4b
    if-eqz v0, :cond_51

    :try_start_4d
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    goto :goto_54

    :cond_51
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_54
    .catchall {:try_start_4d .. :try_end_54} :catchall_58

    :goto_54
    monitor-exit p0

    return-void

    :goto_56
    :try_start_56
    monitor-exit p0
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_58

    throw p1

    :catchall_58
    move-exception p1

    goto :goto_56
.end method

.method public final zza()Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast v0, Luto;

    iget-object v0, v0, Luto;->b:Ljava/lang/Object;

    check-cast v0, Ln0c;

    iget-object v0, v0, Ln0c;->a:Landroid/content/Context;

    iget-object p0, p0, Lwci;->c:Ljava/lang/Object;

    check-cast p0, Lcpp;

    invoke-interface {p0}, Lcpp;->zza()Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Ljup;

    check-cast p0, Ltup;

    invoke-direct {v1, v0, p0}, Ljup;-><init>(Landroid/content/Context;Ltup;)V

    return-object v1
.end method
