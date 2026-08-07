.class public Ll/jf3;
.super Ll/bh2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jf3$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/bh2<",
        "Ll/hul;",
        ">;"
    }
.end annotation


# instance fields
.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ll/hul;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Ll/bh2;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(Ll/hul;Ll/jf3$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jf3;-><init>(Ll/hul;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/jf3;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Ll/jf3;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/jf3;->c:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d(Ll/jf3;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic e(Ll/jf3;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/jf3;->d:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Ll/jf3;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method private g()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bh2;->a()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/jf3;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private j(ZLorg/json/JSONObject;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/jf3;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget v0, p0, Ll/jf3;->c:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget v0, p0, Ll/jf3;->d:I

    .line 14
    .line 15
    :goto_0
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Ll/jf3;->e:Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_2
    iget-object p1, p0, Ll/jf3;->f:Ljava/lang/String;

    .line 21
    .line 22
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const-string v2, ""

    .line 27
    .line 28
    const-string v3, "data"

    .line 29
    .line 30
    const-string v4, "status"

    .line 31
    .line 32
    if-nez v1, :cond_4

    .line 33
    .line 34
    const-string v1, "message"

    .line 35
    .line 36
    filled-new-array {v4, v1, v3}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz p2, :cond_3

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    move-object p2, v2

    .line 48
    :goto_2
    filled-new-array {v0, p1, p2}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v1, p1}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    goto :goto_4

    .line 57
    :cond_4
    filled-new-array {v4, v3}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-eqz p2, :cond_5

    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_5
    move-object p2, v2

    .line 69
    :goto_3
    filled-new-array {v0, p2}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-static {p1, p2}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :goto_4
    invoke-virtual {p0}, Ll/bh2;->a()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    check-cast p2, Ll/hul;

    .line 82
    .line 83
    iget-object p0, p0, Ll/jf3;->b:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-interface {p2, p0, p1}, Ll/hul;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, v0}, Ll/jf3;->j(ZLorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/jzv;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "onSuccess:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "BridgeAsyncCallback"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 v0, 0x1

    .line 27
    invoke-direct {p0, v0, p1}, Ll/jf3;->j(ZLorg/json/JSONObject;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
