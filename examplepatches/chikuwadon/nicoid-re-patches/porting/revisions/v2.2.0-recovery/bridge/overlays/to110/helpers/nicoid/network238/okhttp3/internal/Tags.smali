.class public abstract Lnicoid/network238/okhttp3/internal/Tags;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u00080\u0018\u00002\u00020\u0001B\t\u0008\u0004\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J/\u0010\u0004\u001a\u00020\u0000\"\u0008\u0008\u0000\u0010\u0005*\u00020\u00012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u0001H\u0005H&\u00a2\u0006\u0002\u0010\tJ(\u0010\n\u001a\u0004\u0018\u0001H\u0005\"\u0008\u0008\u0000\u0010\u0005*\u00020\u00012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0007H\u00a6\u0002\u00a2\u0006\u0002\u0010\u000b\u0082\u0001\u0002\u000c\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "",
        "<init>",
        "()V",
        "plus",
        "T",
        "key",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "value",
        "(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;",
        "get",
        "(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;",
        "Lnicoid/network238/okhttp3/internal/EmptyTags;",
        "Lnicoid/network238/okhttp3/internal/LinkedTags;",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/Tags;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract plus(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "TT;)",
            "Lnicoid/network238/okhttp3/internal/Tags;"
        }
    .end annotation
.end method
