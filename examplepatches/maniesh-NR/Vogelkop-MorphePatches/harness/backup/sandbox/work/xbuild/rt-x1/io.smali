.class public final Lio;
.super Lln;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final w:Lads_mobile_sdk/bu1;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLdl;Ljava/lang/String;Lads_mobile_sdk/bu1;ILbp;Li3j;Lap;Ljava/lang/String;)V
    .registers 33

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    filled-new-array/range {p1 .. p4}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    sget-object v0, Lyo;->b:Lyo;

    sget-object v12, Lrm;->h:Lrm;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v6, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v8, p6

    move/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    invoke-direct/range {v1 .. v16}, Lln;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLdl;Ljava/lang/String;Lrm;Lbp;Li3j;Lap;Ljava/lang/String;)V

    move-object/from16 v0, p10

    iput-object v0, v1, Lio;->w:Lads_mobile_sdk/bu1;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Ljo;

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

    iget-object p0, p0, Lio;->w:Lads_mobile_sdk/bu1;

    invoke-virtual {p0}, Lads_mobile_sdk/ov;->destroy()V

    return-void
.end method

.method public final e()Lv50;
    .registers 1

    iget-object p0, p0, Lio;->w:Lads_mobile_sdk/bu1;

    iget-object p0, p0, Lads_mobile_sdk/bu1;->p:Lads_mobile_sdk/e7;

    if-eqz p0, :cond_13

    iget-object p0, p0, Lads_mobile_sdk/e7;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;

    iget-object p0, p0, Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;->r:Lads_mobile_sdk/we1;

    iget-boolean p0, p0, Lads_mobile_sdk/we1;->e:Z

    if-eqz p0, :cond_13

    sget-object p0, Lv50;->c:Lv50;

    return-object p0

    :cond_13
    sget-object p0, Lv50;->b:Lv50;

    return-object p0
.end method

.method public final l()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lio;->w:Lads_mobile_sdk/bu1;

    invoke-virtual {p0}, Lads_mobile_sdk/ov;->getResponseInfo()Lxzh;

    move-result-object p0

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Lxzh;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method
