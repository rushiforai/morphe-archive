.class public final Lvo8;
.super Laqi;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final u:Lqo8;


# direct methods
.method public constructor <init>(Lyo;Ljava/lang/String;Ldl;Lbp;Li3j;Lap;Lqo8;)V
    .registers 22

    const-string v6, "ID String"

    const-string v9, "Call to action text"

    const-string v1, "Banner Ad"

    const-string v2, "Summary Text"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, ""

    move-object v0, p0

    move-object v10, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    move-object/from16 v13, p6

    invoke-direct/range {v0 .. v13}, Laqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lbp;Li3j;Lap;)V

    move-object/from16 p1, p7

    iput-object p1, p0, Lvo8;->u:Lqo8;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lpo8;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lmq;-><init>(Lyz;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V

    return-object v0
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->n:Lv50;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyz;->a:Ljava/lang/String;

    return-object p0
.end method
