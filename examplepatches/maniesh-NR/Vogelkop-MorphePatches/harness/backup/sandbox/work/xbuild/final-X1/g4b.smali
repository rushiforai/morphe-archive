.class public final Lg4b;
.super Lpx8;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public synthetic constructor <init>(Lmsh;ILpxh;ILox8;B)V
    .registers 7

    iput-byte p6, p0, Lg4b;->f:B

    invoke-direct/range {p0 .. p5}, Lpx8;-><init>(Lmsh;ILpxh;ILox8;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lmsh;)Ljava/util/List;
    .registers 6

    iget-byte p0, p0, Lg4b;->f:B

    const-string v0, "fallback"

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_98

    iget-object p0, p2, Lmsh;->w:Ljava/util/List;

    if-eqz p0, :cond_12

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_38

    :cond_12
    sget-object p0, Laum;->d:Laum;

    if-nez p0, :cond_1d

    new-instance p0, Laum;

    invoke-direct {p0, p1}, Laum;-><init>(Landroid/content/Context;)V

    sput-object p0, Laum;->d:Laum;

    :cond_1d
    iget-object p0, p0, Laum;->b:Lpu8;

    if-eqz p0, :cond_37

    iget-object p0, p0, Lpu8;->c:Ljava/util/Map;

    if-eqz p0, :cond_37

    iget-object p1, p2, Loqe;->c:Ljava/lang/String;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_37

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    :cond_37
    move-object p0, v1

    :cond_38
    if-eqz p0, :cond_64

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_64

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_49
    :goto_49
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_63

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ltx8;

    const-string v0, "domain"

    iget-object v1, p2, Ltx8;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_63
    move-object p0, p1

    :cond_64
    return-object p0

    :pswitch_65
    iget-object p0, p2, Lmsh;->x:Ljava/util/List;

    if-eqz p0, :cond_71

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_71

    move-object v1, p0

    goto :goto_96

    :cond_71
    sget-object p0, Laum;->d:Laum;

    if-nez p0, :cond_7c

    new-instance p0, Laum;

    invoke-direct {p0, p1}, Laum;-><init>(Landroid/content/Context;)V

    sput-object p0, Laum;->d:Laum;

    :cond_7c
    iget-object p0, p0, Laum;->b:Lpu8;

    if-eqz p0, :cond_96

    iget-object p0, p0, Lpu8;->d:Ljava/util/Map;

    if-eqz p0, :cond_96

    iget-object p1, p2, Loqe;->c:Ljava/lang/String;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_96

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    :cond_96
    :goto_96
    return-object v1

    nop

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_65
    .end packed-switch
.end method

.method public final b()I
    .registers 2

    iget-byte v0, p0, Lg4b;->f:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lpx8;->b()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f140b2b

    return p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final c(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lg4b;->f:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lpx8;->c(Landroid/view/View;)V

    return-void

    :pswitch_9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lpx8;->d:Lmsh;

    invoke-virtual {p0, p1, v0}, Lg4b;->a(Landroid/content/Context;Lmsh;)Ljava/util/List;

    move-result-object p1

    iget-object p0, p0, Lpx8;->e:Lox8;

    invoke-interface {p0, p1}, Lox8;->f(Ljava/util/List;)V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
