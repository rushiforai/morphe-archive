.class public final Ll/pa3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:F

.field public static b:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(IJ)F
    .locals 0

    .line 1
    const/16 p1, 0x43

    .line 2
    .line 3
    if-ge p0, p1, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/util/Random;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/Random;->nextFloat()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/high16 p1, 0x41000000    # 8.0f

    .line 15
    .line 16
    :goto_0
    add-float/2addr p0, p1

    .line 17
    return p0

    .line 18
    :cond_0
    new-instance p0, Ljava/util/Random;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/Random;->nextFloat()F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/high16 p1, 0x41100000    # 9.0f

    .line 28
    .line 29
    goto :goto_0
.end method

.method public static b()F
    .locals 2

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/high16 v1, 0x41100000    # 9.0f

    .line 11
    .line 12
    add-float/2addr v0, v1

    .line 13
    return v0
.end method

.method public static c(J)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/32 v0, 0xea60

    .line 2
    .line 3
    .line 4
    div-long v0, p0, v0

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    sub-long/2addr p0, v2

    .line 13
    const-wide/16 v2, 0x3e8

    .line 14
    .line 15
    div-long/2addr p0, v2

    .line 16
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "%02d:%02d"

    .line 33
    .line 34
    invoke-static {v2, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static d(IJZ)F
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    sget p3, Ll/pa3;->b:I

    .line 4
    .line 5
    rem-int/lit8 p3, p3, 0x4

    .line 6
    .line 7
    if-nez p3, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-static {p0, p1, p2}, Ll/pa3;->a(IJ)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sput p0, Ll/pa3;->a:F

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    sput p0, Ll/pa3;->b:I

    .line 17
    .line 18
    :cond_1
    sget p0, Ll/pa3;->b:I

    .line 19
    .line 20
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    sput p0, Ll/pa3;->b:I

    .line 23
    .line 24
    sget p0, Ll/pa3;->a:F

    .line 25
    .line 26
    return p0
.end method

.method public static e(J)I
    .locals 4

    .line 1
    long-to-double p0, p0

    .line 2
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 3
    .line 4
    mul-double/2addr p0, v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/m27;->v3()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    mul-int/lit16 v2, v2, 0x3e8

    .line 14
    .line 15
    int-to-double v2, v2

    .line 16
    div-double/2addr p0, v2

    .line 17
    sub-double/2addr v0, p0

    .line 18
    const-wide/high16 p0, 0x4059000000000000L    # 100.0

    .line 19
    .line 20
    mul-double/2addr v0, p0

    .line 21
    double-to-int p0, v0

    .line 22
    return p0
.end method

.method public static f()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/m27;->u3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qt()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    return v0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    return v0
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "p_boost_end,boostagain"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->he(Lcom/p1/mobile/android/app/Act;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const-string p0, "p_suggest_users_home_view,e_boost_button,click"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 24
    .line 25
    const-string v0, "p_navigation_see,boost"

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Zn(Lcom/p1/mobile/android/app/Act;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    const-string p0, "p_wallet,e_wallet_boost_button,click"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersAct;

    .line 48
    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    const-string p0, "p_intl_plm,e_intl_plm_turbo_card,click"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    if-eqz p1, :cond_6

    .line 55
    .line 56
    check-cast p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersAct;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersAct;->Y1()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "p_popup_see,default"

    .line 63
    .line 64
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    const-string p0, "p_popup_see,boost"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_5
    return-object v0

    .line 74
    :cond_6
    const-string p0, ""

    .line 75
    .line 76
    return-object p0
.end method
