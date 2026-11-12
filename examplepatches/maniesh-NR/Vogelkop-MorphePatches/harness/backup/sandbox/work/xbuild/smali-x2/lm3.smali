.class public final Llm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lew3;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Llm3;->a:B

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Lr2b;

    .line 79
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v0, p0, Llm3;->b:Ljava/lang/Object;

    .line 81
    new-instance v0, Ls2b;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ls2b;-><init>(Lesk;B)V

    iput-object v0, p0, Llm3;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgjm;Lqcf;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Llm3;->a:B

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Llm3;->b:Ljava/lang/Object;

    .line 73
    iput-object p2, p0, Llm3;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Llw3;Lwv1;Lew3;Lew3;Llw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Llw3;Llw3;Ltvg;Lwv1;Lcom/opera/android/Lazy;Lj4c;Lcom/opera/android/Lazy;Lwv1;Lew3;Lnu3;)V
    .registers 36

    move-object/from16 v0, p0

    const/4 v1, 0x3

    iput-byte v1, v0, Llm3;->a:B

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lovg;

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    invoke-direct/range {v2 .. v13}, Lovg;-><init>(Llw3;Lwv1;Lew3;Llw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Llw3;Ltvg;Lwv1;Lcom/opera/android/Lazy;)V

    iput-object v2, v0, Llm3;->b:Ljava/lang/Object;

    new-instance v3, Lpvg;

    move-object/from16 v5, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v12, p5

    move-object/from16 v7, p7

    move-object/from16 v4, p8

    move-object/from16 v6, p9

    move-object/from16 v10, p10

    move-object/from16 v8, p14

    move-object/from16 v9, p15

    move-object/from16 v11, p16

    move-object/from16 v13, p17

    move-object/from16 v16, p18

    invoke-direct/range {v3 .. v16}, Lpvg;-><init>(Lcom/opera/android/Lazy;Lwv1;Llw3;Lcom/opera/android/Lazy;Lj4c;Lcom/opera/android/Lazy;Llw3;Lwv1;Llw3;Lew3;Lew3;Lew3;Lnu3;)V

    iput-object v3, v0, Llm3;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lyv3;Lyv3;Ldw3;Ldw3;Lcom/opera/android/Lazy;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Llm3;->a:B

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v1, Lmm3;

    invoke-direct {v1, p1, p2, p5, v0}, Lmm3;-><init>(Lesk;Lesk;Lesk;B)V

    iput-object v1, p0, Llm3;->b:Ljava/lang/Object;

    .line 76
    new-instance p2, Lnm3;

    invoke-direct {p2, p1, p3, p4}, Lnm3;-><init>(Lyv3;Ldw3;Ldw3;)V

    iput-object p2, p0, Llm3;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 3

    iget-byte v0, p0, Llm3;->a:B

    iget-object p0, p0, Llm3;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1e

    check-cast p0, Lpvg;

    invoke-virtual {p0, p1}, Lpvg;->a(Ljava/lang/Class;)Ll7n;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast p0, Ls2b;

    invoke-virtual {p0, p1}, Ls2b;->a(Ljava/lang/Class;)Ll7n;

    move-result-object p0

    return-object p0

    :pswitch_15
    const/4 p0, 0x0

    return-object p0

    :pswitch_17
    check-cast p0, Lnm3;

    invoke-virtual {p0, p1}, Lnm3;->a(Ljava/lang/Class;)Ll7n;

    move-result-object p0

    return-object p0

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_17
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 4

    iget-byte v0, p0, Llm3;->a:B

    iget-object v1, p0, Llm3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    check-cast v1, Lovg;

    invoke-virtual {v1, p1}, Lovg;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast v1, Lr2b;

    invoke-virtual {v1, p1}, Lr2b;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_15
    iget-object p0, p0, Llm3;->c:Ljava/lang/Object;

    check-cast p0, Lqcf;

    check-cast v1, Lgjm;

    const-class v0, Lnt1;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    new-instance p1, Lnt1;

    invoke-direct {p1, v1, p0}, Lnt1;-><init>(Lgjm;Lqcf;)V

    goto :goto_38

    :cond_29
    const-class v0, Lskj;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_37

    new-instance p1, Lskj;

    invoke-direct {p1, v1, p0}, Lskj;-><init>(Lgjm;Lqcf;)V

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    return-object p1

    :pswitch_39
    check-cast v1, Lmm3;

    invoke-virtual {v1, p1}, Lmm3;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_39
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method
