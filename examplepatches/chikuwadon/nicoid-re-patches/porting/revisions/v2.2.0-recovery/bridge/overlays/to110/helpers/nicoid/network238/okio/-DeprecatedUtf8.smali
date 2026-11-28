.class public final Lnicoid/network238/okio/-DeprecatedUtf8;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J \u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0007\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okio/-DeprecatedUtf8;",
        "",
        "<init>",
        "()V",
        "size",
        "",
        "string",
        "",
        "beginIndex",
        "",
        "endIndex",
        "okio"
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
.field public static final INSTANCE:Lnicoid/network238/okio/-DeprecatedUtf8;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okio/-DeprecatedUtf8;

    invoke-direct {v0}, Lnicoid/network238/okio/-DeprecatedUtf8;-><init>()V

    sput-object v0, Lnicoid/network238/okio/-DeprecatedUtf8;->INSTANCE:Lnicoid/network238/okio/-DeprecatedUtf8;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final size(Ljava/lang/String;)J
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    const/4 v0, 0x0

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-static {p1, v0, v0, v1, v2}, Lnicoid/network238/okio/Utf8;->size$default(Ljava/lang/String;IIILjava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final size(Ljava/lang/String;II)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    invoke-static {p1, p2, p3}, Lnicoid/network238/okio/Utf8;->size(Ljava/lang/String;II)J

    move-result-wide p1

    return-wide p1
.end method
