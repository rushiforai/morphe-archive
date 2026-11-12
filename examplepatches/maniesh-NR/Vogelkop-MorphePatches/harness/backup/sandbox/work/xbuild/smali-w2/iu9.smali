.class public final Liu9;
.super Lbqi;
.source "SourceFile"


# static fields
.field public static y:I


# instance fields
.field public final p:Lcom/opera/android/Lazy;

.field public final q:Li5o;

.field public final r:Ljava/lang/String;

.field public final s:Ljava/lang/String;

.field public final t:Ljava/lang/String;

.field public final u:J

.field public final v:J

.field public w:J

.field public x:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/opera/android/Lazy;Lpyl;Li5o;Luwh;Lwo;Lr68;Li3j;Lr9g;)V
    .registers 24

    move-object/from16 v0, p6

    sget-object v4, Lyo;->d:Lyo;

    sget-object v5, Lrm;->b:Lrm;

    iget-object v6, v0, Lwo;->i:Ljava/lang/String;

    iget v1, v0, Lvo;->e:I

    iget v2, v0, Lvo;->g:I

    invoke-static {v1, v2}, Lap;->b(II)Lap;

    move-result-object v12

    const-string v2, "GbSdkProvider"

    const/4 v9, 0x0

    move-object v1, p0

    move-object v3, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p5

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    move-object/from16 v13, p9

    invoke-direct/range {v1 .. v13}, Lbqi;-><init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;)V

    const-wide/16 v2, -0x1

    iput-wide v2, p0, Liu9;->w:J

    move-object/from16 p1, p2

    iput-object p1, p0, Liu9;->p:Lcom/opera/android/Lazy;

    move-object/from16 p1, p4

    iput-object p1, p0, Liu9;->q:Li5o;

    iget-object p1, v0, Lwo;->h:Ljava/lang/String;

    iput-object p1, p0, Liu9;->r:Ljava/lang/String;

    iput-object v6, p0, Liu9;->s:Ljava/lang/String;

    iget-object p1, v0, Lvo;->a:Ljava/lang/String;

    iput-object p1, p0, Liu9;->t:Ljava/lang/String;

    iget p1, v0, Lwo;->k:I

    int-to-long v2, p1

    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    iput-wide v2, p0, Liu9;->u:J

    iget v0, v0, Lwo;->j:I

    int-to-long v2, v0

    invoke-virtual {p1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    iput-wide v2, p0, Liu9;->v:J

    return-void
.end method


# virtual methods
.method public final l(Lzy;Laz;)Lk43;
    .registers 9

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v0, p0, Liu9;->w:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_27

    iget-boolean v2, p0, Liu9;->x:Z

    if-eqz v2, :cond_13

    iget-wide v2, p0, Liu9;->v:J

    goto :goto_15

    :cond_13
    iget-wide v2, p0, Liu9;->u:J

    :goto_15
    add-long/2addr v0, v2

    cmp-long v0, v0, v4

    if-lez v0, :cond_27

    const-string p2, "Backoff triggered"

    iget-object p0, p0, Lbqi;->g:Ljava/lang/String;

    invoke-static {p2, p0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_27
    new-instance v0, Lhu9;

    invoke-interface {p2}, Laz;->a()Ldl;

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lhu9;-><init>(Liu9;Lzy;Ldl;J)V

    return-object v0
.end method
