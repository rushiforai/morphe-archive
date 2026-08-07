.class public final Lcom/google/android/exoplayer2/source/dash/c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/dash/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/dash/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/g6c$a;

.field public final b:I

.field public final c:Ll/p45$a;


# direct methods
.method public constructor <init>(Ll/g6c$a;)V
    .locals 1

    const/4 v0, 0x1

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer2/source/dash/c$a;-><init>(Ll/g6c$a;I)V

    return-void
.end method

.method public constructor <init>(Ll/g6c$a;I)V
    .locals 1

    .line 11
    sget-object v0, Ll/ej3;->j:Ll/p45$a;

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c$a;-><init>(Ll/p45$a;Ll/g6c$a;I)V

    return-void
.end method

.method public constructor <init>(Ll/p45$a;Ll/g6c$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/c$a;->c:Ll/p45$a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/dash/c$a;->a:Ll/g6c$a;

    .line 7
    .line 8
    iput p3, p0, Lcom/google/android/exoplayer2/source/dash/c$a;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/vtv;Ll/h4c;Ll/hs2;I[ILl/u9f;IJZLjava/util/List;Lcom/google/android/exoplayer2/source/dash/d$c;Ll/pgj0;Ll/bf80;Ll/zb5;)Lcom/google/android/exoplayer2/source/dash/a;
    .locals 21
    .param p12    # Lcom/google/android/exoplayer2/source/dash/d$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vtv;",
            "Ll/h4c;",
            "Ll/hs2;",
            "I[I",
            "Ll/u9f;",
            "IJZ",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Lcom/google/android/exoplayer2/source/dash/d$c;",
            "Ll/pgj0;",
            "Ll/bf80;",
            "Ll/zb5;",
            ")",
            "Lcom/google/android/exoplayer2/source/dash/a;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p13

    .line 4
    .line 5
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c$a;->a:Ll/g6c$a;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/g6c$a;->a()Ll/g6c;

    .line 8
    .line 9
    .line 10
    move-result-object v12

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v12, v1}, Ll/g6c;->e(Ll/pgj0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v3, Lcom/google/android/exoplayer2/source/dash/c;

    .line 17
    .line 18
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c$a;->c:Ll/p45$a;

    .line 19
    .line 20
    iget v15, v0, Lcom/google/android/exoplayer2/source/dash/c$a;->b:I

    .line 21
    .line 22
    move-object/from16 v5, p1

    .line 23
    .line 24
    move-object/from16 v6, p2

    .line 25
    .line 26
    move-object/from16 v7, p3

    .line 27
    .line 28
    move/from16 v8, p4

    .line 29
    .line 30
    move-object/from16 v9, p5

    .line 31
    .line 32
    move-object/from16 v10, p6

    .line 33
    .line 34
    move/from16 v11, p7

    .line 35
    .line 36
    move-wide/from16 v13, p8

    .line 37
    .line 38
    move/from16 v16, p10

    .line 39
    .line 40
    move-object/from16 v17, p11

    .line 41
    .line 42
    move-object/from16 v18, p12

    .line 43
    .line 44
    move-object/from16 v19, p14

    .line 45
    .line 46
    move-object/from16 v20, p15

    .line 47
    .line 48
    invoke-direct/range {v3 .. v20}, Lcom/google/android/exoplayer2/source/dash/c;-><init>(Ll/p45$a;Ll/vtv;Ll/h4c;Ll/hs2;I[ILl/u9f;ILl/g6c;JIZLjava/util/List;Lcom/google/android/exoplayer2/source/dash/d$c;Ll/bf80;Ll/zb5;)V

    .line 49
    .line 50
    .line 51
    return-object v3
.end method
