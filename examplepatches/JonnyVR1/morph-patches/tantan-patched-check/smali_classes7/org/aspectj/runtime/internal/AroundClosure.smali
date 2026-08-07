.class public abstract Lorg/aspectj/runtime/internal/AroundClosure;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected bitflags:I

.field protected preInitializationState:[Ljava/lang/Object;

.field protected state:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x100000

    .line 12
    iput v0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->bitflags:I

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x100000

    .line 5
    .line 6
    iput v0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->bitflags:I

    .line 7
    .line 8
    iput-object p1, p0, Lorg/aspectj/runtime/internal/AroundClosure;->state:[Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getFlags()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->bitflags:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreInitializationState()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->preInitializationState:[Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getState()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->state:[Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public linkClosureAndJoinPoint()Lorg/aspectj/lang/ProceedingJoinPoint;
    .locals 2

    .line 16
    iget-object v0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->state:[Ljava/lang/Object;

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    .line 17
    invoke-interface {v0, p0}, Lorg/aspectj/lang/ProceedingJoinPoint;->set$AroundClosure(Lorg/aspectj/runtime/internal/AroundClosure;)V

    return-object v0
.end method

.method public linkClosureAndJoinPoint(I)Lorg/aspectj/lang/ProceedingJoinPoint;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/aspectj/runtime/internal/AroundClosure;->state:[Ljava/lang/Object;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    add-int/lit8 v1, v1, -0x1

    .line 5
    .line 6
    aget-object v0, v0, v1

    .line 7
    .line 8
    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    .line 9
    .line 10
    invoke-interface {v0, p0}, Lorg/aspectj/lang/ProceedingJoinPoint;->set$AroundClosure(Lorg/aspectj/runtime/internal/AroundClosure;)V

    .line 11
    .line 12
    .line 13
    iput p1, p0, Lorg/aspectj/runtime/internal/AroundClosure;->bitflags:I

    .line 14
    .line 15
    return-object v0
.end method

.method public abstract run([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
