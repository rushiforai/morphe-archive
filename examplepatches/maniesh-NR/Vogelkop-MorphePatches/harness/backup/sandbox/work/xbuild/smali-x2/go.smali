.class public final Lgo;
.super Lln;
.source "SourceFile"


# instance fields
.field public final w:Lads_mobile_sdk/ai1;


# direct methods
.method public constructor <init>(Lads_mobile_sdk/ai1;Ljava/lang/String;ZLdl;ILbp;Li3j;Lap;Ljava/lang/String;)V
    .registers 21

    sget-object v0, Lyo;->b:Lyo;

    sget-object v2, Lrm;->f:Lrm;

    move-object v1, p0

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move/from16 v7, p5

    move-object/from16 v6, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v1 .. v10}, Lln;-><init>(Lrm;Ljava/lang/String;ZLdl;Lbp;ILi3j;Lap;Ljava/lang/String;)V

    iput-object p1, p0, Lgo;->w:Lads_mobile_sdk/ai1;

    return-void
.end method


# virtual methods
.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->k:Lv50;

    return-object p0
.end method

.method public final l()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgo;->w:Lads_mobile_sdk/ai1;

    check-cast p0, Lads_mobile_sdk/ov;

    invoke-virtual {p0}, Lads_mobile_sdk/ov;->getResponseInfo()Lxzh;

    move-result-object p0

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Lxzh;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method
