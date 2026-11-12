.class public final synthetic Lwzd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx77;


# direct methods
.method public synthetic constructor <init>(Lx77;B)V
    .registers 3

    iput-byte p2, p0, Lwzd;->a:B

    iput-object p1, p0, Lwzd;->b:Lx77;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lwzd;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lwzd;->b:Lx77;

    packed-switch v0, :pswitch_data_8c

    new-instance v0, Lu9d;

    invoke-direct {v0}, Lu9d;-><init>()V

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_18
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    if-ltz v2, :cond_45

    check-cast v3, Lvzd;

    instance-of v5, v3, Lzzd;

    if-eqz v5, :cond_43

    check-cast v3, Lzzd;

    iget-object v3, v3, Lzzd;->a:Lb2l;

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_43
    move v2, v4

    goto :goto_18

    :cond_45
    invoke-static {}, Lj95;->n()V

    throw v1

    :cond_49
    invoke-virtual {v0}, Lu9d;->g()Lu9d;

    move-result-object p0

    return-object p0

    :pswitch_4e
    new-instance v0, Lu9d;

    invoke-direct {v0}, Lu9d;-><init>()V

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_5d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_86

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    if-ltz v2, :cond_82

    check-cast v3, Lvzd;

    instance-of v5, v3, Lyzd;

    if-eqz v5, :cond_80

    check-cast v3, Lyzd;

    iget v3, v3, Lyzd;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_80
    move v2, v4

    goto :goto_5d

    :cond_82
    invoke-static {}, Lj95;->n()V

    throw v1

    :cond_86
    invoke-virtual {v0}, Lu9d;->g()Lu9d;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_4e
    .end packed-switch
.end method
