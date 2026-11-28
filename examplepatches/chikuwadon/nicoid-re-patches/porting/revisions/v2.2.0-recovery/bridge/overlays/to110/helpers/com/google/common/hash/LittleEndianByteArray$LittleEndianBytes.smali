.class interface abstract Lcom/google/common/hash/LittleEndianByteArray$LittleEndianBytes;
.super Ljava/lang/Object;
.source "LittleEndianByteArray.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/LittleEndianByteArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "LittleEndianBytes"
.end annotation


# virtual methods
.method public abstract getLongLittleEndian([BI)J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "offset"
        }
    .end annotation
.end method

.method public abstract putLongLittleEndian([BIJ)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "offset",
            "value"
        }
    .end annotation
.end method

.method public abstract usesFastPath()Z
.end method
