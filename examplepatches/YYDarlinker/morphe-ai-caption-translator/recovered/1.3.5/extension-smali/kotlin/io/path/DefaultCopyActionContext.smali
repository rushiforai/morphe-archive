.class final Lkotlin/io/path/DefaultCopyActionContext;
.super Ljava/lang/Object;
.source "PathRecursiveFunctions.kt"

# interfaces
.implements Lkotlin/io/path/CopyActionContext;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\u0008\u00c3\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001e\u0010\u0004\u001a\u00020\u0005*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\tH\u0096\u0080\u0004\u00ca\u0001\u0002\u0008\u000b\u00a8\u0006\n"
    }
    d2 = {
        "Lkotlin/io/path/DefaultCopyActionContext;",
        "Lkotlin/io/path/CopyActionContext;",
        "<init>",
        "()V",
        "copyToIgnoringExistingDirectory",
        "Lkotlin/io/path/CopyActionResult;",
        "Ljava/nio/file/Path;",
        "target",
        "followLinks",
        "",
        "kotlin-stdlib-jdk7",
        "Lkotlin/io/path/ExperimentalPathApi;"
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
.field public static final INSTANCE:Lkotlin/io/path/DefaultCopyActionContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/io/path/DefaultCopyActionContext;

    invoke-direct {v0}, Lkotlin/io/path/DefaultCopyActionContext;-><init>()V

    sput-object v0, Lkotlin/io/path/DefaultCopyActionContext;->INSTANCE:Lkotlin/io/path/DefaultCopyActionContext;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public copyToIgnoringExistingDirectory(Ljava/nio/file/Path;Ljava/nio/file/Path;Z)Lkotlin/io/path/CopyActionResult;
    .registers 7

    const-string p0, "<this>"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "target"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 263
    sget-object p0, Lkotlin/io/path/LinkFollowing;->INSTANCE:Lkotlin/io/path/LinkFollowing;

    invoke-virtual {p0, p3}, Lkotlin/io/path/LinkFollowing;->toLinkOptions(Z)[Ljava/nio/file/LinkOption;

    move-result-object p0

    .line 264
    array-length p3, p0

    invoke-static {p0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/nio/file/LinkOption;

    array-length v0, p3

    invoke-static {p3, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/nio/file/LinkOption;

    invoke-static {p1, p3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result p3

    if-eqz p3, :cond_3d

    const/4 p3, 0x1

    new-array v0, p3, [Ljava/nio/file/LinkOption;

    const/4 v1, 0x0

    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/LinkOption;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/nio/file/LinkOption;

    invoke-static {p2, p3}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result p3

    if-eqz p3, :cond_3d

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_54

    .line 267
    :cond_3d
    array-length p3, p0

    invoke-static {p0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/nio/file/CopyOption;

    array-length p3, p0

    invoke-static {p0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/nio/file/CopyOption;

    invoke-static {p1, p2, p0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    move-result-object p0

    const-string p1, "copy(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 270
    :goto_54
    sget-object p0, Lkotlin/io/path/CopyActionResult;->CONTINUE:Lkotlin/io/path/CopyActionResult;

    return-object p0
.end method
