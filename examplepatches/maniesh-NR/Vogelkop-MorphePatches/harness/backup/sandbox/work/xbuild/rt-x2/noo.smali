.class public final Lnoo;
.super Lsc;
.source "SourceFile"


# instance fields
.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ljava/lang/String;Loam;B)V
    .registers 5

    iput-byte p4, p0, Lnoo;->d:B

    invoke-direct {p0, p1, p2, p3}, Lsc;-><init>(Landroid/view/View;Ljava/lang/String;Loam;)V

    return-void
.end method

.method private final o()V
    .registers 1

    return-void
.end method

.method private final p()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;Ljava/lang/String;Loam;)V
    .registers 7

    iget-byte v0, p0, Lnoo;->d:B

    packed-switch v0, :pswitch_data_82

    sget-object v0, Lu06;->d:Lu06;

    invoke-static {v0, p2, p3}, Lcoh;->d(Lu06;Ljava/lang/String;Loam;)Luio;

    move-result-object p2

    iput-object p2, p0, Lsc;->a:Ljava/lang/Object;

    if-eqz p2, :cond_58

    invoke-virtual {p2, p1}, Luio;->d(Landroid/view/View;)V

    iget-object p1, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Luio;

    invoke-static {p1}, Lqe6;->K(Luio;)Lqe6;

    move-result-object p1

    iput-object p1, p0, Lsc;->c:Ljava/lang/Object;

    iget-object p1, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Luio;

    invoke-virtual {p1}, Luio;->e()V

    iget-object p1, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Luio;

    invoke-static {p1}, Lzy9;->J(Luio;)Lzy9;

    move-result-object p1

    iput-object p1, p0, Lsc;->b:Ljava/lang/Object;

    iget-object p0, p1, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    invoke-static {p0}, Lzch;->j(Luio;)V

    iget-boolean p1, p0, Luio;->j:Z

    if-nez p1, :cond_53

    iget-object p1, p0, Luio;->e:Lyp;

    sget-object p2, Lqii;->p:Lqii;

    invoke-virtual {p1}, Lyp;->g()Landroid/webkit/WebView;

    move-result-object p3

    iget-object p1, p1, Lyp;->a:Ljava/lang/String;

    const/4 v0, 0x0

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "publishLoadedEvent"

    invoke-virtual {p2, p3, v0, p1}, Lqii;->m(Landroid/webkit/WebView;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Luio;->j:Z

    goto :goto_58

    :cond_53
    const-string p0, "Loaded event can only be sent once"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_58
    :goto_58
    return-void

    :pswitch_59
    check-cast p1, Landroid/webkit/WebView;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p3, Lgvf;->c:Lgvf;

    sget-object v0, Lgvf;->d:Lgvf;

    sget-object v1, Lu06;->b:Lu06;

    sget-object v2, Lw3b;->c:Lw3b;

    invoke-static {v1, v2, p3, v0}, Ls9i;->E(Lu06;Lw3b;Lgvf;Lgvf;)Ls9i;

    move-result-object p3

    const-string v0, "1.13.7"

    invoke-static {v0}, Lgd7;->a(Ljava/lang/String;)Lgd7;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lne5;->v(Lgd7;Landroid/webkit/WebView;Ljava/lang/String;)Lne5;

    move-result-object p2

    invoke-static {p3, p2}, Luio;->b(Ls9i;Lne5;)Luio;

    move-result-object p2

    invoke-virtual {p2, p1}, Luio;->d(Landroid/view/View;)V

    iput-object p2, p0, Lsc;->a:Ljava/lang/Object;

    invoke-virtual {p2}, Luio;->e()V

    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_59
    .end packed-switch
.end method

.method public final g()V
    .registers 2

    iget-byte v0, p0, Lnoo;->d:B

    packed-switch v0, :pswitch_data_a

    invoke-super {p0}, Lsc;->g()V

    :pswitch_8
    return-void

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final h()V
    .registers 2

    iget-byte v0, p0, Lnoo;->d:B

    packed-switch v0, :pswitch_data_a

    invoke-super {p0}, Lsc;->h()V

    :pswitch_8
    return-void

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
