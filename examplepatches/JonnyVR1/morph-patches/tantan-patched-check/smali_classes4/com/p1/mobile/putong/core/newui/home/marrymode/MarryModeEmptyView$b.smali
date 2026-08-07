.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e0:Lrx/subjects/b;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onTick(J)V
    .locals 3

    .line 1
    invoke-static {p1, p2}, Ll/yab;->O(J)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, " "

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    const/4 v0, 0x6

    .line 49
    if-ne p2, v0, :cond_1

    .line 50
    .line 51
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->e:Lv/VText;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ljava/lang/CharSequence;

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 66
    .line 67
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->f:Lv/VText;

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 80
    .line 81
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->g:Lv/VText;

    .line 82
    .line 83
    const/4 v0, 0x2

    .line 84
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/lang/CharSequence;

    .line 89
    .line 90
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 94
    .line 95
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->h:Lv/VText;

    .line 96
    .line 97
    const/4 v0, 0x3

    .line 98
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ljava/lang/CharSequence;

    .line 103
    .line 104
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 108
    .line 109
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->i:Lv/VText;

    .line 110
    .line 111
    const/4 v0, 0x4

    .line 112
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/lang/CharSequence;

    .line 117
    .line 118
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->j:Lv/VText;

    .line 124
    .line 125
    const/4 p2, 0x5

    .line 126
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Ljava/lang/CharSequence;

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    :cond_1
    return-void
.end method
