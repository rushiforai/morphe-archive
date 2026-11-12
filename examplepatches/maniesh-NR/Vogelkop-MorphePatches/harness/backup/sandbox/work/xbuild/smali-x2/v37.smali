.class public final Lv37;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(Lumi;B)V
    .registers 3

    iput-byte p2, p0, Lv37;->c:B

    const/16 p2, 0x1b

    invoke-direct {p0, p1, p2}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void
.end method


# virtual methods
.method public final b0()Lz37;
    .registers 5

    iget-byte p0, p0, Lv37;->c:B

    packed-switch p0, :pswitch_data_c2

    const-string p0, "/proc/"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    :try_start_b
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "/maps"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object p0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    new-instance p0, Ljava/io/BufferedReader;

    const/16 v1, 0x2000

    invoke-direct {p0, v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_34} :catch_67

    :cond_34
    :try_start_34
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5c

    const/16 v1, 0x20

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x5

    if-le v1, v3, :cond_34

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    const-string v1, "frida-agent"

    invoke-static {v0, v1, v2}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object v0, Lz37;->b:Lz37;
    :try_end_58
    .catchall {:try_start_34 .. :try_end_58} :catchall_60

    :try_start_58
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    goto :goto_69

    :cond_5c
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_5f} :catch_67

    goto :goto_67

    :catchall_60
    move-exception v0

    :try_start_61
    throw v0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_62

    :catchall_62
    move-exception v1

    :try_start_63
    invoke-static {p0, v0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_67} :catch_67

    :catch_67
    :goto_67
    sget-object v0, Lz37;->a:Lz37;

    :goto_69
    return-object v0

    :pswitch_6a
    const-string p0, "/dev/socket/qemud"

    const-string v0, "/dev/qemu_pipe"

    filled-new-array {p0, v0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_7a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_92

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_7a

    goto :goto_bb

    :cond_92
    const-string p0, "/dev/socket/baseband_genyd"

    const-string v0, "/dev/com.genymotion.superuser.daemon"

    const-string v1, "/dev/socket/genyd"

    filled-new-array {v1, p0, v0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_a4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_be

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_a4

    :goto_bb
    sget-object p0, Lz37;->b:Lz37;

    goto :goto_c0

    :cond_be
    sget-object p0, Lz37;->a:Lz37;

    :goto_c0
    return-object p0

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_6a
    .end packed-switch
.end method

.method public final y(Lkotlin/jvm/functions/Function1;)V
    .registers 4

    iget-byte v0, p0, Lv37;->c:B

    packed-switch v0, :pswitch_data_5c

    invoke-super {p0, p1}, Ln1;->y(Lkotlin/jvm/functions/Function1;)V

    return-void

    :pswitch_9
    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v1, "generic"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "sdk"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    const-string v1, "goldfish"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "ranchu"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "vbox86"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    invoke-super {p0, p1}, Ln1;->y(Lkotlin/jvm/functions/Function1;)V

    goto :goto_5a

    :cond_55
    sget-object p0, Lz37;->b:Lz37;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_5a
    return-void

    nop

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
