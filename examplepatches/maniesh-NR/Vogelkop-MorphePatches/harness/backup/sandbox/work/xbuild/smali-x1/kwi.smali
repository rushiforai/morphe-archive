.class public final Lkwi;
.super Llwi;
.source "SourceFile"


# instance fields
.field public final l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;[[BLjava/lang/String;ZLjava/lang/String;[[B)V
    .registers 24

    sget-object v1, Lnwi;->b:Lnwi;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Llwi;-><init>(Lnwi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;[[BZLjava/lang/String;[[B)V

    move-object/from16 p1, p8

    iput-object p1, p0, Lkwi;->l:Ljava/lang/String;

    return-void
.end method
