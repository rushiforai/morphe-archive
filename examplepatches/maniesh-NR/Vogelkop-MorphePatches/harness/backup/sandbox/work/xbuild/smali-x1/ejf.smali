.class public final Lejf;
.super Laqi;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final u:Lz13;


# direct methods
.method public constructor <init>(Lz13;Lrm;Ljava/lang/String;Ldl;ILbp;Li3j;Lap;)V
    .registers 18

    sget-object v1, Lyo;->f:Lyo;

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v6, p5

    move-object v5, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Laqi;-><init>(Lyo;Lrm;Ljava/lang/String;Ldl;Lbp;ILi3j;Lap;)V

    iput-object p1, p0, Lejf;->u:Lz13;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lfjf;

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

    iget-object p0, p0, Lejf;->u:Lz13;

    invoke-virtual {p0}, Lz13;->f()V

    return-void
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->n:Lv50;

    return-object p0
.end method

.method public final u()Z
    .registers 2

    iget-object p0, p0, Lejf;->u:Lz13;

    iget-boolean v0, p0, Lz13;->e:Z

    if-eqz v0, :cond_c

    iget-boolean p0, p0, Lz13;->o:Z

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    const/4 p0, 0x1

    return p0
.end method
