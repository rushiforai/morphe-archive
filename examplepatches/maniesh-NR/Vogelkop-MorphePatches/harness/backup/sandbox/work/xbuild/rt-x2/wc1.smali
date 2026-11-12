.class public final Lwc1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/webkit/WebView;

.field public final b:Lkxn;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Lkxn;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwc1;->a:Landroid/webkit/WebView;

    iput-object p2, p0, Lwc1;->b:Lkxn;

    if-eqz p2, :cond_e

    const-string p2, "androidJsBridge"

    invoke-virtual {p1, p0, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_e
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lq0n;)V
    .registers 8

    const-string v0, "javascript:"

    invoke-static {v0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    const/4 v4, 0x0

    if-gtz v3, :cond_20

    const-string v3, "evaluateJavaScript: "

    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v4}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_20
    iget-object p0, p0, Lwc1;->a:Landroid/webkit/WebView;

    if-eqz p2, :cond_29

    new-instance v4, Lvc1;

    invoke-direct {v4, p2}, Lvc1;-><init>(Lq0n;)V

    :cond_29
    invoke-virtual {p0, p1, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method public final call(Ljava/lang/String;)V
    .registers 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    const-string v4, "call from JS: "

    const/4 v5, 0x0

    if-gtz v3, :cond_1a

    invoke-static {v4, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v5}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1a
    sget-object v1, Lrpb;->d:Lqpb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lppb;->Companion:Lopb;

    invoke-virtual {v3}, Lopb;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    check-cast v3, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v1, p1, v3}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lppb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_48

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v5}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_48
    iget-object p0, p0, Lwc1;->b:Lkxn;

    if-eqz p0, :cond_4f

    invoke-virtual {p0, p1}, Lkxn;->a(Lppb;)V

    :cond_4f
    return-void
.end method

.method public final callAndroid(ILjava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lotb;->d:Lotb;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_23

    const-string v3, "callAndroid call from JS: "

    const-string v4, ", "

    invoke-static {p1, v3, v4, p2, v4}, Lp3p;->p(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v1, v3, v4}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_23
    iget-object p0, p0, Lwc1;->b:Lkxn;

    if-eqz p0, :cond_2f

    new-instance v0, Lppb;

    invoke-direct {v0, p1, p2, p3}, Lppb;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkxn;->a(Lppb;)V

    :cond_2f
    return-void
.end method
