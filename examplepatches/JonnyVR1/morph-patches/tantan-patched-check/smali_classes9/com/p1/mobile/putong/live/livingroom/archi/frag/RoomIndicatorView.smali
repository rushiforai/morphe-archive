.class public Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tgd0;->a(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(ZLl/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->c()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->c()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->c:Lv/VText;

    .line 31
    .line 32
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 33
    .line 34
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->aa:I

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->e:Lv/VText;

    .line 45
    .line 46
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 47
    .line 48
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->aa:I

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->c:Lv/VText;

    .line 13
    .line 14
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tc:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->e:Lv/VText;

    .line 26
    .line 27
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->nc:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->d:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->c:Lv/VText;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->fj:I

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->e:Lv/VText;

    .line 24
    .line 25
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Oi:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 38
    .line 39
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tc:I

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->e:Lv/VText;

    .line 49
    .line 50
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 51
    .line 52
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Oi:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
