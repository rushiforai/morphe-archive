.class public final Lutil/JsonCompatibility$Target;
.super Ljava/lang/Object;
.source "PatchListGenerator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lutil/JsonCompatibility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Target"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000e\u0018\u00002\u00020\u0001BC\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0014\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u001f\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0011R\u0015\u0010\t\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\n\n\u0002\u0010\u0014\u001a\u0004\u0008\u0012\u0010\u0013R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u000e\u00a8\u0006\u0016"
    }
    d2 = {
        "Lutil/JsonCompatibility$Target;",
        "",
        "version",
        "",
        "versionCodes",
        "",
        "",
        "isExperimental",
        "",
        "minSdk",
        "description",
        "<init>",
        "(Ljava/lang/String;Ljava/util/Map;ZLjava/lang/Integer;Ljava/lang/String;)V",
        "getVersion",
        "()Ljava/lang/String;",
        "getVersionCodes",
        "()Ljava/util/Map;",
        "()Z",
        "getMinSdk",
        "()Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "getDescription",
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
.field private final description:Ljava/lang/String;

.field private final isExperimental:Z

.field private final minSdk:Ljava/lang/Integer;

.field private final version:Ljava/lang/String;

.field private final versionCodes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;ZLjava/lang/Integer;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;Z",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object p1, p0, Lutil/JsonCompatibility$Target;->version:Ljava/lang/String;

    .line 142
    iput-object p2, p0, Lutil/JsonCompatibility$Target;->versionCodes:Ljava/util/Map;

    .line 143
    iput-boolean p3, p0, Lutil/JsonCompatibility$Target;->isExperimental:Z

    .line 145
    iput-object p4, p0, Lutil/JsonCompatibility$Target;->minSdk:Ljava/lang/Integer;

    .line 147
    iput-object p5, p0, Lutil/JsonCompatibility$Target;->description:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final getDescription()Ljava/lang/String;
    .registers 1

    .line 147
    iget-object p0, p0, Lutil/JsonCompatibility$Target;->description:Ljava/lang/String;

    return-object p0
.end method

.method public final getMinSdk()Ljava/lang/Integer;
    .registers 1

    .line 145
    iget-object p0, p0, Lutil/JsonCompatibility$Target;->minSdk:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getVersion()Ljava/lang/String;
    .registers 1

    .line 141
    iget-object p0, p0, Lutil/JsonCompatibility$Target;->version:Ljava/lang/String;

    return-object p0
.end method

.method public final getVersionCodes()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 142
    iget-object p0, p0, Lutil/JsonCompatibility$Target;->versionCodes:Ljava/util/Map;

    return-object p0
.end method

.method public final isExperimental()Z
    .registers 1

    .line 143
    iget-boolean p0, p0, Lutil/JsonCompatibility$Target;->isExperimental:Z

    return p0
.end method
