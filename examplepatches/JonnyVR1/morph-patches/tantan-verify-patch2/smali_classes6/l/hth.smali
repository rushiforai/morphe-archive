.class public Ll/hth;
.super Ll/m4;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/wul;)Z
    .locals 4

    .line 1
    instance-of p0, p3, Ll/p8h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p3, Ll/p8h;

    .line 6
    .line 7
    iget-object p0, p3, Ll/p8h;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 8
    .line 9
    iget-object p2, p3, Ll/p8h;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    move-object p2, p0

    .line 14
    :goto_0
    const/4 p3, 0x0

    .line 15
    if-eqz p0, :cond_3

    .line 16
    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    .line 23
    .line 24
    invoke-static {p0, p2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p2, Ll/ksg;->a:I

    .line 29
    .line 30
    invoke-static {p0, p2}, Ll/kth;->e(Ljava/lang/String;I)Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    return p3

    .line 37
    :cond_2
    new-instance p2, Ll/byd0;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "read_count_show_dialog_time_"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-wide/16 v1, 0x0

    .line 69
    .line 70
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-direct {p2, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ll/vxd0;

    .line 78
    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v2, "read_count_show_dialog_count_"

    .line 82
    .line 83
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 87
    .line 88
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-direct {v0, v1, p3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 112
    .line 113
    iget v2, v1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->days:I

    .line 114
    .line 115
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->intervalDays:I

    .line 116
    .line 117
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->showTimes:I

    .line 118
    .line 119
    invoke-static {p2, v0, v2, v3, v1}, Ll/kth;->g(Ll/byd0;Ll/vxd0;III)V

    .line 120
    .line 121
    .line 122
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 123
    .line 124
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p2}, Ll/kth;->f(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;)Landroid/content/Intent;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 134
    .line 135
    .line 136
    sget p0, Ll/a8c0;->i:I

    .line 137
    .line 138
    invoke-virtual {p1, p0, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 139
    .line 140
    .line 141
    const/4 p0, 0x1

    .line 142
    return p0

    .line 143
    :cond_3
    :goto_1
    return p3
.end method
