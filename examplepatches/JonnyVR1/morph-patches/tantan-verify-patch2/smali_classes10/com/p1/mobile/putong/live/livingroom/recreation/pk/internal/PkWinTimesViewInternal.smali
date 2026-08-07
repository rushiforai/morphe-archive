.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pc80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(ZJ)V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "\u8fde\u80dc"

    .line 3
    .line 4
    const-string v2, "99+\u8fde\u80dc"

    .line 5
    .line 6
    const-wide/16 v3, 0x63

    .line 7
    .line 8
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZOTE9OUklLM0FGSVFaUDQ3N0pCT0UzTURYQUFTTjEyIiwidyI6MjE2LCJoIjo5MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjE1ODczNTMxNjk5NTU3MzY4NDB9.png"

    .line 9
    .line 10
    const-wide/16 v6, 0x2

    .line 11
    .line 12
    const-string v8, "context_single_room"

    .line 13
    .line 14
    const/4 v9, 0x1

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    const-wide/16 v10, 0x0

    .line 18
    .line 19
    cmp-long p1, p2, v10

    .line 20
    .line 21
    const/high16 v10, 0x41f00000    # 30.0f

    .line 22
    .line 23
    const/high16 v11, 0x42900000    # 72.0f

    .line 24
    .line 25
    if-gez p1, :cond_0

    .line 26
    .line 27
    invoke-static {p0, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->a:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJKUkJMQUZET1U1UEVOQVFOQ1JUSU0yNlpKWEhNSDEzIiwidyI6MjE2LCJoIjo5MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjM5MTY4MTgwOTE0Mjg0OTEwMDh9.png"

    .line 41
    .line 42
    invoke-static {v8, p1, v0, p2, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b:Landroid/widget/TextView;

    .line 46
    .line 47
    const-string p1, "\u8fde\u80dc\u7ec8\u7ed3"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    cmp-long p1, p2, v6

    .line 54
    .line 55
    if-ltz p1, :cond_2

    .line 56
    .line 57
    invoke-static {p0, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->a:Lv/VDraweeView;

    .line 61
    .line 62
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    invoke-static {v8, p1, v5, v0, v6}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 71
    .line 72
    .line 73
    cmp-long p1, p2, v3

    .line 74
    .line 75
    if-lez p1, :cond_1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b:Landroid/widget/TextView;

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    cmp-long p1, p2, v6

    .line 104
    .line 105
    if-ltz p1, :cond_5

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->a:Lv/VDraweeView;

    .line 108
    .line 109
    invoke-static {v8, p1, v5}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    cmp-long p1, p2, v3

    .line 113
    .line 114
    if-lez p1, :cond_4

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b:Landroid/widget/TextView;

    .line 133
    .line 134
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p0, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
