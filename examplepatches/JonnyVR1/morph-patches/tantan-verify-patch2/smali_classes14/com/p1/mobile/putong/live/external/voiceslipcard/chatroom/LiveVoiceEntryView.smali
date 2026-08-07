.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/v5v;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

.field public c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

.field public d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

.field public e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

.field public f:Lv/VFrame;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Ll/v5v;

.field public j:Ll/j0v;

.field public k:Ll/x20;

.field public l:Landroid/animation/AnimatorSet;

.field public m:Ll/kcg0;

.field public n:Ll/kcg0;

.field public o:Z

.field public p:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    return-void
.end method

.method private F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->k:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->k:Ll/x20;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->y(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->w()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Ll/j0v;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->x(Ll/j0v;Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->F()V

    return-void
.end method

.method private j(II)V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-ne p2, v0, :cond_4

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    move v0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    :goto_0
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 17
    .line 18
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    move v0, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move v0, v2

    .line 23
    :goto_1
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    if-ne p1, v0, :cond_2

    .line 30
    .line 31
    move v0, v1

    .line 32
    goto :goto_2

    .line 33
    :cond_2
    move v0, v2

    .line 34
    :goto_2
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    if-ne p1, v0, :cond_3

    .line 41
    .line 42
    move p1, v1

    .line 43
    goto :goto_3

    .line 44
    :cond_3
    move p1, v2

    .line 45
    :goto_3
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->f:Lv/VFrame;

    .line 49
    .line 50
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->g:Lv/VText;

    .line 54
    .line 55
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->h:Lv/VImage;

    .line 59
    .line 60
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    sget p1, Ll/bnl0;->f:I

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->a:Lv/VFrame;

    .line 66
    .line 67
    new-array p2, v1, [Landroid/view/View;

    .line 68
    .line 69
    aput-object p0, p2, v2

    .line 70
    .line 71
    invoke-static {p1, p2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 2
    .line 3
    new-instance v1, Ll/w5v;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w5v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->setOnCloseButtonClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/x5v;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/x5v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private setNumText(I)V
    .locals 1

    .line 1
    const/16 v0, 0x63

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    if-gt p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->g:Lv/VText;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-le p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->g:Lv/VText;

    .line 20
    .line 21
    const-string p1, "99+"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/j0v;->e()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->q(I)Ll/h2v;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->n()V

    .line 31
    .line 32
    .line 33
    invoke-interface {v0}, Ll/h2v;->F()V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->o:Z

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->I()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final B(ILjava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-lez p1, :cond_1

    .line 4
    .line 5
    const-string v2, "number"

    .line 6
    .line 7
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->setNumText(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->G(ZZ)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->G(ZZ)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-string p1, "dot"

    .line 25
    .line 26
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->G(ZZ)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->G(ZZ)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final C(IIZ)V
    .locals 6

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->p(I)Ll/h2v;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->p(I)Ll/h2v;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Q()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;->Q()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;->f0()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;->W()V

    .line 29
    .line 30
    .line 31
    :cond_0
    new-instance v0, Ll/z5v;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/z5v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->k:Ll/x20;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/j0v;->e()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    if-eq v0, v1, :cond_3

    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    if-eq v0, v1, :cond_2

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    if-eq v0, v1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;->R(Ll/j0v;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;->b0(Ll/j0v;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;->Y(Ll/j0v;Ll/v5v;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 87
    .line 88
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->o:Z

    .line 89
    .line 90
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->Y(Ll/j0v;Ll/v5v;Z)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 98
    .line 99
    .line 100
    :cond_5
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 101
    .line 102
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 106
    .line 107
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 108
    .line 109
    const v2, 0x3c23d70a    # 0.01f

    .line 110
    .line 111
    .line 112
    const/high16 v3, 0x3f800000    # 1.0f

    .line 113
    .line 114
    const v4, 0x3ed70a3d    # 0.42f

    .line 115
    .line 116
    .line 117
    const/4 v5, 0x0

    .line 118
    invoke-direct {v1, v4, v5, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 122
    .line 123
    .line 124
    if-eqz p3, :cond_6

    .line 125
    .line 126
    if-eqz p2, :cond_6

    .line 127
    .line 128
    if-eqz p1, :cond_6

    .line 129
    .line 130
    iget-boolean p3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->o:Z

    .line 131
    .line 132
    invoke-interface {p2, p1, p3}, Ll/h2v;->C(Ll/h2v;Z)Landroid/animation/Animator;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->o:Z

    .line 137
    .line 138
    invoke-interface {p1, p2, v0}, Ll/h2v;->E(Ll/h2v;Z)Landroid/animation/Animator;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 143
    .line 144
    filled-new-array {p1, p3}, [Landroid/animation/Animator;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 152
    .line 153
    new-instance p2, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView$a;

    .line 154
    .line 155
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView$a;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_6
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->F()V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E(Ll/j0v;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->m()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/j0v;->e()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->q(I)Ll/h2v;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    sget-object v1, Ll/h2v;->t0:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    sget-object v1, Ll/h2v;->u0:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->H(Ll/j0v;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->H(Ll/j0v;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 60
    .line 61
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->z(Ll/j0v;Ll/j0v;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/j0v;->e()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v2, -0x1

    .line 75
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 76
    .line 77
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Ll/ppi0;->x()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_5

    .line 86
    .line 87
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_5
    invoke-virtual {p1}, Ll/j0v;->e()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-direct {p0, p1, v2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j(II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1, v2, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->C(IIZ)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final G(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->f:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->h:Lv/VImage;

    .line 10
    .line 11
    xor-int/lit8 v0, p2, 0x1

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->g:Lv/VText;

    .line 17
    .line 18
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->h:Lv/VImage;

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->g:Lv/VText;

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final H(Ll/j0v;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->m()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x190

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/a6v;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/a6v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Ll/j0v;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->n:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method

.method public final I()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->n()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0xbb8

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/y5v;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/y5v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->m:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method

.method public J(Ll/j0v;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->o:Z

    .line 3
    .line 4
    invoke-static {p1, v0, p0, p2}, Ll/evo0;->f(Ll/j0v;ZZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->m()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b6v;->a(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v5v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l(Ll/v5v;)V

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

.method public l(Ll/v5v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 2
    .line 3
    return-void
.end method

.method public final m()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->n:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final n()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->m:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->k()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->s(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final p(I)Ll/h2v;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 24
    .line 25
    return-object p0
.end method

.method public final q(I)Ll/h2v;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 24
    .line 25
    return-object p0
.end method

.method public s(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->p:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ll/ss2;->m()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleOne;->Y(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/ss2;->m()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;->O(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 40
    .line 41
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Ll/ss2;->g()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryRead;->R(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 58
    .line 59
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v1}, Ll/ss2;->g()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->R(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->g:Lv/VText;

    .line 76
    .line 77
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v1}, Ll/ss2;->h()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->h:Lv/VImage;

    .line 89
    .line 90
    invoke-static {p1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Ll/ss2;->l()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public setLiveVoiceEntryViewVis(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->J(Ll/j0v;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/v5v;->x0()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->p:Z

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->J(Ll/j0v;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/j0v;->e()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->i:Ll/v5v;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/v5v;->x0()V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j0v;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/j0v;->d()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->B(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x(Ll/j0v;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->E(Ll/j0v;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->I()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->j:Ll/j0v;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/j0v;->e()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->q(I)Ll/h2v;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-interface {p1}, Ll/h2v;->j()V

    .line 28
    .line 29
    .line 30
    :cond_1
    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->o:Z

    .line 32
    .line 33
    return-void
.end method

.method public final z(Ll/j0v;Ll/j0v;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ll/j0v;->e()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p2}, Ll/j0v;->e()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eq p1, p2, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    :cond_1
    return p0
.end method
