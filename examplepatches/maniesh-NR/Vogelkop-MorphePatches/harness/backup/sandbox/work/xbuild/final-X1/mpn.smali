.class public final Lmpn;
.super Lphj;
.source "SourceFile"


# instance fields
.field public final t:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmpn;->t:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final a(Lnz0;)V
    .registers 7

    instance-of v0, p1, Lz9g;

    if-eqz v0, :cond_4a

    move-object v0, p1

    check-cast v0, Lz9g;

    iget-object v1, v0, Lz9g;->a:Llag;

    sget-object v2, Llag;->c:Llag;

    if-ne v1, v2, :cond_4a

    sget v2, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->e0:I

    iget-object v2, v0, Lz9g;->e:Ljb;

    iget-object v3, v2, Ljb;->h:Ljava/io/Serializable;

    check-cast v3, Ljava/lang/String;

    iget-object v2, v2, Ljb;->i:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    sget-object v4, Llag;->b:Llag;

    if-eq v1, v4, :cond_22

    sget-object v4, Llag;->h:Llag;

    if-eq v1, v4, :cond_22

    move-object v3, v2

    :cond_22
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    iget-object p0, p0, Lmpn;->t:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4a

    const/4 p0, 0x0

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Lz9g;->b(ZZ)V

    return-void

    :cond_4a
    invoke-static {p1}, Lphj;->B(Ljjm;)V

    return-void
.end method

.method public final i()V
    .registers 1

    return-void
.end method
