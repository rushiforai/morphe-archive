.class public final Ljfd;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(Leri;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ljfd;->c:B

    const/16 v0, 0x19

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void
.end method

.method public constructor <init>(Leri;Loc2;)V
    .registers 3

    const/4 p2, 0x1

    iput-byte p2, p0, Ljfd;->c:B

    const/16 p2, 0x19

    .line 9
    invoke-direct {p0, p1, p2}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void
.end method


# virtual methods
.method public final B()Z
    .registers 1

    iget-byte p0, p0, Ljfd;->c:B

    const/4 p0, 0x1

    return p0
.end method

.method public final m(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    iget-byte v0, p0, Ljfd;->c:B

    packed-switch v0, :pswitch_data_64

    return-object p1

    :pswitch_6
    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Leri;

    sget-object v0, Leti;->a:Lq6e;

    if-nez p0, :cond_10

    const/4 p0, 0x0

    goto :goto_12

    :cond_10
    instance-of p0, p0, Lf1a;

    :goto_12
    if-eqz p0, :cond_63

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    sget-object p1, Lwqm;->a:[Ljava/lang/String;

    const-string p1, "client"

    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5f

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->clearQuery()Landroid/net/Uri$Builder;

    invoke-static {p0}, Lwqm;->n(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_31
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    invoke-static {p0, v2}, Lwqm;->o(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_4b

    :cond_5b
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    :cond_5f
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_63
    return-object p1

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
