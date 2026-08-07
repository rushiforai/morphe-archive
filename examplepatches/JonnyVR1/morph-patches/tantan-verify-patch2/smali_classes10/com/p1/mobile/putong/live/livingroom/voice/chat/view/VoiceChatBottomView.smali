.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/rb3;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

.field public b:Lv/VText;

.field public c:Landroid/widget/ImageView;

.field public d:Ll/rb3;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->e(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;)Ll/rb3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->d:Ll/rb3;

    return-object p0
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->d:Ll/rb3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rb3;->N3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->c:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->c:Landroid/widget/ImageView;

    .line 18
    .line 19
    new-instance v1, Ll/n5n0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/n5n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/o5n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ll/rb3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->d:Ll/rb3;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->d:Ll/rb3;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->d:Ll/rb3;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->b:Lv/VText;

    .line 36
    .line 37
    const-string v0, "#66ffffff"

    .line 38
    .line 39
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 47
    .line 48
    sget p1, Ll/qa00;->j:I

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_0
    return-void
.end method

.method public getBubbleHookedView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->b:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rb3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->d(Ll/rb3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
