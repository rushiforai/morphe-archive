.class public final Loxn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll99;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwc1;


# direct methods
.method public synthetic constructor <init>(Lwc1;B)V
    .registers 3

    iput-byte p2, p0, Loxn;->a:B

    iput-object p1, p0, Loxn;->b:Lwc1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;
    .registers 12

    iget-byte p2, p0, Loxn;->a:B

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_d2

    check-cast p1, Lyxn;

    iget-object p0, p0, Loxn;->b:Lwc1;

    instance-of p2, p1, Lwxn;

    if-eqz p2, :cond_14

    iget-object p0, p0, Lwc1;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->reload()V

    goto :goto_2f

    :cond_14
    instance-of p2, p1, Lxxn;

    if-eqz p2, :cond_1e

    iget-object p0, p0, Lwc1;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    goto :goto_2f

    :cond_1e
    instance-of p2, p1, Lvxn;

    if-nez p2, :cond_36

    instance-of p2, p1, Luxn;

    if-eqz p2, :cond_32

    check-cast p1, Luxn;

    iget-object p2, p1, Luxn;->a:Ljava/lang/String;

    iget-object p1, p1, Luxn;->b:Lq0n;

    invoke-virtual {p0, p2, p1}, Lwc1;->a(Ljava/lang/String;Lq0n;)V

    :goto_2f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_35

    :cond_32
    invoke-static {}, Lh9o;->p()V

    :goto_35
    return-object v0

    :cond_36
    throw v0

    :pswitch_37
    check-cast p1, Ljtn;

    iget-object p0, p0, Loxn;->b:Lwc1;

    instance-of p2, p1, Litn;

    if-eqz p2, :cond_4c

    check-cast p1, Litn;

    iget-object p2, p1, Litn;->a:Ljava/lang/String;

    iget-object p1, p1, Litn;->b:Ljava/util/Map;

    iget-object p0, p0, Lwc1;->a:Landroid/webkit/WebView;

    invoke-virtual {p0, p2, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_c3

    :cond_4c
    instance-of p2, p1, Lgtn;

    if-eqz p2, :cond_bf

    check-cast p1, Lgtn;

    iget-object p1, p1, Lgtn;->a:Ljava/lang/String;

    sget-object p2, Lbxn;->a:Lbxn;

    sget-object v1, Lotb;->d:Lotb;

    iget-object v2, v1, Lhzc;->b:Ljava/lang/String;

    sget-object v3, Leaj;->b:Leaj;

    iget-object v4, v1, Lhzc;->a:Letb;

    iget-object v4, v4, Letb;->a:Leaj;

    invoke-virtual {v4, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_7f

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "loadHtmlFile: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", readType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v3, v2, p2, v0}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7f
    :try_start_7f
    iget-object p2, p0, Lwc1;->a:Landroid/webkit/WebView;

    invoke-virtual {p2, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_84} :catch_85

    goto :goto_b9

    :catch_85
    move-exception v0

    move-object p2, v0

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->e:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_a0

    const-string v3, "Error loading HTML file: "

    invoke-static {v3, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, p2}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_a0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    const-string v0, ". Error: "

    const-string v1, "</p></body></html>"

    const-string v2, "<html><body><h1>Error</h1><p>Could not load file: "

    invoke-static {v2, p1, v0, p2, v1}, Lsko;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v3, p0, Lwc1;->a:Landroid/webkit/WebView;

    const-string v7, "UTF-8"

    const/4 v8, 0x0

    const/4 v4, 0x0

    const-string v6, "text/html"

    invoke-virtual/range {v3 .. v8}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_b9
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object p1, Lpx5;->a:Lpx5;

    :goto_bd
    move-object p1, p0

    goto :goto_c6

    :cond_bf
    instance-of p0, p1, Lhtn;

    if-eqz p0, :cond_ce

    :goto_c3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_bd

    :goto_c6
    sget-object p2, Lpx5;->a:Lpx5;

    if-ne p0, p2, :cond_cc

    move-object v0, p0

    goto :goto_d1

    :cond_cc
    move-object v0, p1

    goto :goto_d1

    :cond_ce
    invoke-static {}, Lh9o;->p()V

    :goto_d1
    return-object v0

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
