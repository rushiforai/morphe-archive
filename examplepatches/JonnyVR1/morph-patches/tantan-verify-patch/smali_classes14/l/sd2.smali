.class public final Ll/sd2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J9\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0012\u0010\n\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\t0\u0008\"\u00020\t\u00a2\u0006\u0004\u0008\r\u0010\u000eJ/\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\u000b2\u0006\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u001f\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\'\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0016\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u001c\u0010\u001d\u001a\n \u001a*\u0004\u0018\u00010\t0\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/sd2;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "type",
        "",
        "",
        "arr",
        "Lrx/c;",
        "Lcom/google/android/gms/ads/AdView;",
        "f",
        "(Lcom/p1/mobile/android/app/Act;I[Ljava/lang/String;)Lrx/c;",
        "adView",
        "adUnitID",
        "e",
        "(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;I)Lrx/c;",
        "c",
        "(Lcom/p1/mobile/android/app/Act;I)Lcom/google/android/gms/ads/AdView;",
        "maxHeight",
        "padding",
        "Ll/w70;",
        "d",
        "(Lcom/p1/mobile/android/app/Act;II)Ll/w70;",
        "kotlin.jvm.PlatformType",
        "a",
        "Ljava/lang/String;",
        "TAG",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/sd2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/sd2;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sd2;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/sd2;->INSTANCE:Ll/sd2;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/sd2;->a:Ljava/lang/String;

    .line 17
    .line 18
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

.method public static a(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;ILl/gcg0;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/BaseAdView;->setAdUnitId(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/s70$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/s70$a;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x7

    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne p2, v1, :cond_0

    .line 13
    .line 14
    invoke-static {v3, v2}, Ll/u2n;->h(ZZ)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const/4 v1, 0x5

    .line 20
    if-ne p2, v1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v2, v3

    .line 24
    :goto_0
    invoke-static {v2}, Ll/u2n;->g(Z)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_1
    invoke-virtual {v0, v1}, Ll/r6;->e(Ljava/util/List;)Ll/r6;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/s70$a;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/s70$a;->i()Ll/s70;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/BaseAdView;->b(Ll/s70;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/sd2$a;

    .line 42
    .line 43
    invoke-direct {v0, p1, p3, p0, p2}, Ll/sd2$a;-><init>(Ljava/lang/String;Ll/gcg0;Lcom/google/android/gms/ads/AdView;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/BaseAdView;->setAdListener(Ll/d70;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static final synthetic b()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/sd2;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final c(Lcom/p1/mobile/android/app/Act;I)Lcom/google/android/gms/ads/AdView;
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/ads/AdView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x64

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-ne p2, v2, :cond_0

    .line 10
    .line 11
    move v3, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 v3, 0x48

    .line 14
    .line 15
    :goto_0
    if-ne p2, v2, :cond_1

    .line 16
    .line 17
    sget v2, Ll/qa00;->v:I

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    sget v2, Ll/qa00;->h:I

    .line 21
    .line 22
    :goto_1
    const/16 v4, 0xa

    .line 23
    .line 24
    if-eq p2, v4, :cond_3

    .line 25
    .line 26
    const/16 v1, 0xb

    .line 27
    .line 28
    if-eq p2, v1, :cond_2

    .line 29
    .line 30
    move v1, v3

    .line 31
    goto :goto_2

    .line 32
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->i()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    goto :goto_2

    .line 40
    :cond_3
    sget v2, Ll/qa00;->m:I

    .line 41
    .line 42
    :goto_2
    invoke-virtual {p0, p1, v1, v2}, Ll/sd2;->d(Lcom/p1/mobile/android/app/Act;II)Ll/w70;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/BaseAdView;->setAdSize(Ll/w70;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public final d(Lcom/p1/mobile/android/app/Act;II)Ll/w70;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 15
    .line 16
    .line 17
    iget p0, p1, Landroid/util/DisplayMetrics;->density:F

    .line 18
    .line 19
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 20
    .line 21
    int-to-float p1, p1

    .line 22
    int-to-float p3, p3

    .line 23
    sub-float/2addr p1, p3

    .line 24
    div-float/2addr p1, p0

    .line 25
    float-to-int p0, p1

    .line 26
    :try_start_0
    invoke-static {p0, p2}, Ll/w70;->c(II)Ll/w70;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :catch_0
    sget-object p0, Ll/w70;->i:Ll/w70;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public final e(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/AdView;",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Lcom/google/android/gms/ads/AdView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/rd2;

    .line 5
    .line 6
    invoke-direct {p0, p1, p2, p3}, Ll/rd2;-><init>(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public final varargs f(Lcom/p1/mobile/android/app/Act;I[Ljava/lang/String;)Lrx/c;
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "I[",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/google/android/gms/ads/AdView;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    array-length v0, p3

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/sd2;->c(Lcom/p1/mobile/android/app/Act;I)Lcom/google/android/gms/ads/AdView;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    aget-object p3, p3, v1

    .line 25
    .line 26
    invoke-virtual {p0, v0, p3, p2}, Ll/sd2;->e(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    return-object p0
.end method
