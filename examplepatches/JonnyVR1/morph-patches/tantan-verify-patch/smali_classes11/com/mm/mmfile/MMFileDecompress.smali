.class public Lcom/mm/mmfile/MMFileDecompress;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native decodeFile(Ljava/lang/String;Lcom/mm/mmfile/core/IByteDecompress;)V
.end method

.method public static decodeFile(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/mm/mmfile/MMFileDecompress;->decodeFile(Ljava/lang/String;Lcom/mm/mmfile/core/IByteDecompress;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->flush()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static native decodeFileItem(Ljava/lang/String;Lcom/mm/mmfile/core/IObjectDecompress;)V
.end method
