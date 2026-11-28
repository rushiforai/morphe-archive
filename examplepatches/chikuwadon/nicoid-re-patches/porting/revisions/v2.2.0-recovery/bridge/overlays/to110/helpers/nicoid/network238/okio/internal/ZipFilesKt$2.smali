.class public final synthetic Lnicoid/network238/okio/internal/ZipFilesKt$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okio/internal/ZipFilesKt;"
    method = "readOrSkipLocalHeader$lambda$0"
    proto = "(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okio/BufferedSource;

.field public final synthetic f$1:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic f$2:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic f$3:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$0:Lnicoid/network238/okio/BufferedSource;

    iput-object p2, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$1:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iput-object p3, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$2:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iput-object p4, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$3:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    .line 0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$0:Lnicoid/network238/okio/BufferedSource;

    iget-object v1, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$1:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iget-object v2, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$2:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iget-object v3, p0, Lnicoid/network238/okio/internal/ZipFilesKt$2;->f$3:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okio/internal/ZipFilesKt;->readOrSkipLocalHeader$lambda$0(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;

    move-result-object p1

    return-object p1
.end method
