.class public final Lcy0;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final d:Landroid/content/Context;

.field public final e:Lbrk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lbrk;Lbrk;Lzv3;)V
    .registers 5

    const/4 p3, 0x0

    invoke-direct {p0, p3}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p1, p0, Lcy0;->d:Landroid/content/Context;

    iput-object p2, p0, Lcy0;->e:Lbrk;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 12

    iget-object p2, p0, Lcy0;->e:Lbrk;

    invoke-virtual {p2}, Lbrk;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p3, :cond_14

    sget-object p3, Lyx0;->a:Lyx0;

    goto/16 :goto_7f

    :cond_14
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    move v2, v0

    move v3, v2

    move v4, v3

    :goto_1b
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6e

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxx0;

    instance-of v6, v5, Lux0;

    if-eqz v6, :cond_3e

    check-cast v5, Lux0;

    iget-object v5, v5, Lux0;->a:Lo29;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    packed-switch v5, :pswitch_data_ba

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_3a
    move v3, v1

    goto :goto_1b

    :pswitch_3c
    move v4, v1

    goto :goto_1b

    :cond_3e
    sget-object v2, Lwx0;->a:Lwx0;

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_51

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v1, :cond_4f

    sget-object p3, Lyx0;->e:Lyx0;

    goto :goto_7f

    :cond_4f
    :pswitch_4f
    move v2, v1

    goto :goto_1b

    :cond_51
    instance-of p3, v5, Lvx0;

    if-eqz p3, :cond_6a

    check-cast v5, Lvx0;

    iget p3, v5, Lvx0;->a:I

    const/16 v2, 0x3e8

    if-gt v2, p3, :cond_67

    const/16 v2, 0x4b1

    if-ge p3, v2, :cond_64

    sget-object p3, Lyx0;->g:Lyx0;

    goto :goto_7f

    :cond_64
    sget-object p3, Lyx0;->h:Lyx0;

    goto :goto_7f

    :cond_67
    sget-object p3, Lyx0;->i:Lyx0;

    goto :goto_7f

    :cond_6a
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_6e
    if-eqz v2, :cond_73

    sget-object p3, Lyx0;->f:Lyx0;

    goto :goto_7f

    :cond_73
    if-eqz v3, :cond_7d

    if-eqz v4, :cond_7a

    sget-object p3, Lyx0;->d:Lyx0;

    goto :goto_7f

    :cond_7a
    sget-object p3, Lyx0;->b:Lyx0;

    goto :goto_7f

    :cond_7d
    sget-object p3, Lyx0;->c:Lyx0;

    :goto_7f
    sget-object v2, Lby0;->g:Lh58;

    new-instance v3, Ld82;

    invoke-direct {v3, v2, v1}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq3;

    const/4 v2, 0x6

    invoke-direct {v1, p2, p3, v2}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v1}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object p3

    new-instance v1, Lq3;

    const/4 v2, 0x7

    iget-object p0, p0, Lcy0;->d:Landroid/content/Context;

    invoke-direct {v1, p0, p2, v2}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lm2m;

    invoke-direct {p0, p3, v1}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance p2, Ltx0;

    invoke-direct {p2, p1, v0}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-static {p0, p2}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object p0

    new-instance p1, Ly2;

    const/16 p2, 0x17

    invoke-direct {p1, p2}, Ly2;-><init>(B)V

    new-instance p2, Lm2m;

    invoke-direct {p2, p0, p1}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    invoke-static {p2}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_3c
        :pswitch_3c
        :pswitch_3c
        :pswitch_3a
        :pswitch_4f
        :pswitch_4f
        :pswitch_3c
        :pswitch_4f
        :pswitch_4f
    .end packed-switch
.end method
