.class public final synthetic Lxt1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyt1;


# direct methods
.method public synthetic constructor <init>(Lyt1;B)V
    .registers 3

    iput-byte p2, p0, Lxt1;->a:B

    iput-object p1, p0, Lxt1;->b:Lyt1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lxt1;->a:B

    iget-object p0, p0, Lxt1;->b:Lyt1;

    packed-switch v0, :pswitch_data_62

    iget-object p0, p0, Lyt1;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_10

    const/4 p0, 0x0

    :cond_10
    if-eqz p0, :cond_30

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_30

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "https?"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lkotlin/text/Regex;->j(Ljava/lang/CharSequence;)Z

    move-result p0

    goto :goto_31

    :cond_30
    const/4 p0, 0x0

    :goto_31
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_36
    iget-object v0, p0, Lyt1;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object p0, p0, Lyt1;->a:Ljava/lang/String;

    if-nez v0, :cond_61

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_4f

    const-string p0, ""

    goto :goto_61

    :cond_4f
    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    const/16 v0, 0xa

    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    const-string v0, "opera-user://"

    invoke-static {v0, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_61
    :goto_61
    return-object p0

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
