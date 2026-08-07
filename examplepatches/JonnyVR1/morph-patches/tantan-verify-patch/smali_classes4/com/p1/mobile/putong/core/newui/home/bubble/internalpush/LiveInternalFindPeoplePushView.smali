.class Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalFindPeoplePushView;
.super Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    return-void
.end method

.method public getHideAnim()Landroid/animation/Animator;
    .locals 5

    .line 1
    const/high16 v0, 0x42700000    # 60.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    neg-int v0, v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v2, v1, [F

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    aput v4, v2, v3

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    aput v0, v2, v3

    .line 18
    .line 19
    const-string v0, "translationY"

    .line 20
    .line 21
    invoke-static {p0, v0, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-array v1, v1, [F

    .line 26
    .line 27
    fill-array-data v1, :array_0

    .line 28
    .line 29
    .line 30
    const-string v2, "alpha"

    .line 31
    .line 32
    invoke-static {p0, v2, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {v0, p0}, [Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-wide/16 v0, 0x190

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    nop

    .line 51
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getShowAnim()Landroid/animation/Animator;
    .locals 4

    .line 1
    const/high16 v0, 0x42700000    # 60.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    neg-int v0, v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v2, v1, [F

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput v0, v2, v3

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    aput v3, v2, v0

    .line 18
    .line 19
    const-string v0, "translationY"

    .line 20
    .line 21
    invoke-static {p0, v0, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-array v1, v1, [F

    .line 26
    .line 27
    fill-array-data v1, :array_0

    .line 28
    .line 29
    .line 30
    const-string v2, "alpha"

    .line 31
    .line 32
    invoke-static {p0, v2, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {v0, p0}, [Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-wide/16 v0, 0x190

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    nop

    .line 51
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
