.class final synthetic Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$5;
.super Lkotlin/jvm/internal/FunctionReferenceImpl;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->m(Lcom/tantanapp/sharedlibrary/loader/a;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1001
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/FunctionReferenceImpl;",
        "Lkotlin/jvm/functions/Function3<",
        "Lcom/tantanapp/sharedlibrary/loader/a;",
        "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;",
        "Ll/q5d0<",
        "Lkotlin/Unit;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 7

    const-string v5, "verifySo(Lcom/tantanapp/sharedlibrary/loader/Config;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Lcom/tantanapp/sharedlibrary/loader/Result;"

    const/4 v6, 0x0

    const/4 v1, 0x3

    const-class v3, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;

    const-string v4, "verifySo"

    move-object v0, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/FunctionReferenceImpl;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/a;

    check-cast p2, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    check-cast p3, Ljava/util/Map;

    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$5;->invoke(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 0
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lkotlin/jvm/internal/CallableReference;->receiver:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;

    .line 13
    .line 14
    invoke-static {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->e(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
