.class public Lorg/apache/commons/sudcompress/archivers/zip/Zip64RequiredException;
.super Ljava/util/zip/ZipException;
.source "SourceFile"


# static fields
.field static final ARCHIVE_TOO_BIG_MESSAGE:Ljava/lang/String; = "Archive\'s size exceeds the limit of 4GByte."

.field static final NUMBER_OF_THE_DISK_OF_CENTRAL_DIRECTORY_TOO_BIG_MESSAGE:Ljava/lang/String; = "Number of the disk with the start of Central Directory exceeds the limmit of 65535."

.field static final NUMBER_OF_THIS_DISK_TOO_BIG_MESSAGE:Ljava/lang/String; = "Number of the disk of End Of Central Directory exceeds the limmit of 65535."

.field static final SIZE_OF_CENTRAL_DIRECTORY_TOO_BIG_MESSAGE:Ljava/lang/String; = "The size of the entire central directory exceeds the limit of 4GByte."

.field static final TOO_MANY_ENTRIES_MESSAGE:Ljava/lang/String; = "Archive contains more than 65535 entries."

.field static final TOO_MANY_ENTRIES_ON_THIS_DISK_MESSAGE:Ljava/lang/String; = "Number of entries on this disk exceeds the limmit of 65535."

.field private static final serialVersionUID:J = 0x132ddd9L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getEntryTooBigMessage(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "\'s size exceeds the limit of 4GByte."

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
