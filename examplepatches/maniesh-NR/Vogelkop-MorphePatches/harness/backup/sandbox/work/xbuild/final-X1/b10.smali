.class public final synthetic Lb10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxq9;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lb10;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lwn9;)V
    .registers 2

    const/16 p1, 0xd

    iput-byte p1, p0, Lb10;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 31

    move-object/from16 v0, p0

    iget-byte v0, v0, Lb10;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_3c6

    move-object/from16 v0, p1

    check-cast v0, Landroid/os/Bundle;

    sget-object v1, Lfql;->s:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_23

    invoke-static {v1}, Lqjd;->b(Landroid/os/Bundle;)Lqjd;

    move-result-object v1

    :goto_21
    move-object v10, v1

    goto :goto_26

    :cond_23
    sget-object v1, Lqjd;->h:Lqjd;

    goto :goto_21

    :goto_26
    sget-object v1, Lfql;->t:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v12

    sget-object v1, Lfql;->u:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    sget-object v1, Lfql;->v:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    sget-object v1, Lfql;->w:Ljava/lang/String;

    invoke-virtual {v0, v1, v7}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v18

    sget-object v1, Lfql;->x:Ljava/lang/String;

    invoke-virtual {v0, v1, v7}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v19

    sget-object v1, Lfql;->y:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_50

    invoke-static {v1}, Lljd;->b(Landroid/os/Bundle;)Lljd;

    move-result-object v2

    :cond_50
    move-object/from16 v20, v2

    sget-object v1, Lfql;->z:Ljava/lang/String;

    invoke-virtual {v0, v1, v7}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sget-object v2, Lfql;->A:Ljava/lang/String;

    invoke-virtual {v0, v2, v5, v6}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v21

    sget-object v2, Lfql;->B:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v23

    sget-object v2, Lfql;->C:Ljava/lang/String;

    invoke-virtual {v0, v2, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v25

    sget-object v2, Lfql;->D:Ljava/lang/String;

    invoke-virtual {v0, v2, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v26

    sget-object v2, Lfql;->E:Ljava/lang/String;

    invoke-virtual {v0, v2, v5, v6}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v27

    new-instance v8, Lfql;

    invoke-direct {v8}, Lfql;-><init>()V

    sget-object v9, Lfql;->q:Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual/range {v8 .. v28}, Lfql;->b(Ljava/lang/Object;Lqjd;Ljava/lang/Object;JJJZZLljd;JJIIJ)V

    iput-boolean v1, v8, Lfql;->j:Z

    return-object v8

    :pswitch_84
    move-object/from16 v0, p1

    check-cast v0, Lilh;

    iget-wide v0, v0, Lilh;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_8f
    move-object/from16 v0, p1

    check-cast v0, Lhq8;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_9a
    move-object/from16 v0, p1

    check-cast v0, Lhq8;

    invoke-virtual {v0}, Lhq8;->j()Z

    move-result v1

    if-nez v1, :cond_aa

    new-instance v1, Lvkj;

    invoke-direct {v1, v0}, Lvkj;-><init>(Lhq8;)V

    goto :goto_b1

    :cond_aa
    new-instance v1, Ltkj;

    check-cast v0, Ltq8;

    invoke-direct {v1, v0}, Ltkj;-><init>(Ltq8;)V

    :goto_b1
    return-object v1

    :pswitch_b2
    move-object/from16 v0, p1

    check-cast v0, Llvg;

    new-instance v1, Landroid/util/Pair;

    iget v2, v0, Llvg;->a:I

    invoke-static {v2}, Lp8f;->J(I)Lan0;

    move-result-object v2

    iget v0, v0, Llvg;->b:I

    invoke-static {v0}, Lp8f;->J(I)Lan0;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :pswitch_c8
    move-object/from16 v0, p1

    check-cast v0, Lnkd;

    invoke-interface {v0}, Lnkd;->getTrackGroups()Lfyl;

    move-result-object v0

    iget-object v0, v0, Lfyl;->b:Lcsh;

    new-instance v2, Lbql;

    invoke-direct {v2, v1}, Lbql;-><init>(B)V

    invoke-static {v2, v0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v0

    invoke-static {v0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v0

    return-object v0

    :pswitch_e0
    move-object/from16 v0, p1

    check-cast v0, La46;

    iget-wide v0, v0, La46;->c:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_eb
    move-object/from16 v0, p1

    check-cast v0, La46;

    iget-wide v0, v0, La46;->b:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_f6
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/Collection;

    sget v1, Ls1b;->d:I

    instance-of v1, v0, Ls1b;

    if-eqz v1, :cond_104

    check-cast v0, Ls1b;

    goto/16 :goto_1c4

    :cond_104
    new-instance v1, Lq1b;

    instance-of v3, v0, Ls1b;

    if-eqz v3, :cond_11a

    move-object v4, v0

    check-cast v4, Ls1b;

    check-cast v4, Lish;

    invoke-virtual {v4}, Lish;->o()Lu1b;

    move-result-object v4

    check-cast v4, Lr1b;

    invoke-virtual {v4}, Lr1b;->size()I

    move-result v4

    goto :goto_11c

    :cond_11a
    const/16 v4, 0xb

    :goto_11c
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-boolean v7, v1, Lq1b;->b:Z

    new-instance v5, Lk6f;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v5, v4}, Lk6f;->d(I)V

    iput-object v5, v1, Lq1b;->a:Lk6f;

    if-eqz v3, :cond_19a

    check-cast v0, Ls1b;

    instance-of v3, v0, Lish;

    if-eqz v3, :cond_138

    move-object v2, v0

    check-cast v2, Lish;

    iget-object v2, v2, Lish;->e:Lk6f;

    :cond_138
    if-eqz v2, :cond_169

    iget v0, v5, Lk6f;->c:I

    iget v3, v2, Lk6f;->c:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v5, v0}, Lk6f;->a(I)V

    iget v0, v2, Lk6f;->c:I

    const/4 v3, -0x1

    if-eqz v0, :cond_167

    :cond_14a
    :goto_14a
    if-ltz v7, :cond_1ac

    iget v0, v2, Lk6f;->c:I

    invoke-static {v7, v0}, Lz4o;->A(II)V

    iget-object v0, v2, Lk6f;->a:[Ljava/lang/Object;

    aget-object v0, v0, v7

    iget v4, v2, Lk6f;->c:I

    invoke-static {v7, v4}, Lz4o;->A(II)V

    iget-object v4, v2, Lk6f;->b:[I

    aget v4, v4, v7

    invoke-virtual {v1, v4, v0}, Lq1b;->c(ILjava/lang/Object;)V

    add-int/lit8 v7, v7, 0x1

    iget v0, v2, Lk6f;->c:I

    if-lt v7, v0, :cond_14a

    :cond_167
    move v7, v3

    goto :goto_14a

    :cond_169
    invoke-virtual {v0}, Ls1b;->p()Lu1b;

    move-result-object v2

    iget-object v3, v1, Lq1b;->a:Lk6f;

    iget v4, v3, Lk6f;->c:I

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v3, v2}, Lk6f;->a(I)V

    invoke-virtual {v0}, Ls1b;->p()Lu1b;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_184
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1ac

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj6f;

    iget-object v3, v2, Lj6f;->a:Ljava/lang/Object;

    invoke-virtual {v2}, Lj6f;->a()I

    move-result v2

    invoke-virtual {v1, v2, v3}, Lq1b;->c(ILjava/lang/Object;)V

    goto :goto_184

    :cond_19a
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_19e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1ac

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lq1b;->a(Ljava/lang/Object;)Lw0b;

    goto :goto_19e

    :cond_1ac
    iget-object v0, v1, Lq1b;->a:Lk6f;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lq1b;->a:Lk6f;

    iget v0, v0, Lk6f;->c:I

    if-nez v0, :cond_1ba

    sget-object v0, Lish;->h:Lish;

    goto :goto_1c4

    :cond_1ba
    const/4 v0, 0x1

    iput-boolean v0, v1, Lq1b;->b:Z

    new-instance v0, Lish;

    iget-object v1, v1, Lq1b;->a:Lk6f;

    invoke-direct {v0, v1}, Lish;-><init>(Lk6f;)V

    :goto_1c4
    return-object v0

    :pswitch_1c5
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lfsd;->g:Lnt4;

    invoke-virtual {v1, v0}, Lut4;->e(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d7

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_20b

    :cond_1d7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x10

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1e7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v7, v3, :cond_204

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0xd

    const/16 v5, 0x5c

    if-eq v3, v4, :cond_1fb

    if-eq v3, v5, :cond_1fb

    if-ne v3, v2, :cond_1fe

    :cond_1fb
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1fe
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v7, 0x1

    goto :goto_1e7

    :cond_204
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_20b
    return-object v0

    :pswitch_20c
    move-object/from16 v0, p1

    check-cast v0, Landroid/os/Bundle;

    sget-object v1, Lpjd;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lpjd;->i:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lpjd;->j:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lpjd;->k:Ljava/lang/String;

    invoke-virtual {v0, v4, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    sget-object v5, Lpjd;->l:Ljava/lang/String;

    invoke-virtual {v0, v5, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    sget-object v6, Lpjd;->m:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lpjd;->n:Ljava/lang/String;

    invoke-virtual {v0, v7}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v7, Lmw7;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v1, v7, Lmw7;->c:Ljava/lang/Object;

    invoke-static {v2}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v7, Lmw7;->d:Ljava/lang/Object;

    iput-object v3, v7, Lmw7;->e:Ljava/lang/Object;

    iput v4, v7, Lmw7;->a:I

    iput v5, v7, Lmw7;->b:I

    iput-object v6, v7, Lmw7;->f:Ljava/io/Serializable;

    iput-object v0, v7, Lmw7;->g:Ljava/io/Serializable;

    new-instance v0, Lpjd;

    invoke-direct {v0, v7}, Lpjd;-><init>(Lmw7;)V

    return-object v0

    :pswitch_25c
    move-object/from16 v0, p1

    check-cast v0, Lpjd;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    sget-object v2, Lpjd;->h:Ljava/lang/String;

    iget-object v3, v0, Lpjd;->a:Landroid/net/Uri;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object v2, v0, Lpjd;->b:Ljava/lang/String;

    if-eqz v2, :cond_278

    sget-object v3, Lpjd;->i:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_278
    iget-object v2, v0, Lpjd;->c:Ljava/lang/String;

    if-eqz v2, :cond_281

    sget-object v3, Lpjd;->j:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_281
    iget v2, v0, Lpjd;->d:I

    if-eqz v2, :cond_28a

    sget-object v3, Lpjd;->k:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_28a
    iget v2, v0, Lpjd;->e:I

    if-eqz v2, :cond_293

    sget-object v3, Lpjd;->l:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_293
    iget-object v2, v0, Lpjd;->f:Ljava/lang/String;

    if-eqz v2, :cond_29c

    sget-object v3, Lpjd;->m:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_29c
    iget-object v0, v0, Lpjd;->g:Ljava/lang/String;

    if-eqz v0, :cond_2a5

    sget-object v2, Lpjd;->n:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2a5
    return-object v1

    :pswitch_2a6
    move-object/from16 v0, p1

    check-cast v0, Lzfk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget v2, v0, Lzfk;->a:I

    if-eqz v2, :cond_2bb

    sget-object v3, Lzfk;->d:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_2bb
    iget v2, v0, Lzfk;->b:I

    if-eqz v2, :cond_2c4

    sget-object v3, Lzfk;->e:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_2c4
    iget v0, v0, Lzfk;->c:I

    if-eqz v0, :cond_2cd

    sget-object v2, Lzfk;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_2cd
    return-object v1

    :pswitch_2ce
    move-object/from16 v0, p1

    check-cast v0, Li0c;

    iget-object v0, v0, Li0c;->a:Lszb;

    return-object v0

    :pswitch_2d5
    move-object/from16 v0, p1

    check-cast v0, Lsfa;

    invoke-virtual {v0}, Lsfa;->j()V

    iget-object v0, v0, Lsfa;->I:Lfyl;

    iget-object v0, v0, Lfyl;->b:Lcsh;

    new-instance v2, Lbql;

    invoke-direct {v2, v1}, Lbql;-><init>(B)V

    invoke-static {v2, v0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v0

    invoke-static {v0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v0

    return-object v0

    :pswitch_2ee
    move-object/from16 v0, p1

    check-cast v0, Lbyl;

    return-object v0

    :pswitch_2f3
    move-object/from16 v0, p1

    check-cast v0, Ljzb;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v0, Ljzb;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Ljzb;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_310
    new-instance v0, Lel6;

    move-object/from16 v1, p1

    check-cast v1, Lkzk;

    invoke-direct {v0, v1}, Lel6;-><init>(Lkzk;)V

    return-object v0

    :pswitch_31a
    move-object/from16 v0, p1

    check-cast v0, Lfyl;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    sget-object v2, Lfyl;->e:Ljava/lang/String;

    iget-object v0, v0, Lfyl;->b:Lcsh;

    new-instance v3, Ljava/util/ArrayList;

    iget v4, v0, Lcsh;->d:I

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0, v7}, Lh1b;->u(I)La1b;

    move-result-object v0

    :goto_335
    invoke-virtual {v0}, Lq4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_349

    invoke-virtual {v0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leyl;

    invoke-virtual {v4}, Leyl;->d()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_335

    :cond_349
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object v1

    :pswitch_34d
    move-object/from16 v0, p1

    check-cast v0, Lb05;

    iget v0, v0, Lb05;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v0

    return-object v0

    :pswitch_35c
    move-object/from16 v0, p1

    check-cast v0, La46;

    iget-wide v0, v0, La46;->b:J

    cmp-long v2, v0, v3

    if-eqz v2, :cond_367

    move-wide v5, v0

    :cond_367
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_36c
    move-object/from16 v0, p1

    check-cast v0, Lx36;

    iget v0, v0, Lx36;->r:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_377
    move-object/from16 v0, p1

    check-cast v0, Lg15;

    iget-object v0, v0, Lg15;->a:Lcre;

    return-object v0

    :pswitch_37e
    move-object/from16 v0, p1

    check-cast v0, Ld15;

    iget-object v0, v0, Ld15;->b:Lbre;

    return-object v0

    :pswitch_385
    move-object/from16 v0, p1

    check-cast v0, Le15;

    new-instance v1, Lbre;

    iget-object v3, v0, Le15;->a:Ljava/lang/String;

    iget-object v4, v0, Le15;->b:Ljava/lang/String;

    iget-object v5, v0, Le15;->c:Ljava/lang/String;

    iget-object v6, v0, Le15;->d:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-direct/range {v1 .. v6}, Lbre;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :pswitch_398
    move-object/from16 v0, p1

    check-cast v0, Lkq4;

    iget-object v0, v0, Lkq4;->b:Landroid/net/http/SslCertificate;

    invoke-virtual {v0}, Landroid/net/http/SslCertificate;->getIssuedTo()Landroid/net/http/SslCertificate$DName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/http/SslCertificate$DName;->getCName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_3a7
    move-object/from16 v0, p1

    check-cast v0, Lfi4;

    iget-object v0, v0, Lfi4;->b:Ljava/lang/String;

    return-object v0

    :pswitch_3ae
    move-object/from16 v0, p1

    check-cast v0, Lcn8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_3be
    move-object/from16 v0, p1

    check-cast v0, Lc10;

    iget-object v0, v0, Lc10;->a:Ljava/lang/String;

    return-object v0

    nop

    :pswitch_data_3c6
    .packed-switch 0x0
        :pswitch_3be
        :pswitch_3ae
        :pswitch_3a7
        :pswitch_398
        :pswitch_385
        :pswitch_37e
        :pswitch_377
        :pswitch_36c
        :pswitch_35c
        :pswitch_34d
        :pswitch_31a
        :pswitch_310
        :pswitch_2f3
        :pswitch_2ee
        :pswitch_2d5
        :pswitch_2ce
        :pswitch_2a6
        :pswitch_25c
        :pswitch_20c
        :pswitch_1c5
        :pswitch_f6
        :pswitch_eb
        :pswitch_e0
        :pswitch_c8
        :pswitch_2ee
        :pswitch_b2
        :pswitch_9a
        :pswitch_8f
        :pswitch_84
    .end packed-switch
.end method
