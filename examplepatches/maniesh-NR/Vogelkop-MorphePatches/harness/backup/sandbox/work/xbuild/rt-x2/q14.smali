.class public final synthetic Lq14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Lkotlinx/serialization/internal/EnumDescriptor;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lq14;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lq14;->b:I

    iput-object p2, p0, Lq14;->c:Ljava/lang/Object;

    iput-object p3, p0, Lq14;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lq14;->a:B

    iput-object p1, p0, Lq14;->c:Ljava/lang/Object;

    iput p2, p0, Lq14;->b:I

    iput-object p3, p0, Lq14;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IB)V
    .registers 5

    .line 14
    iput-byte p4, p0, Lq14;->a:B

    iput-object p1, p0, Lq14;->c:Ljava/lang/Object;

    iput-object p2, p0, Lq14;->d:Ljava/lang/Object;

    iput p3, p0, Lq14;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lq14;->a:B

    const/4 v1, 0x0

    iget v2, p0, Lq14;->b:I

    iget-object v3, p0, Lq14;->d:Ljava/lang/Object;

    iget-object p0, p0, Lq14;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1c2

    check-cast p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    check-cast v3, Lc3h;

    sget-object v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->u:[I

    invoke-virtual {p0, v3, v2}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->s(Lc3h;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    check-cast p0, Lu6c;

    check-cast v3, Lndf;

    invoke-virtual {p0}, Lu6c;->j()Lm6c;

    move-result-object p0

    iget-object v0, p0, Lm6c;->l:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ln6c;

    iget v4, v4, Ln6c;->a:I

    if-ne v4, v2, :cond_28

    goto :goto_3b

    :cond_3a
    const/4 v1, 0x0

    :goto_3b
    check-cast v1, Ln6c;

    const/4 v0, 0x0

    if-eqz v1, :cond_72

    iget v2, v1, Ln6c;->l:I

    int-to-float v2, v2

    iget v1, v1, Ln6c;->m:I

    int-to-float v1, v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    add-float/2addr v1, v2

    iget v2, p0, Lm6c;->m:I

    iget p0, p0, Lm6c;->n:I

    add-int/2addr v2, p0

    int-to-float p0, v2

    div-float/2addr p0, v4

    sub-float/2addr v1, p0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p0

    iget v1, v3, Lndf;->d:F

    div-float/2addr p0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float p0, v1, p0

    invoke-static {p0, v0, v1}, Ldjh;->b(FFF)F

    move-result p0

    const v2, 0x3f7d70a4    # 0.99f

    cmpl-float v2, p0, v2

    if-lez v2, :cond_6a

    move v0, v1

    goto :goto_72

    :cond_6a
    const v1, 0x3c23d70a    # 0.01f

    cmpg-float v1, p0, v1

    if-ltz v1, :cond_72

    move v0, p0

    :cond_72
    :goto_72
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_77
    check-cast p0, Lokhttp3/internal/http2/Http2Connection;

    check-cast v3, Ljava/util/List;

    invoke-static {p0, v2, v3}, Lokhttp3/internal/http2/Http2Connection;->h(Lokhttp3/internal/http2/Http2Connection;ILjava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_80
    check-cast p0, Lrn9;

    check-cast v3, [I

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lon9;

    invoke-interface {p0}, Lon9;->H()Lqe6;

    move-result-object p0

    if-eqz p0, :cond_a4

    array-length v0, v3

    if-eqz v0, :cond_a4

    iget-object v0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast v0, Llba;

    invoke-interface {v0}, Llba;->getView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Ld50;

    const/4 v4, 0x4

    invoke-direct {v1, p0, v3, v2, v4}, Ld50;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_a4
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a7
    check-cast p0, Ljava/lang/String;

    check-cast v3, Lkotlinx/serialization/internal/EnumDescriptor;

    new-array v0, v2, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    move v4, v1

    :goto_ae
    if-ge v4, v2, :cond_d5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v6, v3, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->e:[Ljava/lang/String;

    aget-object v6, v6, v4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lxik;->e:Lxik;

    new-array v7, v1, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-static {v5, v6, v7}, Lxug;->g(Ljava/lang/String;Lxvg;[Lkotlinx/serialization/descriptors/SerialDescriptor;)Ld2j;

    move-result-object v5

    aput-object v5, v0, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_ae

    :cond_d5
    return-object v0

    :pswitch_d6
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v3, Lafe;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v3, p0}, Lafe;->setValue(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e9
    check-cast p0, Landroid/content/Context;

    check-cast v3, Landroid/content/res/TypedArray;

    invoke-virtual {v3, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p0, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    new-instance p0, Ljava/io/BufferedReader;

    const/16 v0, 0x2000

    invoke-direct {p0, v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    :try_start_107
    new-instance v0, Ld82;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Ldo5;

    invoke-direct {v2, v0}, Ldo5;-><init>(Lkotlin/sequences/Sequence;)V

    invoke-static {v2}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0
    :try_end_116
    .catchall {:try_start_107 .. :try_end_116} :catchall_1ba

    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    check-cast v0, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {p0, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_16b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, ","

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x6

    invoke-static {v3, v4, v1, v5}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_14c
    :goto_14c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_163

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lxkm;->a(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_14c

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_14c

    :cond_163
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12a

    :cond_16b
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :cond_175
    :goto_175
    if-ge v4, v3, :cond_18c

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    check-cast v6, Ljava/util/List;

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_175

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_175

    :cond_18c
    new-instance p0, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {p0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_199
    if-ge v1, v2, :cond_1b9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Ljava/util/List;

    new-instance v4, Lnz7;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    check-cast v3, Ljava/lang/Iterable;

    const/4 v6, 0x1

    invoke-static {v3, v6}, Lkotlin/collections/CollectionsKt;->G(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v3

    invoke-direct {v4, v5, v3}, Lnz7;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_199

    :cond_1b9
    return-object p0

    :catchall_1ba
    move-exception v0

    :try_start_1bb
    throw v0
    :try_end_1bc
    .catchall {:try_start_1bb .. :try_end_1bc} :catchall_1bc

    :catchall_1bc
    move-exception v1

    invoke-static {p0, v0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1

    nop

    :pswitch_data_1c2
    .packed-switch 0x0
        :pswitch_e9
        :pswitch_d6
        :pswitch_a7
        :pswitch_80
        :pswitch_77
        :pswitch_18
    .end packed-switch
.end method
