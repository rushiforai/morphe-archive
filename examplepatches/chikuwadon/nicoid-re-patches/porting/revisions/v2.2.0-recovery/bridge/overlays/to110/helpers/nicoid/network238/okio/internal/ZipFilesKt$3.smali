.class public final synthetic Lnicoid/network238/okio/internal/ZipFilesKt$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okio/internal/ZipFilesKt;"
    method = "readCentralDirectoryZipEntry$lambda$1"
    proto = "(Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;JLnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic f$1:J

.field public final synthetic f$2:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

.field public final synthetic f$3:Lnicoid/network238/okio/BufferedSource;

.field public final synthetic f$4:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

.field public final synthetic f$5:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

.field public final synthetic f$6:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic f$7:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic f$8:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;JLnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V
    .registers 11

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$0:Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;

    iput-wide p2, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$1:J

    iput-object p4, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$2:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    iput-object p5, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$3:Lnicoid/network238/okio/BufferedSource;

    iput-object p6, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$4:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    iput-object p7, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$5:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    iput-object p8, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$6:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iput-object p9, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$7:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iput-object p10, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$8:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    .line 0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$0:Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;

    iget-wide v1, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$1:J

    iget-object v3, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$2:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    iget-object v4, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$3:Lnicoid/network238/okio/BufferedSource;

    iget-object v5, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$4:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    iget-object v6, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$5:Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;

    iget-object v7, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$6:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iget-object v8, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$7:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    iget-object v9, p0, Lnicoid/network238/okio/internal/ZipFilesKt$3;->f$8:Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static/range {v0 .. v12}, Lnicoid/network238/okio/internal/ZipFilesKt;->readCentralDirectoryZipEntry$lambda$1(Lnicoid/network238/kotlin/jvm/internal/Ref$BooleanRef;JLnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$LongRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;IJ)Lnicoid/network238/kotlin/Unit;

    move-result-object p1

    return-object p1
.end method
