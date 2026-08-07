.class public Ll/fub0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pub0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;


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
    iput-object v0, p0, Ll/fub0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/fub0;->c:Ljava/lang/String;

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    iput-object p1, p0, Ll/fub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic e0(Ll/fub0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fub0;->h0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/cn40;->H()V

    .line 2
    .line 3
    .line 4
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
    iget-object p0, p0, Ll/fub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    new-instance v1, Ll/dub0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/dub0;-><init>(Ll/fub0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/eub0;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/eub0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    iput-object v0, p0, Ll/fub0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/fub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    iput-object v0, p0, Ll/fub0;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/fub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "single_topic_moment"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/fub0;->d:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "from_topic_official"

    .line 44
    .line 45
    iget-object v1, p0, Ll/fub0;->c:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    const-string v0, "from_h5_topic_aggregation"

    .line 54
    .line 55
    iget-object v1, p0, Ll/fub0;->c:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    const-string v0, "fromh5_topic_vote_aggregation"

    .line 64
    .line 65
    iget-object v1, p0, Ll/fub0;->c:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const-string v0, "from_topic_nearby_header"

    .line 75
    .line 76
    iget-object p0, p0, Ll/fub0;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_1

    .line 83
    .line 84
    const-string p0, "nearby"

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_1
    const-string p0, "tag"

    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_2
    :goto_0
    const-string p0, "tantan_topic"

    .line 91
    .line 92
    return-object p0
.end method
