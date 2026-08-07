.class public abstract Ll/l4n0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

.field public c:Lcom/p1/mobile/putong/data/PushMessage;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VText;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/p1/mobile/putong/data/PushMessage;I)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 19
    iput-object p2, p0, Ll/l4n0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    iput p3, p0, Ll/l4n0;->a:I

    .line 21
    invoke-virtual {p0}, Ll/l4n0;->a()V

    .line 22
    invoke-virtual {p0}, Ll/l4n0;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 5
    .line 6
    iput p3, p0, Ll/l4n0;->a:I

    .line 7
    .line 8
    iput-object p2, p0, Ll/l4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/l4n0;->a()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/l4n0;->c()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/ldc0;->D0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lv/VDraweeView;

    .line 10
    .line 11
    iput-object v0, p0, Ll/l4n0;->e:Lv/VDraweeView;

    .line 12
    .line 13
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 14
    .line 15
    sget v1, Ll/ldc0;->o2:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/widget/TextView;

    .line 22
    .line 23
    iput-object v0, p0, Ll/l4n0;->f:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 26
    .line 27
    sget v1, Ll/ldc0;->n2:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lv/VText;

    .line 34
    .line 35
    iput-object v0, p0, Ll/l4n0;->g:Lv/VText;

    .line 36
    .line 37
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 38
    .line 39
    sget v1, Ll/ldc0;->k:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VDraweeView;

    .line 46
    .line 47
    iput-object v0, p0, Ll/l4n0;->h:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 50
    .line 51
    sget v1, Ll/ldc0;->t2:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/widget/TextView;

    .line 58
    .line 59
    iput-object v0, p0, Ll/l4n0;->i:Landroid/widget/TextView;

    .line 60
    .line 61
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 62
    .line 63
    sget v1, Ll/ldc0;->B0:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lv/VImage;

    .line 70
    .line 71
    iput-object v0, p0, Ll/l4n0;->j:Lv/VImage;

    .line 72
    .line 73
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 74
    .line 75
    sget v1, Ll/ldc0;->s2:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lv/VText;

    .line 82
    .line 83
    iput-object v0, p0, Ll/l4n0;->k:Lv/VText;

    .line 84
    .line 85
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 86
    .line 87
    sget v1, Ll/ldc0;->X1:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lv/VText;

    .line 94
    .line 95
    iput-object v0, p0, Ll/l4n0;->m:Lv/VText;

    .line 96
    .line 97
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 98
    .line 99
    sget v1, Ll/ldc0;->W1:I

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Landroid/widget/TextView;

    .line 106
    .line 107
    iput-object v0, p0, Ll/l4n0;->n:Landroid/widget/TextView;

    .line 108
    .line 109
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 110
    .line 111
    sget v1, Ll/ldc0;->i2:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lv/VText;

    .line 118
    .line 119
    iput-object v0, p0, Ll/l4n0;->l:Lv/VText;

    .line 120
    .line 121
    iget-object v0, p0, Ll/l4n0;->d:Landroid/view/View;

    .line 122
    .line 123
    sget v1, Ll/ldc0;->b2:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lv/VText;

    .line 130
    .line 131
    iput-object v0, p0, Ll/l4n0;->o:Lv/VText;

    .line 132
    .line 133
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract c()V
.end method
