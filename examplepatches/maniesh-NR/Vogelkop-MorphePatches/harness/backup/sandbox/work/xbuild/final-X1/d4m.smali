.class public final synthetic Ld4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lplk;


# direct methods
.method public synthetic constructor <init>(Lplk;B)V
    .registers 3

    iput-byte p2, p0, Ld4m;->a:B

    iput-object p1, p0, Ld4m;->b:Lplk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ld4m;->a:B

    iget-object p0, p0, Ld4m;->b:Lplk;

    packed-switch v0, :pswitch_data_48

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lplk;->p(Ljava/util/List;)V

    return-void

    :pswitch_d
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lplk;->d:Ljava/lang/Object;

    check-cast p0, Lode;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0}, Lekc;->n(Ljava/lang/Object;)V

    return-void

    :pswitch_1c
    check-cast p1, Lg4m;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, Lg4m;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_31

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, p1}, Lplk;->s(Ljava/util/ArrayList;)V

    :cond_31
    return-void

    :pswitch_32
    check-cast p1, Lg4m;

    iget-object v0, p1, Lg4m;->a:Ljava/util/List;

    invoke-virtual {p0, v0}, Lplk;->p(Ljava/util/List;)V

    iget-object p1, p1, Lg4m;->b:Ljava/util/List;

    iget-object p0, p0, Lplk;->d:Ljava/lang/Object;

    check-cast p0, Lode;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0}, Lekc;->n(Ljava/lang/Object;)V

    return-void

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_32
        :pswitch_1c
        :pswitch_d
    .end packed-switch
.end method
