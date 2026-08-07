.class public Ll/gt4;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public final j:Ll/yql;

.field public final k:Lcom/p1/mobile/android/app/Act;

.field public final l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/yql;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gt4;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/gt4;->j:Ll/yql;

    .line 12
    .line 13
    iput-object p2, p0, Ll/gt4;->k:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gt4;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public e0()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gt4;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public f0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_6

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Ljava/lang/Exception;

    .line 25
    .line 26
    const-string v2, "liveMessage is null"

    .line 27
    .line 28
    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "[live][trace_problem]"

    .line 36
    .line 37
    invoke-static {v2, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isNotifyMessage()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    new-instance v2, Ll/m05;

    .line 48
    .line 49
    iget-object v3, p0, Ll/gt4;->j:Ll/yql;

    .line 50
    .line 51
    invoke-direct {v2, v1, v3}, Ll/m05;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget v2, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->category:I

    .line 56
    .line 57
    sget v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->NORMAL_CHAT_CATEGORY:I

    .line 58
    .line 59
    if-ne v2, v3, :cond_2

    .line 60
    .line 61
    new-instance v2, Ll/sz4;

    .line 62
    .line 63
    iget-object v3, p0, Ll/gt4;->j:Ll/yql;

    .line 64
    .line 65
    invoke-direct {v2, v1, v3}, Ll/sz4;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    sget v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_CATEGORY:I

    .line 70
    .line 71
    if-ne v2, v3, :cond_3

    .line 72
    .line 73
    new-instance v2, Ll/ban0;

    .line 74
    .line 75
    iget-object v3, p0, Ll/gt4;->j:Ll/yql;

    .line 76
    .line 77
    invoke-direct {v2, v1, v3}, Ll/ban0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    sget v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->DRAGON_INFO_CHAT_CATEGORY:I

    .line 82
    .line 83
    if-ne v2, v3, :cond_4

    .line 84
    .line 85
    new-instance v2, Ll/bbe;

    .line 86
    .line 87
    iget-object v3, p0, Ll/gt4;->j:Ll/yql;

    .line 88
    .line 89
    invoke-direct {v2, v1, v3}, Ll/bbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    sget v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->MYSTERY_BOX_RECORD:I

    .line 94
    .line 95
    if-ne v2, v3, :cond_5

    .line 96
    .line 97
    new-instance v2, Ll/cb20;

    .line 98
    .line 99
    iget-object v3, p0, Ll/gt4;->j:Ll/yql;

    .line 100
    .line 101
    invoke-direct {v2, v1, v3}, Ll/cb20;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    new-instance v2, Ll/sz4;

    .line 106
    .line 107
    iget-object v3, p0, Ll/gt4;->j:Ll/yql;

    .line 108
    .line 109
    invoke-direct {v2, v1, v3}, Ll/sz4;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 110
    .line 111
    .line 112
    :goto_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a:Ljava/util/List;

    .line 117
    .line 118
    if-eqz p1, :cond_7

    .line 119
    .line 120
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-le p1, v1, :cond_7

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_7
    const/4 p1, 0x1

    .line 135
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public g0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gt4;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gt4;->l:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/gt4;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/gt4;->f0(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
