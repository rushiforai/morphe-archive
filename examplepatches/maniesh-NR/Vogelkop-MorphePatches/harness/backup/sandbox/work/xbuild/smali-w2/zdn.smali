.class public final Lzdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final a:Ltah;

.field public final b:Laen;

.field public final c:Ls2b;


# direct methods
.method public constructor <init>(Lgjm;Lmw3;Lnw3;Lnw3;Lnw3;Lmw3;Lmw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lnw3;Lnw3;Lmw3;Lnw3;Lnw3;Lmw3;Lnw3;Lkw3;Lhw3;Lx5f;)V
    .registers 38

    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ltah;

    move-object/from16 v4, p3

    move-object/from16 v11, p4

    move-object/from16 v6, p5

    move-object/from16 v3, p8

    move-object/from16 v2, p10

    move-object/from16 v7, p14

    move-object/from16 v5, p15

    move-object/from16 v8, p16

    move-object/from16 v9, p17

    move-object/from16 v10, p18

    invoke-direct/range {v1 .. v11}, Ltah;-><init>(Lnw3;Lcom/opera/android/Lazy;Lnw3;Lmw3;Lnw3;Lnw3;Lnw3;Lkw3;Lhw3;Lnw3;)V

    iput-object v1, v0, Lzdn;->a:Ltah;

    move-object v2, v1

    new-instance v1, Laen;

    move-object/from16 v3, p1

    move-object/from16 v16, p2

    move-object/from16 v14, p3

    move-object/from16 v7, p4

    move-object/from16 v15, p5

    move-object/from16 v13, p6

    move-object/from16 v5, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v4, p10

    move-object/from16 v6, p11

    move-object/from16 v11, p12

    move-object/from16 v12, p13

    move-object/from16 v17, p19

    invoke-direct/range {v1 .. v17}, Laen;-><init>(Ltah;Lgjm;Lnw3;Lmw3;Lnw3;Lnw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lhw3;Lmw3;Lnw3;Lmw3;Lnw3;Lnw3;Lmw3;Lx5f;)V

    iput-object v1, v0, Lzdn;->b:Laen;

    new-instance v1, Ls2b;

    const/4 v2, 0x1

    move-object/from16 v3, p2

    invoke-direct {v1, v3, v2}, Ls2b;-><init>(Lesk;B)V

    iput-object v1, v0, Lzdn;->c:Ls2b;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 2

    iget-object p0, p0, Lzdn;->c:Ls2b;

    invoke-virtual {p0, p1}, Ls2b;->a(Ljava/lang/Class;)Ll7n;

    move-result-object p0

    return-object p0
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 2

    iget-object p0, p0, Lzdn;->b:Laen;

    invoke-virtual {p0, p1}, Laen;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0
.end method
