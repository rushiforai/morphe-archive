.class public final synthetic Laul;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcul;


# direct methods
.method public synthetic constructor <init>(Lcul;B)V
    .registers 3

    iput-byte p2, p0, Laul;->a:B

    iput-object p1, p0, Laul;->b:Lcul;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Laul;->a:B

    iget-object p0, p0, Laul;->b:Lcul;

    packed-switch v0, :pswitch_data_42

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    iget-object p1, p0, Lcul;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0}, Lcul;->d()V

    return-void

    :pswitch_17
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhq8;

    iget-object v1, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Lhq8;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1d

    invoke-virtual {v0}, Lhq8;->c()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcul;->a(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    :cond_40
    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
