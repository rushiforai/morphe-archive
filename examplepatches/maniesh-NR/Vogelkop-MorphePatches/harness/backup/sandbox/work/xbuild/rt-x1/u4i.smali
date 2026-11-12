.class public final Lu4i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lj4c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lj4c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu4i;->a:Landroid/content/Context;

    iput-object p2, p0, Lu4i;->b:Lj4c;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Z
    .registers 7

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Llk6;->a:Llk6;

    sget-object v1, Lik6;->b:Lik6;

    const/4 v2, 0x1

    sget-object v3, Llqm;->F:Llqm;

    iget-object v4, p0, Lu4i;->a:Landroid/content/Context;

    invoke-static {v2, v1, v3, v4, v0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v1

    if-nez v1, :cond_15

    const/4 p0, 0x0

    return p0

    :cond_15
    sget-object v1, Lik6;->a:Lik6;

    invoke-static {v2, v1, v3, v4, v0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_4f

    iget-object p0, p0, Lu4i;->b:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnzl;

    iget-object v1, p0, Lnzl;->c:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-static {p1}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_41

    invoke-static {p1}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4f

    :cond_41
    iget-object v1, p0, Lnzl;->b:Lnx5;

    new-instance v2, Lr8h;

    const/16 v3, 0x1b

    const/4 v4, 0x0

    invoke-direct {v2, p0, p1, v4, v3}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v1, v4, v4, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_4f
    return v0
.end method
