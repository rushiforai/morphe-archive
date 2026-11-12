.class public final synthetic Liln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/util/concurrent/atomic/AtomicBoolean;B)V
    .registers 4

    iput-byte p3, p0, Liln;->a:B

    iput-object p1, p0, Liln;->b:Ljava/io/File;

    iput-object p2, p0, Liln;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Liln;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Liln;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object p0, p0, Liln;->b:Ljava/io/File;

    packed-switch v0, :pswitch_data_5c

    check-cast p1, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    check-cast p1, Lpzh;

    iget-object v0, p1, Lpzh;->g:Lvzh;

    :try_start_19
    iget-boolean p1, p1, Lpzh;->q:Z
    :try_end_1b
    .catchall {:try_start_19 .. :try_end_1b} :catchall_50

    if-eqz p1, :cond_42

    :try_start_1d
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_22} :catch_3b
    .catchall {:try_start_1d .. :try_end_22} :catchall_50

    :try_start_22
    invoke-virtual {v0}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-static {v3, p1}, Ls29;->a(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_2d
    .catchall {:try_start_22 .. :try_end_2d} :catchall_31

    :try_start_2d
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_3b
    .catchall {:try_start_2d .. :try_end_30} :catchall_50

    goto :goto_48

    :catchall_31
    move-exception v3

    :try_start_32
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_36

    goto :goto_3a

    :catchall_36
    move-exception p1

    :try_start_37
    invoke-virtual {v3, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3a
    throw v3
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3b} :catch_3b
    .catchall {:try_start_37 .. :try_end_3b} :catchall_50

    :catch_3b
    :try_start_3b
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_48

    :cond_42
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_48
    .catchall {:try_start_3b .. :try_end_48} :catchall_50

    :goto_48
    if-eqz v0, :cond_4d

    invoke-virtual {v0}, Lvzh;->close()V

    :cond_4d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_50
    move-exception p0

    if-eqz v0, :cond_5b

    :try_start_53
    invoke-virtual {v0}, Lvzh;->close()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_57

    goto :goto_5b

    :catchall_57
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5b
    :goto_5b
    throw p0

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
