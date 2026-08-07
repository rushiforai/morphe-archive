.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lyo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 14

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->c:Lv/VImage;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    const/high16 v4, 0x42100000    # 36.0f

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->b:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 19
    .line 20
    .line 21
    move-result v8

    .line 22
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 23
    .line 24
    .line 25
    move-result v9

    .line 26
    invoke-static {}, Ll/irn;->a()Z

    .line 27
    .line 28
    .line 29
    move-result v12

    .line 30
    const/4 v13, 0x0

    .line 31
    const-string v5, "context_single_room"

    .line 32
    .line 33
    const/4 v10, 0x1

    .line 34
    const/4 v11, 0x0

    .line 35
    move-object v7, p1

    .line 36
    invoke-static/range {v5 .. v13}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    :goto_0
    if-nez p3, :cond_1

    .line 44
    .line 45
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->a:Lv/VImage;

    .line 52
    .line 53
    sget v1, Ll/qa00;->f:I

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->a:Lv/VImage;

    .line 59
    .line 60
    sget v1, Ll/obc0;->qa:I

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->e:Lv/VImage;

    .line 66
    .line 67
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->d:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 77
    .line 78
    .line 79
    move-result v9

    .line 80
    invoke-static {}, Ll/irn;->a()Z

    .line 81
    .line 82
    .line 83
    move-result v12

    .line 84
    const/4 v13, 0x0

    .line 85
    const-string v5, "context_single_room"

    .line 86
    .line 87
    const/4 v10, 0x1

    .line 88
    const/4 v11, 0x0

    .line 89
    move-object/from16 v7, p2

    .line 90
    .line 91
    invoke-static/range {v5 .. v13}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->e:Lv/VImage;

    .line 96
    .line 97
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->a:Lv/VImage;

    .line 101
    .line 102
    sget v1, Ll/qa00;->m:I

    .line 103
    .line 104
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->a:Lv/VImage;

    .line 108
    .line 109
    sget v0, Ll/obc0;->la:I

    .line 110
    .line 111
    invoke-static {p0, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
