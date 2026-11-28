.class public final synthetic Lnicoid/network238/okio/internal/ResourceFileSystem$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okio/internal/ResourceFileSystem;"
    method = "roots_delegate$lambda$0"
    proto = "(Lnicoid/network238/okio/internal/ResourceFileSystem;)Ljava/util/List;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okio/internal/ResourceFileSystem;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okio/internal/ResourceFileSystem;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/ResourceFileSystem$1;->f$0:Lnicoid/network238/okio/internal/ResourceFileSystem;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ResourceFileSystem$1;->f$0:Lnicoid/network238/okio/internal/ResourceFileSystem;

    invoke-static {v0}, Lnicoid/network238/okio/internal/ResourceFileSystem;->roots_delegate$lambda$0(Lnicoid/network238/okio/internal/ResourceFileSystem;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
