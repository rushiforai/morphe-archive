.class public final Lkotlin/io/path/LinkFollowing;
.super Ljava/lang/Object;
.source "PathTreeWalk.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u000e\u001a\u00020\u000fH\u0086\u0080\u0004\u00a2\u0006\u0002\u0010\u0010J\u0018\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n2\u0006\u0010\u000e\u001a\u00020\u000fH\u0086\u0080\u0004R\u0017\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0017\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0015\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lkotlin/io/path/LinkFollowing;",
        "",
        "<init>",
        "()V",
        "nofollowLinkOption",
        "",
        "Ljava/nio/file/LinkOption;",
        "[Ljava/nio/file/LinkOption;",
        "followLinkOption",
        "nofollowVisitOption",
        "",
        "Ljava/nio/file/FileVisitOption;",
        "followVisitOption",
        "toLinkOptions",
        "followLinks",
        "",
        "(Z)[Ljava/nio/file/LinkOption;",
        "toVisitOptions",
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
.field public static final INSTANCE:Lkotlin/io/path/LinkFollowing;

.field private static final followLinkOption:[Ljava/nio/file/LinkOption;

.field private static final followVisitOption:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/nio/file/FileVisitOption;",
            ">;"
        }
    .end annotation
.end field

.field private static final nofollowLinkOption:[Ljava/nio/file/LinkOption;

.field private static final nofollowVisitOption:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/nio/file/FileVisitOption;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/io/path/LinkFollowing;

    invoke-direct {v0}, Lkotlin/io/path/LinkFollowing;-><init>()V

    sput-object v0, Lkotlin/io/path/LinkFollowing;->INSTANCE:Lkotlin/io/path/LinkFollowing;

    const/4 v0, 0x1

    .line 144
    new-array v0, v0, [Ljava/nio/file/LinkOption;

    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/LinkOption;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lkotlin/io/path/LinkFollowing;->nofollowLinkOption:[Ljava/nio/file/LinkOption;

    .line 145
    new-array v0, v2, [Ljava/nio/file/LinkOption;

    sput-object v0, Lkotlin/io/path/LinkFollowing;->followLinkOption:[Ljava/nio/file/LinkOption;

    .line 147
    invoke-static {}, Lkotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lkotlin/io/path/LinkFollowing;->nofollowVisitOption:Ljava/util/Set;

    .line 148
    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/FileVisitOption;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lkotlin/io/path/LinkFollowing;->followVisitOption:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final toLinkOptions(Z)[Ljava/nio/file/LinkOption;
    .registers 2

    if-eqz p1, :cond_5

    .line 151
    sget-object p0, Lkotlin/io/path/LinkFollowing;->followLinkOption:[Ljava/nio/file/LinkOption;

    return-object p0

    :cond_5
    sget-object p0, Lkotlin/io/path/LinkFollowing;->nofollowLinkOption:[Ljava/nio/file/LinkOption;

    return-object p0
.end method

.method public final toVisitOptions(Z)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Set<",
            "Ljava/nio/file/FileVisitOption;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_5

    .line 154
    sget-object p0, Lkotlin/io/path/LinkFollowing;->followVisitOption:Ljava/util/Set;

    return-object p0

    :cond_5
    sget-object p0, Lkotlin/io/path/LinkFollowing;->nofollowVisitOption:Ljava/util/Set;

    return-object p0
.end method
