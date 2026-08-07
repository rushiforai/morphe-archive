.class public final Lcom/immomo/motracing/Tracer$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/motracing/Tracer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/immomo/motracing/Tracer$a;",
        "",
        "<init>",
        "()V",
        "",
        "value",
        "Lkotlin/ULong;",
        "a",
        "(Ljava/lang/String;)J",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/immomo/motracing/Tracer$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)J
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    move-wide v3, v0

    .line 12
    :goto_0
    const/16 v5, 0x8

    .line 13
    .line 14
    if-ge v2, v5, :cond_1

    .line 15
    .line 16
    if-ge v2, p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    int-to-byte v5, v5

    .line 23
    int-to-long v5, v5

    .line 24
    invoke-static {v5, v6}, Lkotlin/ULong;->b(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v5

    .line 28
    mul-int/lit8 v7, v2, 0x8

    .line 29
    .line 30
    shl-long/2addr v5, v7

    .line 31
    invoke-static {v5, v6}, Lkotlin/ULong;->b(J)J

    .line 32
    .line 33
    .line 34
    move-result-wide v5

    .line 35
    or-long/2addr v3, v5

    .line 36
    invoke-static {v3, v4}, Lkotlin/ULong;->b(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-static {v0, v1}, Lkotlin/ULong;->b(J)J

    .line 42
    .line 43
    .line 44
    move-result-wide v5

    .line 45
    or-long/2addr v3, v5

    .line 46
    invoke-static {v3, v4}, Lkotlin/ULong;->b(J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-wide v3
.end method
