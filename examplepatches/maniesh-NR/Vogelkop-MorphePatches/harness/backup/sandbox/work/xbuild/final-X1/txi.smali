.class public final synthetic Ltxi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Louh;
.implements Ln5o;
.implements Ldog;
.implements Lh93;
.implements Lbcf;
.implements Ldcj;
.implements Lv0k;
.implements Lfv4;
.implements Ldkj;
.implements Lfkj;
.implements Lop5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltxi;->a:B

    iput-object p1, p0, Ltxi;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lhlk;

    iget-object p0, p0, Lhlk;->j:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "vpn_pro.kill_switch.on"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Ltxi;->a:B

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    check-cast p0, Lz0b;

    check-cast p1, La46;

    invoke-virtual {p0, p1}, Lv0b;->c(Ljava/lang/Object;)V

    return-void

    :pswitch_f
    check-cast p0, Lqnk;

    check-cast p1, La46;

    new-instance v0, Lpnk;

    iget-wide v1, p1, La46;->b:J

    iget-object v3, p1, La46;->a:Lh1b;

    iget-wide v4, p1, La46;->c:J

    invoke-static {v3, v4, v5}, Lir5;->c(Lh1b;J)[B

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lpnk;-><init>(J[B)V

    iget-object v1, p0, Lqnk;->c:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-wide v1, p0, Lqnk;->j:J

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v3, v1, v3

    if-eqz v3, :cond_38

    iget-wide v3, p1, La46;->d:J

    cmp-long p1, v3, v1

    if-ltz p1, :cond_3b

    :cond_38
    invoke-virtual {p0, v0}, Lqnk;->e(Lpnk;)V

    :cond_3b
    return-void

    :pswitch_data_3c
    .packed-switch 0x16
        :pswitch_f
    .end packed-switch
.end method

.method public final b(Ljjm;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Ljuj;

    if-nez p2, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Ljuj;->r:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lr3k;

    iget-object p0, p0, Lr3k;->d:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p0, v0}, Lic4;->Q(Lcom/google/android/material/internal/CheckableImageButton;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function2;

    sget-object v0, Lytj;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    sget-object v1, Lytj;->h:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1, p0}, Lkotlin/collections/CollectionsKt;->T(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    sput-object p0, Lytj;->h:Ljava/util/List;
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_13

    monitor-exit v0

    return-void

    :catchall_13
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final e(Lgkj;Lhjm;)V
    .registers 5

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lgkj;

    if-ne p1, v0, :cond_d

    const/4 p1, 0x0

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    :cond_d
    sget-object p1, Lhjm;->a:Lhjm;

    if-ne p2, p1, :cond_38

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lplk;

    iget-object p0, p0, Lplk;->d:Ljava/lang/Object;

    check-cast p0, Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lllk;

    const/4 p2, 0x0

    if-nez p1, :cond_2c

    new-instance p1, Lllk;

    new-instance v0, Lmlk;

    invoke-direct {v0, p2, p2}, Lmlk;-><init>(ZZ)V

    invoke-direct {p1, v0, p2, p2}, Lllk;-><init>(Lmlk;ZZ)V

    :cond_2c
    new-instance v0, Lllk;

    iget-object v1, p1, Lllk;->a:Lmlk;

    iget-boolean p1, p1, Lllk;->b:Z

    invoke-direct {v0, v1, p1, p2}, Lllk;-><init>(Lmlk;ZZ)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_38
    return-void
.end method

.method public final f(Lvr3;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .registers 5

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lst4;

    new-instance v0, Ls0k;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p0, v1}, Ls0k;-><init>(Lvr3;Ljava/lang/CharSequence;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Ltxi;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_150

    :pswitch_9
    const-string v0, "vpn_locs"

    check-cast p0, Lcnk;

    check-cast p1, Lvpb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcnk;->a:Landroid/content/Context;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "language"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-static {v5}, Lscd;->w(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    :try_start_23
    invoke-static {v5}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_2a} :catch_a4

    const-string v4, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    :try_start_30
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_33
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_33} :catch_9f

    const-string v4, "version_code"

    const v5, 0x71de74d2

    :try_start_38
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_3b
    .catch Lorg/json/JSONException; {:try_start_38 .. :try_end_3b} :catch_9a

    const-string v4, "countries"

    :try_start_3d
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_44
    .catch Lorg/json/JSONException; {:try_start_3d .. :try_end_44} :catch_95

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v4, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const-string v5, "vpn.subscription_locations_outdated"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :try_start_58
    new-instance p1, Ljava/io/BufferedOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_6b} :catch_7e
    .catchall {:try_start_58 .. :try_end_6b} :catchall_7c

    :try_start_6b
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_7b} :catch_7f
    .catchall {:try_start_6b .. :try_end_7b} :catchall_8f

    goto :goto_a8

    :catchall_7c
    move-exception p0

    goto :goto_91

    :catch_7e
    move-object p1, v2

    :catch_7f
    :try_start_7f
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_8b
    .catchall {:try_start_7f .. :try_end_8b} :catchall_8f

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_a8

    :catchall_8f
    move-exception p0

    move-object v2, p1

    :goto_91
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_95
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_a8

    :catch_9a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_a8

    :catch_9f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_a8

    :catch_a4
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    :goto_a8
    return-object v2

    :pswitch_a9
    check-cast p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    check-cast p1, Landroid/graphics/Bitmap;

    iget-object p0, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->b:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v2

    :pswitch_b3
    check-cast p0, Luyj;

    check-cast p1, Lkotlin/Pair;

    iget-object v0, p1, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v0, Ltyj;

    iget-object p1, p1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v1, p0, Luyj;->d:Landroid/speech/tts/TextToSpeech;

    iget-object v2, v0, Ltyj;->c:Ljava/lang/String;

    xor-int/lit8 p1, p1, 0x1

    iget v3, p0, Luyj;->j:F

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v5, "volume"

    invoke-virtual {v4, v5, v3}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    iget-object v0, v0, Ltyj;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, p1, v4, v0}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_e9

    iget-object p0, p0, Luyj;->b:Lkze;

    new-instance p1, Lvyj;

    sget-object v0, Lryj;->d:Lryj;

    invoke-direct {p1, v0}, Lvyj;-><init>(Lryj;)V

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    :cond_e9
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ec
    check-cast p0, Lkuj;

    check-cast p1, Ljava/lang/Long;

    if-eqz p1, :cond_100

    iget-object v0, p0, Lkuj;->C:Lh7b;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iput-wide v3, v0, Lh7b;->c:J

    invoke-virtual {p0}, Liji;->W()V

    invoke-virtual {p0}, Liji;->Z()Z

    :cond_100
    return-object v2

    :pswitch_101
    check-cast p0, Lvnj;

    check-cast p1, Lfnj;

    iput-object p1, p0, Lvnj;->g:Lfnj;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lvnj;->e:Ljava/util/ArrayList;

    new-instance v3, Ltmi;

    const/4 v4, 0x4

    invoke-direct {v3, p1, p0, v0, v4}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v3}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0}, Lvnj;->a()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_11e
    if-ge v1, p0, :cond_134

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 v1, v1, 0x1

    check-cast p1, Lkotlin/Pair;

    iget-object v2, p1, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iget-object p1, p1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast p1, Lifd;

    invoke-interface {v2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11e

    :cond_134
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_137
    check-cast p0, Leof;

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_13f

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_13f
    invoke-virtual {p0, p1}, Leof;->run(Ljava/lang/Object;)V

    return-object v2

    :pswitch_143
    check-cast p0, Lzzh;

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_14b

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_14b
    invoke-virtual {p0, p1}, Lzzh;->run(Ljava/lang/Object;)V

    return-object v2

    nop

    :pswitch_data_150
    .packed-switch 0x2
        :pswitch_143
        :pswitch_137
        :pswitch_9
        :pswitch_101
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_ec
        :pswitch_b3
        :pswitch_a9
    .end packed-switch
.end method

.method public final h(JLg1g;)V
    .registers 4

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, [Lhyl;

    invoke-static {p1, p2, p3, p0}, Lrm5;->m(JLg1g;[Lhyl;)V

    return-void
.end method

.method public final i()Landroid/view/View;
    .registers 2

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    sget-boolean v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->R:Z

    iget-object v0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->Q:Ljava/lang/Boolean;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    if-eqz v0, :cond_14

    const/4 p0, 0x0

    return-object p0

    :cond_14
    iget-object p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->l:Lxr5;

    return-object p0
.end method

.method public final j()V
    .registers 7

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lhqk;

    iget-object p0, p0, Lhqk;->k:Lwjh;

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lj1k;

    invoke-virtual {v0}, Lj1k;->invoke()Ljava/lang/Object;

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Lgjm;

    new-instance v1, Lhsi;

    new-instance v2, Loba;

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Loba;-><init>(II[I)V

    invoke-direct {v1, v2}, Lhsi;-><init>(Loba;)V

    iget-object v2, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Lfe5;

    new-instance v3, Lwg5;

    const/16 v4, 0x9

    invoke-direct {v3, p0, v4}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    const/4 v4, 0x6

    invoke-direct {p0, v3, v4}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 6

    iget-byte v0, p0, Ltxi;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3a

    check-cast p0, Lc1f;

    iget-object v0, p0, Lc1f;->g:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0, p2}, Lekc;->r(Ljava/lang/Object;)V

    const/16 v0, 0x10

    iget-object v2, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v2, v0}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v2, v0, Lr9b;->a:I

    if-nez v2, :cond_21

    iget v0, v0, Lr9b;->c:I

    if-eqz v0, :cond_22

    :cond_21
    const/4 v1, 0x0

    :cond_22
    iput-boolean v1, p0, Lc1f;->b:Z

    invoke-virtual {p2}, Lg3o;->f()Landroid/view/WindowInsets;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    return-object p2

    :pswitch_2c
    check-cast p0, Lfsj;

    iget-object p1, p0, Lfsj;->b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    new-instance v0, Lcsj;

    invoke-direct {v0, p0, v1}, Lcsj;-><init>(Lfsj;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-object p2

    nop

    :pswitch_data_3a
    .packed-switch 0x7
        :pswitch_2c
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 11

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lshf;

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ld7h;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a055f

    const/4 v1, 0x0

    if-ne p1, v0, :cond_28

    iget-object p0, p0, Ld7h;->b:Ljava/lang/Object;

    check-cast p0, Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ls5h;

    sget-object v0, Lnil;->b:Lnil;

    const/4 v0, 0x7

    const/4 v2, 0x0

    invoke-static {p1, v1, v2, v2, v0}, Ls5h;->a(Ls5h;Ln8g;ZII)Ls5h;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_4b

    :cond_28
    const v0, 0x7f0a0560

    if-ne p1, v0, :cond_4b

    iget-object p0, p0, Ld7h;->b:Ljava/lang/Object;

    check-cast p0, Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ls5h;

    sget-object v6, Lnil;->c:Lnil;

    sget-object v8, Ln8g;->f:Ln8g;

    sget-object v3, Ln8g;->e:Ln8g;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ls5h;

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v8}, Ls5h;-><init>(Ln8g;ZILnil;ZLn8g;)V

    invoke-virtual {p0, v1, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_4b
    :goto_4b
    const/4 p0, 0x1

    return p0
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Looj;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_19

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    if-eqz p0, :cond_21

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    :cond_21
    return-void
.end method
