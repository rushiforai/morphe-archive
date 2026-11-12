.class public final Lv8a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lk6l;

.field public final b:Lu4l;

.field public final c:Lpde;

.field public final d:Lt5l;

.field public final e:Lt5l;

.field public final f:Li7f;

.field public g:Ljava/util/Map;

.field public h:Z

.field public final i:Lld9;


# direct methods
.method public constructor <init>(Lpde;Lk6l;Lu4l;Lpde;Lt5l;Lt5l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lv8a;->a:Lk6l;

    iput-object p3, p0, Lv8a;->b:Lu4l;

    iput-object p4, p0, Lv8a;->c:Lpde;

    iput-object p5, p0, Lv8a;->d:Lt5l;

    iput-object p6, p0, Lv8a;->e:Lt5l;

    new-instance p5, Li7f;

    invoke-direct {p5}, Li7f;-><init>()V

    iput-object p5, p0, Lv8a;->f:Li7f;

    sget-object p5, Ln08;->a:Ln08;

    iput-object p5, p0, Lv8a;->g:Ljava/util/Map;

    new-instance p5, Lld9;

    const/16 p6, 0x11

    invoke-direct {p5, p0, p6}, Lld9;-><init>(Ljava/lang/Object;B)V

    iput-object p5, p0, Lv8a;->i:Lld9;

    new-instance p5, Ls8a;

    const/4 p6, 0x0

    invoke-direct {p5, p0, p6}, Ls8a;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p5}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance p3, Lt8a;

    invoke-direct {p3, p0}, Lt8a;-><init>(Lv8a;)V

    new-instance p5, Lal7;

    const/16 p6, 0x14

    invoke-direct {p5, p0, p6}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3, p5}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p2, p2, Lk6l;->s:Lg6l;

    new-instance p3, Lqz;

    const/16 p5, 0xa

    invoke-direct {p3, p0, p5}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance p2, Lks6;

    const/16 p3, 0x12

    invoke-direct {p2, p0, p3}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lf85;

    iget-object p0, p0, Lv8a;->f:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lf85;

    iget-object p0, p0, Lv8a;->f:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lv8a;->h:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lv8a;->h:Z

    iget-object v0, p0, Lv8a;->d:Lt5l;

    iget-object p0, p0, Lv8a;->i:Lld9;

    invoke-virtual {v0, p0}, Lt5l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b()V
    .registers 8

    const/4 v0, 0x0

    iput-boolean v0, p0, Lv8a;->h:Z

    iget-object v0, p0, Lv8a;->e:Lt5l;

    iget-object v1, p0, Lv8a;->i:Lld9;

    invoke-virtual {v0, v1}, Lt5l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Lv8a;->c:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu3l;

    iget-object v2, p0, Lv8a;->a:Lk6l;

    invoke-static {v2, v1}, Lexg;->s(Lk6l;Lu3l;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_23
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/Pair;

    iget-object v3, v2, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    iget-object v2, v2, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lu8a;

    iget-object v6, p0, Lv8a;->b:Lu4l;

    invoke-virtual {v6, v3}, Lu4l;->a(I)Lm4l;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v5, v3, v2}, Lu8a;-><init>(Lm4l;I)V

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23

    :cond_52
    iget-object v1, p0, Lv8a;->g:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_87

    iput-object v0, p0, Lv8a;->g:Ljava/util/Map;

    iget-object p0, p0, Lv8a;->f:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_62
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_87

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf85;

    iget-byte v1, v0, Lf85;->a:B

    iget-object v0, v0, Lf85;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_88

    check-cast v0, Ld0e;

    invoke-virtual {v0}, Ld0e;->X()V

    goto :goto_62

    :pswitch_7b
    check-cast v0, Ld5a;

    invoke-virtual {v0}, Ld5a;->b()V

    goto :goto_62

    :pswitch_81
    check-cast v0, Lh85;

    invoke-virtual {v0}, Lh85;->a0()V

    goto :goto_62

    :cond_87
    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_81
        :pswitch_7b
    .end packed-switch
.end method
