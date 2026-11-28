.class public final Lnicoid/network238/okhttp3/internal/EmptyTags;
.super Lnicoid/network238/okhttp3/internal/Tags;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J/\u0010\u0004\u001a\u00020\u0001\"\u0008\u0008\u0000\u0010\u0005*\u00020\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u00082\u0008\u0010\t\u001a\u0004\u0018\u0001H\u0005H\u0016\u00a2\u0006\u0002\u0010\nJ(\u0010\u000b\u001a\u0004\u0018\u0001H\u0005\"\u0008\u0008\u0000\u0010\u0005*\u00020\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0008H\u0096\u0002\u00a2\u0006\u0002\u0010\u000cJ\u0008\u0010\r\u001a\u00020\u000eH\u0016\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/EmptyTags;",
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "<init>",
        "()V",
        "plus",
        "T",
        "",
        "key",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "value",
        "(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;",
        "get",
        "(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;",
        "toString",
        "",
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
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/EmptyTags;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/EmptyTags;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/EmptyTags;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/EmptyTags;->INSTANCE:Lnicoid/network238/okhttp3/internal/EmptyTags;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/Tags;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method


# virtual methods
.method public get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x0

    return-object p1
.end method

.method public plus(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;
    .registers 4
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

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    .line 52
    new-instance v0, Lnicoid/network238/okhttp3/internal/LinkedTags;

    invoke-direct {v0, p1, p2, p0}, Lnicoid/network238/okhttp3/internal/LinkedTags;-><init>(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;Lnicoid/network238/okhttp3/internal/Tags;)V

    return-object v0

    :cond_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 58
    const-string v0, "{}"

    return-object v0
.end method
