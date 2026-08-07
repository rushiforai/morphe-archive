.class public Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->k5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->e5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->e5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->J(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->g5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->f5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/util/Queue;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->i5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lv/VText;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->i5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lv/VText;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "\u65e0\u66f4\u591a\u72b6\u6001"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->h5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lv/VProgressBar;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    const/4 v1, 0x0

    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 101
    .line 102
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->h5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Lv/VProgressBar;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 114
    .line 115
    .line 116
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 119
    .line 120
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 124
    .line 125
    const/4 v0, 0x0

    .line 126
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->l5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$a;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 131
    .line 132
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->g5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->P5(Ljava/lang/String;Z)V

    .line 137
    .line 138
    .line 139
    return-void
.end method
