.class public final Ltdf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrsf;


# instance fields
.field public final a:Lc5o;

.field public final b:Lv56;


# direct methods
.method public constructor <init>(Lc5o;Lv56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltdf;->a:Lc5o;

    iput-object p2, p0, Ltdf;->b:Lv56;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(JZ)V
    .registers 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const/4 p3, -0x1

    iget-object p0, p0, Ltdf;->b:Lv56;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p3, p1, p2}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final c()V
    .registers 5

    const/16 v0, 0x9

    const/4 v1, 0x1

    iget-object p0, p0, Ltdf;->b:Lv56;

    const-wide/16 v2, 0x3c9

    invoke-virtual {p0, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final d(Lrsf;)V
    .registers 16

    check-cast p1, Ltdf;

    iget-object p1, p1, Ltdf;->b:Lv56;

    iget-object p0, p0, Ltdf;->b:Lv56;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, -0x1

    if-eqz v1, :cond_17

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p1, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    if-eqz v3, :cond_28

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v1, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_28
    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_38

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {p1, v3, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_38
    const/4 v5, 0x7

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_48

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {p1, v5, v4, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_48
    const/16 v6, 0x8

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_59

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {p1, v6, v2, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_59
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_6a

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p1, v2, v4, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6a
    const/16 v2, 0xb

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_7b

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {p1, v2, v4, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7b
    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_8c

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {p1, v2, v4, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8c
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    const/16 v8, 0x92e

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x0

    if-eqz v7, :cond_d4

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lob0;

    new-instance v12, Lob0;

    invoke-direct {v12, v8, v4, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_b3

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v11, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b3
    invoke-virtual {v7, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_c2

    invoke-virtual {v7, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v4, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c2
    invoke-virtual {v7, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_d1

    invoke-virtual {v7, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lme0;

    invoke-virtual {v12, v10, v4, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d1
    invoke-virtual {p1, v2, v4, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d4
    const/16 v2, 0xe

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_f9

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrf0;

    new-instance v12, Lrf0;

    invoke-direct {v12, v8, v4, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_f6

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v12, v11, v4, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_f6
    invoke-virtual {p1, v2, v4, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_f9
    const/16 v2, 0xf

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_198

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lhn0;

    new-instance v12, Lhn0;

    const/16 v13, 0x9

    invoke-direct {v12, v8, v4, v13}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_11d

    invoke-virtual {v7, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v11, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_11d
    invoke-virtual {v7, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_12c

    invoke-virtual {v7, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v4, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_12c
    invoke-virtual {v7, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_13b

    invoke-virtual {v7, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v10, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_13b
    invoke-virtual {v7, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_14a

    invoke-virtual {v7, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v9, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_14a
    invoke-virtual {v7, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_159

    invoke-virtual {v7, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    invoke-virtual {v12, v0, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_159
    invoke-virtual {v7, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_168

    invoke-virtual {v7, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v1, v4, v13}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_168
    invoke-virtual {v7, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_177

    invoke-virtual {v7, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v12, v3, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_177
    invoke-virtual {v7, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_186

    invoke-virtual {v7, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v12, v5, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_186
    invoke-virtual {v7, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_195

    invoke-virtual {v7, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v12, v6, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_195
    invoke-virtual {p1, v2, v4, v12}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_198
    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1ea

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqr0;

    new-instance v3, Lqr0;

    invoke-direct {v3, v8, v4, v0}, Ljf0;-><init>(III)V

    invoke-virtual {v2, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1ba

    invoke-virtual {v2, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v3, v11, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1ba
    invoke-virtual {v2, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1c9

    invoke-virtual {v2, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v3, v4, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1c9
    invoke-virtual {v2, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1d8

    invoke-virtual {v2, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v3, v10, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1d8
    invoke-virtual {v2, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1e7

    invoke-virtual {v2, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v3, v9, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1e7
    invoke-virtual {p1, v1, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1ea
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_21e

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lks0;

    new-instance v1, Lks0;

    invoke-direct {v1, v8, v4, v10}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_20c

    invoke-virtual {p0, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v11, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_20c
    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_21b

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, v4, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_21b
    invoke-virtual {p1, v0, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_21e
    return-void
.end method

.method public final e(Lrsf;)Lrsf;
    .registers 4

    new-instance v0, Ltdf;

    check-cast p1, Ltdf;

    iget-object p1, p1, Ltdf;->b:Lv56;

    iget-object v1, p0, Ltdf;->b:Lv56;

    invoke-virtual {v1, p1}, Lv56;->m(Ljf0;)Ljf0;

    iget-object p0, p0, Ltdf;->a:Lc5o;

    invoke-direct {v0, p0, v1}, Ltdf;-><init>(Lc5o;Lv56;)V

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Ltdf;->b:Lv56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final g(III)V
    .registers 4

    return-void
.end method

.method public final h(Ljava/io/ByteArrayOutputStream;J)V
    .registers 4

    iget-object p0, p0, Ltdf;->b:Lv56;

    invoke-virtual {p0, p1, p2, p3}, Ljf0;->t(Ljava/io/ByteArrayOutputStream;J)V

    return-void
.end method

.method public final i(IZ)V
    .registers 6

    sget-object p1, Lir5;->b:Lb30;

    if-nez p1, :cond_5

    return-void

    :cond_5
    const/4 p2, 0x3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Ltdf;->b:Lv56;

    const/4 v2, -0x1

    invoke-virtual {p0, p2, v2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p2, 0x4

    const/4 v0, 0x0

    invoke-virtual {p0, p2, v2, v0}, Ljf0;->o(III)V

    const/16 p2, 0x8

    const-wide/16 v0, 0x3c9

    invoke-virtual {p0, p2, v2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p2, 0x6

    const-wide/16 v0, 0x68

    const/4 v2, 0x1

    invoke-virtual {p0, p2, v2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p2, 0x7

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p2, v2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p2, 0x5

    iget-object p1, p1, Lb30;->b:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Lv56;->x(ILjava/lang/String;)V

    const/16 p1, 0xa

    sget-object p2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lv56;->x(ILjava/lang/String;)V

    return-void
.end method

.method public final isEmpty()Z
    .registers 2

    iget-object p0, p0, Ltdf;->b:Lv56;

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpd0;

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final j(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ltdf;->b:Lv56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lv56;->x(ILjava/lang/String;)V

    return-void
.end method
