.class public interface abstract Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/coroutines/CoroutineContext$Element;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;
    }
.end annotation


# static fields
.field public static final Key:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;->$$INSTANCE:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;

    sput-object v0, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor;->Key:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;

    return-void
.end method
