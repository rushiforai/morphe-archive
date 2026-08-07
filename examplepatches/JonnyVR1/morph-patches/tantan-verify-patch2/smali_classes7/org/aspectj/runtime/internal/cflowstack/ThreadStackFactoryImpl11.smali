.class public Lorg/aspectj/runtime/internal/cflowstack/ThreadStackFactoryImpl11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/aspectj/runtime/internal/cflowstack/ThreadStackFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getNewThreadCounter()Lorg/aspectj/runtime/internal/cflowstack/ThreadCounter;
    .locals 0

    .line 1
    new-instance p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadCounterImpl11;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/aspectj/runtime/internal/cflowstack/ThreadCounterImpl11;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getNewThreadStack()Lorg/aspectj/runtime/internal/cflowstack/ThreadStack;
    .locals 0

    .line 1
    new-instance p0, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/aspectj/runtime/internal/cflowstack/ThreadStackImpl11;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
