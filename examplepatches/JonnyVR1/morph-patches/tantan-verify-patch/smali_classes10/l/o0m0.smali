.class public Ll/o0m0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;


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


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/p0m0;->b(Ll/o0m0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;)Landroid/view/View;
    .locals 4
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ll/o0m0;->c(Landroid/content/Context;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/o0m0;->e:Landroid/widget/TextView;

    .line 6
    .line 7
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->desc:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/o0m0;->d:Landroid/widget/TextView;

    .line 13
    .line 14
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->title:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/o0m0;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->icon:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->svga:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->bgStartColor:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->bgEndColor:Ljava/lang/String;

    .line 31
    .line 32
    const/16 v2, 0xa

    .line 33
    .line 34
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->BL_TR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 35
    .line 36
    invoke-static {v0, v1, v2, v3}, Ll/gc2;->c(Ljava/lang/String;Ljava/lang/String;ILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->bgStartColor:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->bgEndColor:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    const-string v2, "#08FFFFFF"

    .line 53
    .line 54
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    filled-new-array {v1, p2, v2}, [I

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/o0m0;->b:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    return-object p1
.end method

.method public c(Landroid/content/Context;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/o0m0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
