.class public final synthetic Lrif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lisd;

.field public final synthetic c:Lwjh;

.field public final synthetic d:Llv5;


# direct methods
.method public synthetic constructor <init>(Lisd;Lwjh;Llv5;B)V
    .registers 5

    iput-byte p4, p0, Lrif;->a:B

    iput-object p1, p0, Lrif;->b:Lisd;

    iput-object p2, p0, Lrif;->c:Lwjh;

    iput-object p3, p0, Lrif;->d:Llv5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lrif;->a:B

    const/4 v1, 0x0

    const-string v2, "confirmation"

    iget-object v3, p0, Lrif;->d:Llv5;

    iget-object v4, p0, Lrif;->c:Lwjh;

    iget-object p0, p0, Lrif;->b:Lisd;

    packed-switch v0, :pswitch_data_72

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    iget-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Li16;

    iget-object v0, v0, Li16;->c:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    new-instance v5, Lvi2;

    iget-object v0, v4, Lwjh;->b:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->e:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->c:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->d:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    invoke-direct/range {v5 .. v11}, Lvi2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, v5, v3, v1}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_40
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    iget-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Li16;

    iget-object v0, v0, Li16;->c:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    new-instance v5, Lvi2;

    iget-object v0, v4, Lwjh;->b:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->e:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->c:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    iget-object v0, v4, Lwjh;->d:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    invoke-direct/range {v5 .. v11}, Lvi2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, v5, v3, v1}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_40
    .end packed-switch
.end method
