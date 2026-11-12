.class public final synthetic Lk3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 12
    iput-byte p4, p0, Lk3;->a:B

    iput-object p1, p0, Lk3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lk3;->c:Ljava/lang/Object;

    iput-object p3, p0, Lk3;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lrb4;Lqb4;Lowh;Ljava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Lk3;->a:B

    iput-object p1, p0, Lk3;->b:Ljava/lang/Object;

    iput-object p3, p0, Lk3;->c:Ljava/lang/Object;

    iput-object p4, p0, Lk3;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lk3;->a:B

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_5e6

    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Ligi;

    iget-object v3, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/widget/GraphView;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    const/high16 v7, 0x41c00000    # 24.0f

    invoke-static {v7, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    div-int/2addr v6, v5

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    :goto_2e
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_4c

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lui5;

    invoke-virtual {v7}, Lui5;->g()J

    move-result-wide v7

    cmp-long v7, v7, v1

    if-eqz v7, :cond_49

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int v4, v1, v5

    goto :goto_4c

    :cond_49
    add-int/lit8 v5, v5, 0x1

    goto :goto_2e

    :cond_4c
    :goto_4c
    const/4 v1, 0x3

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    new-instance v2, Lpve;

    invoke-direct {v2, v0, p0}, Lpve;-><init>(Ligi;Ljava/util/ArrayList;)V

    new-instance p0, Lt59;

    invoke-direct {p0, v2, v1}, Lt59;-><init>(Lp3a;I)V

    invoke-virtual {p0, v3}, Lt59;->d(Lcom/opera/android/widget/GraphView;)V

    return-void

    :pswitch_63
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lu59;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Liu2;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    iget-object v1, v1, Lu59;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqln;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v0, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8e

    :cond_a2
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v1, v0}, Lqln;->k(Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v2, v0

    if-eqz v2, :cond_bc

    sget-object v0, Lxle;->b:Lxle;

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Liu2;->run(Ljava/lang/Object;)V

    goto :goto_c6

    :cond_bc
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Liu2;->run(Ljava/lang/Object;)V

    :goto_c6
    return-void

    :pswitch_c7
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Luk5;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lc37;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ly5j;

    iget-object v1, v1, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Lxnh;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwnh;

    const/16 v2, 0x400

    invoke-virtual {v1, v2}, Lwnh;->b(I)Z

    move-result v1

    if-eqz v1, :cond_eb

    new-instance v1, Lsw7;

    invoke-direct {v1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_f8

    :cond_eb
    new-instance v1, Lhjb;

    iget-object p0, p0, Ly5j;->a:Ljava/lang/String;

    invoke-direct {v1, p0}, Lhjb;-><init>(Ljava/lang/String;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    move-object v1, p0

    :goto_f8
    invoke-virtual {v0, v1}, Luk5;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_fc
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Ls25;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lr25;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lyqd;

    iget-object v0, v0, Ls25;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Lr25;->a:Ljava/lang/String;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "clearonexit.categories.ongoing"

    invoke-static {v2, v3}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-static {v0, v2}, Lz4o;->z0(Landroid/content/ContextWrapper;Ljava/util/HashSet;)V

    invoke-virtual {p0}, Lyqd;->run()V

    return-void

    :pswitch_122
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lpjn;

    iget-object v3, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v3, Lorg/chromium/device/bluetooth/wrapper/BluetoothGattCharacteristicWrapper;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, [B

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/device/bluetooth/ChromeBluetoothDevice;

    iget-object v0, v0, Lorg/chromium/device/bluetooth/ChromeBluetoothDevice;->f:Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/device/bluetooth/ChromeBluetoothRemoteGattCharacteristic;

    if-nez v0, :cond_144

    const-string p0, "onCharacteristicChanged when chromeCharacteristic == null."

    new-array v0, v4, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lwxe;->d0(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_14d

    :cond_144
    iget-wide v3, v0, Lorg/chromium/device/bluetooth/ChromeBluetoothRemoteGattCharacteristic;->a:J

    cmp-long v0, v3, v1

    if-eqz v0, :cond_14d

    invoke-static {v3, v4, p0}, LJ/N;->MZCKcdTH(JLjava/lang/Object;)V

    :cond_14d
    :goto_14d
    return-void

    :pswitch_14e
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lzn4;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, [B

    iget-object v2, v0, Lzn4;->d:Lcom/opera/android/http/server/HttpServer;

    iget-boolean v3, v0, Lzn4;->g:Z

    if-nez v3, :cond_17a

    iget-object v3, v0, Lzn4;->c:Ljava/util/HashSet;

    invoke-virtual {v3, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17a

    if-eqz p0, :cond_177

    iget-object v0, v0, Lzn4;->b:Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v0, "image/webp"

    iget-wide v2, v2, Lcom/opera/android/http/server/HttpServer;->b:J

    invoke-static {v2, v3, v1, p0, v0}, LJ/N;->MAtcgYqu(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_17a

    :cond_177
    invoke-virtual {v2, v1}, Lcom/opera/android/http/server/HttpServer;->a(Ljava/lang/String;)V

    :cond_17a
    :goto_17a
    return-void

    :pswitch_17b
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lzn4;

    iget-object v0, p0, Lk3;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_18c
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/16 v6, 0x12c

    if-gt v0, v6, :cond_19a

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-le v0, v6, :cond_1e9

    :cond_19a
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-float v0, v0

    int-to-float v7, v7

    div-float/2addr v0, v7

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float/2addr v0, v7

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v7, 0x3e19999a    # 0.15f

    cmpg-float v0, v0, v7

    if-gez v0, :cond_1b8

    invoke-static {p0, v6, v6, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_1e8

    :cond_1b8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    sub-int v8, v7, v0

    if-nez v8, :cond_1c6

    move-object v7, v3

    goto :goto_1d7

    :cond_1c6
    if-lez v8, :cond_1cf

    div-int/lit8 v8, v8, 0x2

    invoke-static {p0, v4, v8, v0, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1d6

    :cond_1cf
    neg-int v0, v8

    div-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0, v4, v7, v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1d6
    .catchall {:try_start_18c .. :try_end_1d6} :catchall_1ff

    :goto_1d6
    move-object v7, v0

    :goto_1d7
    if-eqz v7, :cond_1e7

    :try_start_1d9
    invoke-static {v7, v6, v6, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1dd
    .catchall {:try_start_1d9 .. :try_end_1dd} :catchall_1e2

    :try_start_1dd
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->recycle()V

    move-object p0, v0

    goto :goto_1e8

    :catchall_1e2
    move-exception v0

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->recycle()V

    throw v0

    :cond_1e7
    move-object p0, v3

    :goto_1e8
    move v4, v5

    :cond_1e9
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x5a

    invoke-virtual {p0, v5, v6, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v5

    if-eqz v5, :cond_1fc

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_1fc
    .catchall {:try_start_1dd .. :try_end_1fc} :catchall_1ff

    :cond_1fc
    if-eqz v4, :cond_204

    goto :goto_201

    :catchall_1ff
    if-eqz v4, :cond_204

    :goto_201
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_204
    new-instance p0, Lk3;

    const/16 v0, 0x18

    invoke-direct {p0, v1, v2, v3, v0}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_20f
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/WorkDatabase;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lx4o;

    invoke-virtual {v0}, Landroidx/work/impl/WorkDatabase;->C()Li5o;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    sget-object v3, Le6i;->i:Ljava/util/TreeMap;

    invoke-static {v5, v2}, Laoh;->e(ILjava/lang/String;)Le6i;

    move-result-object v2

    invoke-virtual {v2, v5, v1}, Le6i;->w(ILjava/lang/String;)V

    iget-object v0, v0, Li5o;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/WorkDatabase_Impl;

    invoke-virtual {v0}, Ly5i;->b()V

    invoke-virtual {v0, v2}, Ly5i;->s(Lssk;)Landroid/database/Cursor;

    move-result-object v1

    :try_start_238
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    :goto_241
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_24f

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_24e
    .catchall {:try_start_238 .. :try_end_24e} :catchall_268

    goto :goto_241

    :cond_24f
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v2}, Le6i;->release()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_259
    if-ge v4, v1, :cond_267

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Ljava/lang/String;

    invoke-static {p0, v2}, Lcqp;->J(Lx4o;Ljava/lang/String;)V

    goto :goto_259

    :cond_267
    return-void

    :catchall_268
    move-exception v0

    move-object p0, v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v2}, Le6i;->release()V

    throw p0

    :pswitch_271
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lf7f;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    :try_start_27d
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_281
    if-ge v4, v2, :cond_297

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    check-cast v6, Lxd4;

    invoke-interface {v6}, Lxd4;->e()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_281

    move-object v3, v5

    :cond_297
    check-cast v3, Lxd4;

    if-eqz v3, :cond_2a4

    invoke-interface {v3}, Lud4;->b()Lekc;

    move-result-object p0

    if-eqz p0, :cond_2a4

    invoke-virtual {p0, v1}, Lekc;->p(Lf7f;)V
    :try_end_2a4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_27d .. :try_end_2a4} :catch_2a4

    :catch_2a4
    :cond_2a4
    return-void

    :pswitch_2a5
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lrb4;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lowh;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lujp;

    invoke-static {v1}, Lqb4;->c(Lowh;)I

    move-result v1

    invoke-virtual {v0, v1, p0}, Lrb4;->c(ILujp;)V

    return-void

    :pswitch_2b9
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lrb4;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lowh;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Luj4;

    invoke-static {v1}, Lqb4;->c(Lowh;)I

    move-result v1

    invoke-virtual {v0, v1, p0}, Lrb4;->b(ILyb4;)V

    return-void

    :pswitch_2cd
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lj84;

    iget-object v3, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    const-string v4, "Reporting %d sinks for source: %s"

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5, v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v4, v0, Lj84;->b:Lorg/chromium/components/media_router/BrowserMediaRouter;

    iget-object v5, v4, Lorg/chromium/components/media_router/BrowserMediaRouter;->d:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2fc

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v5, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2fc
    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    invoke-interface {v5, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_312
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_322

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_312

    :cond_322
    iget-object v0, v4, Lorg/chromium/components/media_router/BrowserMediaRouter;->e:Ljava/util/HashMap;

    invoke-virtual {v0, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v4, v4, Lorg/chromium/components/media_router/BrowserMediaRouter;->a:J

    cmp-long v0, v4, v1

    if-eqz v0, :cond_334

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-static {v4, v5, v3, p0}, LJ/N;->M2xU9exV(JLjava/lang/Object;I)V

    :cond_334
    return-void

    :pswitch_335
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lr9i;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lc84;

    :try_start_341
    invoke-virtual {v0}, Lr9i;->G()Ljava/io/File;

    move-result-object v2

    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-static {v1, v2, v3, v4}, Lz5i;->l0(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;I)Z

    move-result v2
    :try_end_34d
    .catchall {:try_start_341 .. :try_end_34d} :catchall_366

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    if-eqz v2, :cond_365

    iget-object v0, v0, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Le84;

    iget-object p0, p0, Lc84;->a:Ljava/lang/String;

    iget-object v0, v0, Le84;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "image_url"

    invoke-static {v0, v1, p0}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    :cond_365
    return-void

    :catchall_366
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    throw p0

    :pswitch_36c
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lb2l;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ld7l;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_37d

    move-object v3, v0

    :cond_37d
    invoke-virtual {v3, v1, p0, v5}, Lk6l;->f(Lb2l;Ld7l;Z)V

    return-void

    :pswitch_381
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/AutofillManager;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/autofill/Address;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/autofill/AutofillManager$AutofillCallback;

    invoke-virtual {v0, v1, p0}, Lcom/opera/android/autofill/AutofillManager;->a(Lcom/opera/android/autofill/Address;Lcom/opera/android/autofill/AutofillManager$AutofillCallback;)V

    return-void

    :pswitch_391
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/CreditCard;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lva2;

    invoke-static {v0, v1, p0}, LJ/N;->M3WZIaM8(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_3a1
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Landroid/media/AudioTrack;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/os/Handler;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lijc;

    const/16 v2, 0x10

    :try_start_3af
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V
    :try_end_3b5
    .catchall {:try_start_3af .. :try_end_3b5} :catchall_3e6

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_3cb

    new-instance v0, Lq02;

    invoke-direct {v0, p0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3cb
    sget-object v4, Lth2;->p:Ljava/lang/Object;

    monitor-enter v4

    :try_start_3ce
    sget p0, Lth2;->r:I

    sub-int/2addr p0, v5

    sput p0, Lth2;->r:I

    if-nez p0, :cond_3df

    sget-object p0, Lth2;->q:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    sput-object v3, Lth2;->q:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_3df
    monitor-exit v4

    return-void

    :goto_3e1
    monitor-exit v4
    :try_end_3e2
    .catchall {:try_start_3ce .. :try_end_3e2} :catchall_3e3

    throw p0

    :catchall_3e3
    move-exception v0

    move-object p0, v0

    goto :goto_3e1

    :catchall_3e6
    move-exception v0

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_3fd

    new-instance v4, Lq02;

    invoke-direct {v4, p0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3fd
    sget-object v1, Lth2;->p:Ljava/lang/Object;

    monitor-enter v1

    :try_start_400
    sget p0, Lth2;->r:I

    sub-int/2addr p0, v5

    sput p0, Lth2;->r:I

    if-nez p0, :cond_411

    sget-object p0, Lth2;->q:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    sput-object v3, Lth2;->q:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_411
    monitor-exit v1
    :try_end_412
    .catchall {:try_start_400 .. :try_end_412} :catchall_415

    throw v0

    :goto_413
    :try_start_413
    monitor-exit v1
    :try_end_414
    .catchall {:try_start_413 .. :try_end_414} :catchall_415

    throw p0

    :catchall_415
    move-exception v0

    move-object p0, v0

    goto :goto_413

    :pswitch_418
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lha2;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lja2;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lja2;

    invoke-virtual {v0, v1, p0}, Lha2;->W(Lja2;Lja2;)V

    return-void

    :pswitch_428
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lf12;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p0}, Lf12;->b(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_438
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lf12;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lvr9;

    invoke-virtual {v0, v1, p0}, Lf12;->a(Ljava/util/ArrayList;Lvr9;)V

    return-void

    :pswitch_448
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lf12;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v0, v1, p0}, Lf12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void

    :pswitch_458
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lf12;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lra;

    invoke-virtual {v0, v1, p0}, Lf12;->f(Ljava/util/ArrayList;Lra;)V

    return-void

    :pswitch_468
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Leb1;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lcb1;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ldb1;

    iget-object v2, v0, Leb1;->a:Landroid/view/View;

    new-instance v3, Ld99;

    invoke-direct {v3, v1}, Ld99;-><init>(Lcb1;)V

    invoke-virtual {v2, v3, v5}, Landroid/view/View;->startActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object v1

    iput-object v1, v0, Leb1;->h:Landroid/view/ActionMode;

    if-nez v1, :cond_486

    invoke-virtual {p0}, Ldb1;->close()V

    :cond_486
    return-void

    :pswitch_487
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Li5o;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lwx;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, v0, Li5o;->k:Ljava/lang/Object;

    check-cast v3, Lnz;

    if-eqz v3, :cond_4da

    const-string v4, "version"

    iget-object v3, v3, Lnz;->f:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "opid"

    iget-object v4, v0, Li5o;->k:Ljava/lang/Object;

    check-cast v4, Lnz;

    iget-object v4, v4, Lnz;->o:Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v0, Li5o;->h:Ljava/lang/Object;

    check-cast v3, Lesk;

    invoke-interface {v3}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "gaid"

    invoke-virtual {v2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v1

    invoke-virtual {v1}, Lv1;->x()Ljava/lang/String;

    move-result-object v1

    const-string v3, "abGroup"

    invoke-virtual {v2, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "country"

    iget-object v0, v0, Li5o;->k:Ljava/lang/Object;

    check-cast v0, Lnz;

    iget-object v0, v0, Lnz;->l:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_4da
    invoke-virtual {p0, v2}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_4de
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/AddressEditorManager;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lbq2;

    invoke-virtual {v0, v1, p0}, Lcom/opera/android/autofill/AddressEditorManager;->a(Ljava/lang/String;Lbq2;)V

    return-void

    :pswitch_4ee
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lio;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lap;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lbp;

    iput-object v1, v0, Lyz;->r:Lap;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Laqi;

    if-eqz p0, :cond_509

    iget-object v0, p0, Lyz;->q:Ltz;

    if-eqz v0, :cond_509

    invoke-interface {v0, p0}, Ltz;->c(Lyz;)Z

    :cond_509
    return-void

    :pswitch_50a
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lgo;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lap;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lbp;

    iput-object v1, v0, Lyz;->r:Lap;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Laqi;

    if-eqz p0, :cond_525

    iget-object v0, p0, Lyz;->q:Ltz;

    if-eqz v0, :cond_525

    invoke-interface {v0, p0}, Ltz;->c(Lyz;)Z

    :cond_525
    return-void

    :pswitch_526
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Lbo;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lap;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Lbp;

    iput-object v1, v0, Lyz;->r:Lap;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Laqi;

    if-eqz p0, :cond_541

    iget-object v0, p0, Lyz;->q:Ltz;

    if-eqz v0, :cond_541

    invoke-interface {v0, p0}, Ltz;->c(Lyz;)Z

    :cond_541
    return-void

    :pswitch_542
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Lesk;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-string v2, "gad_has_consent_for_cookies"

    invoke-static {v0}, Loup;->Z(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_564

    invoke-static {v3, v2, v4}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    goto :goto_567

    :cond_564
    invoke-static {v3, v2}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :goto_567
    :try_start_567
    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    invoke-static {v0}, Lao;->r(Landroid/app/Activity;)V
    :try_end_56d
    .catch Landroid/util/AndroidRuntimeException; {:try_start_567 .. :try_end_56d} :catch_5c2

    :try_start_56d
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v1, :cond_58b

    const-string v2, "com.google.android.gms.ads.APPLICATION_ID"

    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_589
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_56d .. :try_end_589} :catch_58b
    .catch Landroid/util/AndroidRuntimeException; {:try_start_56d .. :try_end_589} :catch_5c2

    if-eqz v2, :cond_58d

    :catch_58b
    :cond_58b
    :try_start_58b
    const-string v1, ""

    :cond_58d
    move-object v7, v1

    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    const-string v1, "force_use_cronet"

    invoke-virtual {v9, v1, v5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v1, Landroid/os/Bundle;

    sget-object v1, Lawh;->a:Lawh;

    sget-object v1, Lbwh;->a:Lbwh;

    sget-object v1, Lyvh;->b:Lyvh;

    const-string v2, "B3EEABB8EE11C2BE770B684D95219ECB"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lj95;->d([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    sget-object v3, Lzvh;->b:Lzvh;

    new-instance v8, Lcwh;

    invoke-direct {v8, v1, v2, v3}, Lcwh;-><init>(Lyvh;Ljava/util/ArrayList;Lzvh;)V

    new-instance v6, Lx77;

    const/16 v11, 0x11

    const/4 v10, 0x0

    invoke-direct/range {v6 .. v11}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    new-instance v1, Lon;

    invoke-direct {v1, p0}, Lon;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v6, v1}, Lwyh;->B(Landroid/content/Context;Lx77;Lon;)V
    :try_end_5c1
    .catch Landroid/util/AndroidRuntimeException; {:try_start_58b .. :try_end_5c1} :catch_5c2

    goto :goto_5ca

    :catch_5c2
    new-instance v0, Lpn;

    invoke-direct {v0, p0, v4}, Lpn;-><init>(Landroid/content/Context;B)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    :goto_5ca
    return-void

    :pswitch_5cb
    iget-object v0, p0, Lk3;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    iget-object v1, p0, Lk3;->c:Ljava/lang/Object;

    check-cast v1, Ll3;

    iget-object p0, p0, Lk3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    if-eqz v0, :cond_5df

    iget-object p0, v1, Ll3;->b:Lv6f;

    invoke-interface {p0, v0}, Lv6f;->onError(Ljava/lang/Throwable;)V

    goto :goto_5e4

    :cond_5df
    iget-object v0, v1, Ll3;->b:Lv6f;

    invoke-interface {v0, p0}, Lv6f;->a(Ljava/lang/Object;)V

    :goto_5e4
    return-void

    nop

    :pswitch_data_5e6
    .packed-switch 0x0
        :pswitch_5cb
        :pswitch_542
        :pswitch_526
        :pswitch_50a
        :pswitch_4ee
        :pswitch_4de
        :pswitch_487
        :pswitch_468
        :pswitch_458
        :pswitch_448
        :pswitch_438
        :pswitch_428
        :pswitch_418
        :pswitch_3a1
        :pswitch_391
        :pswitch_381
        :pswitch_36c
        :pswitch_335
        :pswitch_2cd
        :pswitch_2b9
        :pswitch_2a5
        :pswitch_271
        :pswitch_20f
        :pswitch_17b
        :pswitch_14e
        :pswitch_122
        :pswitch_fc
        :pswitch_c7
        :pswitch_63
    .end packed-switch
.end method
