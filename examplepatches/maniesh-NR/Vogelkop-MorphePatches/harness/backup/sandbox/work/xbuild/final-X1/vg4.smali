.class public final synthetic Lvg4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lvg4;->a:B

    iput-object p1, p0, Lvg4;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lvg4;->a:B

    const-string v1, ""

    const/4 v2, 0x0

    const/high16 v3, 0x41800000    # 16.0f

    const v4, 0x7f06063b

    const v5, 0x7f0402c8

    const/4 v6, 0x0

    iget-object p0, p0, Lvg4;->b:Landroid/content/Context;

    packed-switch v0, :pswitch_data_15e

    const-class v0, Lcom/opera/android/tabui2/screenshots/TabScreenshotEntryDatabase;

    const-string v1, "tab_screenshots"

    invoke-static {p0, v0, v1}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object p0

    const/4 v0, 0x1

    new-array v0, v0, [Lryd;

    sget-object v1, Ln7l;->e:Lbpk;

    aput-object v1, v0, v6

    invoke-virtual {p0, v0}, Lu5i;->a([Lryd;)V

    invoke-virtual {p0}, Lu5i;->b()Ly5i;

    move-result-object p0

    check-cast p0, Lcom/opera/android/tabui2/screenshots/TabScreenshotEntryDatabase;

    return-object p0

    :pswitch_2c
    const v0, 0x7f0805c5

    invoke-static {v0, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_49

    invoke-static {v5, p0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v3, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    invoke-virtual {v0, v6, v6, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    move-object v2, v0

    goto :goto_4e

    :cond_49
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_4e
    return-object v2

    :pswitch_4f
    const v0, 0x7f0805fa

    invoke-static {v0, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v5, p0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v3, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    invoke-virtual {v0, v6, v6, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-object v0

    :pswitch_69
    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_6e
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v0, "publicsuffixes"

    invoke-virtual {p0, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    instance-of v0, p0, Ljava/io/BufferedInputStream;

    if-eqz v0, :cond_7f

    check-cast p0, Ljava/io/BufferedInputStream;

    goto :goto_87

    :cond_7f
    new-instance v0, Ljava/io/BufferedInputStream;

    const/16 v1, 0x2000

    invoke-direct {v0, p0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    move-object p0, v0

    :goto_87
    :try_start_87
    invoke-static {p0}, Lhn9;->r(Ljava/io/BufferedInputStream;)I

    move-result v0

    new-array v1, v0, [B
    :try_end_8d
    .catchall {:try_start_87 .. :try_end_8d} :catchall_c4

    move v2, v6

    :goto_8e
    const-string v3, "Unexpected end of stream"

    const/4 v4, -0x1

    if-ge v2, v0, :cond_a3

    sub-int v5, v0, v2

    :try_start_95
    invoke-virtual {p0, v1, v2, v5}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v5

    if-eq v5, v4, :cond_9d

    add-int/2addr v2, v5

    goto :goto_8e

    :cond_9d
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a3
    invoke-static {p0}, Lhn9;->r(Ljava/io/BufferedInputStream;)I

    move-result v0

    new-array v2, v0, [B

    :goto_a9
    if-ge v6, v0, :cond_bb

    sub-int v5, v0, v6

    invoke-virtual {p0, v2, v6, v5}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v5

    if-eq v5, v4, :cond_b5

    add-int/2addr v6, v5

    goto :goto_a9

    :cond_b5
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_bb
    new-instance v0, Lo9h;

    invoke-direct {v0, v1, v2}, Lo9h;-><init>([B[B)V
    :try_end_c0
    .catchall {:try_start_95 .. :try_end_c0} :catchall_c4

    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    return-object v0

    :catchall_c4
    move-exception v0

    :try_start_c5
    throw v0
    :try_end_c6
    .catchall {:try_start_c5 .. :try_end_c6} :catchall_c6

    :catchall_c6
    move-exception v1

    invoke-static {p0, v0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_cb
    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_d0
    invoke-static {p0}, Li0l;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_d7

    move-object v1, p0

    :cond_d7
    return-object v1

    :pswitch_d8
    invoke-static {p0}, Li0l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_df

    move-object v1, p0

    :cond_df
    return-object v1

    :pswitch_e0
    sget v0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->f:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p0, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_ee
    sget v0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->f:I

    const/high16 v0, 0x40e00000    # 7.0f

    invoke-static {p0, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_fc
    sget v0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->f:I

    const v0, 0x7f0807e3

    invoke-static {v0, p0}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_106
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object p0

    invoke-virtual {p0}, Lgc7;->a()Ljava/lang/String;

    move-result-object p0

    const-string v0, "google_play"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_121
    sget-object v0, Lhv8;->g:Ljxh;

    invoke-virtual {v0, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12c
    sget-object v0, Lhv8;->f:Ljxh;

    invoke-virtual {v0, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_137
    sget-object p0, Loz7;->a:Ljava/util/concurrent/CountDownLatch;

    return-object v2

    :pswitch_13a
    sget v0, Lcom/opera/hype/emoji/EmojiTextView;->i:I

    new-instance v0, Lfz7;

    invoke-direct {v0, p0}, Lfz7;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_142
    new-instance v0, Lkz6;

    invoke-direct {v0, p0}, Lkz6;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_148
    const-string v0, "euicc"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/euicc/EuiccManager;

    return-object p0

    :pswitch_151
    new-instance v0, Lyo6;

    invoke-direct {v0, p0}, Lyo6;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_157
    new-instance v0, Lf8i;

    invoke-direct {v0, p0}, Lf8i;-><init>(Landroid/content/Context;)V

    return-object v0

    nop

    :pswitch_data_15e
    .packed-switch 0x0
        :pswitch_157
        :pswitch_151
        :pswitch_148
        :pswitch_142
        :pswitch_13a
        :pswitch_137
        :pswitch_12c
        :pswitch_121
        :pswitch_106
        :pswitch_fc
        :pswitch_ee
        :pswitch_e0
        :pswitch_d8
        :pswitch_d0
        :pswitch_cb
        :pswitch_6e
        :pswitch_69
        :pswitch_4f
        :pswitch_2c
    .end packed-switch
.end method
