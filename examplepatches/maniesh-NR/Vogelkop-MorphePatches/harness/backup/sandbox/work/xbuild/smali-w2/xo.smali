.class public final Lxo;
.super Lvo;
.source "SourceFile"


# instance fields
.field public final h:Lrm;

.field public final i:Ljava/lang/String;

.field public final j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;Lrm;Ljava/lang/String;IIILy55;Z)V
    .registers 20

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p7

    move/from16 v6, p8

    move/from16 v7, p9

    invoke-direct/range {v0 .. v7}, Lvo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;III)V

    iput-object p5, p0, Lxo;->h:Lrm;

    iput-object p6, p0, Lxo;->i:Ljava/lang/String;

    move/from16 p1, p11

    iput-boolean p1, p0, Lxo;->j:Z

    return-void
.end method
