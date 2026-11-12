.class public final synthetic Lq2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lq2g;->a:B

    iput-object p1, p0, Lq2g;->b:Ljava/lang/Object;

    iput-object p2, p0, Lq2g;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    iget-byte v0, p0, Lq2g;->a:B

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_350

    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lvqi;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ls4f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ls4f;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_19
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Liji;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    return-void

    :pswitch_2b
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lbei;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_40

    new-instance p0, Lpjg;

    const/16 v1, 0x1c

    invoke-direct {p0, v0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lorg/chromium/base/ThreadUtils;->d(Ljava/lang/Runnable;)V

    goto :goto_4e

    :cond_40
    new-instance v1, Laei;

    iget-object v2, v0, Lbei;->b:Landroid/content/Context;

    iget-wide v5, v0, Lbei;->a:J

    invoke-direct {v1, v2, p0, v5, v6}, Laei;-><init>(Landroid/content/Context;Ljava/lang/String;J)V

    new-array p0, v4, [Ljava/lang/Void;

    invoke-static {v1, p0}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    :goto_4e
    return-void

    :pswitch_4f
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ldbh;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Typeface;

    invoke-virtual {v0, p0}, Ldbh;->E(Landroid/graphics/Typeface;)V

    return-void

    :pswitch_5b
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->b()I

    move-result v2

    new-instance v5, Lsa2;

    invoke-direct {v5, v1, v4}, Lsa2;-><init>(BZ)V

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    invoke-virtual {p0, v5}, Lcom/opera/android/bookmarks/c;->c(Lzk3;)Z

    iget p0, v5, Lsa2;->b:I

    int-to-long v4, p0

    long-to-int p0, v4

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_94

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    const/16 v5, 0x2b

    int-to-long v6, v2

    invoke-virtual {v1, v5, v3, v6, v7}, Ljf0;->p(IIJ)V

    const/16 v2, 0x2c

    int-to-long v5, p0

    invoke-virtual {v1, v2, v3, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    :cond_94
    return-void

    :pswitch_95
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lb2j;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Lb2j;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_a1
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ls28;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v1, v0, Ls28;->e:Ljava/lang/Object;

    check-cast v1, Ll76;

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ls28;->d()V

    return-void

    :pswitch_b4
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ls28;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    new-instance v1, Lz0b;

    invoke-direct {v1, v2}, Lv0b;-><init>(I)V

    iget-object v0, v0, Ls28;->e:Ljava/lang/Object;

    check-cast v0, Ll76;

    invoke-virtual {v1, v0}, Lv0b;->e(Ljava/lang/Iterable;)V

    invoke-virtual {v1}, Lz0b;->g()Lcsh;

    move-result-object v0

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_d0
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v0, v0, Lglh;->a:Ljlh;

    invoke-virtual {v0, p0}, Ljlh;->k(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    if-eqz p0, :cond_100

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_eb
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    const-string v1, "UPDATE reading SET visit_count = visit_count + 1 WHERE id=?"

    invoke-virtual {p0, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_fd
    .catchall {:try_start_eb .. :try_end_fd} :catchall_101

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    :cond_100
    return-void

    :catchall_101
    move-exception v0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :pswitch_106
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lwzg;

    iget-object v1, v0, Lglh;->a:Ljlh;

    invoke-virtual {v1}, Ljlh;->m()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lglh;->i(Ljava/util/ArrayList;)V

    iput-object v1, p0, Lwzg;->c:Ljava/lang/Object;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :pswitch_121
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Collection;

    iget-object v1, v0, Lglh;->g:Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    iget-object v0, v0, Lglh;->b:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_134
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_144

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lclh;

    invoke-interface {v1, p0}, Lclh;->c(Ljava/util/Collection;)V

    goto :goto_134

    :cond_144
    return-void

    :pswitch_145
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lych;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lplh;

    iget-object v1, v0, Lych;->b:Lnx5;

    new-instance v2, Lr8h;

    invoke-direct {v2, p0, v0, v5, v3}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v1, v5, v5, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :pswitch_159
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Livg;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lio7;

    iget-object v1, v0, Livg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v0, v0, Livg;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/EnumSet;

    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_187

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_176
    if-ge v4, p0, :cond_184

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v4, v4, 0x1

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_176

    :cond_184
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :cond_187
    return-void

    :pswitch_188
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ltah;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v1, v0, Ltah;->h:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, v0, Ltah;->i:Ljava/lang/Object;

    check-cast v1, Lwmj;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Ltah;->i:Ljava/lang/Object;

    check-cast v0, Lwmj;

    iput-object p0, v0, Lwmj;->a:Ljava/lang/String;

    iput-object v5, v0, Lwmj;->b:Lvmj;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_1ac
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Intent;

    sget v1, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;->b:I

    iget-object v0, v0, Lorg/chromium/net/ProxyChangeListener$ProxyReceiver;->a:Lorg/chromium/net/ProxyChangeListener;

    invoke-static {p0}, Lorg/chromium/net/ProxyChangeListener;->d(Landroid/content/Intent;)Lx7h;

    move-result-object p0

    invoke-static {v0, p0}, Lorg/chromium/net/ProxyChangeListener;->b(Lorg/chromium/net/ProxyChangeListener;Lx7h;)V

    return-void

    :pswitch_1c0
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/net/ProxyChangeListener;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Intent;

    invoke-static {v0, p0}, Lorg/chromium/net/ProxyChangeListener;->a(Lorg/chromium/net/ProxyChangeListener;Landroid/content/Intent;)V

    return-void

    :pswitch_1cc
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lg5h;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ltwi;

    invoke-virtual {v0, p0}, Lg5h;->s(Ltwi;)V

    return-void

    :pswitch_1d8
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lt1h;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lw4o;

    iget-object v1, v0, Lt1h;->k:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1e3
    iget-object v0, v0, Lt1h;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v4

    :goto_1ea
    if-ge v3, v2, :cond_1f8

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Ldg8;

    invoke-interface {v5, p0, v4}, Ldg8;->a(Lw4o;Z)V

    goto :goto_1ea

    :cond_1f8
    monitor-exit v1

    return-void

    :goto_1fa
    monitor-exit v1
    :try_end_1fb
    .catchall {:try_start_1e3 .. :try_end_1fb} :catchall_1fc

    throw p0

    :catchall_1fc
    move-exception p0

    goto :goto_1fa

    :pswitch_1fe
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ls1h;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lgwa;

    iget-object v0, v0, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean v1, v0, Lxwh;->f:Z

    if-eqz v1, :cond_210

    return-void

    :cond_210
    iget-object v1, v0, Lxwh;->b:Lo94;

    iget-object v1, v1, Lo94;->b:Ln94;

    invoke-virtual {v1}, Lx6;->isDone()Z

    move-result v1

    const-string v3, "onImageCaptured() must be called before onFinalResult()"

    invoke-static {v3, v1}, Ljpo;->n(Ljava/lang/String;Z)V

    invoke-virtual {v0}, Lxwh;->a()V

    invoke-static {}, Lxug;->i()V

    new-instance v0, Lkoj;

    invoke-direct {v0, v5, p0, v2}, Lkoj;-><init>(Lbp2;Ljava/lang/Object;B)V

    throw v5

    :pswitch_229
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ls1h;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lqya;

    iget-object v0, v0, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean v1, v0, Lxwh;->f:Z

    if-eqz v1, :cond_23e

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-void

    :cond_23e
    iget-object v1, v0, Lxwh;->b:Lo94;

    iget-object v1, v1, Lo94;->b:Ln94;

    invoke-virtual {v1}, Lx6;->isDone()Z

    move-result v1

    const-string v2, "onImageCaptured() must be called before onFinalResult()"

    invoke-static {v2, v1}, Ljpo;->n(Ljava/lang/String;Z)V

    invoke-virtual {v0}, Lxwh;->a()V

    new-instance v0, Lcbl;

    invoke-direct {v0, v5, p0}, Lcbl;-><init>(Lbp2;Lqya;)V

    throw v5

    :pswitch_254
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ls1h;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    iget-object v0, v0, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean v0, v0, Lxwh;->f:Z

    if-eqz v0, :cond_266

    return-void

    :cond_266
    new-instance v0, Lkoj;

    invoke-direct {v0, v5, p0, v1}, Lkoj;-><init>(Lbp2;Ljava/lang/Object;B)V

    throw v5

    :pswitch_26c
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lyhe;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lbuk;

    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/camera/view/PreviewView;

    iget-object v0, v0, Landroidx/camera/view/PreviewView;->o:Lyhe;

    invoke-virtual {v0, p0}, Lyhe;->a(Lbuk;)V

    return-void

    :pswitch_27e
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lrwg;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lbuk;

    invoke-interface {v0, p0}, Lrwg;->a(Lbuk;)V

    return-void

    :pswitch_28a
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Lulg;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v0, v0, Lulg;->e:Lxt3;

    invoke-virtual {v0, p0}, Lxt3;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_298
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ltlg;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lndc;

    iget-boolean v1, v0, Ltlg;->l:Z

    if-nez v1, :cond_2c0

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->a:Lqcc;

    if-eq p0, v1, :cond_2c0

    iput-boolean v3, v0, Ltlg;->l:Z

    iget-object p0, v0, Ltlg;->a:Lnr8;

    check-cast p0, Lcom/opera/android/favorites/e;

    iget-object p0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v1, v0, Ltlg;->j:Lwq8;

    invoke-virtual {p0, v1}, Ltq8;->t(Lsq8;)V

    invoke-virtual {v0}, Ltlg;->S()V

    :cond_2c0
    return-void

    :pswitch_2c1
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/media3/ui/PlayerView;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    sget v1, Landroidx/media3/ui/PlayerView;->C:I

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iget-object p0, v0, Landroidx/media3/ui/PlayerView;->f:Landroid/widget/ImageView;

    if-eqz p0, :cond_2de

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroidx/media3/ui/PlayerView;->o()V

    :cond_2de
    iget-object v1, v0, Landroidx/media3/ui/PlayerView;->q:Lgig;

    if-eqz v1, :cond_2f5

    const/16 v2, 0x1e

    invoke-interface {v1, v2}, Lgig;->C(I)Z

    move-result v2

    if-eqz v2, :cond_2f5

    invoke-interface {v1}, Lgig;->w()Lfzl;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lfzl;->a(I)Z

    move-result v1

    if-nez v1, :cond_304

    :cond_2f5
    if-eqz p0, :cond_2fd

    invoke-virtual {p0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v0}, Landroidx/media3/ui/PlayerView;->o()V

    :cond_2fd
    iget-object p0, v0, Landroidx/media3/ui/PlayerView;->c:Landroid/view/View;

    if-eqz p0, :cond_304

    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_304
    return-void

    :pswitch_305
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    iget-object v0, v0, Ltjg;->o:Lxbf;

    if-eqz v0, :cond_314

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_314
    return-void

    :pswitch_315
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Ls9g;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    iget-object v0, v0, Ls9g;->f:Li7f;

    new-instance v1, Lpv1;

    invoke-direct {v1, p0, v2}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    return-void

    :pswitch_328
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Li32;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lj12;

    iget-object v0, v0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Lp2g;

    iget-object v0, v0, Lp2g;->b:Lc3g;

    invoke-virtual {p0, v0}, Lj12;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_33a
    iget-object v0, p0, Lq2g;->b:Ljava/lang/Object;

    check-cast v0, Li32;

    iget-object p0, p0, Lq2g;->c:Ljava/lang/Object;

    check-cast p0, Lj12;

    iget-object v0, v0, Li32;->l:Ljava/lang/Object;

    check-cast v0, Lp2g;

    iget-object v0, v0, Lp2g;->a:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lj12;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_350
    .packed-switch 0x0
        :pswitch_33a
        :pswitch_328
        :pswitch_315
        :pswitch_305
        :pswitch_2c1
        :pswitch_298
        :pswitch_28a
        :pswitch_27e
        :pswitch_26c
        :pswitch_254
        :pswitch_229
        :pswitch_1fe
        :pswitch_1d8
        :pswitch_1cc
        :pswitch_1c0
        :pswitch_1ac
        :pswitch_188
        :pswitch_159
        :pswitch_145
        :pswitch_121
        :pswitch_106
        :pswitch_d0
        :pswitch_b4
        :pswitch_a1
        :pswitch_95
        :pswitch_5b
        :pswitch_4f
        :pswitch_2b
        :pswitch_19
    .end packed-switch
.end method
