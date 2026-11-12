.class public final Ldkl;
.super Lcgh;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lzyk;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, LJ/N;->MxvwDZcS(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/url/GURL;

    iget-boolean v1, v0, Lorg/chromium/url/GURL;->b:Z

    if-eqz v1, :cond_1d

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LJ/N;->M52RypMk(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    :cond_1d
    sget-object v0, Laik;->a:[Ljava/lang/String;

    invoke-static {p1}, Lehi;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ldkl;->a:Ljava/lang/String;

    new-instance p1, Lp7l;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ldkl;->b:Lzyk;

    return-void
.end method
