.class public final synthetic Lwx1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;Lx12;Ljava/io/File;)V
    .registers 4

    const/4 p1, 0x3

    iput-byte p1, p0, Lwx1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lwx1;->b:Ljava/io/File;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/File;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lwx1;->a:B

    iput-object p1, p0, Lwx1;->b:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lwx1;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lwx1;->b:Ljava/io/File;

    packed-switch v0, :pswitch_data_88

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    :goto_f
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_14
    check-cast p1, Lkotlin/Unit;

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    goto :goto_f

    :pswitch_1b
    check-cast p1, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2a

    :cond_29
    const/4 v2, 0x0

    :cond_2a
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2f
    check-cast p1, Lpzh;

    iget-boolean v0, p1, Lpzh;->q:Z

    if-eqz v0, :cond_4a

    iget-object p1, p1, Lpzh;->g:Lvzh;

    invoke-virtual {p1}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object p1

    :try_start_3b
    invoke-static {p1, v2, p0}, Lx12;->a(Ljava/io/InputStream;ILjava/io/File;)Lt12;

    move-result-object p0
    :try_end_3f
    .catchall {:try_start_3b .. :try_end_3f} :catchall_43

    invoke-static {p1, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_4f

    :catchall_43
    move-exception p0

    :try_start_44
    throw p0
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_45

    :catchall_45
    move-exception v0

    invoke-static {p1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_4a
    invoke-virtual {p1}, Lpzh;->close()V

    sget-object p0, Lt12;->c:Lt12;

    :goto_4f
    return-object p0

    :pswitch_50
    check-cast p1, Lkotlin/Unit;

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    goto :goto_f

    :pswitch_57
    check-cast p1, Lkotlin/Unit;

    :try_start_59
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_5c
    .catchall {:try_start_59 .. :try_end_5c} :catchall_5c

    :catchall_5c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_5f
    check-cast p1, Lkotlin/Unit;

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_82

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_79

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_7d

    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_87

    :cond_79
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    :cond_7d
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_87

    :cond_82
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_87
    return-object v1

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_5f
        :pswitch_57
        :pswitch_50
        :pswitch_2f
        :pswitch_1b
        :pswitch_14
    .end packed-switch
.end method
