.class public final Lvd7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpke;


# instance fields
.field public final synthetic a:Lwd7;


# direct methods
.method public constructor <init>(Lwd7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvd7;->a:Lwd7;

    return-void
.end method


# virtual methods
.method public final w(Lb2l;Loke;JZ)V
    .registers 6

    if-eqz p5, :cond_80

    iget-boolean p3, p2, Loke;->d:Z

    if-nez p3, :cond_80

    iget-boolean p2, p2, Loke;->c:Z

    if-nez p2, :cond_80

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    const-string p3, "http"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_32

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    const-string p3, "https"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_80

    :cond_32
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_80

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_80

    const-string p2, "["

    const/4 p3, 0x0

    invoke-static {p1, p2, p3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_4f

    const-string p2, "]"

    invoke-static {p1, p2, p3}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_80

    :cond_4f
    iget-object p0, p0, Lvd7;->a:Lwd7;

    iget-object p2, p0, Lwd7;->g:Lkotlin/jvm/functions/Function1;

    invoke-interface {p2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_80

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    :try_start_65
    invoke-static {p1}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_69
    .catch Ljava/lang/IllegalArgumentException; {:try_start_65 .. :try_end_69} :catch_69

    :catch_69
    iget-object p2, p0, Lwd7;->c:Lox3;

    invoke-virtual {p2}, Lox3;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lhd;

    iget-wide p3, p0, Lwd7;->j:J

    iget-boolean p0, p2, Lhd;->b:Z

    if-eqz p0, :cond_80

    new-instance p0, Livd;

    const/4 p5, 0x6

    invoke-direct {p0, p1, p3, p4, p5}, Livd;-><init>(Ljava/lang/String;JB)V

    invoke-virtual {p2, p0}, Lhd;->v(Lkotlin/jvm/functions/Function1;)V

    :cond_80
    return-void
.end method
