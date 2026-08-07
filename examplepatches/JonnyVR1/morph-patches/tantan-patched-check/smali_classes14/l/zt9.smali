.class public Ll/zt9;
.super Ll/dy6;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Detect;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->a(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/tantan/core/base/R$string;->c:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget p0, Lcom/tantan/core/base/R$string;->n:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    return-object p0
.end method


# virtual methods
.method public b3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/DetectCategoryType;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u542b\u6709\u8fdd\u53cd\u793e\u533a\u89c4\u8303\u4fe1\u606f\uff0c\u8bf7\u91cd\u65b0\u7f16\u8f91"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/DetectRequest;->new_()Lcom/p1/mobile/putong/data/DetectRequest;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p3, p0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/data/DetectText;->new_()Lcom/p1/mobile/putong/data/DetectText;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    iput-object p3, v0, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 36
    .line 37
    iput-object p2, v0, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 38
    .line 39
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/DetectText;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iput-object p2, p0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {p0}, Ll/yb5;->Q(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p2, Ll/yt9;

    .line 54
    .line 55
    invoke-direct {p2, p1}, Ll/yt9;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
