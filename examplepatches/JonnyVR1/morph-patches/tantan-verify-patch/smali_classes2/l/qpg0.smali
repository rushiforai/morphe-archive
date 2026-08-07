.class public final Ll/qpg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cwg0;


# instance fields
.field public final synthetic a:Ltech/sud/gip/core/ai/ISudListenerAiSse;


# direct methods
.method public constructor <init>(Ltech/sud/gip/core/ai/ISudListenerAiSse;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qpg0;->a:Ltech/sud/gip/core/ai/ISudListenerAiSse;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "aiSse onFailure:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "SudAiModelImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/pyg0;->b:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const/4 v0, -0x1

    .line 26
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p1, "ret_code"

    .line 32
    .line 33
    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const-string p1, "ret_msg"

    .line 38
    .line 39
    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {v1, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    :goto_0
    iget-object p0, p0, Ll/qpg0;->a:Ltech/sud/gip/core/ai/ISudListenerAiSse;

    .line 54
    .line 55
    invoke-interface {p0, v0, p1}, Ltech/sud/gip/core/ai/ISudListenerAiSse;->onFailure(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final onCompleted()V
    .locals 2

    .line 1
    const-string v0, "SudAiModelImpl"

    .line 2
    .line 3
    const-string v1, "aiSse onCompleted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/pyg0;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/qpg0;->a:Ltech/sud/gip/core/ai/ISudListenerAiSse;

    .line 14
    .line 15
    invoke-interface {p0}, Ltech/sud/gip/core/ai/ISudListenerAiSse;->onCompleted()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final onSseLine(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "aiSse onSseLine:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "SudAiModelImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/qpg0;->a:Ltech/sud/gip/core/ai/ISudListenerAiSse;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ltech/sud/gip/core/ai/ISudListenerAiSse;->onSseLine(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
