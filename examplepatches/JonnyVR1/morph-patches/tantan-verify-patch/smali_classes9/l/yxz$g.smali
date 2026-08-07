.class public Ll/yxz$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yxz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$g;->a:Ll/yxz;

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iwl;->getFirstVisiblePositionHook()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 10
    .line 11
    iget-object v1, v1, Ll/qzz;->n1:Ll/iwl;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/iwl;->getLastVisiblePositionHook()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr v1, v0

    .line 18
    :goto_0
    if-ltz v1, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 21
    .line 22
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ll/iwl;->C(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v2, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 29
    .line 30
    iget-object v2, v2, Ll/yxz;->Q1:Ll/q800;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    iget-object v2, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 35
    .line 36
    iget-object v2, v2, Ll/yxz;->Q1:Ll/q800;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/q800;->g()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-ne v0, v2, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 45
    .line 46
    iget-object v2, v0, Ll/yxz;->Q1:Ll/q800;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/q800;->u()Lv/VDraweeView;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v0, v2}, Ll/yxz;->y3(Ll/yxz;Landroid/view/View;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-static {}, Ll/w600;->h()Ll/w600;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 63
    .line 64
    invoke-static {v1}, Ll/yxz;->C3(Ll/yxz;)Ll/clz;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Ll/tvz;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "headView"

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Ll/w600;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Ll/w600;->h()Ll/w600;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v1, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 84
    .line 85
    invoke-static {v1}, Ll/yxz;->D3(Ll/yxz;)Ll/clz;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Ll/tvz;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object v3, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 96
    .line 97
    iget-object v3, v3, Ll/yxz;->Q1:Ll/q800;

    .line 98
    .line 99
    invoke-virtual {v3}, Ll/q800;->w()Landroid/widget/FrameLayout;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget-object p0, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 104
    .line 105
    iget-object p0, p0, Ll/yxz;->Q1:Ll/q800;

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/q800;->u()Lv/VDraweeView;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/w600;->p(Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_0
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 116
    .line 117
    if-eqz v2, :cond_1

    .line 118
    .line 119
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 120
    .line 121
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M:Lv/VDraweeView;

    .line 122
    .line 123
    iget-object v3, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 124
    .line 125
    invoke-static {v3, v2}, Ll/yxz;->y3(Ll/yxz;Landroid/view/View;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_1

    .line 130
    .line 131
    invoke-static {}, Ll/w600;->h()Ll/w600;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iget-object p0, p0, Ll/yxz$g;->a:Ll/yxz;

    .line 136
    .line 137
    invoke-static {p0}, Ll/yxz;->E3(Ll/yxz;)Ll/clz;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Ll/tvz;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->getMessageId()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v1, p0, v2}, Ll/w600;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->W0()V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_2
    return-void
.end method
