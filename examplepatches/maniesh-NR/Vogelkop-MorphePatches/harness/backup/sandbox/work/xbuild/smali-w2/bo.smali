.class public final Lbo;
.super Lln;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final w:Lzq;


# direct methods
.method public constructor <init>(Lrm;Ljava/lang/String;ZLdl;Lzq;ILbp;Li3j;Lap;Ljava/lang/String;)V
    .registers 22

    sget-object v0, Lyo;->b:Lyo;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move/from16 v7, p6

    move-object/from16 v6, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-direct/range {v1 .. v10}, Lln;-><init>(Lrm;Ljava/lang/String;ZLdl;Lbp;ILi3j;Lap;Ljava/lang/String;)V

    move-object/from16 p1, p5

    iput-object p1, p0, Lbo;->w:Lzq;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lco;

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
    .registers 3

    invoke-super {p0}, Laqi;->c()V

    iget-object p0, p0, Lbo;->w:Lzq;

    iget-object v0, p0, Lzq;->a:Lads_mobile_sdk/tl;

    const/4 v1, 0x0

    iput-object v1, p0, Lzq;->a:Lads_mobile_sdk/tl;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-virtual {p0}, Lzq;->a()V

    invoke-virtual {p0}, Lzq;->b()V

    if-eqz v0, :cond_18

    invoke-interface {v0}, Lui;->destroy()V

    :cond_18
    return-void
.end method

.method public final d(Liq;)Z
    .registers 4

    iget-object v0, p0, Lyz;->j:Lrm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lrm;->d:Lrm;

    if-eq v0, v1, :cond_d

    sget-object v1, Lrm;->e:Lrm;

    if-ne v0, v1, :cond_19

    :cond_d
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_20

    if-eq v0, v1, :cond_1e

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1e

    :cond_19
    invoke-super {p0, p1}, Lyz;->d(Liq;)Z

    move-result p0

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    return v1
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->n:Lv50;

    return-object p0
.end method

.method public final l()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lbo;->w:Lzq;

    iget-object p0, p0, Lzq;->a:Lads_mobile_sdk/tl;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lads_mobile_sdk/ov;->getResponseInfo()Lxzh;

    move-result-object p0

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lxzh;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method
