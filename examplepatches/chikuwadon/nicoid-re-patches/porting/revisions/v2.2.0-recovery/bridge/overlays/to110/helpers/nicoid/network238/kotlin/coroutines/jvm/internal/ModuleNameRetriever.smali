.class final Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;

.field private static cache:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

.field private static final notOnJava9:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;

    invoke-direct {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->INSTANCE:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;

    .line 61
    new-instance v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->notOnJava9:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final buildCache(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;
    .registers 6

    .line 77
    :try_start_0
    const-class v0, Ljava/lang/Class;

    const-string v1, "getModule"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 78
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v3, "java.lang.Module"

    invoke-virtual {v1, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 79
    const-string v3, "getDescriptor"

    invoke-virtual {v1, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 80
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    const-string v3, "java.lang.module.ModuleDescriptor"

    invoke-virtual {p1, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 81
    const-string v3, "name"

    invoke-virtual {p1, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 82
    new-instance v2, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    invoke-direct {v2, v0, v1, p1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    sput-object v2, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->cache:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p1

    .line 84
    sget-object p1, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->notOnJava9:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    sput-object p1, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->cache:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    return-object p1
.end method


# virtual methods
.method public final getModuleName(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    sget-object v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->cache:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->buildCache(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    move-result-object v0

    .line 67
    :cond_0
    sget-object v1, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->notOnJava9:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    goto :goto_1

    .line 70
    :cond_1
    iget-object v1, v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;->getModuleMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 71
    iget-object v1, v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;->getDescriptorMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 72
    iget-object v0, v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;->nameMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    :cond_2
    move-object p1, v2

    :goto_0
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_3

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_3
    :goto_1
    return-object v2
.end method
