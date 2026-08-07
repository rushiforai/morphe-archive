.class public Ll/odj0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pdj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:I


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
    iput-object v0, p0, Ll/odj0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/odj0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/odj0;->d:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    iput v0, p0, Ll/odj0;->f:I

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    iput-object p1, p0, Ll/odj0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/odj0;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    iput-object v0, p0, Ll/odj0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/odj0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "topic_owner"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/odj0;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/odj0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "moment_id"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/odj0;->d:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Ll/odj0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "vote_index"

    .line 50
    .line 51
    const/4 v2, -0x1

    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Ll/odj0;->f:I

    .line 57
    .line 58
    iget-object v0, p0, Ll/odj0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "from"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/odj0;->e:Ljava/lang/String;

    .line 71
    .line 72
    const-string v1, "from_topic_official"

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    const-string v0, "from_h5_topic_aggregation"

    .line 81
    .line 82
    iget-object v1, p0, Ll/odj0;->e:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    const-string v0, "fromh5_topic_vote_aggregation"

    .line 91
    .line 92
    iget-object v1, p0, Ll/odj0;->e:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_0

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    const-string v0, "from_topic_nearby_header"

    .line 102
    .line 103
    iget-object p0, p0, Ll/odj0;->e:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_1

    .line 110
    .line 111
    const-string p0, "nearby"

    .line 112
    .line 113
    return-object p0

    .line 114
    :cond_1
    const-string p0, "tag"

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_2
    :goto_0
    const-string p0, "tantan_topic"

    .line 118
    .line 119
    return-object p0
.end method
