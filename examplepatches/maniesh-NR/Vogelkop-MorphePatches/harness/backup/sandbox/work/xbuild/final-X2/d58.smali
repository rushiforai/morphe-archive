.class public final synthetic Ld58;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Ld58;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lf58;)V
    .registers 2

    const/4 p1, 0x0

    iput-byte p1, p0, Ld58;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte p0, p0, Ld58;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch p0, :pswitch_data_216

    check-cast p1, Lcyj;

    iget-object p0, p1, Lcyj;->h:Lpxj;

    return-object p0

    :pswitch_e
    check-cast p1, Leyj;

    iget-object v2, p1, Leyj;->k:Lcyj;

    iget-object v4, v2, Lcyj;->c:Ly7h;

    iget-object p0, v2, Lcyj;->d:Lrxj;

    iget v0, p0, Lrxj;->a:I

    div-int/2addr v0, v1

    iget v3, p0, Lrxj;->b:I

    div-int/2addr v3, v1

    invoke-static {p0, v0, v3}, Lrxj;->a(Lrxj;II)Lrxj;

    move-result-object v6

    iget-object p0, p1, Leyj;->k:Lcyj;

    iget-object p0, p0, Lcyj;->g:Lqxj;

    iget p1, p0, Lqxj;->h:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    invoke-static {p0, p1}, Lqxj;->a(Lqxj;F)Lqxj;

    move-result-object v7

    const/4 v8, 0x0

    const/16 v9, 0xb5

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v9}, Lcyj;->a(Lcyj;Ljsc;Ly7h;Lixh;Lrxj;Lqxj;Lpxj;I)Lcyj;

    move-result-object p0

    return-object p0

    :pswitch_37
    sget-object p0, Lytj;->c:Ljava/lang/Object;

    monitor-enter p0

    :try_start_3a
    sget-object v0, Lytj;->i:Ljava/util/List;

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    :goto_43
    if-ge v3, v1, :cond_51

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-interface {v2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4e
    .catchall {:try_start_3a .. :try_end_4e} :catchall_55

    add-int/lit8 v3, v3, 0x1

    goto :goto_43

    :cond_51
    monitor-exit p0

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_55
    move-exception v0

    move-object p1, v0

    monitor-exit p0

    throw p1

    :pswitch_59
    move-object v0, p1

    check-cast v0, Ln6j;

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v1, 0x1

    const v2, 0x7f140ffd

    const v3, 0x7f0a09e3

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x2

    const v2, 0x7f1410bd

    const v3, 0x7f0a0a08

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x3

    const v2, 0x7f1410cb

    const v3, 0x7f0a09f6

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x4

    const v2, 0x7f1410fd

    const v3, 0x7f0a09f5

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8b
    check-cast p1, Lq8l;

    iget-object p0, p1, Lq8l;->a:Lp8l;

    sget-object p1, Lp8l;->b:Lp8l;

    if-ne p0, p1, :cond_9e

    goto :goto_9f

    :pswitch_94
    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object p0

    sget-object p1, Lb7j;->d:Lb7j;

    if-eq p0, p1, :cond_9f

    :cond_9e
    move v2, v3

    :cond_9f
    :goto_9f
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_a4
    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->Z()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_af
    check-cast p1, Lch4;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b4
    check-cast p1, Lch4;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b9
    check-cast p1, Lp1d;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_be
    check-cast p1, Lp1d;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c3
    check-cast p1, Lak5;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_d6

    if-eq p0, v2, :cond_d7

    if-eq p0, v1, :cond_d7

    const/4 p1, 0x3

    if-eq p0, p1, :cond_d6

    invoke-static {}, Lh9o;->p()V

    goto :goto_db

    :cond_d6
    move v2, v3

    :cond_d7
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_db
    return-object v0

    :pswitch_dc
    check-cast p1, Ljava/lang/Throwable;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e1
    check-cast p1, Ljava/lang/Throwable;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e6
    move-object v0, p1

    check-cast v0, Ln6j;

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v1, 0x1

    const v2, 0x7f140fcb

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x2

    const v2, 0x7f14103e

    const/4 v3, 0x2

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_100
    check-cast p1, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    new-instance p0, Lylj;

    invoke-direct {p0}, Lylj;-><init>()V

    return-object p0

    :pswitch_10f
    check-cast p1, Lf8k;

    iget-object p0, p1, Lf8k;->g:Lrmn;

    return-object p0

    :pswitch_114
    check-cast p1, Lf8k;

    iget-object p0, p1, Lf8k;->c:Lw6k;

    return-object p0

    :pswitch_119
    check-cast p1, Lut8;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11e
    check-cast p1, Ljava/lang/Boolean;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_123
    check-cast p1, Lwvg;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_128
    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    :pswitch_131
    const-string p0, "SELECT * from add_favorite_removed_suggestion"

    check-cast p1, Losk;

    invoke-virtual {p1, p0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p0

    :try_start_139
    const-string p1, "url"

    invoke-static {p0, p1}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_144
    invoke-virtual {p0}, Lwsk;->n()Z

    move-result v1

    if-eqz v1, :cond_157

    invoke-virtual {p0, p1}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lsr8;

    invoke-direct {v2, v1}, Lsr8;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_156
    .catchall {:try_start_139 .. :try_end_156} :catchall_15b

    goto :goto_144

    :cond_157
    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_15b
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    throw p1

    :pswitch_161
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    sget p1, Lcom/opera/android/webcore/FastResizeWebViewContainer;->i:I

    if-eqz p0, :cond_16e

    sget-object p0, Lbq8;->b:Lbq8;

    goto :goto_170

    :cond_16e
    sget-object p0, Lbq8;->a:Lbq8;

    :goto_170
    return-object p0

    :pswitch_171
    sget-object p0, Lsf8;->a:Lsf8;

    check-cast p1, Lt41;

    invoke-virtual {p1, v3}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v3

    iget-object v4, p1, Lt41;->a:Landroid/database/Cursor;

    invoke-interface {v4, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    if-nez v5, :cond_185

    invoke-interface {v4, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    :cond_185
    invoke-virtual {p1, v1}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, v3, v0, p1}, Lsf8;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_18e
    check-cast p1, Lkotlin/jvm/functions/Function1;

    const-string p0, "events"

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_198
    check-cast p1, Lkotlin/jvm/functions/Function1;

    const-string p0, "events"

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a2
    sget-object p0, Ltf8;->a:Ltf8;

    check-cast p1, Lt41;

    invoke-virtual {p1, v3}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v3

    iget-object v4, p1, Lt41;->a:Landroid/database/Cursor;

    invoke-interface {v4, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    if-nez v5, :cond_1b6

    invoke-interface {v4, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    :cond_1b6
    invoke-virtual {p1, v1}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, v3, v0, p1}, Ltf8;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1bf
    check-cast p1, Lkotlin/jvm/functions/Function1;

    const-string p0, "events"

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c9
    const-string p0, "SELECT * FROM entry"

    check-cast p1, Losk;

    invoke-virtual {p1, p0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p0

    :try_start_1d1
    const-string p1, "tabId"

    invoke-static {p0, p1}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result p1

    const-string v0, "descriptionMedium"

    invoke-static {p0, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v1, "descriptionMini"

    invoke-static {p0, v1}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_1e8
    invoke-virtual {p0}, Lwsk;->n()Z

    move-result v3

    if-eqz v3, :cond_20c

    invoke-virtual {p0, p1}, Lwsk;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {p0, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lauj;->j(Ljava/lang/String;)Ll7l;

    move-result-object v4

    invoke-virtual {p0, v1}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lauj;->j(Ljava/lang/String;)Ll7l;

    move-result-object v5

    new-instance v6, Lm7l;

    invoke-direct {v6, v3, v4, v5}, Lm7l;-><init>(ILl7l;Ll7l;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_20b
    .catchall {:try_start_1d1 .. :try_end_20b} :catchall_210

    goto :goto_1e8

    :cond_20c
    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-object v2

    :catchall_210
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    throw p1

    :pswitch_data_216
    .packed-switch 0x0
        :pswitch_1c9
        :pswitch_1bf
        :pswitch_1a2
        :pswitch_198
        :pswitch_18e
        :pswitch_171
        :pswitch_161
        :pswitch_131
        :pswitch_128
        :pswitch_123
        :pswitch_11e
        :pswitch_119
        :pswitch_114
        :pswitch_10f
        :pswitch_100
        :pswitch_e6
        :pswitch_e1
        :pswitch_dc
        :pswitch_c3
        :pswitch_be
        :pswitch_b9
        :pswitch_b4
        :pswitch_af
        :pswitch_a4
        :pswitch_94
        :pswitch_8b
        :pswitch_59
        :pswitch_37
        :pswitch_e
    .end packed-switch
.end method
