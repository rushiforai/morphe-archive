.class public final Ll/omg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qtg0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ltech/sud/gip/core/ai/ISudListenerAiCommon;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ltech/sud/gip/core/ai/ISudListenerAiCommon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/omg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/omg0;->b:Ltech/sud/gip/core/ai/ISudListenerAiCommon;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "aiCommon param:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/omg0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " response:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "SudAiModelImpl"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/pyg0;->b:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/omg0;->b:Ltech/sud/gip/core/ai/ISudListenerAiCommon;

    .line 36
    .line 37
    invoke-interface {p0, p1}, Ltech/sud/gip/core/ai/ISudListenerAiCommon;->onCompleted(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
