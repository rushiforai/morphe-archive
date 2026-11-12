.class public final synthetic Lr2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm94;
.implements Lvlf;
.implements Lzph;
.implements Lfkj;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;
.implements Ln5o;
.implements Lxk7;
.implements Lzvk;
.implements Lyk7;
.implements Lbcf;
.implements Lph;
.implements Lbqb;
.implements Lm9n;
.implements Lpjk;
.implements Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;
.implements Livn;
.implements Lyyk;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Ltya;
.implements Lnc8;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lr2n;->a:B

    iput-object p1, p0, Lr2n;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ly2n;Lq3j;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Lr2n;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lr2n;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lukn;

    iget-object v0, p0, Lukn;->s:Lqln;

    iget-object v0, v0, Lqln;->f:Lami;

    new-instance v1, Lskn;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lskn;-><init>(Lukn;B)V

    invoke-virtual {v0, v1}, Lami;->r(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 7

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lq3j;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lp3j;->b:Lpyl;

    iget-object v1, v1, Lpyl;->f:Ljava/lang/Object;

    check-cast v1, Lbfe;

    iget-object v1, v1, Lhbl;->a:Landroid/util/ArrayMap;

    const-string v2, "androidx.camera.video.VideoCapture.streamUpdate"

    invoke-virtual {v1, v2, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v1, Lt2n;

    invoke-direct {v1, v0, p1, p0}, Lt2n;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Ll94;Lq3j;)V

    new-instance v3, Lh4m;

    const/4 v4, 0x5

    invoke-direct {v3, v0, p0, v1, v4}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Ll94;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    iget-object p0, p0, Lp3j;->b:Lpyl;

    invoke-virtual {p0, v1}, Lpyl;->d(Lrb4;)V

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v2, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%s[0x%x]"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(I)Z
    .registers 3

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lqkn;

    iget-object v0, p0, Lqkn;->j:Lujn;

    iget-object p0, p0, Lqkn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lujn;->P(Ljava/lang/String;)I

    move-result p0

    if-eq p0, p1, :cond_24

    iget-object p0, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmkb;

    invoke-virtual {p0}, Lmkb;->a()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Z)V
    .registers 3

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->p:Lkrn;

    new-instance v0, Lern;

    invoke-direct {v0, p1}, Lern;-><init>(Z)V

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void
.end method

.method public final d(ILjava/lang/String;)V
    .registers 5

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    sget v0, Lcom/opera/android/webapps/WebappActivity;->J:I

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.opera.android.INTERNAL_WEB_SEARCH"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "query"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.opera.android.EXTRA_SEARCH_IN_NEW_TAB"

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p2, "com.opera.android.EXTRA_SEARCH_INCOGNITO_MODE"

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.opera.android.EXTRA_SEARCH_URL_ORIGIN"

    const/4 p2, 0x0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final e(Lgkj;Lhjm;)V
    .registers 4

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Li9c;

    iget-object v0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast v0, Lgkj;

    if-ne p1, v0, :cond_15

    const/4 p1, 0x0

    iput-object p1, p0, Li9c;->g:Ljava/lang/Object;

    sget-object p1, Lhjm;->a:Lhjm;

    if-ne p2, p1, :cond_15

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Li9c;->e(Z)V

    :cond_15
    return-void
.end method

