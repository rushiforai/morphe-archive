.class public final Lcom/clevertap/android/sdk/inapp/delay/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pqm;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/pqm<",
        "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\n\u0008\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0017\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\r\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/delay/a;",
        "Ll/pqm;",
        "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        "<init>",
        "()V",
        "Lorg/json/JSONObject;",
        "inApp",
        "",
        "b",
        "(Lorg/json/JSONObject;)J",
        "",
        "id",
        "data",
        "g",
        "(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        "message",
        "f",
        "(Ljava/lang/String;Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        "e",
        "(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


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
.method public bridge synthetic a(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/a;->g(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Lorg/json/JSONObject;)J
    .locals 0
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/rqm;->INSTANCE:Ll/rqm;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/rqm;->a(Lorg/json/JSONObject;)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public bridge synthetic c(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/delay/a;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/a;->f(Ljava/lang/String;Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$a;

    .line 5
    .line 6
    const-string v0, "Timer expired while app was backgrounded"

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;

    .line 8
    .line 9
    sget-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->UNKNOWN:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/Exception;

    .line 12
    .line 13
    invoke-direct {v1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1, v0, v1}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;-><init>(Ljava/lang/String;Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public g(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
