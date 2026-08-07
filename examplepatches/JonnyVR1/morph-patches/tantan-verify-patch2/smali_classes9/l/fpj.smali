.class public Ll/fpj;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/fpj;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 3

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p3, ""

    .line 7
    .line 8
    :try_start_0
    const-string v0, "tabIdList"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, ","

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/epj;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/epj;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :catch_0
    :try_start_1
    const-string v0, "tabId"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 48
    .line 49
    .line 50
    :catch_1
    :try_start_2
    const-string v0, "receiverId"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 56
    :try_start_3
    const-string v1, "receiverName"

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 62
    :try_start_4
    const-string v2, "receiverAvatar"

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 68
    goto :goto_0

    .line 69
    :catch_2
    move-object v1, p3

    .line 70
    goto :goto_0

    .line 71
    :catch_3
    move-object v0, p3

    .line 72
    move-object v1, v0

    .line 73
    :catch_4
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_0

    .line 78
    .line 79
    invoke-static {p2, p0, v0, v1, p3}, Ll/ydn0;->j(Ll/i6t;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance p2, Ll/lx50;

    .line 94
    .line 95
    invoke-direct {p2}, Ll/lx50;-><init>()V

    .line 96
    .line 97
    .line 98
    const/16 p3, 0x3e8

    .line 99
    .line 100
    invoke-virtual {p2, p3}, Ll/lx50;->i(I)Ll/lx50;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p2, p0}, Ll/lx50;->g(Ljava/util/List;)Ll/lx50;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method
