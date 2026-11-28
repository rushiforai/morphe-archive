.class final Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Cache"
.end annotation


# instance fields
.field public final getDescriptorMethod:Ljava/lang/reflect/Method;

.field public final getModuleMethod:Ljava/lang/reflect/Method;

.field public final nameMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 4

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;->getModuleMethod:Ljava/lang/reflect/Method;

    .line 55
    iput-object p2, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;->getDescriptorMethod:Ljava/lang/reflect/Method;

    .line 57
    iput-object p3, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever$Cache;->nameMethod:Ljava/lang/reflect/Method;

    return-void
.end method
