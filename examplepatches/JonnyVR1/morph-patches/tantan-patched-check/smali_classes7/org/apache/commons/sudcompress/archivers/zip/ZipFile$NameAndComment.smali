.class final Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NameAndComment"
.end annotation


# instance fields
.field private final comment:[B

.field private final name:[B


# direct methods
.method private constructor <init>([B[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;->name:[B

    .line 5
    .line 6
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;->comment:[B

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>([B[BLl/tpq0;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;-><init>([B[B)V

    return-void
.end method

.method public static bridge synthetic a(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;->comment:[B

    return-object p0
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$NameAndComment;->name:[B

    return-object p0
.end method
