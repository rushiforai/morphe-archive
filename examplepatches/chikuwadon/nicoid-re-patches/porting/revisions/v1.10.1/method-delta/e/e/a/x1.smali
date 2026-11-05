.class public Le/e/a/x1;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Landroid/text/Spanned;

.field public e:Landroid/text/Spanned;

.field public f:Landroid/text/Spanned;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/Boolean;

.field public j:Ljava/lang/Boolean;

.field public k:I

.field public l:I

.field public m:I

.field public n:Landroid/text/Spanned;

.field public o:I

.field public p:J

.field public q:J

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:J

.field public u:J

.field public v:Lcom/google/android/gms/ads/NativeExpressAdView;

.field public w:Landroid/widget/LinearLayout;

.field public x:Z

.field public y:Ljava/lang/String;


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    sparse-switch v0, :sswitch_data_236

    goto/16 :goto_10e

    :sswitch_b
    const-string v0, "item_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0xb

    goto/16 :goto_10f

    :sswitch_17
    const-string v0, "videoinfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x4

    goto/16 :goto_10f

    :sswitch_22
    const-string v0, "thumbnail"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x2

    goto/16 :goto_10f

    :sswitch_2d
    const-string v0, "videourl"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x0

    goto/16 :goto_10f

    :sswitch_38
    const-string v0, "rawplay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x8

    goto/16 :goto_10f

    :sswitch_44
    const-string v0, "posttime"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x5

    goto/16 :goto_10f

    :sswitch_4f
    const-string v0, "postedAt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x13

    goto/16 :goto_10f

    :sswitch_5b
    const-string v0, "isselect"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x7

    goto/16 :goto_10f

    :sswitch_66
    const-string v0, "rawmylis"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0xa

    goto/16 :goto_10f

    :sswitch_72
    const-string v0, "videoid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x1

    goto/16 :goto_10f

    :sswitch_7d
    const-string v0, "admobview"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x11

    goto/16 :goto_10f

    :sswitch_89
    const-string v0, "title"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x6

    goto/16 :goto_10f

    :sswitch_94
    const-string v0, "rank"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0xd

    goto/16 :goto_10f

    :sswitch_a0
    const-string v0, "isad"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0xe

    goto/16 :goto_10f

    :sswitch_ac
    const-string v0, "rawpostedAt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x15

    goto :goto_10f

    :sswitch_b7
    const-string v0, "cachedAt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x14

    goto :goto_10f

    :sswitch_c2
    const-string v0, "isLImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x12

    goto :goto_10f

    :sswitch_cd
    const-string v0, "cachesize"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0xf

    goto :goto_10f

    :sswitch_d8
    const-string v0, "rawres"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x9

    goto :goto_10f

    :sswitch_e3
    const-string v0, "first_retrieve"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0xc

    goto :goto_10f

    :sswitch_ee
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x3

    goto :goto_10f

    :sswitch_f8
    const-string v0, "rawcachedAt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x16

    goto :goto_10f

    :sswitch_103
    const-string v0, "cached"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/16 p1, 0x10

    goto :goto_10f

    :cond_10e
    :goto_10e
    const/4 p1, -0x1

    :goto_10f
    packed-switch p1, :pswitch_data_294

    goto/16 :goto_234

    :pswitch_114
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/x1;->u:J

    goto/16 :goto_234

    :pswitch_11e
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/x1;->t:J

    goto/16 :goto_234

    :pswitch_128
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->s:Ljava/lang/String;

    goto/16 :goto_234

    :pswitch_12e
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->r:Ljava/lang/String;

    goto/16 :goto_234

    :pswitch_134
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/x1;->x:Z

    goto/16 :goto_234

    :pswitch_13e
    check-cast p2, Lcom/google/android/gms/ads/NativeExpressAdView;

    iput-object p2, p0, Le/e/a/x1;->v:Lcom/google/android/gms/ads/NativeExpressAdView;

    goto/16 :goto_234

    :pswitch_144
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/x1;->q:J

    goto/16 :goto_234

    :pswitch_14e
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/x1;->p:J

    goto/16 :goto_234

    :pswitch_158
    check-cast p2, Ljava/lang/Boolean;

    iput-object p2, p0, Le/e/a/x1;->j:Ljava/lang/Boolean;

    goto/16 :goto_234

    :pswitch_15e
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->g:Ljava/lang/String;

    goto/16 :goto_234

    :pswitch_164
    check-cast p2, Landroid/text/Spanned;

    iput-object p2, p0, Le/e/a/x1;->n:Landroid/text/Spanned;

    goto/16 :goto_234

    :pswitch_16a
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Le/e/a/x1;->o:I

    goto/16 :goto_234

    :pswitch_174
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Le/e/a/x1;->m:I

    goto/16 :goto_234

    :pswitch_17e
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Le/e/a/x1;->l:I

    goto/16 :goto_234

    :pswitch_188
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Le/e/a/x1;->k:I

    goto/16 :goto_234

    :pswitch_192
    check-cast p2, Ljava/lang/Boolean;

    iput-object p2, p0, Le/e/a/x1;->i:Ljava/lang/Boolean;

    goto/16 :goto_234

    :pswitch_198
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->h:Ljava/lang/String;

    goto/16 :goto_234

    :pswitch_19e
    check-cast p2, Landroid/text/Spanned;

    iput-object p2, p0, Le/e/a/x1;->f:Landroid/text/Spanned;

    goto/16 :goto_234

    :pswitch_1a4
    check-cast p2, Landroid/text/Spanned;

    iput-object p2, p0, Le/e/a/x1;->e:Landroid/text/Spanned;

    goto/16 :goto_234

    :pswitch_1aa
    check-cast p2, Landroid/text/Spanned;

    iput-object p2, p0, Le/e/a/x1;->d:Landroid/text/Spanned;

    goto/16 :goto_234

    :pswitch_1b0
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->c:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/x1;->c:Ljava/lang/String;

    const-string p2, "M"

    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_234

    const/16 p1, 0x20

    const-string p2, "(smile\\?i=|/thumbnails/)([0-9]+)"

    invoke-static {p2, p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    iget-object p2, p0, Le/e/a/x1;->c:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    :goto_1cc
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p2

    if-eqz p2, :cond_1db

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_1cc

    :cond_1db
    iget-boolean p1, p0, Le/e/a/x1;->x:Z

    if-eqz p1, :cond_203

    const p1, 0x1683d19

    if-lt v2, p1, :cond_203

    iget-object p1, p0, Le/e/a/x1;->c:Ljava/lang/String;

    const-string p2, ".M"

    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1fb

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Le/e/a/x1;->c:Ljava/lang/String;

    invoke-static {p1, v0, p2}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/x1;->c:Ljava/lang/String;

    :cond_1fb
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u30b5\u30e0\u30cdM\u3042\u308a"

    goto :goto_20a

    :cond_203
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u30b5\u30e0\u30cdM\u306a\u3057"

    :goto_20a
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_234

    :pswitch_214
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->b:Ljava/lang/String;

    goto :goto_234

    :pswitch_219
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Le/e/a/x1;->a:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/x1;->a:Ljava/lang/String;

    const-string p2, ".*so\\d.*"

    invoke-virtual {p1, p2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_228

    goto :goto_232

    :cond_228
    iget-object p1, p0, Le/e/a/x1;->a:Ljava/lang/String;

    const-string p2, ".*(sm|nm|ss)\\d.*"

    invoke-virtual {p1, p2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_234

    :goto_232
    iput-boolean v2, p0, Le/e/a/x1;->x:Z

    :cond_234
    :goto_234
    return-void

    nop

    :sswitch_data_236
    .sparse-switch
        -0x518abede -> :sswitch_103
        -0x505b66e3 -> :sswitch_f8
        -0x41f1c51a -> :sswitch_ee
        -0x39da5b15 -> :sswitch_e3
        -0x37e8d088 -> :sswitch_d8
        -0x20f1017d -> :sswitch_cd
        -0x1b4ff1e7 -> :sswitch_c2
        -0x19d6770b -> :sswitch_b7
        -0x95e3e06 -> :sswitch_ac
        0x3176cd -> :sswitch_a0
        0x354c2c -> :sswitch_94
        0x6942258 -> :sswitch_89
        0xaf0f822 -> :sswitch_7d
        0x1afceed6 -> :sswitch_72
        0x1ecbc642 -> :sswitch_66
        0x28c73aa6 -> :sswitch_5b
        0x2d26b1d2 -> :sswitch_4f
        0x2d2d9b6d -> :sswitch_44
        0x3acdef5c -> :sswitch_38
        0x44a11b14 -> :sswitch_2d
        0x4f4e50ec -> :sswitch_22
        0x4f7cc3a9 -> :sswitch_17
        0x7e22b9c7 -> :sswitch_b
    .end sparse-switch

    :pswitch_data_294
    .packed-switch 0x0
        :pswitch_219
        :pswitch_214
        :pswitch_1b0
        :pswitch_1aa
        :pswitch_1a4
        :pswitch_19e
        :pswitch_198
        :pswitch_192
        :pswitch_188
        :pswitch_17e
        :pswitch_174
        :pswitch_16a
        :pswitch_164
        :pswitch_15e
        :pswitch_158
        :pswitch_14e
        :pswitch_144
        :pswitch_13e
        :pswitch_134
        :pswitch_12e
        :pswitch_128
        :pswitch_11e
        :pswitch_114
    .end packed-switch
.end method
