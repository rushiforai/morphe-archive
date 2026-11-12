.class public final Lcq;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/String;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/io/Serializable;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Ljava/util/ArrayList;Lqn;Ldcj;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lcq;->a:B

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcq;->c:Ljava/lang/Object;

    .line 19
    iput-object p2, p0, Lcq;->d:Ljava/io/Serializable;

    .line 20
    iput-object p3, p0, Lcq;->e:Ljava/lang/Object;

    .line 21
    iput-object p4, p0, Lcq;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lcq;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcq;->c:Ljava/lang/Object;

    iput-object p2, p0, Lcq;->b:Ljava/lang/String;

    iput-object p3, p0, Lcq;->d:Ljava/io/Serializable;

    iput-object p4, p0, Lcq;->e:Ljava/lang/Object;

    iput-object p5, p0, Lcq;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 14

    iget-byte p2, p0, Lcq;->a:B

    iget-object v0, p0, Lcq;->e:Ljava/lang/Object;

    iget-object v1, p0, Lcq;->d:Ljava/io/Serializable;

    iget-object v2, p0, Lcq;->c:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_3a

    new-instance v3, Lvcj;

    move-object v5, v2

    check-cast v5, Landroid/content/Intent;

    move-object v6, v1

    check-cast v6, Ljava/util/ArrayList;

    move-object v7, v0

    check-cast v7, Lqn;

    new-instance v8, Lrii;

    const/4 p2, 0x3

    invoke-direct {v8, p0, p2}, Lrii;-><init>(Ljava/lang/Object;B)V

    move-object v4, p1

    invoke-direct/range {v3 .. v8}, Lvcj;-><init>(Lmej;Landroid/content/Intent;Ljava/util/ArrayList;Lqn;Lrii;)V

    return-object v3

    :pswitch_21
    move-object v4, p1

    new-instance p1, Ldq;

    move-object v6, v2

    check-cast v6, Lmq;

    iget-object v7, p0, Lcq;->b:Ljava/lang/String;

    move-object v8, v1

    check-cast v8, Ljava/lang/String;

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    iget-object p0, p0, Lcq;->f:Ljava/lang/Object;

    move-object v10, p0

    check-cast v10, Ljava/util/List;

    move-object v5, v4

    move-object v4, p1

    invoke-direct/range {v4 .. v10}, Ldq;-><init>(Lmej;Lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v4

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    iget-byte v0, p0, Lcq;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lcq;->f:Ljava/lang/Object;

    check-cast p1, Ldcj;

    if-eqz p1, :cond_14

    iget-object v0, p0, Lcq;->b:Ljava/lang/String;

    invoke-interface {p1, p0, v0}, Ldcj;->b(Ljjm;Ljava/lang/String;)V

    :cond_14
    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