.method public final execute()Ljava/lang/Object;
    .registers 9

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lt9l;

    iget-object v0, p0, Lt9l;->b:Ljava/lang/Object;

    check-cast v0, Lydi;

    invoke-virtual {v0}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_f
    const-string v1, "SELECT distinct t._id, t.backend_name, t.priority, t.extras FROM transport_contexts AS t, events AS e WHERE e.context_id = t._id"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_79

    :try_start_18
    move-object v3, v1

    check-cast v3, Landroid/database/Cursor;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :goto_20
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_53

    invoke-static {}, Ldp2;->a()Ll45;

    move-result-object v5

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ll45;->O(Ljava/lang/String;)V

    const/4 v7, 0x2

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Lryg;->b(I)Lmyg;

    move-result-object v7

    iput-object v7, v5, Ll45;->c:Ljava/lang/Object;

    const/4 v7, 0x3

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_49

    invoke-static {v7, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v6

    :cond_49
    iput-object v6, v5, Ll45;->b:Ljava/lang/Object;

    invoke-virtual {v5}, Ll45;->n()Ldp2;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_52
    .catchall {:try_start_18 .. :try_end_52} :catchall_74

    goto :goto_20

    :cond_53
    :try_start_53
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_59
    .catchall {:try_start_53 .. :try_end_59} :catchall_79

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v2

    :goto_61
    if-ge v1, v0, :cond_73

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Ldp2;

    iget-object v5, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v5, Lx77;

    invoke-virtual {v5, v3, v7, v2}, Lx77;->n(Ldp2;IZ)V

    goto :goto_61

    :cond_73
    return-object v6

    :catchall_74
    move-exception p0

    :try_start_75
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw p0
    :try_end_79
    .catchall {:try_start_75 .. :try_end_79} :catchall_79

    :catchall_79
    move-exception p0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method

.method public final f()Landroid/graphics/drawable/Drawable;
    .registers 5

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v0, Lx05;

    invoke-direct {v0, p0}, Lx05;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lx05;->d(I)V

    const v1, 0x7f040203

    const v2, 0x7f06063b

    invoke-static {v1, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Lx05;->b([I)V

    invoke-static {v0}, Lal2;->c(Lx05;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x7f080241

    invoke-static {v1, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v3, 0x7f040a85

    invoke-static {v3, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {v1, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    new-instance p0, Lw3a;

    invoke-static {v1, v0}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    const/16 v1, 0x11

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lr2n;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_bc

    :pswitch_8
    check-cast p0, Ln1;

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {p0}, Ln1;->b0()Lz37;

    move-result-object p0

    return-object p0

    :pswitch_11
    check-cast p0, Ls14;

    check-cast p1, Ljava/lang/Void;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_51

    new-instance v1, Ljava/util/ArrayList;

    array-length v0, p0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    array-length v0, p0

    const/4 v2, 0x0

    :goto_2c
    if-ge v2, v0, :cond_51

    aget-object v3, p0, v2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".json"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4e

    :try_start_3c
    new-instance v4, Ljava/lang/String;

    invoke-static {v3}, Ls29;->h(Ljava/io/File;)[B

    move-result-object v3

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v3, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v4}, Lkln;->h(Ljava/lang/String;)Lkln;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_4e} :catch_4e
    .catch Lorg/json/JSONException; {:try_start_3c .. :try_end_4e} :catch_4e

    :catch_4e
    :cond_4e
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    :cond_51
    if-eqz v1, :cond_64

    new-instance p0, Lmn;

    const/16 v0, 0x1a

    invoke-direct {p0, v0}, Lmn;-><init>(B)V

    invoke-static {p0}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_64
    return-object p1

    :pswitch_65
    check-cast p0, Llt2;

    check-cast p1, Laln;

    invoke-virtual {p0, p1}, Llt2;->run(Ljava/lang/Object;)V

    return-object v1

    :pswitch_6d
    check-cast p0, Lvq8;

    check-cast p1, Ljava/lang/Void;

    :try_start_71
    new-instance p1, Ljava/lang/String;

    iget-object p0, p0, Lvq8;->f:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-static {p0}, Ls29;->h(Ljava/io/File;)[B

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    invoke-static {p1}, Lvq8;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1
    :try_end_82
    .catch Lorg/json/JSONException; {:try_start_71 .. :try_end_82} :catch_82
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_82} :catch_82

    :catch_82
    return-object v1

    :pswitch_83
    check-cast p0, Lojn;

    check-cast p1, Lmin;

    iget-object p0, p0, Lojn;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lra3;

    iget-object p0, p0, Lra3;->b:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc36;

    iget-object p1, p1, Lmin;->b:[B

    invoke-virtual {p0, p1}, Lc36;->b([B)[B

    move-result-object p0

    if-eqz p0, :cond_a4

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    :cond_a4
    return-object v1

    :pswitch_a5
    check-cast p0, Ld7k;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_b4

    new-instance v0, Lmjn;

    invoke-direct {v0, p1}, Lmjn;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b9

    :cond_b4
    sget-object p1, Lljn;->b:Lljn;

    invoke-virtual {p0, p1}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_b9
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_bc
    .packed-switch 0x6
        :pswitch_a5
        :pswitch_83
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_6d
        :pswitch_65
        :pswitch_11
    .end packed-switch
.end method

.method public final isEmpty()Z
    .registers 3

    iget-byte v0, p0, Lr2n;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    check-cast p0, Ljdo;

    iget-object p0, p0, Ljdo;->v:Ld83;

    if-nez p0, :cond_f

    const/4 p0, 0x0

    :cond_f
    iget-object v0, p0, Ld83;->c:Ljava/util/List;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object p0, p0, Ld83;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/TreeSet;

    invoke-virtual {p0}, Ljava/util/TreeSet;->size()I

    move-result p0

    if-ne v0, p0, :cond_22

    const/4 v1, 0x1

    :cond_22
    return v1

    :pswitch_23
    check-cast p0, Lndn;

    iget-boolean v0, p0, Lndn;->t:Z

    if-eqz v0, :cond_37

    iget-object p0, p0, Lndn;->d:Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_37

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    :cond_37
    return v1

    :pswitch_data_38
    .packed-switch 0x3
        :pswitch_23
    .end packed-switch
.end method

.method public final j()V
    .registers 5

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lmqn;

    iget-object v0, p0, Lmqn;->S:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    move-object v0, v1

    :cond_a
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v0

    iget v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v3, 0x6

    if-eq v2, v3, :cond_18

    return-void

    :cond_18
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    iget-object p0, p0, Lmqn;->T:Lvl6;

    if-eqz p0, :cond_20

    move-object v1, p0

    :cond_20
    iget-object p0, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    return-void
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Ltpn;

    check-cast p1, Loh;

    iget-object p0, p0, Ltpn;->a:Lua7;

    invoke-virtual {p0}, Lua7;->D()V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 9

    iget-byte p1, p0, Lr2n;->a:B

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_8a

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    sget p1, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->O()V

    return-object p2

    :pswitch_f
    check-cast p0, Lz63;

    new-instance p1, Lpqh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iget-object v0, p2, Lg3o;->a:Ld3o;

    const/16 v1, 0x287

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    iput-object v1, p1, Lpqh;->a:Ljava/lang/Object;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v0, v0, Lr9b;->d:I

    if-eqz v0, :cond_3b

    iget-object v0, p1, Lpqh;->a:Ljava/lang/Object;

    check-cast v0, Lr9b;

    iget v1, v0, Lr9b;->a:I

    iget v2, v0, Lr9b;->b:I

    iget v0, v0, Lr9b;->c:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3}, Lr9b;->c(IIII)Lr9b;

    move-result-object v0

    iput-object v0, p1, Lpqh;->a:Ljava/lang/Object;

    :cond_3b
    iget-object v0, p0, Lz63;->b:Ljava/lang/Object;

    check-cast v0, Lpt1;

    iget-object v1, v0, Lpt1;->g:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v2, p1, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Lr9b;

    iget v3, v2, Lr9b;->a:I

    iget v4, v2, Lr9b;->b:I

    iget v2, v2, Lr9b;->c:I

    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v1, v3, v4, v2, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-eqz v1, :cond_7f

    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v1

    if-nez v1, :cond_7f

    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p1, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Lr9b;

    iget v2, v2, Lr9b;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iget-object p1, p1, Lpqh;->a:Ljava/lang/Object;

    check-cast p1, Lr9b;

    iget v3, p1, Lr9b;->c:I

    iget p1, p1, Lr9b;->d:I

    invoke-direct {v1, v2, v0, v3, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, v1}, Lz63;->b(Landroid/graphics/Rect;)V

    goto :goto_88

    :cond_7f
    new-instance v1, Lkq2;

    const/4 v2, 0x3

    invoke-direct {v1, p0, p1, v2}, Lkq2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :goto_88
    return-object p2

    nop

    :pswitch_data_8a
    .packed-switch 0xe
        :pswitch_f
    .end packed-switch
.end method

.method public final n(Ltw7;)V
    .registers 3

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lupn;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_11

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    iget-object p0, p0, Lupn;->a:Lqq8;

    return-void

    :cond_11
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_16

    return-void

    :cond_16
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final o(Luya;)V
    .registers 2

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lqdo;

    :try_start_4
    invoke-interface {p1}, Luya;->e()Lqya;

    move-result-object p1

    if-eqz p1, :cond_f

    iget-object p0, p0, Lqdo;->c:Lsdo;

    invoke-virtual {p0, p1}, Lsdo;->f(Lqya;)V
    :try_end_f
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_f} :catch_f

    :catch_f
    :cond_f
    return-void
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 2

    iget-byte p1, p0, Lr2n;->a:B

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_1e

    check-cast p0, Ljava/util/concurrent/ScheduledFuture;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    return-void

    :sswitch_e
    check-cast p0, Lo4o;

    iget-object p0, p0, Lo4o;->b:Lcom/google/android/gms/tasks/TaskCompletionSource;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    return-void

    :sswitch_17
    check-cast p0, Landroid/content/Intent;

    invoke-static {p0}, Lsgb;->o(Landroid/content/Intent;)V

    return-void

    nop

    :sswitch_data_1e
    .sparse-switch
        0x5 -> :sswitch_17
        0x16 -> :sswitch_e
    .end sparse-switch
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 4

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Laco;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    instance-of v0, p1, Lp0k;

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    move-object v0, p1

    check-cast v0, Lp0k;

    goto :goto_11

    :cond_10
    move-object v0, v1

    :goto_11
    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Lp0k;->d()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_1b
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Laco;->m(Ljava/lang/Integer;Z)V

    if-eqz v1, :cond_34

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_34

    new-instance p1, Lttn;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Lttn;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v0, 0x2710

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_34
    invoke-virtual {p0, p1}, Laco;->p(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final onSuccess(Landroidx/webkit/WebViewStartUpResult;)V
    .registers 5

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;

    sget-object v0, Landroidx/webkit/WebViewCompat;->a:Landroid/net/Uri;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lfmn;

    const/4 v2, 0x4

    invoke-direct {v1, p0, p1, v2}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-object p0, p0, Lr2n;->b:Ljava/lang/Object;

    check-cast p0, Lbdn;

    iget-object p1, p0, Lbdn;->c:Lydn;

    invoke-virtual {p1, p2}, Lydn;->C(Z)V

    iget-object p1, p0, Lbdn;->h:Lcdn;

    iget p1, p1, Lcdn;->k:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_17

    if-nez p2, :cond_17

    iget-object p0, p0, Lbdn;->i:Lhv3;

    invoke-virtual {p0}, Lhv3;->m()V

    :cond_17
    return-void
.end method
