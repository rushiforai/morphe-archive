.class public final synthetic Llkc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 9

    iput-byte p8, p0, Llkc;->a:B

    iput-object p1, p0, Llkc;->b:Ljava/lang/Object;

    iput-object p2, p0, Llkc;->c:Ljava/lang/Object;

    iput-object p3, p0, Llkc;->d:Ljava/lang/Object;

    iput-object p4, p0, Llkc;->e:Ljava/lang/Object;

    iput-object p5, p0, Llkc;->f:Ljava/lang/Object;

    iput-object p6, p0, Llkc;->g:Ljava/lang/Object;

    iput-object p7, p0, Llkc;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Llkc;->a:B

    iget-object v2, v0, Llkc;->h:Ljava/lang/Object;

    iget-object v3, v0, Llkc;->g:Ljava/lang/Object;

    iget-object v4, v0, Llkc;->f:Ljava/lang/Object;

    iget-object v5, v0, Llkc;->e:Ljava/lang/Object;

    iget-object v6, v0, Llkc;->d:Ljava/lang/Object;

    iget-object v7, v0, Llkc;->c:Ljava/lang/Object;

    iget-object v0, v0, Llkc;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_a0

    move-object v9, v0

    check-cast v9, Landroid/content/Context;

    move-object v10, v7

    check-cast v10, Lumi;

    check-cast v6, Lsnc;

    check-cast v5, Lj4c;

    check-cast v4, Lj4c;

    check-cast v3, Lj4c;

    check-cast v2, Lj4c;

    new-instance v8, Lqs6;

    invoke-virtual {v6}, Lsnc;->a()Lfs6;

    move-result-object v11

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ldse;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lx0f;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfqe;

    iget-object v14, v0, Lfqe;->f:Lode;

    new-instance v15, Lonc;

    const/4 v0, 0x0

    invoke-direct {v15, v2, v0}, Lonc;-><init>(Lj4c;B)V

    invoke-virtual {v6}, Lsnc;->b()Lvpc;

    move-result-object v0

    iget-object v0, v0, Lvpc;->d:Lode;

    iget-object v1, v6, Lsnc;->E:Lb59;

    iget-object v2, v6, Lsnc;->v:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lup9;

    iget-object v2, v6, Lsnc;->p:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcg1;

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    invoke-direct/range {v8 .. v19}, Lqs6;-><init>(Landroid/content/Context;Lumi;Lfs6;Ldse;Lx0f;Lode;Lonc;Lode;Lb59;Lup9;Lcg1;)V

    return-object v8

    :pswitch_6b
    check-cast v0, Lqs4;

    check-cast v7, Lekc;

    check-cast v6, Ltsd;

    check-cast v5, Ltsd;

    check-cast v4, Ltsd;

    check-cast v3, Ltsd;

    check-cast v2, Ltsd;

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v20, v6

    move-object v6, v2

    move-object/from16 v2, v20

    move-object/from16 v20, v5

    move-object v5, v3

    move-object/from16 v3, v20

    invoke-virtual/range {v0 .. v6}, Lqs4;->k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_6b
    .end packed-switch
.end method
