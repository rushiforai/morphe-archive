.class public final Lib9;
.super Lhb9;
.source "SourceFile"


# instance fields
.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:J

.field public final j:J

.field public final k:Ljava/lang/String;

.field public final l:Landroid/net/Uri;


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;Landroid/net/Uri;)V
    .registers 16

    invoke-direct/range {p0 .. p5}, Lhb9;-><init>(JJLjava/lang/String;)V

    iput-object p6, p0, Lib9;->e:Ljava/lang/String;

    iput-object p7, p0, Lib9;->f:Ljava/lang/String;

    iput-object p8, p0, Lib9;->g:Ljava/lang/String;

    iput-object p9, p0, Lib9;->h:Ljava/lang/String;

    iput-wide p10, p0, Lib9;->i:J

    iput-wide p12, p0, Lib9;->j:J

    iput-object p14, p0, Lib9;->k:Ljava/lang/String;

    iput-object p15, p0, Lib9;->l:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final e()Z
    .registers 5

    iget-wide v0, p0, Lib9;->i:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-gtz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
