.class public Ll/tf;
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

.method public static a(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->E(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static b(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/tf;->c(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static c(Ljava/lang/Throwable;)Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v0, 0x9d6c

    .line 11
    .line 12
    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    const v0, 0x62638

    .line 16
    .line 17
    .line 18
    if-eq p0, v0, :cond_0

    .line 19
    .line 20
    packed-switch p0, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    packed-switch p0, :pswitch_data_1

    .line 24
    .line 25
    .line 26
    packed-switch p0, :pswitch_data_2

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :pswitch_0
    sget p0, Lcom/p1/mobile/putong/common/R$string;->K:I

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :pswitch_1
    sget p0, Lcom/p1/mobile/putong/common/R$string;->K:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :pswitch_2
    sget p0, Lcom/p1/mobile/putong/common/R$string;->N:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 45
    .line 46
    .line 47
    return v1

    .line 48
    :cond_0
    :pswitch_3
    sget p0, Lcom/p1/mobile/putong/common/R$string;->L:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 59
    .line 60
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 61
    .line 62
    const v0, 0x9c9f

    .line 63
    .line 64
    .line 65
    if-eq p0, v0, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    sget p0, Lcom/p1/mobile/putong/common/R$string;->d3:I

    .line 69
    .line 70
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 71
    .line 72
    .line 73
    return v1

    .line 74
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 75
    return p0

    .line 76
    nop

    .line 77
    :pswitch_data_0
    .packed-switch 0x9c4d
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :pswitch_data_1
    .packed-switch 0x61a8a
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch

    .line 88
    :pswitch_data_2
    .packed-switch 0x68bc8
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method
