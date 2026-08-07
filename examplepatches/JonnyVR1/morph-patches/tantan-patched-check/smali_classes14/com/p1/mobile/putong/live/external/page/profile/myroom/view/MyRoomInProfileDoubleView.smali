.class public Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;

.field public b:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Ll/i420;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/y20;Ll/i420;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h420;->a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ll/i420;Ll/i420;ZLl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i420;",
            "Ll/i420;",
            "Z",
            "Ll/y20<",
            "Ll/i420;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->i0(Ll/i420;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->b:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;

    .line 7
    .line 8
    invoke-virtual {v0, p2, p3}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->i0(Ll/i420;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;

    .line 12
    .line 13
    new-instance v0, Ll/f420;

    .line 14
    .line 15
    invoke-direct {v0, p4, p1}, Ll/f420;-><init>(Ll/y20;Ll/i420;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->b:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;

    .line 22
    .line 23
    new-instance p1, Ll/g420;

    .line 24
    .line 25
    invoke-direct {p1, p4, p2}, Ll/g420;-><init>(Ll/y20;Ll/i420;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
