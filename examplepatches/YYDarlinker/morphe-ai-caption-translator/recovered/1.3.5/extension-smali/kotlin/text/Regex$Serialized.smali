.class final Lkotlin/text/Regex$Serialized;
.super Ljava/lang/Object;
.source "Regex.kt"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/text/Regex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Serialized"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/text/Regex$Serialized$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u0000\n\u0002\u0008\u0002\u0008\u0002\u0018\u0000 \u000f2\u00060\u0001j\u0002`\u0002:\u0001\u000fB\u0019\u0008F\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\n\u0010\r\u001a\u00020\u000eH\u0082\u0080\u0004R\u0015\u0010\u0003\u001a\u00020\u0004X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u0005\u001a\u00020\u0006X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0010"
    }
    d2 = {
        "Lkotlin/text/Regex$Serialized;",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "pattern",
        "",
        "flags",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "getPattern",
        "()Ljava/lang/String;",
        "getFlags",
        "()I",
        "readResolve",
        "",
        "Companion",
        "kotlin-stdlib"
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
.field public static final Companion:Lkotlin/text/Regex$Serialized$Companion;

.field private static final serialVersionUID:J


# instance fields
.field private final flags:I

.field private final pattern:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/text/Regex$Serialized$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/text/Regex$Serialized$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/text/Regex$Serialized;->Companion:Lkotlin/text/Regex$Serialized$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4

    const-string v0, "pattern"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/text/Regex$Serialized;->pattern:Ljava/lang/String;

    iput p2, p0, Lkotlin/text/Regex$Serialized;->flags:I

    return-void
.end method

.method private final readResolve()Ljava/lang/Object;
    .registers 3

    .line 336
    new-instance v0, Lkotlin/text/Regex;

    iget-object v1, p0, Lkotlin/text/Regex$Serialized;->pattern:Ljava/lang/String;

    iget p0, p0, Lkotlin/text/Regex$Serialized;->flags:I

    invoke-static {v1, p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p0

    const-string v1, "compile(...)"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, p0}, Lkotlin/text/Regex;-><init>(Ljava/util/regex/Pattern;)V

    return-object v0
.end method


# virtual methods
.method public final getFlags()I
    .registers 1

    .line 331
    iget p0, p0, Lkotlin/text/Regex$Serialized;->flags:I

    return p0
.end method

.method public final getPattern()Ljava/lang/String;
    .registers 1

    .line 331
    iget-object p0, p0, Lkotlin/text/Regex$Serialized;->pattern:Ljava/lang/String;

    return-object p0
.end method
