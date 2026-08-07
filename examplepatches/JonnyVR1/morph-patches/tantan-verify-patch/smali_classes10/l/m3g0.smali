.class public Ll/m3g0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0xd

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "no state:"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :pswitch_0
    const-string p0, "AuthError"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_1
    const-string p0, "AuthSuccess"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_2
    const-string p0, "Disconnected"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_3
    const-string p0, "ConnectError"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_4
    const-string p0, "Connected"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_5
    const-string p0, "Connecting"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_6
    const-string p0, "Idle"

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_0
    const-string p0, "KeepAliveError"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_1
    const-string p0, "IOError"

    .line 52
    .line 53
    return-object p0

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
