.class public final synthetic Lcom/google/common/io/TempFileCreator$TempFileAndChannel$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/io/TempFileCreator$TempFileAndChannel;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel$0;->f$0:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/io/TempFileCreator$TempFileAndChannel$0;->f$0:Lcom/google/common/io/TempFileCreator$TempFileAndChannel;

    invoke-virtual {p0}, Lcom/google/common/io/TempFileCreator$TempFileAndChannel;->lambda$close$0$com-google-common-io-TempFileCreator$TempFileAndChannel()V

    return-void
.end method
