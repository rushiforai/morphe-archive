.class public final synthetic Ld8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ld8e;->a:B

    iput-object p1, p0, Ld8e;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Ld8e;->a:B

    const-string v1, ""

    const/16 v2, 0xa

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object p0, p0, Ld8e;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_508

    check-cast p0, Ls3i;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v5

    :cond_1a
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1f
    check-cast p0, Lxyh;

    iget-object v0, p0, Lxyh;->a:Ljava/lang/ClassLoader;

    iget-object p0, p0, Lxyh;->b:Lg29;

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v6, v5

    :cond_37
    :goto_37
    if-ge v6, v3, :cond_69

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ljava/net/URL;

    invoke-virtual {v7}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    const-string v9, "file"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4f

    move-object v8, v4

    goto :goto_63

    :cond_4f
    sget-object v8, Lw6g;->b:Ljava/lang/String;

    new-instance v8, Ljava/io/File;

    invoke-virtual {v7}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    invoke-static {v8}, Ls16;->p(Ljava/io/File;)Lw6g;

    move-result-object v7

    new-instance v8, Lkotlin/Pair;

    invoke-direct {v8, p0, v7}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_63
    if-eqz v8, :cond_37

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_37

    :cond_69
    const-string v1, "META-INF/MANIFEST.MF"

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v6, v5

    :cond_7d
    :goto_7d
    if-ge v6, v3, :cond_cb

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ljava/net/URL;

    invoke-virtual {v7}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "jar:file:"

    invoke-static {v7, v8, v5}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_9d

    const-string v8, "!"

    const/4 v9, 0x6

    invoke-static {v9, v7, v8}, Lkotlin/text/StringsKt;->O(ILjava/lang/String;Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_9f

    :cond_9d
    move-object v9, v4

    goto :goto_c5

    :cond_9f
    sget-object v9, Lw6g;->b:Ljava/lang/String;

    new-instance v9, Ljava/io/File;

    const/4 v10, 0x4

    invoke-virtual {v7, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v7

    invoke-direct {v9, v7}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    invoke-static {v9}, Ls16;->p(Ljava/io/File;)Lw6g;

    move-result-object v7

    new-instance v8, Lu4h;

    const/16 v9, 0x11

    invoke-direct {v8, v9}, Lu4h;-><init>(B)V

    invoke-static {v7, p0, v8}, Lupj;->u(Lw6g;Lg29;Lkotlin/jvm/functions/Function1;)Lzco;

    move-result-object v7

    sget-object v8, Lxyh;->d:Lw6g;

    new-instance v9, Lkotlin/Pair;

    invoke-direct {v9, v7, v8}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_c5
    if-eqz v9, :cond_7d

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7d

    :cond_cb
    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_d0
    check-cast p0, Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0

    :pswitch_d9
    check-cast p0, Lyoh;

    iput-object v4, p0, Lyoh;->i:Lc4;

    const-string v0, "OnPositionedDispatch"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_e2
    invoke-virtual {p0}, Lyoh;->a()V
    :try_end_e5
    .catchall {:try_start_e2 .. :try_end_e5} :catchall_eb

    invoke-static {}, Landroid/os/Trace;->endSection()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_eb
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0

    :pswitch_f0
    check-cast p0, Lokhttp3/internal/ws/WebSocketWriter;

    invoke-static {p0}, Lokhttp3/internal/ws/RealWebSocket;->a(Lokhttp3/internal/ws/WebSocketWriter;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_f7
    check-cast p0, Lokhttp3/internal/ws/RealWebSocket;

    invoke-static {p0}, Lokhttp3/internal/ws/RealWebSocket;->b(Lokhttp3/internal/ws/RealWebSocket;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_fe
    check-cast p0, Lu89;

    invoke-interface {p0}, Lu89;->invoke()F

    move-result p0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p0, p0, v0

    if-gez p0, :cond_10d

    const v0, 0x3e99999a    # 0.3f

    :cond_10d
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_112
    check-cast p0, Lt59;

    invoke-virtual {p0}, Lt59;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11a
    check-cast p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/CircleImageView;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12a
    check-cast p0, Ls4f;

    invoke-virtual {p0}, Ls4f;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2e

    invoke-static {v2, v0, v1}, Lkotlin/text/StringsKt;->f0(CLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "preferences_pb"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_149

    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v4

    goto :goto_150

    :cond_149
    const-string v0, "File extension for file: "

    const-string v1, " does not match required extension for Preferences file: preferences_pb"

    invoke-static {p0, v1, v0}, Lkp5;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    :goto_150
    return-object v4

    :pswitch_151
    check-cast p0, Laog;

    iget-object v0, p0, Laog;->r:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2c;

    if-eqz v0, :cond_164

    invoke-interface {v0}, Lb2c;->f()Z

    move-result v1

    if-eqz v1, :cond_164

    move-object v4, v0

    :cond_164
    if-eqz v4, :cond_170

    iget-object p0, p0, Laog;->q:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgcb;

    if-nez p0, :cond_171

    :cond_170
    move v3, v5

    :cond_171
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_176
    check-cast p0, Long;

    sget-object v0, Lnng;->b:Lnng;

    new-array v1, v5, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    new-instance v2, Lrmg;

    invoke-direct {v2, p0, v3}, Lrmg;-><init>(Ljava/lang/Object;B)V

    const-string v3, "kotlinx.serialization.Polymorphic"

    invoke-static {v3, v0, v1, v2}, Lxug;->f(Ljava/lang/String;Lxvg;[Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function1;)Ld2j;

    move-result-object v0

    iget-object p0, p0, Long;->a:Litb;

    new-instance v1, Lbs5;

    invoke-direct {v1, v0, p0}, Lbs5;-><init>(Ld2j;Litb;)V

    return-object v1

    :pswitch_18f
    check-cast p0, Lufg;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected end of input: yet to parse \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lufg;->a:Ljava/lang/String;

    const/16 v1, 0x27

    invoke-static {v0, p0, v1}, Lo18;->p(Ljava/lang/StringBuilder;Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1a1
    check-cast p0, Laeg;

    iget-object p0, p0, Laeg;->a:Lpe4;

    new-instance v0, Lka4;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lpe4;->a:Lm20;

    iget-object p0, p0, Lm20;->b:Ljava/lang/String;

    return-object v0

    :pswitch_1af
    check-cast p0, Lijd;

    invoke-virtual {p0}, Lijd;->a()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_1b6
    check-cast p0, Lshf;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v1, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lcq5;

    iget-object v6, v0, Lqln;->f:Lami;

    iget-object v6, v6, Lami;->e:Ljava/lang/Object;

    check-cast v6, Lvq8;

    invoke-virtual {v6}, Lvq8;->i()Z

    move-result v6

    if-eqz v6, :cond_297

    iget-object v0, v0, Lqln;->f:Lami;

    iget-object v0, v0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-static {v7}, Lqbd;->a(I)I

    move-result v7

    const/16 v8, 0x10

    if-ge v7, v8, :cond_1e7

    move v7, v8

    :cond_1e7
    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-direct {v8, v7}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1f0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_205

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    check-cast v9, Laln;

    invoke-interface {v9}, Laln;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f0

    :cond_205
    invoke-virtual {v1}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbef;

    invoke-virtual {v0}, Lbef;->g()Lffb;

    move-result-object v0

    new-instance v7, Ld82;

    invoke-direct {v7, v0, v3}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lm3g;

    invoke-direct {v0, p0, v2}, Lm3g;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lm2m;

    invoke-direct {p0, v7, v0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lbli;

    const/16 v2, 0xb

    invoke-direct {v0, v2}, Lbli;-><init>(B)V

    new-instance v3, Lec7;

    invoke-direct {v3, p0, v0, v5}, Lec7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lx37;

    const/4 v0, 0x3

    invoke-direct {p0, v8, v0}, Lx37;-><init>(Ljava/util/LinkedHashMap;B)V

    new-instance v0, Lm2m;

    invoke-direct {v0, v3, p0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Lbli;

    const/16 v3, 0xd

    invoke-direct {p0, v3}, Lbli;-><init>(B)V

    new-instance v3, Lv39;

    invoke-direct {v3, v0, v5, p0}, Lv39;-><init>(Lkotlin/sequences/Sequence;ZLkotlin/jvm/functions/Function1;)V

    new-instance p0, Lm3g;

    invoke-direct {p0, v2}, Lm3g;-><init>(B)V

    new-instance v0, Lm2m;

    invoke-direct {v0, v3, p0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_297

    invoke-virtual {v1}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbef;

    invoke-virtual {v0}, Lbef;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<default>"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26c

    const-string v0, "NETWORK_529"

    :cond_26c
    move-object v1, p0

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_273
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Leef;

    iget-object v3, v3, Leef;->a:Laln;

    invoke-interface {v3}, Laln;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_273

    move-object v4, v2

    :cond_28d
    check-cast v4, Leef;

    sget-object v0, Lhff;->b:Lhff;

    new-instance v1, Lycg;

    invoke-direct {v1, p0, v4, v0}, Lycg;-><init>(Ljava/util/List;Leef;Lhff;)V

    goto :goto_2bb

    :cond_297
    new-instance v1, Lycg;

    new-instance p0, Leef;

    sget-object v0, Lami;->m:Lby6;

    invoke-direct {p0, v0}, Leef;-><init>(Laln;)V

    new-instance v0, Leef;

    sget-object v2, Lami;->l:Lill;

    sget-object v3, Lg7j;->f:Lg7j;

    invoke-direct {v0, v2, v3}, Leef;-><init>(Laln;Lg7j;)V

    filled-new-array {p0, v0}, [Leef;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    if-eqz v6, :cond_2b6

    sget-object v0, Lhff;->c:Lhff;

    goto :goto_2b8

    :cond_2b6
    sget-object v0, Lhff;->d:Lhff;

    :goto_2b8
    invoke-direct {v1, p0, v4, v0}, Lycg;-><init>(Ljava/util/List;Leef;Lhff;)V

    :goto_2bb
    return-object v1

    :pswitch_2bc
    check-cast p0, Locg;

    invoke-virtual {p0}, Locg;->f0()Lzcg;

    move-result-object p0

    iget-object v0, p0, Lzcg;->d:Lvbg;

    iget-object v1, p0, Lzcg;->j:Ljava/util/LinkedHashSet;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    iget-object v5, p0, Lzcg;->p:Leef;

    if-eqz v5, :cond_2d6

    iget-object v5, v5, Leef;->a:Laln;

    if-eqz v5, :cond_2d6

    invoke-interface {v5}, Laln;->getId()Ljava/lang/String;

    move-result-object v4

    :cond_2d6
    iget-object v5, p0, Lzcg;->h:Lijd;

    iget-object v5, v5, Lijd;->h:Ljava/lang/Object;

    check-cast v5, Lwnm;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    new-instance v6, Ljava/util/ArrayList;

    invoke-static {v5, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2ef
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_31a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrdf;

    new-instance v7, Lwcg;

    iget-object v8, v5, Lrdf;->a:Lqdf;

    invoke-virtual {v8}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    iget-boolean v9, v5, Lrdf;->b:Z

    iget-object v10, p0, Lzcg;->k:Ljava/util/LinkedHashSet;

    iget-object v5, v5, Lrdf;->a:Lqdf;

    invoke-interface {v10, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    invoke-direct {v7, v8, v9, v5}, Lwcg;-><init>(Ljava/lang/String;ZZ)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2ef

    :cond_31a
    iget-object v2, p0, Lzcg;->i:Lshf;

    iget-object v2, v2, Lshf;->c:Ljava/lang/Object;

    check-cast v2, Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lycg;

    iget-object v2, v2, Lycg;->c:Lhff;

    new-instance v5, Lxcg;

    invoke-direct {v5, v1, v4, v6, v2}, Lxcg;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/ArrayList;Lhff;)V

    invoke-virtual {v0, v5, v3}, Lvbg;->a(Lxcg;Z)V

    iget-object v0, p0, Lzcg;->b:Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "personalization.onboarding.completed"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object p0, p0, Lzcg;->g:Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_34a
    check-cast p0, Ll3g;

    iget-object v0, p0, Ll3g;->a:Lqie;

    iget-object p0, p0, Ll3g;->b:Ljava/lang/String;

    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Lqsk;

    invoke-interface {v0}, Lqsk;->getDatabaseName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\' was requested."

    if-nez v1, :cond_36e

    const-string v1, ":memory:"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_390

    const-string v0, "This driver is configured to open an in-memory database but a file-based named \'"

    invoke-static {v0, p0, v2}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    goto :goto_399

    :cond_36e
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_390

    const/16 v3, 0x2f

    invoke-static {v3, v1, v1}, Lkotlin/text/StringsKt;->f0(CLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, p0, p0}, Lkotlin/text/StringsKt;->f0(CLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_390

    invoke-interface {v0}, Lqsk;->getDatabaseName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\' but \'"

    const-string v3, "This driver is configured to open a database named \'"

    invoke-static {v3, v0, v1, p0, v2}, Lj9h;->o(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_399

    :cond_390
    new-instance v4, Losk;

    invoke-interface {v0}, Lqsk;->getWritableDatabase()Lto9;

    move-result-object p0

    invoke-direct {v4, p0}, Losk;-><init>(Lto9;)V

    :goto_399
    return-object v4

    :pswitch_39a
    check-cast p0, Lsxf;

    invoke-virtual {p0}, Lsxf;->n()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_3a5
    check-cast p0, Llsf;

    new-instance v0, Lg77;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lg77;-><init>(B)V

    iget-object v1, p0, Llsf;->b:Lpnc;

    invoke-virtual {v1}, Lpnc;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpna;

    iput-object v1, v0, Lg77;->b:Ljava/lang/Object;

    iget-object p0, p0, Llsf;->a:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf3j;

    iget-object p0, p0, Lf3j;->b:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "/"

    invoke-static {p0, v1, v5}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_3d2

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_3d2
    invoke-static {v0, p0}, Lg77;->d(Lg77;Ljava/lang/String;)V

    new-instance p0, Lpw6;

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lpw6;-><init>(B)V

    filled-new-array {p0}, [Lpw6;

    move-result-object p0

    iget-object v1, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-static {v1, p0}, Lo95;->s(Ljava/util/Collection;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lg77;->f()Ljyb;

    move-result-object p0

    new-instance v0, Lzfo;

    iget-object v1, p0, Ljyb;->a:Ljava/lang/String;

    iget-object v2, p0, Ljyb;->b:Lpna;

    new-instance v3, Lqe6;

    const/16 v4, 0x17

    invoke-direct {v3, p0, v4}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2, v3}, Lzfo;-><init>(Ljava/lang/String;Lpna;Lqe6;)V

    return-object v0

    :pswitch_3fb
    check-cast p0, Lkcf;

    new-instance v0, Licf;

    invoke-direct {v0, p0}, Licf;-><init>(Lkcf;)V

    return-object v0

    :pswitch_403
    check-cast p0, Lgbf;

    iget-object p0, p0, Lgbf;->l:Lzaf;

    iget-object v0, p0, Lzaf;->b:Lgbf;

    iget-object v0, v0, Lgbf;->h:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_412

    invoke-virtual {p0, v0}, Lzaf;->a0(Lb2l;)V

    :cond_412
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_415
    check-cast p0, Lu0a;

    return-object p0

    :pswitch_418
    check-cast p0, Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm0a;

    return-object p0

    :pswitch_421
    check-cast p0, Ljtf;

    check-cast p0, Llx6;

    iget-byte v0, p0, Llx6;->a:B

    packed-switch v0, :pswitch_data_546

    iget-object p0, p0, Llx6;->d:Ljava/lang/Object;

    check-cast p0, Ljava/io/InputStream;

    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Lmr6;->b:Lmr6;

    sget v0, La34;->a:I

    new-instance v0, Ljkh;

    sget v1, Lctb;->a:I

    new-instance v1, Lj9b;

    invoke-direct {v1, p0}, Lj9b;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljkh;-><init>(Lj9b;)V

    goto :goto_446

    :pswitch_441
    iget-object p0, p0, Llx6;->d:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Ld44;

    :goto_446
    return-object v0

    :pswitch_447
    check-cast p0, Lt4f;

    invoke-virtual {p0}, Lt4f;->b()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Unexpected end of input: yet to parse "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_454
    check-cast p0, Lylh;

    iget-object p0, p0, Lylh;->a:Lwlh;

    iget-object p0, p0, Lwlh;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvlh;

    return-object p0

    :pswitch_461
    check-cast p0, Lhle;

    invoke-virtual {p0}, Lhle;->T0()Lnx5;

    move-result-object p0

    return-object p0

    :pswitch_468
    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lnx5;

    return-object p0

    :pswitch_46f
    check-cast p0, Lhd;

    iput-boolean v5, p0, Lhd;->b:Z

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast v1, Ldee;

    if-eqz v1, :cond_4b8

    iget-object v2, v1, Ldee;->a:[Ljava/lang/Object;

    iget v3, v1, Ldee;->b:I

    move v4, v5

    :goto_483
    if-ge v4, v3, :cond_4ac

    aget-object v6, v2, v4

    check-cast v6, Lm3c;

    iget-object v7, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v7, Ldee;

    if-nez v7, :cond_496

    new-instance v7, Ldee;

    invoke-direct {v7}, Ldee;-><init>()V

    iput-object v7, p0, Lhd;->g:Ljava/lang/Object;

    :cond_496
    invoke-virtual {v7, v4}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lh7h;

    iget-object v6, v6, Lm3c;->F:Ltah;

    iget-object v6, v6, Ltah;->g:Ljava/lang/Object;

    check-cast v6, Lb8e;

    iget-boolean v8, v6, Lb8e;->n:Z

    if-eqz v8, :cond_4a9

    invoke-static {v6, v7}, Lhd;->q(Lb8e;Lh7h;)V

    :cond_4a9
    add-int/lit8 v4, v4, 0x1

    goto :goto_483

    :cond_4ac
    invoke-virtual {v1}, Ldee;->d()V

    iget-object v1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Ldee;

    if-eqz v1, :cond_4b8

    invoke-virtual {v1}, Ldee;->d()V

    :cond_4b8
    iget-object v1, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v1, Ldee;

    if-eqz v1, :cond_4f1

    iget-object v2, v1, Ldee;->a:[Ljava/lang/Object;

    iget v3, v1, Ldee;->b:I

    :goto_4c2
    if-ge v5, v3, :cond_4e5

    aget-object v4, v2, v5

    check-cast v4, Ld13;

    iget-object v6, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v6, Ldee;

    if-nez v6, :cond_4d5

    new-instance v6, Ldee;

    invoke-direct {v6}, Ldee;-><init>()V

    iput-object v6, p0, Lhd;->e:Ljava/lang/Object;

    :cond_4d5
    invoke-virtual {v6, v5}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lh7h;

    iget-boolean v7, v4, Lb8e;->n:Z

    if-eqz v7, :cond_4e2

    invoke-static {v4, v6}, Lhd;->q(Lb8e;Lh7h;)V

    :cond_4e2
    add-int/lit8 v5, v5, 0x1

    goto :goto_4c2

    :cond_4e5
    invoke-virtual {v1}, Ldee;->d()V

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Ldee;

    if-eqz p0, :cond_4f1

    invoke-virtual {p0}, Ldee;->d()V

    :cond_4f1
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4f5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_505

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld13;

    invoke-virtual {v0}, Ld13;->V0()V

    goto :goto_4f5

    :cond_505
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_508
    .packed-switch 0x0
        :pswitch_46f
        :pswitch_468
        :pswitch_461
        :pswitch_454
        :pswitch_447
        :pswitch_421
        :pswitch_418
        :pswitch_415
        :pswitch_403
        :pswitch_3fb
        :pswitch_3a5
        :pswitch_39a
        :pswitch_34a
        :pswitch_2bc
        :pswitch_1b6
        :pswitch_1af
        :pswitch_1a1
        :pswitch_18f
        :pswitch_176
        :pswitch_151
        :pswitch_12a
        :pswitch_11a
        :pswitch_112
        :pswitch_fe
        :pswitch_f7
        :pswitch_f0
        :pswitch_d9
        :pswitch_d0
        :pswitch_1f
    .end packed-switch

    :pswitch_data_546
    .packed-switch 0x0
        :pswitch_441
    .end packed-switch
.end method
