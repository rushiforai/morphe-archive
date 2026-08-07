.class public Lcom/p1/mobile/putong/core/newui/home/b$k;
.super Ll/k3l;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/k3l;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/b;->x:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->J6()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/b;->d:Lv/VFrame;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->I1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->H1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->t5()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->Q5(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->s1(Lcom/p1/mobile/putong/core/newui/home/b;)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->n1(Lcom/p1/mobile/putong/core/newui/home/b;)Ll/vql;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Ll/vql;->b()V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->z2()Landroid/widget/FrameLayout;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 75
    .line 76
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/b;->C2()Ll/avl;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-interface {v3}, Ll/avl;->getRealView()Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v3, "child"

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_1

    .line 109
    .line 110
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/b;->z2()Landroid/widget/FrameLayout;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 120
    .line 121
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->E1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_3

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->F2()Landroid/widget/LinearLayout;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_2

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->F2()Landroid/widget/LinearLayout;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->I2()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_3

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$k;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->I2()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    :cond_3
    return-void
.end method
