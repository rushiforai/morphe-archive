.class public final synthetic Lcnb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqnb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfnb;


# direct methods
.method public synthetic constructor <init>(Lfnb;B)V
    .registers 3

    iput-byte p2, p0, Lcnb;->a:B

    iput-object p1, p0, Lcnb;->b:Lfnb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lcnb;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcnb;->b:Lfnb;

    packed-switch v0, :pswitch_data_56

    move-object v0, p0

    check-cast v0, Lnnb;

    iget-object v2, v0, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    if-nez v2, :cond_34

    iget-object v2, v0, Lnnb;->m:Lpnb;

    const/16 v3, 0xa

    iput v3, v2, Lpnb;->l:I

    iget-object v2, v0, Lnnb;->i:Ljava/net/HttpURLConnection;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/net/URLConnection;->setDoOutput(Z)V

    iget-object v2, v0, Lnnb;->i:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/URLConnection;->connect()V

    iget-object v2, v0, Lnnb;->m:Lpnb;

    const/16 v3, 0xc

    iput v3, v2, Lpnb;->l:I

    iget-object v2, v0, Lnnb;->i:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iput-object v2, v0, Lnnb;->l:Ljava/io/OutputStream;

    invoke-static {v2}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v2

    iput-object v2, v0, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    :cond_34
    iget-object v0, p0, Lfnb;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    new-instance v0, Lcnb;

    invoke-direct {v0, p0, v1}, Lcnb;-><init>(Lfnb;B)V

    const-string v1, "readFromProvider"

    invoke-virtual {p0, v0, v1}, Lfnb;->b(Lqnb;Ljava/lang/String;)V

    return-void

    :pswitch_44
    iget-object v0, p0, Lfnb;->d:Ltom;

    iget-object v2, p0, Lfnb;->e:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p0, v2}, Ltom;->read(Lorg/chromium/net/UploadDataSink;Ljava/nio/ByteBuffer;)V

    iget-object v0, p0, Lfnb;->c:Lonb;

    new-instance v2, Ldnb;

    invoke-direct {v2, p0, v1}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lonb;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_44
    .end packed-switch
.end method
