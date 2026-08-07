.class public final Ll/xj90;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xj90;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(ZZ)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Og:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ng:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_1
    if-eqz p2, :cond_2

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/core/R$string;->cg:I

    .line 14
    .line 15
    return p0

    .line 16
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->dg:I

    .line 17
    .line 18
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 0

    .line 1
    sget-object p0, Ll/xj90$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x4

    .line 10
    if-eq p0, p1, :cond_4

    .line 11
    .line 12
    const/4 p1, 0x5

    .line 13
    if-eq p0, p1, :cond_3

    .line 14
    .line 15
    const/16 p1, 0x8

    .line 16
    .line 17
    if-eq p0, p1, :cond_1

    .line 18
    .line 19
    const/16 p1, 0xb

    .line 20
    .line 21
    if-eq p0, p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ih:I

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Mg:I

    .line 35
    .line 36
    return p0

    .line 37
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Lg:I

    .line 38
    .line 39
    return p0

    .line 40
    :cond_3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Qb:I

    .line 41
    .line 42
    return p0

    .line 43
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->rg:I

    .line 44
    .line 45
    return p0
.end method

.method public final c(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Wb:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Vb:I

    .line 7
    .line 8
    return p0
.end method

.method public final d(ZZ)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Rg:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Qg:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_1
    if-eqz p2, :cond_2

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/core/R$string;->jg:I

    .line 14
    .line 15
    return p0

    .line 16
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ig:I

    .line 17
    .line 18
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xj90;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Ll/xj90;->a:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Rg:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Qg:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_2
    if-eqz p1, :cond_4

    .line 40
    .line 41
    iget-object p0, p0, Ll/xj90;->a:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Wb:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_3
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Vb:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_4
    iget-object p0, p0, Ll/xj90;->a:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    if-eqz v1, :cond_5

    .line 62
    .line 63
    sget p1, Lcom/p1/mobile/putong/core/R$string;->jg:I

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_5
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ig:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)I
    .locals 3

    .line 1
    invoke-static {p2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-object v2, Ll/xj90$a;->a:[I

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    aget p1, v2, p1

    .line 16
    .line 17
    packed-switch p1, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :pswitch_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Bc:I

    .line 23
    .line 24
    return p0

    .line 25
    :pswitch_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->mg:I

    .line 26
    .line 27
    return p0

    .line 28
    :pswitch_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->kg:I

    .line 29
    .line 30
    return p0

    .line 31
    :pswitch_3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->lg:I

    .line 32
    .line 33
    return p0

    .line 34
    :pswitch_4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->eg:I

    .line 35
    .line 36
    return p0

    .line 37
    :pswitch_5
    sget p0, Lcom/p1/mobile/putong/core/R$string;->zr:I

    .line 38
    .line 39
    return p0

    .line 40
    :pswitch_6
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ar:I

    .line 41
    .line 42
    return p0

    .line 43
    :pswitch_7
    sget p0, Lcom/p1/mobile/putong/core/R$string;->fg:I

    .line 44
    .line 45
    return p0

    .line 46
    :pswitch_8
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Wa:I

    .line 47
    .line 48
    return p0

    .line 49
    :pswitch_9
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ac:I

    .line 50
    .line 51
    return p0

    .line 52
    :pswitch_a
    sget p0, Lcom/p1/mobile/putong/core/R$string;->q3:I

    .line 53
    .line 54
    return p0

    .line 55
    :pswitch_b
    if-eqz v1, :cond_0

    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Og:I

    .line 58
    .line 59
    return p0

    .line 60
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ng:I

    .line 61
    .line 62
    return p0

    .line 63
    :pswitch_c
    invoke-virtual {p0, v0, v1}, Ll/xj90;->a(ZZ)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :pswitch_d
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Mn:I

    .line 69
    .line 70
    return p0

    .line 71
    :pswitch_e
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Rb:I

    .line 72
    .line 73
    return p0

    .line 74
    :pswitch_f
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ug:I

    .line 75
    .line 76
    return p0

    .line 77
    :pswitch_10
    if-eqz v1, :cond_1

    .line 78
    .line 79
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Rg:I

    .line 80
    .line 81
    return p0

    .line 82
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Qg:I

    .line 83
    .line 84
    return p0

    .line 85
    :pswitch_11
    invoke-static {p2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Ll/xj90;->c(Z)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    return p0

    .line 96
    :cond_2
    invoke-virtual {p0, v0, v1}, Ll/xj90;->d(ZZ)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    return p0

    .line 101
    :pswitch_12
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ms:I

    .line 102
    .line 103
    return p0

    .line 104
    nop

    .line 105
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public g(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/xj90;->a:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Rb:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Ll/joa;->s3()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method
