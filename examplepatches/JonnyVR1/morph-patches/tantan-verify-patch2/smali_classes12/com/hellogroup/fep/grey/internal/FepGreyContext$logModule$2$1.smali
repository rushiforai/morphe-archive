.class final Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function6;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2;->invoke()Ll/pgi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function6<",
        "Lcom/hellogroup/fep/base/FepLogModuleType;",
        "Lcom/hellogroup/fep/base/FepLogLevel;",
        "Ljava/lang/String;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "+",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Throwable;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u00000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0003\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0016\u0010\u0008\u001a\u0012\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\t2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\n\u00a2\u0006\u0002\u0008\u000f"
    }
    d2 = {
        "<anonymous>",
        "",
        "moduleType",
        "Lcom/hellogroup/fep/base/FepLogModuleType;",
        "level",
        "Lcom/hellogroup/fep/base/FepLogLevel;",
        "message",
        "",
        "extraInfo",
        "",
        "",
        "errorCode",
        "",
        "throwable",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;

    invoke-direct {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;-><init>()V

    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 33
    check-cast p1, Lcom/hellogroup/fep/base/FepLogModuleType;

    check-cast p2, Lcom/hellogroup/fep/base/FepLogLevel;

    check-cast p3, Ljava/lang/String;

    check-cast p4, Ljava/util/Map;

    check-cast p5, Ljava/lang/Number;

    invoke-virtual {p5}, Ljava/lang/Number;->intValue()I

    move-result p5

    check-cast p6, Ljava/lang/Throwable;

    invoke-virtual/range {p0 .. p6}, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1;->invoke(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V
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
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->d()Ll/tl5;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1$1;

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
    invoke-direct/range {v0 .. v6}, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1$1;-><init>(Lcom/hellogroup/fep/base/FepLogModuleType;Lcom/hellogroup/fep/base/FepLogLevel;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1$2;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2$1$2;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Ll/tl5;->b(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
