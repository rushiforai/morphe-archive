.class public abstract Laqi;
.super Lyz;
.source "SourceFile"


# instance fields
.field public s:J

.field public final t:Lbp;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lbp;Li3j;Lap;)V
    .registers 29

    .line 52
    sget-object v11, Lrm;->h:Lrm;

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    invoke-direct/range {v0 .. v14}, Laqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lrm;Lbp;Li3j;Lap;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lrm;Lbp;Li3j;Lap;)V
    .registers 30

    move-object/from16 v0, p12

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    .line 53
    invoke-direct/range {v1 .. v14}, Lyz;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lrm;Li3j;Lap;)V

    .line 54
    iput-object v0, p0, Laqi;->t:Lbp;

    .line 55
    iput-object p0, v0, Lbp;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lyo;Lrm;Ljava/lang/String;Ldl;Lbp;ILi3j;Lap;)V
    .registers 25

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v8, p3

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v10, ""

    const-string v2, ""

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, ""

    move-object/from16 v1, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v9, p4

    move-object/from16 v13, p5

    move-object/from16 v14, p7

    move-object/from16 v15, p8

    invoke-direct/range {v1 .. v15}, Laqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lrm;Lbp;Li3j;Lap;)V

    return-void
.end method


# virtual methods
.method public c()V
    .registers 2

    iget-object p0, p0, Laqi;->t:Lbp;

    if-eqz p0, :cond_7

    const/4 v0, 0x0

    iput-object v0, p0, Lbp;->b:Ljava/lang/Object;

    :cond_7
    return-void
.end method

.method public final o()Z
    .registers 1

    iget-object p0, p0, Laqi;->t:Lbp;

    if-eqz p0, :cond_a

    iget p0, p0, Lbp;->a:I

    if-lez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final q()Z
    .registers 5

    invoke-virtual {p0}, Laqi;->u()Z

    move-result v0

    if-nez v0, :cond_17

    iget-wide v0, p0, Lyz;->m:J

    iget-wide v2, p0, Laqi;->s:J

    add-long/2addr v0, v2

    const-wide/32 v2, 0x493e0

    sub-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    cmp-long p0, v2, v0

    if-ltz p0, :cond_19

    :cond_17
    const/4 p0, 0x1

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final s()Z
    .registers 1

    iget-object p0, p0, Laqi;->t:Lbp;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final t()Z
    .registers 1

    iget-object p0, p0, Laqi;->t:Lbp;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public u()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
