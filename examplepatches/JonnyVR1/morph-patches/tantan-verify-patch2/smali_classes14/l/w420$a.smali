.class public Ll/w420$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w420;->u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/w420;


# direct methods
.method public constructor <init>(Ll/w420;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w420$a;->a:Ll/w420;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Ll/w420$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w420$a;->j()V

    return-void
.end method


# virtual methods
.method public d(Ll/so0;)V
    .locals 3
    .param p1    # Ll/so0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/wo0;->d(Ll/so0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/w420$a;->a:Ll/w420;

    .line 5
    .line 6
    iget-object p1, p1, Ll/w420;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    new-instance v0, Ll/v420;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/v420;-><init>(Ll/w420$a;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v1, 0x3e8

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic j()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/w420$a;->a:Ll/w420;

    .line 2
    .line 3
    iget-object v1, v0, Ll/w420;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    int-to-float v2, v2

    .line 10
    const/4 v3, 0x2

    .line 11
    new-array v4, v3, [F

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    aput v5, v4, v6

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    aput v2, v4, v5

    .line 19
    .line 20
    const-string v2, "TranslationY"

    .line 21
    .line 22
    invoke-static {v1, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-wide/16 v4, 0x1b58

    .line 27
    .line 28
    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Ll/w420;->e(Ll/w420;Landroid/animation/ObjectAnimator;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/w420$a;->a:Ll/w420;

    .line 36
    .line 37
    invoke-static {v0}, Ll/w420;->d(Ll/w420;)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, -0x1

    .line 42
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/w420$a;->a:Ll/w420;

    .line 46
    .line 47
    invoke-static {v0}, Ll/w420;->d(Ll/w420;)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/w420$a;->a:Ll/w420;

    .line 55
    .line 56
    invoke-static {p0}, Ll/w420;->d(Ll/w420;)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 61
    .line 62
    .line 63
    return-void
.end method
