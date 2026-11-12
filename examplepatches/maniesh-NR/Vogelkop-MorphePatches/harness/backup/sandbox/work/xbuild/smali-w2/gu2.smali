.class public final synthetic Lgu2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhu2;


# direct methods
.method public synthetic constructor <init>(Lhu2;B)V
    .registers 3

    iput-byte p2, p0, Lgu2;->a:B

    iput-object p1, p0, Lgu2;->b:Lhu2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lgu2;->a:B

    iget-object p0, p0, Lgu2;->b:Lhu2;

    packed-switch v0, :pswitch_data_4c

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lhu2;->j:Lh42;

    new-instance v1, Lfu2;

    iget-object v2, p0, Lhu2;->c:Lyu2;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt v2, v3, :cond_1b

    invoke-interface {p1}, Ljava/util/List;->size()I

    :cond_1b
    new-instance v2, Lcu2;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-direct {v1, p1, v2}, Lfu2;-><init>(Ljava/util/List;Lcu2;)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lhu2;->h:Loml;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c
    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_32

    sget-object p1, Ll08;->a:Ll08;

    :cond_32
    check-cast p1, Ljava/lang/Iterable;

    iget-object p0, p0, Lhu2;->i:Ljk;

    invoke-static {p0, p1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_3b
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lhu2;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_43
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lhu2;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_43
        :pswitch_3b
        :pswitch_2c
    .end packed-switch
.end method
