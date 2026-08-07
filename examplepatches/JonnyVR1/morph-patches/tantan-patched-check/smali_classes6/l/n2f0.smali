.class public Ll/n2f0;
.super Ll/m4;
.source "SourceFile"


# instance fields
.field public b:Lcom/p1/mobile/putong/feed/data/StateGuide;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/m4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 6
    .line 7
    sget-object v0, Ll/owi;->h:Ll/wyd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 28
    .line 29
    iput-object v0, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 30
    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/wul;)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/n2f0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 8
    .line 9
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/StateGuide;->title:Ljava/lang/String;

    .line 10
    .line 11
    iget v4, v0, Lcom/p1/mobile/putong/feed/data/StateGuide;->defaultEmotionIndex:I

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    move-object v7, p0

    .line 16
    move-object v1, p1

    .line 17
    move-object v3, p2

    .line 18
    invoke-static/range {v1 .. v7}, Ll/zzg;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;Ll/uul;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return p3
.end method

.method public final e()Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget v2, Ll/ksg;->a:I

    .line 8
    .line 9
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/StateGuide;->swipeMomentCount:I

    .line 10
    .line 11
    if-le v2, v0, :cond_8

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jka;->I7()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_1
    sget-object v0, Ll/owi;->i:Ll/byd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Long;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    return v1

    .line 42
    :cond_2
    invoke-static {}, Ll/ci80;->h()Ll/ci80;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/ci80;->n()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    return v1

    .line 53
    :cond_3
    iget-object v0, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/StateGuide;->gender:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const-string v3, "both"

    .line 66
    .line 67
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_5

    .line 72
    .line 73
    if-eqz v2, :cond_4

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 76
    .line 77
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_5

    .line 82
    .line 83
    :cond_4
    return v1

    .line 84
    :cond_5
    sget-object v0, Ll/owi;->j:Ll/vxd0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ljava/lang/Integer;

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget-object v2, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 97
    .line 98
    iget v2, v2, Lcom/p1/mobile/putong/feed/data/StateGuide;->unClickCount:I

    .line 99
    .line 100
    const/4 v3, 0x1

    .line 101
    if-lt v0, v2, :cond_7

    .line 102
    .line 103
    invoke-static {}, Ll/pzi0;->o()J

    .line 104
    .line 105
    .line 106
    move-result-wide v4

    .line 107
    sget-object v0, Ll/owi;->k:Ll/byd0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Ljava/lang/Long;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 116
    .line 117
    .line 118
    move-result-wide v6

    .line 119
    invoke-static {v4, v5, v6, v7}, Ll/p6i;->b(JJ)J

    .line 120
    .line 121
    .line 122
    move-result-wide v4

    .line 123
    iget-object p0, p0, Ll/n2f0;->b:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 124
    .line 125
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/StateGuide;->guideShowInterval:I

    .line 126
    .line 127
    int-to-long v6, p0

    .line 128
    cmp-long p0, v4, v6

    .line 129
    .line 130
    if-lez p0, :cond_6

    .line 131
    .line 132
    sget-object p0, Ll/owi;->j:Ll/vxd0;

    .line 133
    .line 134
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    return v3

    .line 142
    :cond_6
    return v1

    .line 143
    :cond_7
    return v3

    .line 144
    :cond_8
    :goto_0
    return v1
.end method
