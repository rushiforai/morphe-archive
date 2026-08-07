.class public final Ll/fa;
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

.method public static b(IJZ)F
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    sget p3, Ll/fa;->b:I

    .line 4
    .line 5
    rem-int/lit8 p3, p3, 0x4

    .line 6
    .line 7
    if-nez p3, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-static {p0, p1, p2}, Ll/fa;->a(IJ)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sput p0, Ll/fa;->a:F

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    sput p0, Ll/fa;->b:I

    .line 17
    .line 18
    :cond_1
    sget p0, Ll/fa;->b:I

    .line 19
    .line 20
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    sput p0, Ll/fa;->b:I

    .line 23
    .line 24
    sget p0, Ll/fa;->a:F

    .line 25
    .line 26
    return p0
.end method

.method public static c(J)I
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
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dw6;->p3()I

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

.method public static d(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "p_accelerate_data,again"

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
    const-string p0, "p_home,accelerate_entrance"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Zn(Lcom/p1/mobile/android/app/Act;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    const-string p0, "p_wallet,e_wallet_boost_button,click"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersAct;

    .line 41
    .line 42
    if-eqz p0, :cond_3

    .line 43
    .line 44
    const-string p0, "p_intl_plm,e_intl_plm_turbo_card,click"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    const-string p0, ""

    .line 48
    .line 49
    return-object p0
.end method
