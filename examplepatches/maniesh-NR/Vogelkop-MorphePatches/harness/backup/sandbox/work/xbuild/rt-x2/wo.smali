.class public final Lwo;
.super Lvo;
.source "SourceFile"


# instance fields
.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:I

.field public final k:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;II)V
    .registers 19

    sget-object v4, Lyo;->d:Lyo;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lvo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;III)V

    iput-object p7, p0, Lwo;->h:Ljava/lang/String;

    move-object/from16 p1, p8

    iput-object p1, p0, Lwo;->i:Ljava/lang/String;

    move/from16 p1, p9

    iput p1, p0, Lwo;->j:I

    move/from16 p1, p10

    iput p1, p0, Lwo;->k:I

    return-void
.end method
