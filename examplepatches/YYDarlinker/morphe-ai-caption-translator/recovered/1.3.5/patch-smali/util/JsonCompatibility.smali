.class final Lutil/JsonCompatibility;
.super Ljava/lang/Object;
.source "PatchListGenerator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/JsonCompatibility$Target;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\"\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\u0019BU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\u000e\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\t\u0012\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0010R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0010R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0010R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0010R\u0019\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0017\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001a"
    }
    d2 = {
        "Lutil/JsonCompatibility;",
        "",
        "packageName",
        "",
        "name",
        "description",
        "apkFileType",
        "appIconColor",
        "signatures",
        "",
        "targets",
        "",
        "Lutil/JsonCompatibility$Target;",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/util/List;)V",
        "getPackageName",
        "()Ljava/lang/String;",
        "getName",
        "getDescription",
        "getApkFileType",
        "getAppIconColor",
        "getSignatures",
        "()Ljava/util/Set;",
        "getTargets",
        "()Ljava/util/List;",
        "Target",
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
.field private final apkFileType:Ljava/lang/String;

.field private final appIconColor:Ljava/lang/String;

.field private final description:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final packageName:Ljava/lang/String;

.field private final signatures:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final targets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lutil/JsonCompatibility$Target;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Lutil/JsonCompatibility$Target;",
            ">;)V"
        }
    .end annotation

    const-string v0, "packageName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targets"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lutil/JsonCompatibility;->packageName:Ljava/lang/String;

    .line 129
    iput-object p2, p0, Lutil/JsonCompatibility;->name:Ljava/lang/String;

    .line 131
    iput-object p3, p0, Lutil/JsonCompatibility;->description:Ljava/lang/String;

    .line 133
    iput-object p4, p0, Lutil/JsonCompatibility;->apkFileType:Ljava/lang/String;

    .line 135
    iput-object p5, p0, Lutil/JsonCompatibility;->appIconColor:Ljava/lang/String;

    .line 137
    iput-object p6, p0, Lutil/JsonCompatibility;->signatures:Ljava/util/Set;

    .line 138
    iput-object p7, p0, Lutil/JsonCompatibility;->targets:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final getApkFileType()Ljava/lang/String;
    .registers 1

    .line 133
    iget-object p0, p0, Lutil/JsonCompatibility;->apkFileType:Ljava/lang/String;

    return-object p0
.end method

.method public final getAppIconColor()Ljava/lang/String;
    .registers 1

    .line 135
    iget-object p0, p0, Lutil/JsonCompatibility;->appIconColor:Ljava/lang/String;

    return-object p0
.end method

.method public final getDescription()Ljava/lang/String;
    .registers 1

    .line 131
    iget-object p0, p0, Lutil/JsonCompatibility;->description:Ljava/lang/String;

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    .line 129
    iget-object p0, p0, Lutil/JsonCompatibility;->name:Ljava/lang/String;

    return-object p0
.end method

.method public final getPackageName()Ljava/lang/String;
    .registers 1

    .line 127
    iget-object p0, p0, Lutil/JsonCompatibility;->packageName:Ljava/lang/String;

    return-object p0
.end method

.method public final getSignatures()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 137
    iget-object p0, p0, Lutil/JsonCompatibility;->signatures:Ljava/util/Set;

    return-object p0
.end method

.method public final getTargets()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lutil/JsonCompatibility$Target;",
            ">;"
        }
    .end annotation

    .line 138
    iget-object p0, p0, Lutil/JsonCompatibility;->targets:Ljava/util/List;

    return-object p0
.end method
