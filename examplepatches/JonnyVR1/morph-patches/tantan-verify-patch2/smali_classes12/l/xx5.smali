.class public Ll/xx5;
.super Ll/ef00;
.source "SourceFile"


# instance fields
.field private b:Lcom/quickjs/JSObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ef00;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public close(Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "ConsoleModule"

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const/4 p0, 0x5

    .line 2
    const-string v0, "ConsoleModule"

    .line 3
    .line 4
    invoke-static {p0, v0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->K(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final info(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "ConsoleModule"

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "ConsoleModule"

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setup(Lcom/quickjs/JSContext;)V
    .locals 1

    .line 1
    const-string v0, "native_console"

    .line 2
    .line 3
    invoke-virtual {p1, p0, v0}, Lcom/quickjs/JSObject;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/xx5;->b:Lcom/quickjs/JSObject;

    .line 8
    .line 9
    return-void
.end method

.method public final warn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "ConsoleModule"

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->P(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
