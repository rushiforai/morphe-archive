.class public final synthetic Lmmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J

.field public final synthetic e:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;JLcom/opera/api/Callback;B)V
    .registers 7

    iput-byte p6, p0, Lmmk;->a:B

    iput-object p1, p0, Lmmk;->b:Ljava/lang/Object;

    iput-object p2, p0, Lmmk;->c:Ljava/lang/String;

    iput-wide p3, p0, Lmmk;->d:J

    iput-object p5, p0, Lmmk;->e:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lmmk;->a:B

    iget-object v2, v0, Lmmk;->e:Lcom/opera/api/Callback;

    iget-object v3, v0, Lmmk;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_60

    check-cast v3, Lslk;

    check-cast v2, Lzzh;

    move-object/from16 v1, p1

    check-cast v1, Lh0d;

    iget-object v5, v3, Lslk;->b:Ltmk;

    new-instance v9, Leof;

    const/16 v4, 0x16

    invoke-direct {v9, v3, v2, v4}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v2, Lh0d;->c:Lh0d;

    iget-object v3, v5, Ltmk;->c:Lxbf;

    iget-object v6, v0, Lmmk;->c:Ljava/lang/String;

    iget-wide v7, v0, Lmmk;->d:J

    if-ne v1, v2, :cond_30

    new-instance v4, Lmmk;

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Lmmk;-><init>(Ljava/lang/Object;Ljava/lang/String;JLcom/opera/api/Callback;B)V

    invoke-virtual {v3, v4}, Lxbf;->A(Lcom/opera/api/Callback;)V

    goto :goto_39

    :cond_30
    new-instance v4, Lmmk;

    const/4 v10, 0x1

    invoke-direct/range {v4 .. v10}, Lmmk;-><init>(Ljava/lang/Object;Ljava/lang/String;JLcom/opera/api/Callback;B)V

    invoke-virtual {v3, v4}, Lxbf;->z(Lcom/opera/api/Callback;)V

    :goto_39
    return-void

    :pswitch_3a
    move-object v5, v3

    check-cast v5, Ltmk;

    move-object v10, v2

    check-cast v10, Leof;

    move-object/from16 v6, p1

    check-cast v6, Ljava/lang/String;

    iget-object v7, v0, Lmmk;->c:Ljava/lang/String;

    iget-wide v8, v0, Lmmk;->d:J

    invoke-virtual/range {v5 .. v10}, Ltmk;->a(Ljava/lang/String;Ljava/lang/String;JLeof;)V

    return-void

    :pswitch_4c
    move-object v11, v3

    check-cast v11, Ltmk;

    move-object/from16 v16, v2

    check-cast v16, Leof;

    move-object/from16 v12, p1

    check-cast v12, Ljava/lang/String;

    iget-object v13, v0, Lmmk;->c:Ljava/lang/String;

    iget-wide v14, v0, Lmmk;->d:J

    invoke-virtual/range {v11 .. v16}, Ltmk;->a(Ljava/lang/String;Ljava/lang/String;JLeof;)V

    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_3a
    .end packed-switch
.end method
