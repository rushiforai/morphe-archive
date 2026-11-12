.class public final synthetic Lmfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsfo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Lspa;


# direct methods
.method public synthetic constructor <init>(Lsfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lspa;B)V
    .registers 10

    iput-byte p9, p0, Lmfo;->a:B

    iput-object p1, p0, Lmfo;->b:Lsfo;

    iput-object p2, p0, Lmfo;->c:Ljava/lang/String;

    iput-object p3, p0, Lmfo;->d:Ljava/lang/String;

    iput-object p4, p0, Lmfo;->e:Ljava/lang/String;

    iput-object p5, p0, Lmfo;->f:Ljava/lang/String;

    iput-object p6, p0, Lmfo;->g:Ljava/lang/String;

    iput-object p7, p0, Lmfo;->h:Ljava/lang/String;

    iput-object p8, p0, Lmfo;->i:Lspa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lmfo;->a:B

    const-string v2, "oscore_id"

    const-string v3, "object"

    const-string v4, "user_id"

    const-string v5, "lang"

    const-string v6, "country"

    const-string v7, "product"

    const-string v8, "subscribe"

    iget-object v9, v0, Lmfo;->i:Lspa;

    iget-object v10, v0, Lmfo;->h:Ljava/lang/String;

    iget-object v11, v0, Lmfo;->g:Ljava/lang/String;

    iget-object v12, v0, Lmfo;->f:Ljava/lang/String;

    iget-object v13, v0, Lmfo;->e:Ljava/lang/String;

    iget-object v14, v0, Lmfo;->d:Ljava/lang/String;

    iget-object v15, v0, Lmfo;->c:Ljava/lang/String;

    iget-object v0, v0, Lmfo;->b:Lsfo;

    packed-switch v1, :pswitch_data_82

    move-object/from16 v1, p1

    check-cast v1, Ltgm;

    move-object/from16 v16, p2

    check-cast v16, Ltgm;

    iget-object v0, v0, Lsfo;->a:Ljava/lang/String;

    invoke-static {v0, v8, v1}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-eqz v15, :cond_37

    invoke-static {v9, v7, v15}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_37
    if-eqz v14, :cond_3c

    invoke-static {v9, v6, v14}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3c
    if-eqz v13, :cond_41

    invoke-static {v9, v5, v13}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_41
    if-eqz v12, :cond_46

    invoke-static {v9, v4, v12}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_46
    if-eqz v11, :cond_4b

    invoke-static {v9, v3, v11}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4b
    if-eqz v10, :cond_50

    invoke-static {v9, v2, v10}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_50
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_53
    move-object/from16 v1, p1

    check-cast v1, Ltgm;

    move-object/from16 v16, p2

    check-cast v16, Ltgm;

    iget-object v0, v0, Lsfo;->a:Ljava/lang/String;

    invoke-static {v0, v8, v1}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-eqz v15, :cond_65

    invoke-static {v9, v7, v15}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_65
    if-eqz v14, :cond_6a

    invoke-static {v9, v6, v14}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6a
    if-eqz v13, :cond_6f

    invoke-static {v9, v5, v13}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6f
    if-eqz v12, :cond_74

    invoke-static {v9, v4, v12}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_74
    if-eqz v11, :cond_79

    invoke-static {v9, v3, v11}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_79
    if-eqz v10, :cond_7e

    invoke-static {v9, v2, v10}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_7e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_53
    .end packed-switch
.end method
