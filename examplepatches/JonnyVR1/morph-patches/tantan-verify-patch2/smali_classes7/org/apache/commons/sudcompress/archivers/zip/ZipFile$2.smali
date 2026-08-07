.class Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$2;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 66
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    check-cast p2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$2;->compare(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)I

    move-result p0

    return p0
.end method

.method public compare(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)I
    .locals 8

    .line 1
    const/4 p0, 0x0

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    move-object p1, v1

    .line 14
    :goto_0
    instance-of v0, p2, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    move-object v1, p2

    .line 19
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$Entry;

    .line 20
    .line 21
    :cond_2
    const/4 p2, 0x1

    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    return p2

    .line 25
    :cond_3
    const/4 v0, -0x1

    .line 26
    if-nez v1, :cond_4

    .line 27
    .line 28
    return v0

    .line 29
    :cond_4
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getDiskNumberStart()J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    sub-long/2addr v2, v4

    .line 38
    const-wide/16 v4, 0x0

    .line 39
    .line 40
    cmp-long v2, v2, v4

    .line 41
    .line 42
    if-eqz v2, :cond_6

    .line 43
    .line 44
    if-gez v2, :cond_5

    .line 45
    .line 46
    return v0

    .line 47
    :cond_5
    return p2

    .line 48
    :cond_6
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalHeaderOffset()J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalHeaderOffset()J

    .line 53
    .line 54
    .line 55
    move-result-wide v6

    .line 56
    sub-long/2addr v2, v6

    .line 57
    cmp-long p1, v2, v4

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    return p0

    .line 62
    :cond_7
    if-gez p1, :cond_8

    .line 63
    .line 64
    return v0

    .line 65
    :cond_8
    return p2
.end method
