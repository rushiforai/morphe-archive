.class final Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bgi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/fep/base/core/FepManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "InternalFepConfigObserver"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\t\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJQ\u0010\u001a\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0016\u0010\u0015\u001a\u0012\u0012\u0004\u0012\u00020\u0011\u0012\u0006\u0012\u0004\u0018\u00010\u0014\u0018\u00010\u00132\u0006\u0010\u0017\u001a\u00020\u00162\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ)\u0010\u001f\u001a\u00020\n2\u0006\u0010\u001c\u001a\u00020\u00112\u0006\u0010\u001d\u001a\u00020\u00112\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0014H\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 \u00a8\u0006!"
    }
    d2 = {
        "Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;",
        "Ll/bgi;",
        "<init>",
        "(Lcom/hellogroup/fep/base/core/FepManager;)V",
        "Lcom/hellogroup/fep/config/core/FepConfigManager;",
        "manager",
        "",
        "isLocalData",
        "Lcom/hellogroup/fep/config/model/FepConfigFetchType;",
        "type",
        "",
        "b",
        "(Lcom/hellogroup/fep/config/core/FepConfigManager;ZLcom/hellogroup/fep/config/model/FepConfigFetchType;)V",
        "Lcom/hellogroup/fep/base/FepLogModuleType;",
        "moduleType",
        "Lcom/hellogroup/fep/base/FepLogLevel;",
        "level",
        "",
        "message",
        "",
        "",
        "extraInfo",
        "",
        "errorCode",
        "",
        "throwable",
        "c",
        "(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V",
        "configType",
        "key",
        "value",
        "a",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/fep/base/core/FepManager;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/base/core/FepManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;->a:Lcom/hellogroup/fep/base/core/FepManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;->a:Lcom/hellogroup/fep/base/core/FepManager;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/hellogroup/fep/base/core/FepManager;->b(Lcom/hellogroup/fep/base/core/FepManager;)Ll/tl5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigTrackUsage$1;

    .line 14
    .line 15
    invoke-direct {v0, p1, p2, p3}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigTrackUsage$1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigTrackUsage$2;->INSTANCE:Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigTrackUsage$2;

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1}, Ll/tl5;->b(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b(Lcom/hellogroup/fep/config/core/FepConfigManager;ZLcom/hellogroup/fep/config/model/FepConfigFetchType;)V
    .locals 1
    .param p1    # Lcom/hellogroup/fep/config/core/FepConfigManager;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/hellogroup/fep/config/model/FepConfigFetchType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;->a:Lcom/hellogroup/fep/base/core/FepManager;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/hellogroup/fep/base/core/FepManager;->b(Lcom/hellogroup/fep/base/core/FepManager;)Ll/tl5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigDidUpdate$1;

    .line 14
    .line 15
    invoke-direct {v0, p1, p2, p3}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigDidUpdate$1;-><init>(Lcom/hellogroup/fep/config/core/FepConfigManager;ZLcom/hellogroup/fep/config/model/FepConfigFetchType;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigDidUpdate$2;->INSTANCE:Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigDidUpdate$2;

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1}, Ll/tl5;->b(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V
    .locals 7
    .param p1    # Lcom/hellogroup/fep/base/FepLogModuleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/fep/base/FepLogLevel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/fep/base/FepLogModuleType;",
            "Lcom/hellogroup/fep/base/FepLogLevel;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;I",
            "Ljava/lang/Throwable;",
            ")V"
        }
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver;->a:Lcom/hellogroup/fep/base/core/FepManager;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/hellogroup/fep/base/core/FepManager;->b(Lcom/hellogroup/fep/base/core/FepManager;)Ll/tl5;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigLog$1;

    .line 17
    .line 18
    move-object v1, p1

    .line 19
    move-object v2, p2

    .line 20
    move-object v3, p3

    .line 21
    move-object v4, p4

    .line 22
    move v5, p5

    .line 23
    move-object v6, p6

    .line 24
    invoke-direct/range {v0 .. v6}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigLog$1;-><init>(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigLog$2;->INSTANCE:Lcom/hellogroup/fep/base/core/FepManager$InternalFepConfigObserver$fepConfigLog$2;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Ll/tl5;->b(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
