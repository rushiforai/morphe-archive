.class public final Lwjb;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz1h;


# direct methods
.method public synthetic constructor <init>(Lz1h;B)V
    .registers 3

    iput-byte p2, p0, Lwjb;->a:B

    iput-object p1, p0, Lwjb;->b:Lz1h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final G(Lb2l;)V
    .registers 5

    iget-byte v0, p0, Lwjb;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lwjb;->b:Lz1h;

    packed-switch v0, :pswitch_data_5e

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3a

    new-instance v0, Lorg/chromium/url/GURL;

    invoke-direct {v0, p1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    iget-boolean p1, v0, Lorg/chromium/url/GURL;->b:Z

    if-eqz p1, :cond_3a

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p1

    const-string v2, "http"

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_39

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p1

    const-string v0, "https"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3a

    :cond_39
    const/4 v1, 0x1

    :cond_3a
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_42
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_56

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_56

    invoke-static {p1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    :cond_56
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method

.method public final x(Lb2l;)V
    .registers 5

    iget-byte v0, p0, Lwjb;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lwjb;->b:Lz1h;

    packed-switch v0, :pswitch_data_5e

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3a

    new-instance v0, Lorg/chromium/url/GURL;

    invoke-direct {v0, p1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    iget-boolean p1, v0, Lorg/chromium/url/GURL;->b:Z

    if-eqz p1, :cond_3a

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p1

    const-string v2, "http"

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_39

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p1

    const-string v0, "https"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3a

    :cond_39
    const/4 v1, 0x1

    :cond_3a
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_42
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_56

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_56

    invoke-static {p1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    :cond_56
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method
