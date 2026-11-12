.class public final Lc23;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 13
    iput-byte p3, p0, Lc23;->a:B

    iput-object p1, p0, Lc23;->b:Ljava/lang/Object;

    iput-object p2, p0, Lc23;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lmeg;Lcom/opera/android/BrowserActivity;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lc23;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc23;->c:Ljava/lang/Object;

    iput-object p2, p0, Lc23;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpt3;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lc23;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lc23;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lucn;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lc23;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lc23;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 6

    iget-byte v0, p0, Lc23;->a:B

    sparse-switch v0, :sswitch_data_9c

    return-void

    :sswitch_6
    iget-object p2, p0, Lc23;->c:Ljava/lang/Object;

    check-cast p2, Lucn;

    invoke-virtual {p2, p1}, Lmgn;->d(Lb2l;)Z

    move-result p2

    if-nez p2, :cond_2f

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p2

    if-nez p2, :cond_2f

    iget-object p2, p0, Lc23;->b:Ljava/lang/Object;

    check-cast p2, Lnpl;

    if-eqz p2, :cond_21

    invoke-static {p2}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_21
    new-instance p2, Lnpl;

    const/16 v0, 0x17

    invoke-direct {p2, p0, p1, v0}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lc23;->b:Ljava/lang/Object;

    const-wide/16 p0, 0xdac

    invoke-static {p2, p0, p1}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_2f
    return-void

    :sswitch_30
    iget-object v0, p0, Lc23;->c:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/url/GURL;

    if-eqz v0, :cond_9a

    iget-boolean v1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-eqz v1, :cond_40

    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    goto :goto_9a

    :cond_40
    iget v1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->m:I

    div-int/lit8 v1, v1, 0x64

    const/4 v2, 0x3

    if-eq v1, v2, :cond_9a

    iget-object p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p2, v0}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_95

    iget-object v0, p0, Lc23;->b:Ljava/lang/Object;

    check-cast v0, Lpt3;

    iget-object v1, p0, Lc23;->c:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/url/GURL;

    invoke-virtual {v1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p2

    iget-byte v2, v0, Lpt3;->a:B

    iget-object v0, v0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v2, :pswitch_data_a6

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v0

    iget-object v0, v0, Lipk;->h:Leq6;

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lrr8;

    iget-object v2, v0, Lrr8;->l:Ljava/util/HashMap;

    invoke-virtual {v2, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lgqh;

    invoke-direct {v2, v1, p2}, Lgqh;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lldk;->g(Ljava/lang/Object;)V

    goto :goto_95

    :pswitch_7e
    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v0

    iget-object v0, v0, Lipk;->h:Leq6;

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lrr8;

    iget-object v2, v0, Lrr8;->l:Ljava/util/HashMap;

    invoke-virtual {v2, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lgqh;

    invoke-direct {v2, v1, p2}, Lgqh;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lldk;->g(Ljava/lang/Object;)V

    :cond_95
    :goto_95
    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    :cond_9a
    :goto_9a
    return-void

    nop

    :sswitch_data_9c
    .sparse-switch
        0x1 -> :sswitch_30
        0x4 -> :sswitch_6
    .end sparse-switch

    :pswitch_data_a6
    .packed-switch 0x10
        :pswitch_7e
    .end packed-switch
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-byte p1, p0, Lc23;->a:B

    sparse-switch p1, :sswitch_data_1e

    return-void

    :sswitch_6
    iget-object p1, p0, Lc23;->b:Ljava/lang/Object;

    check-cast p1, Lnpl;

    if-eqz p1, :cond_12

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lc23;->b:Ljava/lang/Object;

    :cond_12
    return-void

    :sswitch_13
    iget-object p1, p0, Lc23;->c:Ljava/lang/Object;

    check-cast p1, Lorg/chromium/url/GURL;

    if-nez p1, :cond_1d

    iget-object p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    iput-object p1, p0, Lc23;->c:Ljava/lang/Object;

    :cond_1d
    return-void

    :sswitch_data_1e
    .sparse-switch
        0x1 -> :sswitch_13
        0x4 -> :sswitch_6
    .end sparse-switch
.end method

.method public final R(Ld7l;)V
    .registers 2

    iget-byte p1, p0, Lc23;->a:B

    packed-switch p1, :pswitch_data_2a

    return-void

    :pswitch_6
    iget-object p1, p0, Lc23;->b:Ljava/lang/Object;

    check-cast p1, Lhh4;

    if-eqz p1, :cond_f

    invoke-interface {p1}, Lhh4;->cancel()V

    :cond_f
    iget-object p0, p0, Lc23;->c:Ljava/lang/Object;

    check-cast p0, Lqji;

    iget-object p0, p0, Lqji;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_19
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_29

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnji;

    invoke-virtual {p1}, Lnji;->d()V

    goto :goto_19

    :cond_29
    return-void

    :pswitch_data_2a
    .packed-switch 0x3
        :pswitch_6
    .end packed-switch
.end method

.method public final S(Ld7l;)V
    .registers 2

    iget-byte p1, p0, Lc23;->a:B

    packed-switch p1, :pswitch_data_14

    return-void

    :pswitch_6
    iget-object p1, p0, Lc23;->b:Ljava/lang/Object;

    check-cast p1, Lnpl;

    if-eqz p1, :cond_12

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lc23;->b:Ljava/lang/Object;

    :cond_12
    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x4
        :pswitch_6
    .end packed-switch
.end method

.method public final f(Lb2l;)V
    .registers 3

    iget-byte p1, p0, Lc23;->a:B

    packed-switch p1, :pswitch_data_16

    return-void

    :pswitch_6
    iget-object p1, p0, Lc23;->c:Ljava/lang/Object;

    check-cast p1, Lmeg;

    iget-object p0, p0, Lc23;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    invoke-virtual {p1}, Lmeg;->a()V

    return-void

    :pswitch_data_16
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final j(Lb2l;)V
    .registers 4

    iget-byte v0, p0, Lc23;->a:B

    packed-switch v0, :pswitch_data_20

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    iget-object p1, p0, Lc23;->b:Ljava/lang/Object;

    check-cast p1, Le23;

    iget-object p0, p0, Lc23;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-boolean v0, p1, Le23;->b:Z

    if-nez v0, :cond_1e

    iput-object p0, p1, Le23;->c:Ljava/lang/String;

    const-wide/16 v0, 0x1388

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
