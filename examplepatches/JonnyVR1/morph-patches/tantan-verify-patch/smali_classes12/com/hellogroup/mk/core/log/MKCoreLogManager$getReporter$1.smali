.class final synthetic Lcom/hellogroup/mk/core/log/MKCoreLogManager$getReporter$1;
.super Lkotlin/jvm/internal/MutablePropertyReference0;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/log/MKCoreLogManager;)V
    .locals 0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/MutablePropertyReference0;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lkotlin/jvm/internal/CallableReference;->receiver:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/hellogroup/mk/core/log/MKCoreLogManager;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->a(Lcom/hellogroup/mk/core/log/MKCoreLogManager;)Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    const-string p0, "logReporter"

    return-object p0
.end method

.method public getOwner()Lkotlin/reflect/KDeclarationContainer;
    .locals 0

    const-class p0, Lcom/hellogroup/mk/core/log/MKCoreLogManager;

    invoke-static {p0}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 0

    const-string p0, "getLogReporter()Lcom/hellogroup/mk/core/log/core/MKLogReporter;"

    return-object p0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lkotlin/jvm/internal/CallableReference;->receiver:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/hellogroup/mk/core/log/MKCoreLogManager;

    .line 4
    .line 5
    check-cast p1, Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->b(Lcom/hellogroup/mk/core/log/MKCoreLogManager;Lcom/hellogroup/mk/core/log/core/MKLogReporter;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
