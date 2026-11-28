.class final Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/MemoryCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NewestFirst"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lnicoid/network238/kotlin/Pair;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u00c2\u0002\u0018\u00002&\u0012\u000e\u0012\u000c\u0012\u0004\u0012\u00020\u0003\u0012\u0002\u0008\u00030\u00020\u0001j\u0012\u0012\u000e\u0012\u000c\u0012\u0004\u0012\u00020\u0003\u0012\u0002\u0008\u00030\u0002`\u0004B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J,\u0010\u0007\u001a\u00020\u00082\u0010\u0010\t\u001a\u000c\u0012\u0004\u0012\u00020\u0003\u0012\u0002\u0008\u00030\u00022\u0010\u0010\n\u001a\u000c\u0012\u0004\u0012\u00020\u0003\u0012\u0002\u0008\u00030\u0002H\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;",
        "Ljava/util/Comparator;",
        "Lnicoid/network238/kotlin/Pair;",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "Lnicoid/network238/kotlin/Comparator;",
        "<init>",
        "()V",
        "compare",
        "",
        "o1",
        "o2",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 126
    check-cast p1, Lnicoid/network238/kotlin/Pair;

    check-cast p2, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;->compare(Lnicoid/network238/kotlin/Pair;Lnicoid/network238/kotlin/Pair;)I

    move-result p1

    return p1
.end method

.method public compare(Lnicoid/network238/kotlin/Pair;Lnicoid/network238/kotlin/Pair;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/Pair;",
            "Lnicoid/network238/kotlin/Pair;",
            ")I"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    invoke-virtual {p2}, Lnicoid/network238/kotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-interface {p2, p1}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;)I

    move-result p1

    return p1
.end method
