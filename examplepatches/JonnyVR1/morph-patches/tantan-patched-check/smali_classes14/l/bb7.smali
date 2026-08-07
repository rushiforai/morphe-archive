.class public Ll/bb7;
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


# virtual methods
.method public final a(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c69;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->transDataFromPush(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 14
    .line 15
    .line 16
    sget-object p1, Ll/i8w;->INSTANCE:Ll/i8w;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/i8w;->f(Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/PushMessage;)Z
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "intl.lovebuzz.invite"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "intl.lovebuzz.match"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "intl.lovebuzz.like"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "intl.lovebuzz.prolong"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "intl.lovebuzz.report"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "intl.lovebuzz.warn"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 62
    .line 63
    const-string v1, "intl.lovebuzz.react"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 p0, 0x0

    .line 73
    return p0

    .line 74
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ll/bb7;->a(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x1

    .line 78
    return p0
.end method

.method public c()V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    new-instance v1, Ll/bb7$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bb7$a;-><init>(Ll/bb7;)V

    .line 6
    .line 7
    .line 8
    const-string v7, "intl.lovebuzz.warn"

    .line 9
    .line 10
    const-string v8, "intl.lovebuzz.react"

    .line 11
    .line 12
    const-string v2, "intl.lovebuzz.invite"

    .line 13
    .line 14
    const-string v3, "intl.lovebuzz.match"

    .line 15
    .line 16
    const-string v4, "intl.lovebuzz.like"

    .line 17
    .line 18
    const-string v5, "intl.lovebuzz.prolong"

    .line 19
    .line 20
    const-string v6, "intl.lovebuzz.report"

    .line 21
    .line 22
    filled-new-array/range {v2 .. v8}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, v1, p0}, Ll/cmb0;->a0(Ll/cmb0$g;Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
