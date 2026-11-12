.class public final synthetic Le4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lplk;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lplk;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Le4m;->a:B

    iput-object p1, p0, Le4m;->b:Lplk;

    iput-object p2, p0, Le4m;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Le4m;->a:B

    iget-object v1, p0, Le4m;->c:Ljava/lang/String;

    iget-object p0, p0, Le4m;->b:Lplk;

    check-cast p1, Lg4m;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    packed-switch v0, :pswitch_data_30

    new-instance v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lg4m;->b:Ljava/util/List;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0, v0}, Lplk;->s(Ljava/util/ArrayList;)V

    :cond_1e
    return-void

    :pswitch_1f
    new-instance v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lg4m;->b:Ljava/util/List;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p0, v0}, Lplk;->s(Ljava/util/ArrayList;)V

    :cond_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
