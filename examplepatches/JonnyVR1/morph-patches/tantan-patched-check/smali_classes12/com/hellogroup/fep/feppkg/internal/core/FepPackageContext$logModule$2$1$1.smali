.class final Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1;->invoke(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ll/ehi;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Ll/ehi;",
        "observer",
        "",
        "invoke",
        "(Ll/ehi;)V",
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
.field final synthetic $errorCode:I

.field final synthetic $extraInfo:Ljava/util/Map;

.field final synthetic $level:Lcom/hellogroup/fep/base/FepLogLevel;

.field final synthetic $message:Ljava/lang/String;

.field final synthetic $moduleType:Lcom/hellogroup/fep/base/FepLogModuleType;

.field final synthetic $throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$moduleType:Lcom/hellogroup/fep/base/FepLogModuleType;

    iput-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$level:Lcom/hellogroup/fep/base/FepLogLevel;

    iput-object p3, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$extraInfo:Ljava/util/Map;

    iput p5, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$errorCode:I

    iput-object p6, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$throwable:Ljava/lang/Throwable;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 21
    check-cast p1, Ll/ehi;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->invoke(Ll/ehi;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/ehi;)V
    .locals 7
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$moduleType:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$level:Lcom/hellogroup/fep/base/FepLogLevel;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$message:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$extraInfo:Ljava/util/Map;

    .line 11
    .line 12
    iget v5, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$errorCode:I

    .line 13
    .line 14
    iget-object v6, p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext$logModule$2$1$1;->$throwable:Ljava/lang/Throwable;

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    invoke-interface/range {v0 .. v6}, Ll/ehi;->f(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
