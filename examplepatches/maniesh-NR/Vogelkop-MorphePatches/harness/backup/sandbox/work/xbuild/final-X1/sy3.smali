.class public final synthetic Lsy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    iput-byte p2, p0, Lsy3;->a:B

    iput-object p1, p0, Lsy3;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lsy3;->a:B

    iget-object p0, p0, Lsy3;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_24

    const-string v0, "article_share_url"

    invoke-static {p0, v0}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_17
    return-object v0

    :pswitch_18
    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :pswitch_22
    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_22
        :pswitch_18
    .end packed-switch
.end method
