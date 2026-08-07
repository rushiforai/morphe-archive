.class public Ll/yqw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/byl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V
    .locals 0
    .param p4    # Ll/z84;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/y84;

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    const-string p2, "reason: call MWCEngineEmptyImpl#trigger"

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Ll/y84;-><init>(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-interface {p4, p0, p1}, Ll/z84;->a(Ll/y84;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public bridge synthetic d(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Ll/byl;
    .locals 0
    .param p1    # Lcom/immomo/mwc/sdk/c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yqw;->e(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Ll/yqw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Ll/yqw;
    .locals 2
    .param p1    # Lcom/immomo/mwc/sdk/c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance p1, Lcom/immomo/mwc/sdk/exception/MWCException;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    const-string v1, "reason: call MWCEngineEmptyImpl#addWorker"

    .line 7
    .line 8
    invoke-direct {p1, v0, v1}, Lcom/immomo/mwc/sdk/exception/MWCException;-><init>(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p2, p1, v0}, Ll/ro5;->a(Lcom/immomo/mwc/sdk/exception/MWCException;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-object p0
.end method
