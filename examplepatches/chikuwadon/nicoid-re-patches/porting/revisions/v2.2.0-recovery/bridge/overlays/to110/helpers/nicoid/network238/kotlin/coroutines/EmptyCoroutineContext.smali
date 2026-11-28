.class public final Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/coroutines/CoroutineContext;
.implements Ljava/io/Serializable;


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;

    invoke-direct {v0}, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lnicoid/network238/kotlin/coroutines/CoroutineContext$Key;)Lnicoid/network238/kotlin/coroutines/CoroutineContext$Element;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x0

    return-object p1
.end method

.method public hashCode()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 104
    const-string v0, "EmptyCoroutineContext"

    return-object v0
.end method
