.class public Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VImage;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:Z


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
    const-string p1, "\u8fd8\u5269%s\u53ef\u4ee5\u548c\u6709\u7f18\u7684\u5979\u53d1\u9001\u6d88\u606f"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->i:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "\u8fd8\u5269%s\u53ef\u4ee5\u548c\u6709\u7f18\u7684\u4ed6\u53d1\u9001\u6d88\u606f"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->j:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, ""

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->k:Ljava/lang/String;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->l:Z

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->m:Z

    .line 21
    .line 22
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

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    const-string p1, "\u8fd8\u5269%s\u53ef\u4ee5\u548c\u6709\u7f18\u7684\u5979\u53d1\u9001\u6d88\u606f"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->i:Ljava/lang/String;

    .line 25
    const-string p1, "\u8fd8\u5269%s\u53ef\u4ee5\u548c\u6709\u7f18\u7684\u4ed6\u53d1\u9001\u6d88\u606f"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->j:Ljava/lang/String;

    .line 26
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->k:Ljava/lang/String;

    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->l:Z

    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->m:Z

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

    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    const-string p1, "\u8fd8\u5269%s\u53ef\u4ee5\u548c\u6709\u7f18\u7684\u5979\u53d1\u9001\u6d88\u606f"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->i:Ljava/lang/String;

    .line 31
    const-string p1, "\u8fd8\u5269%s\u53ef\u4ee5\u548c\u6709\u7f18\u7684\u4ed6\u53d1\u9001\u6d88\u606f"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->j:Ljava/lang/String;

    .line 32
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->k:Ljava/lang/String;

    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->l:Z

    const/4 p1, 0x1

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->m:Z

    return-void
.end method

.method private setLeave(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->b:Lv/VImage;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->f:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    xor-int/2addr v1, v2

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ll/r97;->u()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->a:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->h:Lv/VText;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n6q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(J)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v0, p1, v0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->f:Lv/VText;

    .line 11
    .line 12
    if-lez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->setLeave(Z)V

    .line 21
    .line 22
    .line 23
    const-wide/32 v0, 0x36ee80

    .line 24
    .line 25
    .line 26
    cmp-long v2, p1, v0

    .line 27
    .line 28
    if-lez v2, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->i:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    div-long/2addr p1, v0

    .line 38
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, "\u5c0f\u65f6"

    .line 42
    .line 43
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_0
    const-wide/32 v0, 0xea60

    .line 60
    .line 61
    .line 62
    cmp-long v2, p1, v0

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->i:Ljava/lang/String;

    .line 65
    .line 66
    if-lez v2, :cond_1

    .line 67
    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    div-long/2addr p1, v0

    .line 74
    const-wide/16 v0, 0x3c

    .line 75
    .line 76
    rem-long/2addr p1, v0

    .line 77
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p1, "\u5206\u949f"

    .line 81
    .line 82
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-wide/16 v1, 0x3e8

    .line 104
    .line 105
    div-long/2addr p1, v1

    .line 106
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p1, "\u79d2"

    .line 110
    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :cond_2
    const-string p1, "\u5bf9\u65b9\u5df2\u7ecf\u79bb\u5f00\u4e86\u5bf9\u8bdd"

    .line 128
    .line 129
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    const/4 p1, 0x1

    .line 133
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->setLeave(Z)V

    .line 134
    .line 135
    .line 136
    const-string p0, "\u4fe1\u53f7\u5df2\u6d88\u5931"

    .line 137
    .line 138
    return-object p0
.end method

.method public final c(J)[Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const/4 v0, 0x2

    .line 7
    new-array v0, v0, [Ljava/lang/String;

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    cmp-long v1, p1, v1

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/4 v4, 0x0

    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 22
    .line 23
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->setLeave(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->i:Ljava/lang/String;

    .line 31
    .line 32
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->j:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v2, "\uff0c"

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->j:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    :goto_0
    invoke-virtual {p2, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    aput-object p0, v0, v4

    .line 70
    .line 71
    aput-object p1, v0, v3

    .line 72
    .line 73
    return-object v0

    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->f:Lv/VText;

    .line 75
    .line 76
    const-string p2, "\u5bf9\u65b9\u5df2\u7ecf\u79bb\u5f00\u4e86\u5bf9\u8bdd"

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->e:Lv/VText;

    .line 82
    .line 83
    const-string p2, "\u4fe1\u53f7\u5df2\u6d88\u5931"

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->setLeave(Z)V

    .line 89
    .line 90
    .line 91
    const-string p0, "\u4fe1\u53f7\u5df2\u6d88\u5931\uff0c\u5bf9\u65b9\u5df2\u7ecf\u79bb\u5f00\u4e86\u5bf9\u8bdd"

    .line 92
    .line 93
    aput-object p0, v0, v4

    .line 94
    .line 95
    aput-object v2, v0, v3

    .line 96
    .line 97
    return-object v0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->m:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->e:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/r97;->u()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->a:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->h:Lv/VText;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->a:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    const/high16 v1, 0x41a00000    # 20.0f

    .line 45
    .line 46
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->a:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->m:Z

    .line 63
    .line 64
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->m:Z

    .line 65
    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "https://auto.tancdn.com/v1/raw/12065e8a-9ab6-424a-a8cd-a32325e7c33d11.pdf"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v1, -0x1

    .line 87
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {v0}, Ll/r97;->u()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->b:Lv/VImage;

    .line 111
    .line 112
    sget v1, Ll/ibc0;->A0:I

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->a:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    sget v0, Ll/ibc0;->K2:I

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 122
    .line 123
    .line 124
    :cond_2
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/r97;->u()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p6, p7}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->c(J)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 p2, 0x1

    .line 20
    aget-object p3, p1, p2

    .line 21
    .line 22
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->h:Lv/VText;

    .line 27
    .line 28
    const/4 p4, 0x0

    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    aget-object p1, p1, p4

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    aget-object p3, p1, p4

    .line 38
    .line 39
    aget-object p1, p1, p2

    .line 40
    .line 41
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/4 p2, 0x3

    .line 46
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const p4, -0x181e3

    .line 51
    .line 52
    .line 53
    invoke-static {p3, p1, p4, p2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->e:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0, p6, p7}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartbeatNotify;->b(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
