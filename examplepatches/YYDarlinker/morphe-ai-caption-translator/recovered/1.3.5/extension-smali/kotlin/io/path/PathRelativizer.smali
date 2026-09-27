.class final Lkotlin/io/path/PathRelativizer;
.super Ljava/lang/Object;
.source "PathUtils.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u0005H\u0086\u0080\u0004R\u0017\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0007\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lkotlin/io/path/PathRelativizer;",
        "",
        "<init>",
        "()V",
        "emptyPath",
        "Ljava/nio/file/Path;",
        "kotlin.jvm.PlatformType",
        "parentPath",
        "tryRelativeTo",
        "path",
        "base",
        "kotlin-stdlib-jdk7"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lkotlin/io/path/PathRelativizer;

.field private static final emptyPath:Ljava/nio/file/Path;

.field private static final parentPath:Ljava/nio/file/Path;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/io/path/PathRelativizer;

    invoke-direct {v0}, Lkotlin/io/path/PathRelativizer;-><init>()V

    sput-object v0, Lkotlin/io/path/PathRelativizer;->INSTANCE:Lkotlin/io/path/PathRelativizer;

    const/4 v0, 0x0

    .line 150
    new-array v1, v0, [Ljava/lang/String;

    const-string v2, ""

    invoke-static {v2, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v1

    sput-object v1, Lkotlin/io/path/PathRelativizer;->emptyPath:Ljava/nio/file/Path;

    .line 151
    const-string v1, ".."

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {v1, v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v0

    sput-object v0, Lkotlin/io/path/PathRelativizer;->parentPath:Ljava/nio/file/Path;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final tryRelativeTo(Ljava/nio/file/Path;Ljava/nio/file/Path;)Ljava/nio/file/Path;
    .registers 8

    const-string p0, "path"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "base"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    invoke-static {p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$2(Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object p0

    .line 156
    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$2(Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object p1

    .line 157
    invoke-static {p0, p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Ljava/nio/file/Path;Ljava/nio/file/Path;)Ljava/nio/file/Path;

    move-result-object p2

    .line 159
    invoke-static {p0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)I

    move-result v0

    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_24
    if-ge v2, v0, :cond_47

    .line 160
    invoke-static {p0, v2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;I)Ljava/nio/file/Path;

    move-result-object v3

    sget-object v4, Lkotlin/io/path/PathRelativizer;->parentPath:Ljava/nio/file/Path;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 161
    invoke-static {p1, v2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;I)Ljava/nio/file/Path;

    move-result-object v3

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    :cond_3f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unable to compute relative path"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 164
    :cond_47
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_56

    sget-object v0, Lkotlin/io/path/PathRelativizer;->emptyPath:Ljava/nio/file/Path;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_56

    goto :goto_8b

    .line 167
    :cond_56
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 169
    invoke-static {p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)Ljava/nio/file/FileSystem;

    move-result-object p1

    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/FileSystem;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "getSeparator(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v0, v2}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8a

    .line 170
    invoke-static {p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)Ljava/nio/file/FileSystem;

    move-result-object p1

    invoke-static {p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)Ljava/nio/file/FileSystem;

    move-result-object p2

    invoke-static {p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/FileSystem;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-static {p0, p2}, Lkotlin/text/StringsKt;->dropLast(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    new-array p2, v1, [Ljava/lang/String;

    invoke-static {p1, p0, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/FileSystem;Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object p1

    goto :goto_8b

    :cond_8a
    move-object p1, p2

    .line 174
    :goto_8b
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object p1
.end method
