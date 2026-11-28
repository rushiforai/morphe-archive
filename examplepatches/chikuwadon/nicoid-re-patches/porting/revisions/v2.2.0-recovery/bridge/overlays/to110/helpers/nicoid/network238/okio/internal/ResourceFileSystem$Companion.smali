.class final Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/internal/ResourceFileSystem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008\u0082\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0008\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\t\u001a\u00020\u0005J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0005H\u0002R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\r"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;",
        "",
        "<init>",
        "()V",
        "ROOT",
        "Lnicoid/network238/okio/Path;",
        "getROOT",
        "()Lnicoid/network238/okio/Path;",
        "removeBase",
        "base",
        "keepPath",
        "",
        "path",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$keepPath(Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;Lnicoid/network238/okio/Path;)Z
    .registers 2

    .line 204
    invoke-direct {p0, p1}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->keepPath(Lnicoid/network238/okio/Path;)Z

    move-result p0

    return p0
.end method

.method private final keepPath(Lnicoid/network238/okio/Path;)Z
    .registers 4

    .line 212
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->name()Ljava/lang/String;

    move-result-object p1

    const-string v0, ".class"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    xor-int/2addr p1, v1

    return p1
.end method


# virtual methods
.method public final getROOT()Lnicoid/network238/okio/Path;
    .registers 2

    .line 205
    # getter for: Lnicoid/network238/okio/internal/ResourceFileSystem;->ROOT:Lnicoid/network238/okio/Path;
    invoke-static {}, Lnicoid/network238/okio/internal/ResourceFileSystem;->access$getROOT$cp()Lnicoid/network238/okio/Path;

    move-result-object v0

    return-object v0
.end method

.method public final removeBase(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 208
    invoke-virtual {p2}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object p2

    .line 209
    invoke-virtual {p0}, Lnicoid/network238/okio/internal/ResourceFileSystem$Companion;->getROOT()Lnicoid/network238/okio/Path;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/16 v2, 0x5c

    const/16 v3, 0x2f

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;CCZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object p1

    return-object p1
.end method
