.class public final Leo;
.super Lln;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final w:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Ljava/lang/String;ZLdl;ILbp;Li3j;Lap;Ljava/lang/String;)V
    .registers 36

    move-object/from16 v0, p1

    new-instance v1, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v0, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v9, 0x0

    move v3, v9

    :goto_13
    if-ge v3, v2, :cond_23

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lads_mobile_sdk/l31;

    iget-object v4, v4, Lads_mobile_sdk/l31;->d:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_23
    const/4 v6, 0x0

    const/16 v7, 0x3e

    const-string v2, ":"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v11

    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v9

    :goto_3d
    if-ge v3, v2, :cond_4d

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lads_mobile_sdk/l31;

    iget-object v4, v4, Lads_mobile_sdk/l31;->f:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    :cond_4d
    const/4 v6, 0x0

    const/16 v7, 0x3e

    const-string v2, ":"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v15

    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_66
    if-ge v9, v2, :cond_84

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v9, v9, 0x1

    check-cast v3, Lads_mobile_sdk/l31;

    iget-object v4, v3, Lads_mobile_sdk/l31;->d:Ljava/lang/String;

    iget-object v3, v3, Lads_mobile_sdk/l31;->f:Ljava/lang/String;

    filled-new-array {v4, v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_66

    :cond_84
    const/4 v6, 0x0

    const/16 v7, 0x3e

    const-string v2, ","

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, p5

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    sget-object v1, Lyo;->b:Lyo;

    sget-object v21, Lrm;->g:Lrm;

    const-string v12, ""

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v20, 0x0

    move-object/from16 v10, p0

    move-object/from16 v17, p2

    move/from16 v18, p3

    move-object/from16 v19, p4

    move-object/from16 v22, p6

    move-object/from16 v23, p7

    move-object/from16 v24, p8

    move-object/from16 v25, p9

    invoke-direct/range {v10 .. v25}, Lln;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLdl;Ljava/lang/String;Lrm;Lbp;Li3j;Lap;Ljava/lang/String;)V

    iput-object v0, v10, Leo;->w:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lfo;

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
    .registers 4

    invoke-super {p0}, Laqi;->c()V

    iget-object p0, p0, Leo;->w:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lads_mobile_sdk/l31;

    check-cast v2, Lads_mobile_sdk/ov;

    invoke-virtual {v2}, Lads_mobile_sdk/ov;->destroy()V

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->o:Lv50;

    return-object p0
.end method

.method public final l()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Leo;->w:Ljava/util/ArrayList;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lads_mobile_sdk/l31;

    if-eqz p0, :cond_17

    check-cast p0, Lads_mobile_sdk/ov;

    invoke-virtual {p0}, Lads_mobile_sdk/ov;->getResponseInfo()Lxzh;

    move-result-object p0

    if-eqz p0, :cond_17

    invoke-virtual {p0}, Lxzh;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_17
    const/4 p0, 0x0

    return-object p0
.end method

.method public final m()J
    .registers 3

    iget-object p0, p0, Leo;->w:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method
