.class public final synthetic Lo02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLoqh;Ljava/nio/channels/WritableByteChannel;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lo02;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lo02;->c:J

    iput-object p3, p0, Lo02;->b:Ljava/lang/Object;

    iput-object p4, p0, Lo02;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;JLjava/lang/Object;B)V
    .registers 6

    .line 13
    iput-byte p5, p0, Lo02;->a:B

    iput-object p1, p0, Lo02;->b:Ljava/lang/Object;

    iput-wide p2, p0, Lo02;->c:J

    iput-object p4, p0, Lo02;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;JB)V
    .registers 6

    .line 14
    iput-byte p5, p0, Lo02;->a:B

    iput-object p1, p0, Lo02;->b:Ljava/lang/Object;

    iput-object p2, p0, Lo02;->d:Ljava/lang/Object;

    iput-wide p3, p0, Lo02;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lo02;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x3

    const-string v4, "GET"

    const/4 v5, 0x0

    iget-wide v6, v0, Lo02;->c:J

    iget-object v8, v0, Lo02;->d:Ljava/lang/Object;

    iget-object v9, v0, Lo02;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_226

    check-cast v9, Lzfo;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Lspa;

    sget-object v1, Lapa;->b:Lapa;

    invoke-static {v4}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v1

    iput-object v1, v0, Lspa;->b:Lapa;

    iget-object v1, v0, Lspa;->a:Ltgm;

    iget-object v2, v9, Lzfo;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "q/event_venue"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    const-string v1, "event_id"

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz v8, :cond_4a

    const-string v1, "user_preferred_language"

    invoke-static {v0, v1, v8}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4d
    check-cast v9, Lweo;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Lspa;

    sget-object v1, Lapa;->b:Lapa;

    invoke-static {v4}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v1

    iput-object v1, v0, Lspa;->b:Lapa;

    iget-object v1, v0, Lspa;->a:Ltgm;

    iget-object v2, v9, Lweo;->a:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Ll75;->f(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Ll75;->f(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "api/v1/market/product/"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/limits"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    sget-object v1, Lvpa;->a:Ljf2;

    iget-object v0, v0, Lspa;->c:Lg9a;

    const-string v1, "Authorization"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Accept-Language"

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a8
    check-cast v9, Ljava/lang/String;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Lki0;

    iget-object v1, v0, Lki0;->a:Lji0;

    iget-object v0, v0, Lki0;->a:Lji0;

    const/4 v4, 0x0

    const-wide/16 v10, 0x1

    invoke-virtual {v1, v4, v2, v10, v11}, Ljf0;->p(IIJ)V

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_c3

    invoke-virtual {v0, v2, v2, v9}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c3
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_cd

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cd
    sget-object v1, Lii0;->c:Lii0;

    invoke-virtual {v0, v3, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2, v6, v7}, Ljf0;->p(IIJ)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_d9
    check-cast v9, Lcd1;

    check-cast v8, Lpaj;

    move-object/from16 v10, p1

    check-cast v10, Lo3c;

    invoke-virtual {v10}, Lo3c;->a()V

    invoke-virtual {v9}, Lcd1;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_123

    invoke-virtual {v9}, Lcd1;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    const v1, 0x3e851eb8    # 0.26f

    mul-float/2addr v0, v1

    invoke-static {v6, v7, v0}, Lu95;->b(JF)J

    move-result-wide v11

    sget-object v0, Lkfo;->i:Lrga;

    if-ne v8, v0, :cond_112

    const/4 v15, 0x0

    const/16 v16, 0x7e

    const-wide/16 v13, 0x0

    invoke-static/range {v10 .. v16}, Lmk7;->z0(Lmk7;JJFI)V

    goto :goto_123

    :cond_112
    iget-object v0, v10, Lo3c;->a:Luh4;

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v0

    invoke-virtual {v10}, Lo3c;->getLayoutDirection()Ld2c;

    move-result-object v2

    invoke-interface {v8, v0, v1, v2, v10}, Lpaj;->a(JLd2c;Ln27;)Lw7d;

    move-result-object v0

    invoke-static {v10, v0, v11, v12}, Lx7d;->f(Lmk7;Lw7d;J)V

    :cond_123
    :goto_123
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_126
    check-cast v9, Loqh;

    check-cast v8, Ljava/nio/channels/WritableByteChannel;

    move-object/from16 v0, p1

    check-cast v0, Ljava/nio/ByteBuffer;

    iget-wide v1, v9, Loqh;->a:J

    sub-long/2addr v6, v1

    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    move-result v1

    int-to-long v1, v1

    cmp-long v1, v6, v1

    if-gez v1, :cond_15a

    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    move-result v1

    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    move-result v2

    long-to-int v3, v6

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    :goto_147
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_151

    invoke-interface {v8, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    goto :goto_147

    :cond_151
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-wide v0, v9, Loqh;->a:J

    add-long/2addr v0, v6

    iput-wide v0, v9, Loqh;->a:J

    goto :goto_16e

    :cond_15a
    const-wide/16 v1, 0x0

    :goto_15c
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_169

    invoke-interface {v8, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    goto :goto_15c

    :cond_169
    iget-wide v3, v9, Loqh;->a:J

    add-long/2addr v3, v1

    iput-wide v3, v9, Loqh;->a:J

    :goto_16e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_171
    move-object v1, v9

    check-cast v1, Lwth;

    check-cast v8, Lbo3;

    move-object/from16 v3, p1

    check-cast v3, Ltw7;

    instance-of v4, v3, Lrw7;

    if-eqz v4, :cond_188

    check-cast v3, Lrw7;

    iget-object v0, v3, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    invoke-virtual {v8, v5}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c9

    :cond_188
    instance-of v4, v3, Lsw7;

    if-eqz v4, :cond_1cc

    check-cast v3, Lsw7;

    iget-object v3, v3, Lsw7;->a:Ljava/lang/Object;

    check-cast v3, Lsfb;

    if-eqz v3, :cond_1c5

    iget-object v6, v3, Lsfb;->h:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v7, v3, -0x1

    if-ltz v7, :cond_1c0

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v7, v2, :cond_1c0

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    move-object v3, v1

    new-instance v1, Lp02;

    iget-wide v4, v0, Lo02;->c:J

    move-object v2, v8

    const/4 v8, -0x1

    invoke-direct/range {v1 .. v8}, Lp02;-><init>(Lkotlin/jvm/functions/Function1;Lwth;JLjava/util/ArrayList;II)V

    move-object v6, v1

    move-object v1, v3

    move-wide v2, v4

    move-wide v4, v9

    invoke-virtual/range {v1 .. v6}, Lwth;->z(JJLkotlin/jvm/functions/Function1;)V

    goto :goto_1c9

    :cond_1c0
    move-object v2, v8

    invoke-virtual {v2, v5}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c9

    :cond_1c5
    move-object v2, v8

    invoke-virtual {v2, v5}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1c9
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1cf

    :cond_1cc
    invoke-static {}, Lh9o;->p()V

    :goto_1cf
    return-object v5

    :pswitch_1d0
    move-object v6, v9

    check-cast v6, Lwth;

    move-object v7, v8

    check-cast v7, Lj31;

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    instance-of v2, v1, Lrw7;

    if-eqz v2, :cond_1e8

    check-cast v1, Lrw7;

    iget-object v0, v1, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    invoke-virtual {v7, v5}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21f

    :cond_1e8
    instance-of v2, v1, Lsw7;

    if-eqz v2, :cond_222

    check-cast v1, Lsw7;

    iget-object v1, v1, Lsw7;->a:Ljava/lang/Object;

    check-cast v1, Lsfb;

    if-eqz v1, :cond_21c

    iget-object v11, v1, Lsfb;->h:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_200

    invoke-virtual {v7, v5}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21f

    :cond_200
    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    move-object v8, v6

    new-instance v6, Lp02;

    iget-wide v9, v0, Lo02;->c:J

    const/4 v13, 0x1

    invoke-direct/range {v6 .. v13}, Lp02;-><init>(Lkotlin/jvm/functions/Function1;Lwth;JLjava/util/ArrayList;II)V

    move-object v11, v6

    move-object v6, v8

    move-wide v7, v9

    move-wide v9, v1

    invoke-virtual/range {v6 .. v11}, Lwth;->z(JJLkotlin/jvm/functions/Function1;)V

    goto :goto_21f

    :cond_21c
    invoke-virtual {v7, v5}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_21f
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_225

    :cond_222
    invoke-static {}, Lh9o;->p()V

    :goto_225
    return-object v5

    :pswitch_data_226
    .packed-switch 0x0
        :pswitch_1d0
        :pswitch_171
        :pswitch_126
        :pswitch_d9
        :pswitch_a8
        :pswitch_4d
    .end packed-switch
.end method
