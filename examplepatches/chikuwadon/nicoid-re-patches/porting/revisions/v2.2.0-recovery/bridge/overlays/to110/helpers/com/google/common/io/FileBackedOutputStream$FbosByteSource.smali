.class final Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;
.super Lcom/google/common/io/ByteSource;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/FileBackedOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FbosByteSource"
.end annotation


# instance fields
.field final state:Lcom/google/common/io/FileBackedOutputStream$State;


# direct methods
.method constructor <init>(Lcom/google/common/io/FileBackedOutputStream$State;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 168
    invoke-direct {p0}, Lcom/google/common/io/ByteSource;-><init>()V

    .line 169
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    return-void
.end method


# virtual methods
.method public openStream()Ljava/io/InputStream;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$State;->openInputStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method
