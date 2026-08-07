.class public Ll/s7j0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/t7j0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/s7j0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/s7j0;->d:Ljava/lang/String;

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    iput-object p1, p0, Ll/s7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e0(Ll/s7j0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s7j0;->h0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic h0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/s7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/r7j0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/r7j0;-><init>(Ll/s7j0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "from_all_topic_newest"

    .line 2
    .line 3
    iget-object v1, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "update"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    const-string v0, "FROM_ALL_TOPIC_RECOMMENDED"

    .line 15
    .line 16
    iget-object p0, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const-string p0, "recommend"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    return-object v1
.end method

.method public g0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "topic_id"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/s7j0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/s7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "from"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/s7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "moment_type"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/s7j0;->d:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Ll/s7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "single_topic_moment"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ll/s7j0;->e:Ljava/lang/String;

    .line 56
    .line 57
    const-string v0, "from_topic_official"

    .line 58
    .line 59
    iget-object v1, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_5

    .line 66
    .line 67
    const-string v0, "from_h5_topic_aggregation"

    .line 68
    .line 69
    iget-object v1, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    const-string v0, "from_topic_nearby_header"

    .line 79
    .line 80
    iget-object v1, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    const-string p0, "nearby"

    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_1
    const-string v0, "from_all_topic_newest"

    .line 92
    .line 93
    iget-object v1, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    const-string p0, "new_feed"

    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_2
    const-string v0, "FROM_ALL_TOPIC_RECOMMENDED"

    .line 105
    .line 106
    iget-object v1, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    const-string p0, "recommend_feed"

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_3
    const-string v0, "from_topic_live_group"

    .line 118
    .line 119
    iget-object p0, p0, Ll/s7j0;->c:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_4

    .line 126
    .line 127
    const-string p0, "live_group_topic"

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_4
    const-string p0, "tag"

    .line 131
    .line 132
    return-object p0

    .line 133
    :cond_5
    :goto_0
    const-string p0, "tantan_topic"

    .line 134
    .line 135
    return-object p0
.end method
