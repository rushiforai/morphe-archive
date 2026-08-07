.class final Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver;->e(Ljava/lang/String;Ll/tgi;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ll/rgi;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Ll/rgi;",
        "observer",
        "",
        "invoke",
        "(Ll/rgi;)V",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $bid:Ljava/lang/String;

.field final synthetic $checkResult:Ll/tgi;

.field final synthetic $requestData:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/tgi;Ljava/util/Map;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->$bid:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->$checkResult:Ll/tgi;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->$requestData:Ljava/util/Map;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/rgi;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->invoke(Ll/rgi;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/rgi;)V
    .locals 2
    .param p1    # Ll/rgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->$bid:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->$checkResult:Ll/tgi;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/hellogroup/fep/base/core/FepManager$InternalFepPackageObserver$packageCheckUpdateResponse$1;->$requestData:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {p1, v0, v1, p0}, Ll/ehi;->e(Ljava/lang/String;Ll/tgi;Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
