.class public final Ll/lbe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B%\u0008\u0000\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0018\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\rR\u0016\u0010\u0004\u001a\u00020\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\rR\u0016\u0010\u0006\u001a\u00020\u00058\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Ll/lbe0;",
        "Ljava/lang/AutoCloseable;",
        "Lcom/immomo/motracing/Span;",
        "previousSpan",
        "currentSpan",
        "",
        "_close",
        "<init>",
        "(Lcom/immomo/motracing/Span;Lcom/immomo/motracing/Span;Z)V",
        "",
        "close",
        "()V",
        "a",
        "Lcom/immomo/motracing/Span;",
        "b",
        "c",
        "Z",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private a:Lcom/immomo/motracing/Span;

.field private b:Lcom/immomo/motracing/Span;

.field private c:Z


# direct methods
.method public constructor <init>(Lcom/immomo/motracing/Span;Lcom/immomo/motracing/Span;Z)V
    .locals 0
    .param p1    # Lcom/immomo/motracing/Span;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/motracing/Span;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/lbe0;->a:Lcom/immomo/motracing/Span;

    .line 8
    .line 9
    iput-object p2, p0, Ll/lbe0;->b:Lcom/immomo/motracing/Span;

    .line 10
    .line 11
    iput-boolean p3, p0, Ll/lbe0;->c:Z

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/motracing/Span;Lcom/immomo/motracing/Span;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Ll/lbe0;-><init>(Lcom/immomo/motracing/Span;Lcom/immomo/motracing/Span;Z)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/lbe0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/lbe0;->c:Z

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/motracing/GlobalTracer;->INSTANCE:Lcom/immomo/motracing/GlobalTracer;

    .line 10
    .line 11
    iget-object v1, p0, Ll/lbe0;->b:Lcom/immomo/motracing/Span;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/immomo/motracing/Span;->c()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-object p0, p0, Ll/lbe0;->a:Lcom/immomo/motracing/Span;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, p0}, Lcom/immomo/motracing/GlobalTracer;->f(JLcom/immomo/motracing/Span;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
