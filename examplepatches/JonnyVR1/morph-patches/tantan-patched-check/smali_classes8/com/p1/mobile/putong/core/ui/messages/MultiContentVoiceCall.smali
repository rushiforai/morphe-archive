.class public Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/nr10;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;
    }
.end annotation


# static fields
.field public static m:Ljava/lang/String; = "media_first"

.field public static n:Ljava/lang/String; = "media_second"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Landroid/view/View;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->l:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/or10;->a(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getMediaCameraView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->g:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaIntimateQuestionView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaLocationView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->d:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaMildQuestionView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaPictureView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->j:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaVideoView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaVoiceCall()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->i:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/qec0;->n3:I

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b:Landroidx/viewpager/widget/ViewPager;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/qec0;->o3:I

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b:Landroidx/viewpager/widget/ViewPager;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->l:Landroid/view/View;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 45
    .line 46
    sget v1, Ll/edc0;->T1:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->d:Landroid/view/View;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 55
    .line 56
    sget v1, Ll/edc0;->z1:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->e:Landroid/view/View;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 65
    .line 66
    sget v1, Ll/edc0;->p2:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->f:Landroid/view/View;

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 75
    .line 76
    sget v1, Ll/edc0;->F:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->g:Landroid/view/View;

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 85
    .line 86
    sget v1, Ll/edc0;->j3:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->j:Landroid/view/View;

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->k:Landroid/view/View;

    .line 95
    .line 96
    sget v1, Ll/edc0;->x5:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->i:Landroid/view/View;

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->l:Landroid/view/View;

    .line 105
    .line 106
    sget v1, Ll/edc0;->t5:I

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->h:Landroid/view/View;

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b:Landroidx/viewpager/widget/ViewPager;

    .line 115
    .line 116
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->c:Lv/VPagerCircleIndicator;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b:Landroidx/viewpager/widget/ViewPager;

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method
