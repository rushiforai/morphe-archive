.class public final Lbt8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lat8;


# instance fields
.field public final synthetic a:B

.field public final b:J

.field public final c:J

.field public final d:J


# direct methods
.method public constructor <init>(B)V
    .registers 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    iput-byte v1, v0, Lbt8;->a:B

    const v5, -0xa85ab5

    const v6, -0xa552b3

    const v7, -0x1b1e1a

    const v8, -0x40701

    const v9, -0x928b5e

    const v10, -0xcfc595

    const/high16 v11, -0x1000000

    const/16 v12, -0x4973

    const v13, -0x62bd00

    const v14, -0xbbb9b2

    const v15, -0xb79a01

    const v2, -0x116e91

    packed-switch v1, :pswitch_data_112

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const v1, -0x99ffe1

    const v3, -0x6e2727

    const/16 v4, -0x4c46

    invoke-static {v4, v1, v2, v15, v3}, Lam2;->s(IIIII)V

    const v1, -0xffc8c7

    invoke-static {v1}, Lcs5;->c(I)J

    const v1, -0xa16b13

    invoke-static {v1}, Lcs5;->c(I)J

    move-result-wide v1

    iput-wide v1, v0, Lbt8;->b:J

    const v1, -0x208218

    invoke-static {v1}, Lcs5;->c(I)J

    move-result-wide v1

    iput-wide v1, v0, Lbt8;->c:J

    const v1, -0xe6f0c3

    invoke-static {v1}, Lcs5;->c(I)J

    move-result-wide v1

    iput-wide v1, v0, Lbt8;->d:J

    const v0, -0x22806

    const v1, -0xd5ecd4

    const v2, -0x78285c

    const v3, -0xffc7e1

    invoke-static {v2, v3, v0, v1, v14}, Lam2;->s(IIIII)V

    const v0, -0x3a3930

    invoke-static {v13, v12, v14, v11, v0}, Lam2;->s(IIIII)V

    const v0, -0xd23c8b

    invoke-static {v10, v9, v8, v7, v0}, Lam2;->s(IIIII)V

    const v0, -0x261d01

    const/16 v1, -0x1e90

    const v2, -0x1b969e

    const v3, -0x515552

    invoke-static {v2, v3, v0, v1, v6}, Lam2;->s(IIIII)V

    const/4 v0, -0x1

    const/high16 v1, 0x33000000

    const v2, -0x63216e

    invoke-static {v5, v2, v1, v11, v0}, Lam2;->s(IIIII)V

    invoke-static {v11}, Lcs5;->c(I)J

    const v0, -0xa1a3a1

    invoke-static {v0}, Lcs5;->c(I)J

    const v0, -0x616361

    invoke-static {v0}, Lcs5;->c(I)J

    return-void

    :pswitch_9c
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget v1, Lu95;->h:I

    sget-wide v1, Lu95;->g:J

    iput-wide v1, v0, Lbt8;->b:J

    iput-wide v1, v0, Lbt8;->c:J

    iput-wide v1, v0, Lbt8;->d:J

    return-void

    :pswitch_aa
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const v1, -0x4bdbc0

    const v3, -0xff9592

    const/4 v4, -0x1

    invoke-static {v1, v4, v2, v15, v3}, Lam2;->s(IIIII)V

    invoke-static {v4}, Lcs5;->c(I)J

    const v1, -0xc77e06

    invoke-static {v1}, Lcs5;->c(I)J

    move-result-wide v1

    iput-wide v1, v0, Lbt8;->b:J

    const v1, -0x5de053

    invoke-static {v1}, Lcs5;->c(I)J

    move-result-wide v1

    iput-wide v1, v0, Lbt8;->c:J

    invoke-static {v4}, Lcs5;->c(I)J

    move-result-wide v1

    iput-wide v1, v0, Lbt8;->d:J

    const v0, -0x8daa8e

    const v1, 0x66e1e2ec

    const v2, -0xe993be    # -1.999463E38f

    invoke-static {v2, v4, v0, v4, v1}, Lam2;->s(IIIII)V

    const v0, -0xd1cfc8

    const v1, -0xa3a199

    const v2, -0x1e1d14

    invoke-static {v12, v13, v2, v0, v1}, Lam2;->s(IIIII)V

    const v0, -0xfb67a9

    invoke-static {v10, v9, v8, v7, v0}, Lam2;->s(IIIII)V

    const v0, -0xab7106

    const/16 v1, -0x2a00

    const v2, -0x20cacd

    const v3, -0x797c79

    invoke-static {v2, v3, v0, v1, v6}, Lam2;->s(IIIII)V

    const/4 v0, -0x1

    const/high16 v1, 0x33000000

    const v2, -0x63216e

    invoke-static {v5, v2, v1, v11, v0}, Lam2;->s(IIIII)V

    invoke-static {v0}, Lcs5;->c(I)J

    invoke-static {v14}, Lcs5;->c(I)J

    invoke-static {v3}, Lcs5;->c(I)J

    return-void

    nop

    :pswitch_data_112
    .packed-switch 0x1
        :pswitch_aa
        :pswitch_9c
    .end packed-switch
.end method


# virtual methods
.method public final c()J
    .registers 3

    iget-byte v0, p0, Lbt8;->a:B

    packed-switch v0, :pswitch_data_e

    iget-wide v0, p0, Lbt8;->d:J

    return-wide v0

    :pswitch_8
    iget-wide v0, p0, Lbt8;->d:J

    return-wide v0

    :pswitch_b
    iget-wide v0, p0, Lbt8;->d:J

    return-wide v0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final e()J
    .registers 3

    iget-byte v0, p0, Lbt8;->a:B

    packed-switch v0, :pswitch_data_e

    iget-wide v0, p0, Lbt8;->b:J

    return-wide v0

    :pswitch_8
    iget-wide v0, p0, Lbt8;->b:J

    return-wide v0

    :pswitch_b
    iget-wide v0, p0, Lbt8;->b:J

    return-wide v0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final s()J
    .registers 3

    iget-byte v0, p0, Lbt8;->a:B

    packed-switch v0, :pswitch_data_e

    iget-wide v0, p0, Lbt8;->c:J

    return-wide v0

    :pswitch_8
    iget-wide v0, p0, Lbt8;->c:J

    return-wide v0

    :pswitch_b
    iget-wide v0, p0, Lbt8;->c:J

    return-wide v0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
