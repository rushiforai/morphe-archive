.class public final synthetic Lrck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lev7;


# direct methods
.method public synthetic constructor <init>(Lev7;B)V
    .registers 3

    iput-byte p2, p0, Lrck;->a:B

    iput-object p1, p0, Lrck;->b:Lev7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lrck;->a:B

    iget-object p0, p0, Lrck;->b:Lev7;

    packed-switch v0, :pswitch_data_38

    check-cast p1, Leyj;

    invoke-virtual {p0}, Lev7;->j()V

    return-void

    :pswitch_d
    check-cast p1, Lb3c;

    iget-object p1, p0, Lev7;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsck;

    invoke-virtual {p0, v1}, Lev7;->i(Lsck;)V

    goto :goto_1d

    :cond_2d
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->clear()V

    iget-object p0, p0, Lev7;->m:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
