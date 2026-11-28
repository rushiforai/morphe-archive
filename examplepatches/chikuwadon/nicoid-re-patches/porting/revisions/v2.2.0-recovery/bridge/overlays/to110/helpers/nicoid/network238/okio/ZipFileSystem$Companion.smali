.class final Lnicoid/network238/okio/ZipFileSystem$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/ZipFileSystem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0082\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lnicoid/network238/okio/ZipFileSystem$Companion;",
        "",
        "<init>",
        "()V",
        "ROOT",
        "Lnicoid/network238/okio/Path;",
        "getROOT",
        "()Lnicoid/network238/okio/Path;",
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

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/ZipFileSystem$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getROOT()Lnicoid/network238/okio/Path;
    .registers 2

    .line 138
    # getter for: Lnicoid/network238/okio/ZipFileSystem;->ROOT:Lnicoid/network238/okio/Path;
    invoke-static {}, Lnicoid/network238/okio/ZipFileSystem;->access$getROOT$cp()Lnicoid/network238/okio/Path;

    move-result-object v0

    return-object v0
.end method
