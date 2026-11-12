.class public final synthetic Lnf8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lnf8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .registers 2

    const/16 p1, 0x8

    iput-byte p1, p0, Lnf8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lnf8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte p0, p0, Lnf8;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch p0, :pswitch_data_2d0

    check-cast p1, Ljt2;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lot2;

    invoke-virtual {p1, p0}, Lot2;->e([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    check-cast p1, Ljt2;

    check-cast p2, [I

    check-cast p1, Lot2;

    invoke-virtual {p1}, Lot2;->d()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_26
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->E(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_37
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->c(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_48
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->J(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_59
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->z(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_6a
    check-cast p1, Lw6g;

    check-cast p2, Lg29;

    iget-object p0, p1, Lw6g;->a:Lg54;

    invoke-virtual {p0}, Lg54;->w()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v3}, Ls16;->o(Ljava/lang/String;Z)Lw6g;

    move-result-object p0

    iget-object p0, p0, Lw6g;->a:Lg54;

    invoke-virtual {p0}, Lg54;->w()Ljava/lang/String;

    new-instance p0, Lylj;

    invoke-direct {p0}, Lylj;-><init>()V

    return-object p0

    :pswitch_83
    check-cast p1, Ld8j;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lg8j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lx2f;

    new-instance v0, Loba;

    invoke-direct {v0, v1, v2, p0}, Loba;-><init>(II[I)V

    invoke-direct {p2, v0}, Lx2f;-><init>(Loba;)V

    iget-object p0, p1, Lg8j;->b:Lgjm;

    invoke-virtual {p0, p2, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a3
    check-cast p1, Lini;

    check-cast p2, Lf0g;

    new-instance p0, Lece;

    sget-object p2, Lf7c;->a:Lf7c;

    new-instance v1, Lcw5;

    invoke-direct {v1, p1, v3}, Lcw5;-><init>(Lini;B)V

    invoke-static {p2, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object p2

    const-class v1, Lnx5;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    invoke-virtual {p1, v1, v0, v0}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnx5;

    const-class v2, Lcb7;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    invoke-virtual {p1, v2, v0, v0}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcb7;

    const-class v3, Lyin;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v3

    invoke-virtual {p1, v3, v0, v0}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyin;

    invoke-direct {p0, p2, v1, v2, p1}, Lece;-><init>(Ll4c;Lnx5;Lcb7;Lyin;)V

    return-object p0

    :pswitch_dc
    check-cast p1, Lzwe;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    invoke-virtual {p1, p0}, Lzwe;->a([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_eb
    check-cast p1, Lwre;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    invoke-virtual {p1, p0}, Lwre;->a([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_fa
    check-cast p1, Lini;

    check-cast p2, Lf0g;

    const-class p0, Lu9f;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p1, p0, v0, v0}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu9f;

    iget-object p1, p0, Lu9f;->a:Landroid/content/Context;

    const-string p2, "http_cache"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_11f

    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lu9f;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p1, v0, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :cond_11f
    new-instance p2, Ls9f;

    invoke-direct {p2}, Ls9f;-><init>()V

    new-instance v0, La74;

    const-wide/32 v3, 0x2faf080

    invoke-direct {v0, p1, v3, v4}, La74;-><init>(Ljava/io/File;J)V

    iput-object v0, p2, Ls9f;->l:La74;

    const-wide/16 v0, 0x1e

    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v0, v1, p1}, Ls9f;->a(JLjava/util/concurrent/TimeUnit;)V

    invoke-virtual {p2, v0, v1, p1}, Ls9f;->b(JLjava/util/concurrent/TimeUnit;)V

    const-string v3, "timeout"

    invoke-static {v3, v0, v1, p1}, Lokhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p2, Ls9f;->A:I

    iget-object p1, p0, Lu9f;->c:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_146
    if-ge v2, v0, :cond_156

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Leeb;

    iget-object v3, p2, Ls9f;->c:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_146

    :cond_156
    iget-object p0, p0, Lu9f;->b:Lil5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lt9f;

    invoke-direct {p0, p2}, Lt9f;-><init>(Ls9f;)V

    return-object p0

    :pswitch_161
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p2, Lg2e;

    invoke-interface {p2}, Lg2e;->a()Lv1e;

    move-result-object p0

    iget-object p0, p0, Lv1e;->a:Ljava/lang/String;

    return-object p0

    :pswitch_16f
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p2, Lg2e;

    invoke-interface {p2}, Lg2e;->a()Lv1e;

    move-result-object p0

    iget-object p0, p0, Lv1e;->a:Ljava/lang/String;

    return-object p0

    :pswitch_17d
    check-cast p1, Lu3l;

    check-cast p2, Ljava/util/Set;

    new-instance p0, Lxzd;

    invoke-direct {p0, p1, p2}, Lxzd;-><init>(Lu3l;Ljava/util/Set;)V

    return-object p0

    :pswitch_187
    check-cast p1, Ld8j;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lg8j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lbrd;

    new-instance v0, Loba;

    invoke-direct {v0, v1, v2, p0}, Loba;-><init>(II[I)V

    invoke-direct {p2, v0}, Lbrd;-><init>(Loba;)V

    iget-object p0, p1, Lg8j;->b:Lgjm;

    invoke-virtual {p0, p2, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a7
    check-cast p1, Lrji;

    check-cast p2, Lz6c;

    invoke-virtual {p2}, Lz6c;->d()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1b6

    move-object v0, p0

    :cond_1b6
    return-object v0

    :pswitch_1b7
    check-cast p1, Lrji;

    check-cast p2, Lu6c;

    invoke-virtual {p2}, Lu6c;->h()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p2}, Lu6c;->i()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_1d4
    check-cast p1, Lg0c;

    check-cast p2, [I

    new-instance p0, Lp3m;

    iget-object p2, p1, Lg0c;->b:Lwv1;

    iget-object p2, p2, Lwv1;->b:Lb6h;

    invoke-interface {p2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lv3m;

    invoke-direct {p0, p2}, Lp3m;-><init>(Lv3m;)V

    const/16 p2, 0x1003

    invoke-static {p0, p2}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    iget-object p1, p1, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1f5
    check-cast p1, Lnqa;

    check-cast p2, Lspa;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1fc
    check-cast p1, Lmqa;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    sub-int/2addr p0, v3

    int-to-double p0, p0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p0

    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double/2addr p0, v0

    double-to-long p0, p0

    const-wide/32 v0, 0xea60

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    sget-object p2, Luih;->a:Ltih;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Luih;->b:Lk6;

    const-wide/16 v0, 0x3e8

    invoke-virtual {p2, v0, v1}, Luih;->n(J)J

    move-result-wide v0

    add-long/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :pswitch_22d
    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Laoh;->m(I)I

    move-result p0

    invoke-static {p1, p0}, Ly9m;->k(Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23e
    check-cast p1, Lrji;

    check-cast p2, Lhba;

    iget-object p0, p2, Lhba;->a:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldg5;

    if-eqz p0, :cond_25d

    iget p1, p0, Ldg5;->a:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p0, p0, Ldg5;->b:Lcg5;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lkotlin/Pair;

    invoke-direct {v0, p1, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_25d
    return-object v0

    :pswitch_25e
    check-cast p1, Ld8j;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lg8j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lbaa;

    new-instance v0, Loba;

    invoke-direct {v0, v1, v2, p0}, Loba;-><init>(II[I)V

    invoke-direct {p2, v0}, Lbaa;-><init>(Loba;)V

    iget-object p0, p1, Lg8j;->b:Lgjm;

    invoke-virtual {p0, p2, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27e
    check-cast p1, Ld8j;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lg8j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Ldw9;

    new-instance v0, Loba;

    invoke-direct {v0, v1, v2, p0}, Loba;-><init>(II[I)V

    invoke-direct {p2, v0}, Ldw9;-><init>(Loba;)V

    iget-object p0, p1, Lg8j;->b:Lgjm;

    invoke-virtual {p0, p2, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29e
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2a7
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/IOException;

    throw p2

    :pswitch_2ac
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/IOException;

    throw p2

    :pswitch_2b1
    check-cast p1, Ld8j;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lg8j;

    invoke-virtual {p1, p0}, Lg8j;->e([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c2
    check-cast p1, Ljava/util/List;

    check-cast p2, Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    check-cast p2, Ljava/lang/Iterable;

    invoke-static {p2, p1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2d0
    .packed-switch 0x0
        :pswitch_2c2
        :pswitch_2b1
        :pswitch_2ac
        :pswitch_2a7
        :pswitch_29e
        :pswitch_27e
        :pswitch_25e
        :pswitch_23e
        :pswitch_22d
        :pswitch_1fc
        :pswitch_1f5
        :pswitch_1d4
        :pswitch_1b7
        :pswitch_1a7
        :pswitch_187
        :pswitch_17d
        :pswitch_16f
        :pswitch_161
        :pswitch_fa
        :pswitch_eb
        :pswitch_dc
        :pswitch_a3
        :pswitch_83
        :pswitch_6a
        :pswitch_59
        :pswitch_48
        :pswitch_37
        :pswitch_26
        :pswitch_1a
    .end packed-switch
.end method
