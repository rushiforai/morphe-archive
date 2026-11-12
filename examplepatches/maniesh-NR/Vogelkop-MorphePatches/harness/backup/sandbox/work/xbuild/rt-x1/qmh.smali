.class public final Lqmh;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgrk;Lcrk;)V
    .registers 16

    const/4 v0, 0x1

    iput-byte v0, p0, Lqmh;->d:B

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    new-instance v1, Lcom/opera/android/suggestion/Suggestion;

    const/4 v10, 0x0

    const/16 v2, 0xf

    const-string v3, ""

    const-string v4, ""

    const-string v5, ""

    const/4 v6, 0x0

    const/4 v7, 0x0

    const v8, 0x7fffffff

    const/4 v11, -0x1

    const/4 v12, 0x0

    move-object v9, v4

    invoke-direct/range {v1 .. v12}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    iput-object v1, p0, Lqmh;->e:Ljava/lang/Object;

    iput-object p1, p0, Lqmh;->f:Ljava/lang/Object;

    iput-object p2, p0, Lqmh;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgrk;Lgrk;Ls28;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lqmh;->d:B

    const/4 v0, 0x5

    .line 36
    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    .line 37
    iput-object p1, p0, Lqmh;->e:Ljava/lang/Object;

    .line 38
    iput-object p2, p0, Lqmh;->f:Ljava/lang/Object;

    .line 39
    iput-object p3, p0, Lqmh;->g:Ljava/lang/Object;

    return-void
.end method

.method private final h()V
    .registers 1

    return-void
.end method

.method private final i()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 1

    iget-byte p0, p0, Lqmh;->d:B

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 6

    iget-byte p2, p0, Lqmh;->d:B

    iget-object p3, p0, Lqmh;->e:Ljava/lang/Object;

    iget-object v0, p0, Lqmh;->g:Ljava/lang/Object;

    iget-object p0, p0, Lqmh;->f:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_7e

    check-cast p0, Lgrk;

    iget-object p0, p0, Lgrk;->b:Lmrk;

    iget-object p0, p0, Lmrk;->I:Lirk;

    iget-boolean p0, p0, Lirk;->a:Z

    if-nez p0, :cond_31

    check-cast v0, Lcrk;

    iget-object p0, v0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lfbf;

    iget-object p0, p0, Lfbf;->a:Lgbf;

    iget-object p0, p0, Lgbf;->j:Lvbf;

    iget-object p0, p0, Lvbf;->t:Ltbf;

    iget-object p0, p0, Ltbf;->b:Lypm;

    iget-object p0, p0, Lypm;->g:Lzg;

    if-nez p0, :cond_31

    check-cast p3, Lcom/opera/android/suggestion/Suggestion;

    invoke-static {p3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    goto :goto_36

    :cond_31
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    :goto_36
    return-void

    :pswitch_37
    check-cast p3, Lgrk;

    invoke-virtual {p3}, Lgrk;->a()Z

    move-result p2

    if-nez p2, :cond_77

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_53

    invoke-static {p1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_77

    check-cast p0, Lgrk;

    invoke-virtual {p0}, Lgrk;->a()Z

    move-result p0

    if-nez p0, :cond_77

    :cond_53
    check-cast v0, Ls28;

    new-instance p0, Lo8f;

    const/16 p1, 0x1d

    invoke-direct {p0, p4, p1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-boolean p1, v0, Ls28;->d:Z

    if-nez p1, :cond_68

    sget-object p1, Lh1b;->b:La1b;

    sget-object p1, Lcsh;->e:Lcsh;

    invoke-virtual {p0, p1}, Lo8f;->run(Ljava/lang/Object;)V

    goto :goto_7c

    :cond_68
    iget-object p1, v0, Ls28;->h:Ljava/lang/Object;

    check-cast p1, Lko7;

    new-instance p2, Lq2g;

    const/16 p3, 0x16

    invoke-direct {p2, v0, p0, p3}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lldk;->f(Ljava/lang/Runnable;)V

    goto :goto_7c

    :cond_77
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    :goto_7c
    return-void

    nop

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
