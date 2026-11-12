.class public final synthetic Ln2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo2l;


# direct methods
.method public synthetic constructor <init>(Lo2l;B)V
    .registers 3

    iput-byte p2, p0, Ln2l;->a:B

    iput-object p1, p0, Ln2l;->b:Lo2l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Ln2l;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ln2l;->b:Lo2l;

    packed-switch v0, :pswitch_data_86

    iget-object p0, p0, Lo2l;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    :goto_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm2l;

    instance-of v0, v0, Lu2l;

    if-eqz v0, :cond_10

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_28
    iget-object v0, p0, Lo2l;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    const/4 v2, -0x1

    if-eqz v0, :cond_6c

    invoke-virtual {p0, v0}, Lo2l;->a(Lb2l;)I

    move-result v3

    if-eq v3, v2, :cond_3b

    move v2, v3

    goto :goto_6c

    :cond_3b
    iget-object p0, p0, Lo2l;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_43
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    if-ltz v1, :cond_67

    check-cast v3, Lm2l;

    instance-of v5, v3, Lt2l;

    if-eqz v5, :cond_65

    check-cast v3, Lt2l;

    invoke-interface {v3}, Lt2l;->a()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_65

    move v2, v1

    goto :goto_6c

    :cond_65
    move v1, v4

    goto :goto_43

    :cond_67
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_6c
    :goto_6c
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_71
    iget-object v0, p0, Lo2l;->b:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lo2l;->c:Lz6l;

    invoke-static {v1, p0}, Lexg;->A(Ljava/util/ArrayList;Lnxg;)V

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    return-object p0

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_71
        :pswitch_28
    .end packed-switch
.end method
