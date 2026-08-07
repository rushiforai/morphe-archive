.class public abstract Ll/cq2;
.super Ll/crx;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final k:J

.field public final l:J

.field public m:Ll/eq2;

.field public n:[I


# direct methods
.method public constructor <init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJJJ)V
    .locals 12
    .param p5    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object v0, p0

    .line 2
    move-object v1, p1

    .line 3
    move-object v2, p2

    .line 4
    move-object v3, p3

    .line 5
    move/from16 v4, p4

    .line 6
    .line 7
    move-object/from16 v5, p5

    .line 8
    .line 9
    move-wide/from16 v6, p6

    .line 10
    .line 11
    move-wide/from16 v8, p8

    .line 12
    .line 13
    move-wide/from16 v10, p14

    .line 14
    .line 15
    invoke-direct/range {v0 .. v11}, Ll/crx;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJ)V

    .line 16
    .line 17
    .line 18
    move-wide/from16 p1, p10

    .line 19
    .line 20
    iput-wide p1, p0, Ll/cq2;->k:J

    .line 21
    .line 22
    move-wide/from16 p1, p12

    .line 23
    .line 24
    iput-wide p1, p0, Ll/cq2;->l:J

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final i(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cq2;->n:[I

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, [I

    .line 8
    .line 9
    aget p0, p0, p1

    .line 10
    .line 11
    return p0
.end method

.method public final j()Ll/eq2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cq2;->m:Ll/eq2;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/eq2;

    .line 8
    .line 9
    return-object p0
.end method

.method public k(Ll/eq2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cq2;->m:Ll/eq2;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/eq2;->a()[I

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/cq2;->n:[I

    .line 8
    .line 9
    return-void
.end method
