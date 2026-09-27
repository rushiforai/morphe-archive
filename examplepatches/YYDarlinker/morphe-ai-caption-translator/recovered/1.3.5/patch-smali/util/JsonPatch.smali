.class final Lutil/JsonPatch;
.super Ljava/lang/Object;
.source "PatchListGenerator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/JsonPatch$Option;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\u0018BW\u0012\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0008\u0012\u0010\u0008\u0002\u0010\t\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u0008\u0012\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u0008\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0010R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0017\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u0019\u0010\t\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0015R\u0017\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0015\u00a8\u0006\u0019"
    }
    d2 = {
        "Lutil/JsonPatch;",
        "",
        "name",
        "",
        "description",
        "default",
        "",
        "dependencies",
        "",
        "compatiblePackages",
        "Lutil/JsonCompatibility;",
        "options",
        "Lutil/JsonPatch$Option;",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V",
        "getName",
        "()Ljava/lang/String;",
        "getDescription",
        "getDefault",
        "()Z",
        "getDependencies",
        "()Ljava/util/List;",
        "getCompatiblePackages",
        "getOptions",
        "Option",
        "app.yydarlinker:patches"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final compatiblePackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lutil/JsonCompatibility;",
            ">;"
        }
    .end annotation
.end field

.field private final default:Z

.field private final dependencies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final description:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final options:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lutil/JsonPatch$Option;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Lutil/JsonCompatibility;",
            ">;",
            "Ljava/util/List<",
            "Lutil/JsonPatch$Option;",
            ">;)V"
        }
    .end annotation

    const-string v0, "dependencies"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Lutil/JsonPatch;->name:Ljava/lang/String;

    .line 105
    iput-object p2, p0, Lutil/JsonPatch;->description:Ljava/lang/String;

    .line 106
    iput-boolean p3, p0, Lutil/JsonPatch;->default:Z

    .line 107
    iput-object p4, p0, Lutil/JsonPatch;->dependencies:Ljava/util/List;

    .line 109
    iput-object p5, p0, Lutil/JsonPatch;->compatiblePackages:Ljava/util/List;

    .line 110
    iput-object p6, p0, Lutil/JsonPatch;->options:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 10

    and-int/lit8 p8, p7, 0x1

    const/4 v0, 0x0

    if-eqz p8, :cond_6

    move-object p1, v0

    :cond_6
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_b

    move-object p2, v0

    :cond_b
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_10

    const/4 p3, 0x1

    :cond_10
    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_15

    move-object p5, v0

    .line 103
    :cond_15
    invoke-direct/range {p0 .. p6}, Lutil/JsonPatch;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final getCompatiblePackages()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lutil/JsonCompatibility;",
            ">;"
        }
    .end annotation

    .line 109
    iget-object p0, p0, Lutil/JsonPatch;->compatiblePackages:Ljava/util/List;

    return-object p0
.end method

.method public final getDefault()Z
    .registers 1

    .line 106
    iget-boolean p0, p0, Lutil/JsonPatch;->default:Z

    return p0
.end method

.method public final getDependencies()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 107
    iget-object p0, p0, Lutil/JsonPatch;->dependencies:Ljava/util/List;

    return-object p0
.end method

.method public final getDescription()Ljava/lang/String;
    .registers 1

    .line 105
    iget-object p0, p0, Lutil/JsonPatch;->description:Ljava/lang/String;

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    .line 104
    iget-object p0, p0, Lutil/JsonPatch;->name:Ljava/lang/String;

    return-object p0
.end method

.method public final getOptions()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lutil/JsonPatch$Option;",
            ">;"
        }
    .end annotation

    .line 110
    iget-object p0, p0, Lutil/JsonPatch;->options:Ljava/util/List;

    return-object p0
.end method
