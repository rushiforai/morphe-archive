.class Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/image/DiskLruCache$Editor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FaultHidingOutputStream"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Ljava/io/OutputStream;Lcom/cosmos/photon/push/image/DiskLruCache$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;-><init>(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->access$2302(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public flush()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->access$2302(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public write(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-static {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->access$2302(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public write([BII)V
    .locals 1

    .line 14
    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 15
    :catch_0
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->access$2302(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)Z

    return-void
.end method
