.class public Ll/yhn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/FrameLayout;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/xhn0;


# direct methods
.method public constructor <init>(Ll/xhn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yhn0;->a:Ll/xhn0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Landroid/widget/FrameLayout;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->I:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    sget v1, Ll/mdc0;->N6:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/TextView;

    .line 19
    .line 20
    sget v2, Ll/mdc0;->K:I

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sget v3, Ll/mdc0;->J:I

    .line 27
    .line 28
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v3, p0, Ll/yhn0;->a:Ll/xhn0;

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/xhn0;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    iget-object v4, p0, Ll/yhn0;->a:Ll/xhn0;

    .line 41
    .line 42
    invoke-virtual {v4}, Ll/xhn0;->a()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/yhn0;->a:Ll/xhn0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xhn0;->a()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeItem;->icon:Ljava/lang/String;

    .line 58
    .line 59
    const-string v4, "context_livingAct"

    .line 60
    .line 61
    invoke-static {v4, v0, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    if-eqz v3, :cond_0

    .line 65
    .line 66
    sget p0, Ll/n9c0;->p0:I

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    sget p0, Ll/n9c0;->m1:I

    .line 70
    .line 71
    :goto_0
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Wa:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yhn0;->H(Landroid/widget/FrameLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
