.class public final Lnicoid/network238/okio/SystemFileSystem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\"\u001c\u0010\u0000\u001a\u00020\u0001*\u00020\u00028\u00c6\u0002\u00a2\u0006\u000c\u0012\u0004\u0008\u0003\u0010\u0004\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "SYSTEM",
        "Lnicoid/network238/okio/FileSystem;",
        "Lnicoid/network238/okio/FileSystem$Companion;",
        "getSYSTEM$annotations",
        "(Lnicoid/network238/okio/FileSystem$Companion;)V",
        "getSYSTEM",
        "(Lnicoid/network238/okio/FileSystem$Companion;)Lnicoid/network238/okio/FileSystem;",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic getSYSTEM(Lnicoid/network238/okio/FileSystem$Companion;)Lnicoid/network238/okio/FileSystem;
    .registers 3
    .param p0, "$this$SYSTEM"    # Lnicoid/network238/okio/FileSystem$Companion;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 13
    .local v0, "$i$f$getSYSTEM":I
    sget-object v1, Lnicoid/network238/okio/FileSystem;->SYSTEM:Lnicoid/network238/okio/FileSystem;

    return-object v1
.end method

.method public static synthetic getSYSTEM$annotations(Lnicoid/network238/okio/FileSystem$Companion;)V
    .registers 1

    return-void
.end method
