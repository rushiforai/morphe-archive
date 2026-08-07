.class public Ll/n3p0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/m3p0;Landroid/view/View;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/m3p0;->e:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 14
    .line 15
    iput-object v1, p0, Ll/m3p0;->f:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/widget/LinearLayout;

    .line 23
    .line 24
    iput-object v2, p0, Ll/m3p0;->g:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 37
    .line 38
    iput-object v0, p0, Ll/m3p0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 51
    .line 52
    iput-object p1, p0, Ll/m3p0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 53
    .line 54
    return-void
.end method

.method public static b(Ll/m3p0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->f8:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/n3p0;->a(Ll/m3p0;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
