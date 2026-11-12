.class public final Lz65;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/opera/api/Callback;

.field public final c:Ljava/lang/Runnable;

.field public final d:Lyqd;

.field public final e:Z

.field public final f:Lkl0;

.field public final g:Lpn;

.field public h:Z

.field public i:Z

.field public final synthetic j:B

.field public final k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lhu5;Lhpd;)V
    .registers 11

    const/4 v0, 0x1

    iput-byte v0, p0, Lz65;->j:B

    const v0, 0x7f1401b7

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v1

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbxc;

    new-instance v2, Ldm6;

    const v3, 0x7f140554

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x14

    invoke-virtual {v1, v4, p1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_30

    const v4, 0x7f140bda

    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    :cond_30
    const/16 v5, 0x15

    invoke-virtual {v1, v5, p1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_43

    const v5, 0x7f140bd8

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    :cond_43
    const/16 v6, 0x16

    invoke-virtual {v1, v6, p1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_56

    const v1, 0x7f140bd9

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_56
    invoke-direct {v2, v3, v4, v5, v1}, Ldm6;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lkl0;->d:Lkl0;

    invoke-direct {p0, v1, p2, p3, p1}, Lz65;-><init>(Ljava/lang/String;Lcom/opera/api/Callback;Ljava/lang/Runnable;Lkl0;)V

    iput-object v2, p0, Lz65;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lp10;Lhu5;Ljbd;Lyqd;Lpn;)V
    .registers 16

    const/4 v3, 0x0

    iput-byte v3, p0, Lz65;->j:B

    .line 115
    new-instance v8, Ly65;

    .line 116
    iget v3, p2, Lp10;->b:I

    .line 117
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 118
    iget v4, p2, Lp10;->c:I

    .line 119
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f140b36

    .line 120
    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 121
    invoke-direct {v8, v3, v4, v1}, Ly65;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-virtual {p2}, Lp10;->c()Z

    move-result v5

    .line 123
    sget-object v6, Lkl0;->g:Lkl0;

    move-object v0, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v7, p6

    .line 124
    invoke-direct/range {v0 .. v7}, Lz65;-><init>(Ljava/lang/String;Lcom/opera/api/Callback;Ljava/lang/Runnable;Lyqd;ZLkl0;Lpn;)V

    .line 125
    iput-object v8, p0, Lz65;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lxx1;Lyqd;)V
    .registers 8

    const/4 v0, 0x2

    iput-byte v0, p0, Lz65;->j:B

    const v0, 0x7f1401b7

    .line 105
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 106
    new-instance v1, Lt2f;

    const v2, 0x7f140bdd

    .line 107
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f140bdb

    .line 108
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const v3, 0x7f140bdc

    .line 109
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 110
    invoke-direct {v1, v2, v0, p1}, Lt2f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    sget-object v0, Lkl0;->f:Lkl0;

    .line 112
    invoke-direct {p0, p1, p2, p3, v0}, Lz65;-><init>(Ljava/lang/String;Lcom/opera/api/Callback;Ljava/lang/Runnable;Lkl0;)V

    .line 113
    iput-object v1, p0, Lz65;->k:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/opera/api/Callback;Ljava/lang/Runnable;Lkl0;)V
    .registers 13

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    .line 114
    invoke-direct/range {v0 .. v7}, Lz65;-><init>(Ljava/lang/String;Lcom/opera/api/Callback;Ljava/lang/Runnable;Lyqd;ZLkl0;Lpn;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/opera/api/Callback;Ljava/lang/Runnable;Lyqd;ZLkl0;Lpn;)V
    .registers 8

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lz65;->a:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lz65;->b:Lcom/opera/api/Callback;

    .line 100
    iput-object p3, p0, Lz65;->c:Ljava/lang/Runnable;

    .line 101
    iput-object p4, p0, Lz65;->d:Lyqd;

    .line 102
    iput-boolean p5, p0, Lz65;->e:Z

    .line 103
    iput-object p6, p0, Lz65;->f:Lkl0;

    .line 104
    iput-object p7, p0, Lz65;->g:Lpn;

    return-void
.end method
