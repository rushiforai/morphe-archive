.class public final synthetic Lsy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwy;


# direct methods
.method public synthetic constructor <init>(Lwy;B)V
    .registers 3

    iput-byte p2, p0, Lsy;->a:B

    iput-object p1, p0, Lsy;->b:Lwy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lsy;->a:B

    const-string v1, "https"

    const/4 v2, 0x0

    iget-object p0, p0, Lsy;->b:Lwy;

    packed-switch v0, :pswitch_data_cc

    iget-object p0, p0, Lwy;->a:Landroid/content/Context;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/4 v0, 0x7

    invoke-virtual {p0, v0, v2}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_22

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    goto :goto_24

    :cond_22
    const-string p0, "dot-a.op-mobile.opera.com"

    :goto_24
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    new-instance v0, Lk5o;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "impression"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "click"

    invoke-virtual {p0, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    const/4 v2, 0x2

    invoke-direct {v0, v1, p0, v2}, Lk5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_58
    iget-object p0, p0, Lwy;->a:Landroid/content/Context;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/4 v0, 0x6

    invoke-virtual {p0, v0, v2}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_70

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    goto :goto_72

    :cond_70
    const-string p0, "api-a.op-mobile.opera.com"

    :goto_72
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    new-instance v0, Lr9i;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "config"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "fetch"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "v1/feedback/rejected"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v4, "/v1/dps/"

    invoke-virtual {p0, v4}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x3

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_c2
    invoke-virtual {p0}, Lwy;->T()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_c2
        :pswitch_58
    .end packed-switch
.end method
