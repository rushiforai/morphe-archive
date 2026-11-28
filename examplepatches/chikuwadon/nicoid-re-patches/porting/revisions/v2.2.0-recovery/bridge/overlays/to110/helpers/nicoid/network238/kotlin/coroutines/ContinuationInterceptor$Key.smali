.class public final Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/coroutines/CoroutineContext$Key;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Key"
.end annotation


# static fields
.field static final synthetic $$INSTANCE:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;

    invoke-direct {v0}, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;->$$INSTANCE:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
