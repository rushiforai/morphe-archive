.class public final Lwv0;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B


# direct methods
.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    iput-byte p3, p0, Lwv0;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p0, p0, Lwv0;->t:B

    packed-switch p0, :pswitch_data_72

    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/16 v0, 0xc

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_e
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/16 v0, 0xb

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_17
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/16 v0, 0xa

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_20
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/16 v0, 0x9

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_29
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/16 v0, 0x8

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_32
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x7

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_3a
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x6

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_42
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x5

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_4a
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x4

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_52
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x3

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_5a
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x2

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_62
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_6a
    new-instance p0, Lwv0;

    const/4 p1, 0x2

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lwv0;-><init>(ILmt5;B)V

    return-object p0

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_62
        :pswitch_5a
        :pswitch_52
        :pswitch_4a
        :pswitch_42
        :pswitch_3a
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lwv0;->t:B

    const/4 v1, 0x2

    packed-switch v0, :pswitch_data_ea

    check-cast p1, Lads_mobile_sdk/t70;

    check-cast p2, Lmt5;

    new-instance p0, Lwv0;

    const/16 p1, 0xc

    invoke-direct {p0, v1, p2, p1}, Lwv0;-><init>(ILmt5;B)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_18
    check-cast p1, Lads_mobile_sdk/jq0;

    check-cast p2, Lmt5;

    new-instance p0, Lwv0;

    const/16 p1, 0xb

    invoke-direct {p0, v1, p2, p1}, Lwv0;-><init>(ILmt5;B)V

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2a
    check-cast p1, Lkotlin/Unit;

    check-cast p2, Lmt5;

    new-instance p0, Lwv0;

    const/16 p1, 0xa

    invoke-direct {p0, v1, p2, p1}, Lwv0;-><init>(ILmt5;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object p1, Lpx5;->a:Lpx5;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :pswitch_3d
    check-cast p1, Ljava/lang/Throwable;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_4f
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_60
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_71
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_82
    check-cast p1, Lkotlin/Unit;

    check-cast p2, Lmt5;

    new-instance p0, Lwv0;

    const/4 p1, 0x5

    invoke-direct {p0, v1, p2, p1}, Lwv0;-><init>(ILmt5;B)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object p1, Lpx5;->a:Lpx5;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :pswitch_94
    check-cast p1, Ll99;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a5
    check-cast p1, Ltoi;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_b6
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c7
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_d8
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwv0;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwv0;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwv0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_d8
        :pswitch_c7
        :pswitch_b6
        :pswitch_a5
        :pswitch_94
        :pswitch_82
        :pswitch_71
        :pswitch_60
        :pswitch_4f
        :pswitch_3d
        :pswitch_2a
        :pswitch_18
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte p0, p0, Lwv0;->t:B

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_12e

    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lads_mobile_sdk/t70;->p()Lads_mobile_sdk/t70;

    move-result-object p0

    return-object p0

    :pswitch_10
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lads_mobile_sdk/jq0;->v()Li6p;

    move-result-object p0

    invoke-virtual {p0}, Lads_mobile_sdk/iu0;->b$1()V

    iget-object p1, p0, Lads_mobile_sdk/iu0;->b:Lads_mobile_sdk/ku0;

    check-cast p1, Lads_mobile_sdk/jq0;

    invoke-static {p1}, Lads_mobile_sdk/jq0;->O(Lads_mobile_sdk/jq0;)I

    move-result v0

    or-int/lit8 v0, v0, 0x4

    invoke-static {p1, v0}, Lads_mobile_sdk/jq0;->R(Lads_mobile_sdk/jq0;I)V

    invoke-static {p1}, Lads_mobile_sdk/jq0;->S(Lads_mobile_sdk/jq0;)V

    invoke-virtual {p0}, Lads_mobile_sdk/iu0;->a()Lads_mobile_sdk/ku0;

    move-result-object p0

    check-cast p0, Lads_mobile_sdk/jq0;

    return-object p0

    :pswitch_33
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3b
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_43
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Loxo;->a:Loxo;

    sget-object p0, Loxo;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    sget-object p0, Loxo;->i:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_5b
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lfap;->a:Lzyk;

    :try_start_62
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object p0

    const-string p1, "mounted"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_75

    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result p0
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_72} :catch_75

    if-eqz p0, :cond_75

    const/4 v0, 0x1

    :catch_75
    :cond_75
    new-instance p0, Ljava/lang/Integer;

    invoke-direct {p0, v0}, Ljava/lang/Integer;-><init>(I)V

    return-object p0

    :pswitch_7b
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lcbp;->b:Landroid/app/Application;

    sget-object p0, Lcbp;->b:Landroid/app/Application;

    if-eqz p0, :cond_9e

    sget-object p1, Ljno;->a:Ljno;

    sget-object p1, Lcbp;->c:Lt0i;

    if-eqz p1, :cond_90

    invoke-static {p0, v0}, Ljno;->a(Landroid/app/Application;Z)V

    goto :goto_9e

    :cond_90
    sget-object p1, Lcbp;->d:Ljava/util/ArrayList;

    if-eqz p1, :cond_9e

    new-instance p1, Lgh2;

    const/16 v1, 0xe

    invoke-direct {p1, v1, p0, v0}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-static {p1, p1}, Lcbp;->c(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    :cond_9e
    :goto_9e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a1
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a9
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b1
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b9
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_c3
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p0

    return-object p0

    :pswitch_cd
    sget-object p0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Ljava/security/SecureRandom;

    invoke-direct {p0}, Ljava/security/SecureRandom;-><init>()V

    const/16 p1, 0x10

    new-array v0, p1, [B

    invoke-virtual {p0, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    new-array v1, p1, [B

    invoke-virtual {p0, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    array-length p0, v0

    const/4 v2, 0x0

    if-ne p0, p1, :cond_127

    array-length p0, v1

    if-ne p0, p1, :cond_121

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    invoke-static {v1, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p1

    :try_start_f2
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V
    :try_end_f9
    .catch Ljava/io/IOException; {:try_start_f2 .. :try_end_f9} :catch_118

    :try_start_f9
    invoke-virtual {v0, p0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    sget-object p0, Lco5;->a:Ljava/util/Base64$Encoder;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object p0
    :try_end_109
    .catchall {:try_start_f9 .. :try_end_109} :catchall_10e

    :try_start_109
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_10c
    .catch Ljava/io/IOException; {:try_start_109 .. :try_end_10c} :catch_118

    move-object v2, p0

    goto :goto_12c

    :catchall_10e
    move-exception p0

    :try_start_10f
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_112
    .catchall {:try_start_10f .. :try_end_112} :catchall_113

    goto :goto_117

    :catchall_113
    move-exception p1

    :try_start_114
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_117
    throw p0
    :try_end_118
    .catch Ljava/io/IOException; {:try_start_114 .. :try_end_118} :catch_118

    :catch_118
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lh9o;->m(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12c

    :cond_121
    const-string p0, "Encryption key must be 128 bits"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_12c

    :cond_127
    const-string p0, "Signing key must be 128 bits"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_12c
    return-object v2

    nop

    :pswitch_data_12e
    .packed-switch 0x0
        :pswitch_cd
        :pswitch_c3
        :pswitch_b9
        :pswitch_b1
        :pswitch_a9
        :pswitch_a1
        :pswitch_7b
        :pswitch_5b
        :pswitch_43
        :pswitch_3b
        :pswitch_33
        :pswitch_10
    .end packed-switch
.end method
