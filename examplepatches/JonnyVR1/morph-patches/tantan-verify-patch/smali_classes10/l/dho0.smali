.class public Ll/dho0;
.super Ll/ic3;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ic3<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public l:Ll/jc3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/jc3<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/CharSequence;",
            "II",
            "Ljava/lang/String;",
            "Ll/jc3<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/ic3;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p6, p0, Ll/dho0;->l:Ll/jc3;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public O(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/ic3;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/ic3;->d:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->setImageRes(I)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/ic3;->e:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/ic3;->e:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->setImageUrl(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->e:Landroid/widget/TextView;

    .line 26
    .line 27
    sget v1, Ll/n9c0;->m1:I

    .line 28
    .line 29
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->e:Landroid/widget/TextView;

    .line 37
    .line 38
    const/high16 v1, 0x41400000    # 12.0f

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/ic3;->f:Ljava/lang/CharSequence;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/dho0;->l:Ll/jc3;

    .line 49
    .line 50
    invoke-interface {v0}, Ll/jc3;->E()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object v1, p0, Ll/dho0;->l:Ll/jc3;

    .line 55
    .line 56
    if-lez v0, :cond_2

    .line 57
    .line 58
    invoke-interface {v1}, Ll/jc3;->E()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->b(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-interface {v1}, Ll/jc3;->l1()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->g0(Z)V

    .line 71
    .line 72
    .line 73
    :goto_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const/high16 v1, 0x42aa0000    # 85.0f

    .line 78
    .line 79
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    sub-int/2addr v0, v1

    .line 84
    int-to-float v0, v0

    .line 85
    const/high16 v1, 0x40800000    # 4.0f

    .line 86
    .line 87
    div-float/2addr v0, v1

    .line 88
    float-to-int v0, v0

    .line 89
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->a:Lv/VFrame;

    .line 90
    .line 91
    const/4 v2, 0x2

    .line 92
    new-array v2, v2, [Landroid/view/View;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    aput-object p1, v2, v3

    .line 96
    .line 97
    const/4 v3, 0x1

    .line 98
    aput-object v1, v2, v3

    .line 99
    .line 100
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    iget p0, p0, Ll/ic3;->k:I

    .line 104
    .line 105
    if-lez p0, :cond_3

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;->e:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    :cond_3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dho0;->O(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomVoicePlayItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
