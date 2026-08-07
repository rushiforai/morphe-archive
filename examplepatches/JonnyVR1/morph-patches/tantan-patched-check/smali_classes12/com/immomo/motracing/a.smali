.class public final Lcom/immomo/motracing/a;
.super Lcom/immomo/motracing/Span;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000f\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u001d\u0010\u0011\u001a\u00020\u000c8\u0016X\u0096D\u00f8\u0001\u0000\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\u00020\u000c8\u0016X\u0096D\u00f8\u0001\u0000\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u000e\u001a\u0004\u0008\u0012\u0010\u0010R\u001d\u0010\u0014\u001a\u00020\u000c8\u0016X\u0096D\u00f8\u0001\u0000\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u000e\u001a\u0004\u0008\r\u0010\u0010R\u001d\u0010\u0016\u001a\u00020\u000c8\u0016X\u0096D\u00f8\u0001\u0000\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\u000e\u001a\u0004\u0008\u0015\u0010\u0010R\u001a\u0010\u001a\u001a\u00020\u00048\u0016X\u0096D\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/immomo/motracing/a;",
        "Lcom/immomo/motracing/Span;",
        "<init>",
        "()V",
        "",
        "event",
        "",
        "d",
        "(Ljava/lang/String;)V",
        "Ll/lbe0;",
        "e",
        "()Ll/lbe0;",
        "Lkotlin/ULong;",
        "a",
        "J",
        "c",
        "()J",
        "tracerId",
        "b",
        "traceId",
        "spanId",
        "getParentSpanId",
        "parentSpanId",
        "Ljava/lang/String;",
        "getName",
        "()Ljava/lang/String;",
        "name",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/motracing/a;

# The value of this static final field might be set in the static constructor
.field private static final a:J = -0x1L

# The value of this static final field might be set in the static constructor
.field private static final b:J = -0x1L

# The value of this static final field might be set in the static constructor
.field private static final c:J = -0x1L

# The value of this static final field might be set in the static constructor
.field private static final d:J = -0x1L

# The value of this static final field might be set in the static constructor
.field private static final e:Ljava/lang/String; = "EMPTY"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/motracing/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/motracing/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/motracing/a;->INSTANCE:Lcom/immomo/motracing/a;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    sput-wide v0, Lcom/immomo/motracing/a;->a:J

    .line 11
    .line 12
    sput-wide v0, Lcom/immomo/motracing/a;->b:J

    .line 13
    .line 14
    sput-wide v0, Lcom/immomo/motracing/a;->c:J

    .line 15
    .line 16
    sput-wide v0, Lcom/immomo/motracing/a;->d:J

    .line 17
    .line 18
    const-string v0, "EMPTY"

    .line 19
    .line 20
    sput-object v0, Lcom/immomo/motracing/a;->e:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/motracing/Span;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/immomo/motracing/a;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/immomo/motracing/a;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/immomo/motracing/a;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public e()Ll/lbe0;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/lbe0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v0, v1, p0, v2}, Ll/lbe0;-><init>(Lcom/immomo/motracing/Span;Lcom/immomo/motracing/Span;Z)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
