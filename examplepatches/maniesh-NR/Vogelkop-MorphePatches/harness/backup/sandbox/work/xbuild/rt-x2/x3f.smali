.class public final Lx3f;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Lddc;

.field public f:Ld3k;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lddc;Lhw3;Lyqk;Lghf;Z)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lx3f;->d:B

    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p1, p0, Lx3f;->e:Lddc;

    iput-object p2, p0, Lx3f;->g:Ljava/lang/Object;

    iput-object p3, p0, Lx3f;->h:Ljava/lang/Object;

    iput-object p4, p0, Lx3f;->i:Ljava/lang/Object;

    if-eqz p5, :cond_14

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    :cond_14
    return-void
.end method

.method public constructor <init>(Lpde;Lkul;Lddc;Lgrk;Lbrk;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lx3f;->d:B

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    .line 22
    iput-object p1, p0, Lx3f;->g:Ljava/lang/Object;

    .line 23
    iput-object p2, p0, Lx3f;->h:Ljava/lang/Object;

    .line 24
    iput-object p3, p0, Lx3f;->e:Lddc;

    .line 25
    iput-object p4, p0, Lx3f;->i:Ljava/lang/Object;

    .line 26
    iput-object p5, p0, Lx3f;->j:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 3

    iget-byte v0, p0, Lx3f;->d:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_1c

    iget-object v0, p0, Lx3f;->f:Ld3k;

    if-eqz v0, :cond_f

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    iput-object v1, p0, Lx3f;->f:Ld3k;

    :cond_f
    return-void

    :pswitch_10
    iget-object v0, p0, Lx3f;->f:Ld3k;

    if-eqz v0, :cond_17

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_17
    iput-object v1, p0, Lx3f;->f:Ld3k;

    iput-object v1, p0, Lx3f;->j:Ljava/lang/Object;

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 13

    iget-byte p2, p0, Lx3f;->d:B

    const/4 v0, 0x3

    iget-object v1, p0, Lx3f;->e:Lddc;

    packed-switch p2, :pswitch_data_80

    invoke-virtual {p0}, Lx3f;->cancel()V

    iget-object p2, p0, Lx3f;->j:Ljava/lang/Object;

    check-cast p2, Lbrk;

    invoke-virtual {p2}, Lbrk;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_21

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    goto :goto_57

    :cond_21
    iget-object p2, p0, Lx3f;->g:Ljava/lang/Object;

    check-cast p2, Lpde;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Ll42;

    if-eqz v5, :cond_51

    iget-object p2, p0, Lx3f;->i:Ljava/lang/Object;

    check-cast p2, Lgrk;

    iget-object p2, p2, Lgrk;->b:Lmrk;

    iget-object p2, p2, Lmrk;->I:Lirk;

    iget-boolean p2, p2, Lirk;->a:Z

    if-eqz p2, :cond_40

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-gtz p1, :cond_51

    :cond_40
    new-instance v2, Ls71;

    const/16 v7, 0x1a

    const/4 v6, 0x0

    move-object v4, p0

    move-object v3, p4

    invoke-direct/range {v2 .. v7}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v1, v6, v6, v2, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p0

    iput-object p0, v4, Lx3f;->f:Ld3k;

    goto :goto_57

    :cond_51
    move-object v3, p4

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {v3, p0}, Lyv4;->d(Ljava/util/List;)V

    :goto_57
    return-void

    :pswitch_58
    move-object v4, p0

    move-object v3, p4

    if-nez p3, :cond_7a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-gtz p0, :cond_7a

    iget-object p0, v4, Lx3f;->f:Ld3k;

    if-eqz p0, :cond_69

    iput-object v3, v4, Lx3f;->j:Ljava/lang/Object;

    goto :goto_7f

    :cond_69
    iput-object v3, v4, Lx3f;->j:Ljava/lang/Object;

    new-instance p0, Lrf4;

    const/16 p1, 0xd

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v4}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, p2, p2, p0, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p0

    iput-object p0, v4, Lx3f;->f:Ld3k;

    goto :goto_7f

    :cond_7a
    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {v3, p0}, Lyv4;->d(Ljava/util/List;)V

    :goto_7f
    return-void

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_58
    .end packed-switch
.end method
