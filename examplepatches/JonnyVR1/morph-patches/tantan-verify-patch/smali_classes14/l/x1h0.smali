.class public final Ll/x1h0;
.super Ll/txs;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u0017\u0010\u000e\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u0017\u0010\u0015\u001a\u00020\u00108\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0018\u001a\u00020\u00108\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0012\u001a\u0004\u0008\u0017\u0010\u0014R\u0017\u0010\u001e\u001a\u00020\u00198\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/x1h0;",
        "Ll/txs;",
        "Ll/ner;",
        "lifecycleProvider",
        "Ll/nus;",
        "info",
        "<init>",
        "(Ll/ner;Ll/nus;)V",
        "",
        "T",
        "()V",
        "a3",
        "",
        "time",
        "b3",
        "(J)V",
        "Ll/vxd0;",
        "f",
        "Ll/vxd0;",
        "getSuggest_save_guide_total_num",
        "()Ll/vxd0;",
        "suggest_save_guide_total_num",
        "g",
        "getSuggest_save_guide_show_day_count",
        "suggest_save_guide_show_day_count",
        "Ll/byd0;",
        "h",
        "Ll/byd0;",
        "getSuggest_save_guide_show_day_time",
        "()Ll/byd0;",
        "suggest_save_guide_show_day_time",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final f:Ll/vxd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final g:Ll/vxd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final h:Ll/byd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 3
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/nus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/vxd0;

    .line 11
    .line 12
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "SuggestGuide_guide_total_"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/x1h0;->f:Ll/vxd0;

    .line 35
    .line 36
    new-instance p1, Ll/vxd0;

    .line 37
    .line 38
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v2, "SuggestGuide_guide_show_day_count_"

    .line 45
    .line 46
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Ll/x1h0;->g:Ll/vxd0;

    .line 60
    .line 61
    new-instance p1, Ll/byd0;

    .line 62
    .line 63
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v1, "SuggestGuide_guide_show_day_time_"

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    const-wide/16 v0, 0x0

    .line 82
    .line 83
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-direct {p1, p2, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Ll/x1h0;->h:Ll/byd0;

    .line 91
    .line 92
    return-void
.end method

.method public static Q2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static R2(Ljava/lang/Long;)V
    .locals 1

    .line 1
    const-string p0, "guide"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/t4u;->l(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static S2(Ll/t4u$a;)V
    .locals 1

    .line 1
    const-string p0, "guide"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/t4u;->l(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static T2(Ll/x1h0;Ll/t4u$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x1h0;->a3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static U2(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static V2(Ll/t4u$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "p_live_recommend"

    .line 2
    .line 3
    iget-object p0, p0, Ll/t4u$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static W2(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const-string p0, "guide"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/t4u;->l(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static X2(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static Y2(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static Z2(Ll/t4u$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "p_live_recommend"

    .line 2
    .line 3
    iget-object p0, p0, Ll/t4u$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/t4u;->j()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/n1h0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/n1h0;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/o1h0;

    .line 18
    .line 19
    invoke-direct {v2, v1}, Ll/o1h0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/p1h0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/p1h0;-><init>(Ll/x1h0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final a3()V
    .locals 9

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->x5()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->on:Z

    .line 10
    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    iget-object v1, p0, Ll/x1h0;->f:Ll/vxd0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->total:I

    .line 26
    .line 27
    if-ge v2, v3, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Ll/x1h0;->h:Ll/byd0;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/lang/Long;

    .line 36
    .line 37
    iget-object v3, p0, Ll/x1h0;->g:Ll/vxd0;

    .line 38
    .line 39
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-static {}, Ll/pzi0;->n()J

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    const/4 v6, 0x1

    .line 50
    if-nez v2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v7

    .line 57
    cmp-long v4, v7, v4

    .line 58
    .line 59
    if-nez v4, :cond_1

    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->dayLimit:I

    .line 66
    .line 67
    if-ge v2, v4, :cond_2

    .line 68
    .line 69
    iget-object v2, p0, Ll/x1h0;->g:Ll/vxd0;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    add-int/2addr v3, v6

    .line 76
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v2, v3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Ll/x1h0;->f:Ll/vxd0;

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v1, v6

    .line 90
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v2, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->duration:J

    .line 98
    .line 99
    invoke-virtual {p0, v0, v1}, Ll/x1h0;->b3(J)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    :goto_0
    invoke-static {}, Ll/pzi0;->n()J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 111
    .line 112
    .line 113
    move-result-wide v7

    .line 114
    sub-long/2addr v3, v7

    .line 115
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->nextDay:I

    .line 116
    .line 117
    const v5, 0x5265c00

    .line 118
    .line 119
    .line 120
    mul-int/2addr v2, v5

    .line 121
    int-to-long v7, v2

    .line 122
    cmp-long v2, v3, v7

    .line 123
    .line 124
    if-lez v2, :cond_2

    .line 125
    .line 126
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->dayLimit:I

    .line 127
    .line 128
    if-lez v2, :cond_2

    .line 129
    .line 130
    iget-object v2, p0, Ll/x1h0;->h:Ll/byd0;

    .line 131
    .line 132
    invoke-static {}, Ll/pzi0;->n()J

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v2, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Ll/x1h0;->g:Ll/vxd0;

    .line 144
    .line 145
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {v2, v3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Ll/x1h0;->f:Ll/vxd0;

    .line 153
    .line 154
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    add-int/2addr v1, v6

    .line 159
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v2, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;->duration:J

    .line 167
    .line 168
    invoke-virtual {p0, v0, v1}, Ll/x1h0;->b3(J)V

    .line 169
    .line 170
    .line 171
    :cond_2
    return-void
.end method

.method public final b3(J)V
    .locals 2

    .line 1
    const-string v0, "guide"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/t4u;->l(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    invoke-static {p1, p2, v0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ll/q1h0;

    .line 30
    .line 31
    invoke-direct {p2}, Ll/q1h0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/t4u;->j()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance p2, Ll/r1h0;

    .line 50
    .line 51
    invoke-direct {p2}, Ll/r1h0;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/s1h0;

    .line 55
    .line 56
    invoke-direct {v0, p2}, Ll/s1h0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p2, Ll/t1h0;

    .line 64
    .line 65
    invoke-direct {p2}, Ll/t1h0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance p1, Ll/u1h0;

    .line 84
    .line 85
    invoke-direct {p1}, Ll/u1h0;-><init>()V

    .line 86
    .line 87
    .line 88
    new-instance p2, Ll/v1h0;

    .line 89
    .line 90
    invoke-direct {p2, p1}, Ll/v1h0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    new-instance p1, Ll/w1h0;

    .line 98
    .line 99
    invoke-direct {p1}, Ll/w1h0;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {p1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method
