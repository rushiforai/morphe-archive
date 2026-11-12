.class public final Lgnf;
.super Laqi;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final u:Lbie;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lbie;ILbp;Li3j;Lap;)V
    .registers 30

    filled-new-array/range {p1 .. p4}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v0, p10

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v12, Lyo;->f:Lyo;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v7, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    invoke-direct/range {v2 .. v15}, Laqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lbp;Li3j;Lap;)V

    move-object/from16 v0, p9

    iput-object v0, v2, Lgnf;->u:Lbie;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Linf;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lmq;-><init>(Lyz;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V

    return-object v0
.end method

.method public final c()V
    .registers 1

    invoke-super {p0}, Laqi;->c()V

    iget-object p0, p0, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->d()V

    return-void
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->b:Lv50;

    return-object p0
.end method

.method public final u()Z
    .registers 1

    iget-object p0, p0, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lpxo;->d()Z

    move-result p0

    return p0
.end method
