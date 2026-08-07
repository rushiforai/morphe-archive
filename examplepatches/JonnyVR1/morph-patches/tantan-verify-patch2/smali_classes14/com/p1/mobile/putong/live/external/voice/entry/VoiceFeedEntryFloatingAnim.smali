.class public Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;,
        Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/Animator;

.field public j:Landroid/animation/Animator;

.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;

.field public m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->e()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k()V

    return-void
.end method

.method private getNextImgUrl()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    rem-int/2addr v0, v1

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m:I

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    iput v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m:I

    .line 25
    .line 26
    return-object v0
.end method


# virtual methods
.method public final b(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final c()Lv/VDraweeView;
    .locals 4

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const v3, 0x106000b

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/high16 v3, 0x40000000    # 2.0f

    .line 31
    .line 32
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    int-to-float v3, v3

    .line 37
    invoke-virtual {v1, v2, v3}, Lcom/facebook/drawee/generic/RoundingParams;->o(IF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/xlj;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {v2, p0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ll/xlj;->a()Ll/wlj;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v2, Ll/mbc0;->u:I

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ll/wlj;->D(I)V

    .line 56
    .line 57
    .line 58
    sget-object v2, Ll/h1e0;->i:Ll/h1e0;

    .line 59
    .line 60
    invoke-virtual {p0, v2}, Ll/wlj;->w(Ll/h1e0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public d(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g()V

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c:I

    .line 8
    .line 9
    if-gtz p1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c:I

    .line 13
    .line 14
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->e:I

    .line 17
    .line 18
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    const/high16 v0, 0x42080000    # 34.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 8
    .line 9
    const/high16 v0, 0x41000000    # 8.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b:I

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->d:I

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c:I

    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;-><init>(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;Ll/cfn0;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->l:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 41
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 48
    .line 49
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b(Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public getChildDrawingOrder(II)I
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lt p2, p1, :cond_0

    .line 8
    .line 9
    return p2

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;

    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->b:I

    .line 19
    .line 20
    return p0
.end method

.method public final h(Landroid/view/View;)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    const-string v2, "alpha"

    .line 8
    .line 9
    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    new-array v0, v0, [F

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aput v2, v0, v3

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    aput v2, v0, v3

    .line 24
    .line 25
    const-string v2, "translationX"

    .line 26
    .line 27
    invoke-static {v2, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0, v1}, [Landroid/animation/PropertyValuesHolder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 40
    .line 41
    const-wide/16 v0, 0x12c

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 47
    .line 48
    const-wide/16 v0, 0xc8

    .line 49
    .line 50
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final i(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    const-string v1, "alpha"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j:Landroid/animation/Animator;

    .line 22
    .line 23
    const-wide/16 v0, 0x1f4

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j:Landroid/animation/Animator;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final j(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    sub-float/2addr v1, v2

    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    add-float/2addr v1, v2

    .line 17
    const/4 v2, 0x2

    .line 18
    new-array v2, v2, [F

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    aput v0, v2, v3

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    aput v1, v2, v0

    .line 25
    .line 26
    const-string v0, "translationX"

    .line 27
    .line 28
    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i:Landroid/animation/Animator;

    .line 41
    .line 42
    const-wide/16 v0, 0x1f4

    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i:Landroid/animation/Animator;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final k()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_6

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto/16 :goto_3

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto/16 :goto_3

    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->e:I

    .line 52
    .line 53
    const/high16 v2, 0x3f800000    # 1.0f

    .line 54
    .line 55
    const-string v3, "context_square"

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    const/4 v5, 0x1

    .line 59
    if-ge v0, v1, :cond_7

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c()Lv/VDraweeView;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->getNextImgUrl()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v3, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    iget v3, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 75
    .line 76
    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 77
    .line 78
    .line 79
    new-instance v3, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;

    .line 80
    .line 81
    const/4 v6, 0x0

    .line 82
    invoke-direct {v3, v6}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;-><init>(Ll/cfn0;)V

    .line 83
    .line 84
    .line 85
    iput-object v0, v3, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 86
    .line 87
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    iput v6, v3, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->a:I

    .line 94
    .line 95
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    iput v6, v3, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->b:I

    .line 102
    .line 103
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-ne v1, v5, :cond_3

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-ne v1, v5, :cond_4

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 133
    .line 134
    iget v2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->d:I

    .line 135
    .line 136
    add-int/2addr v1, v2

    .line 137
    int-to-float v1, v1

    .line 138
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 139
    .line 140
    .line 141
    const/4 v1, 0x0

    .line 142
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h(Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iget v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->e:I

    .line 155
    .line 156
    if-ne v0, v1, :cond_5

    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;

    .line 165
    .line 166
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 167
    .line 168
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i(Landroid/view/View;)V

    .line 169
    .line 170
    .line 171
    :goto_1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c:I

    .line 172
    .line 173
    if-ge v5, v0, :cond_6

    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;

    .line 182
    .line 183
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j(Landroid/view/View;)V

    .line 186
    .line 187
    .line 188
    add-int/lit8 v5, v5, 0x1

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 192
    .line 193
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    sub-int/2addr v0, v5

    .line 198
    if-ge v4, v0, :cond_6

    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;

    .line 207
    .line 208
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j(Landroid/view/View;)V

    .line 211
    .line 212
    .line 213
    add-int/lit8 v4, v4, 0x1

    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_6
    :goto_3
    return-void

    .line 217
    :cond_7
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-ge v4, v0, :cond_a

    .line 224
    .line 225
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g:Ljava/util/ArrayList;

    .line 226
    .line 227
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;

    .line 232
    .line 233
    iget v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->a:I

    .line 234
    .line 235
    iget v6, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c:I

    .line 236
    .line 237
    add-int/2addr v1, v6

    .line 238
    iget v7, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->e:I

    .line 239
    .line 240
    rem-int/2addr v1, v7

    .line 241
    iput v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->a:I

    .line 242
    .line 243
    iget v8, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->b:I

    .line 244
    .line 245
    add-int/2addr v8, v5

    .line 246
    rem-int/2addr v8, v7

    .line 247
    iput v8, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->b:I

    .line 248
    .line 249
    if-ne v1, v6, :cond_8

    .line 250
    .line 251
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 252
    .line 253
    iget v6, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->f:I

    .line 254
    .line 255
    int-to-float v6, v6

    .line 256
    invoke-virtual {v1, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 257
    .line 258
    .line 259
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 260
    .line 261
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 262
    .line 263
    .line 264
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->getNextImgUrl()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    iget-object v6, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 269
    .line 270
    invoke-static {v3, v6, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 274
    .line 275
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->h(Landroid/view/View;)V

    .line 276
    .line 277
    .line 278
    goto :goto_5

    .line 279
    :cond_8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$a;->c:Lv/VDraweeView;

    .line 280
    .line 281
    if-nez v1, :cond_9

    .line 282
    .line 283
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->i(Landroid/view/View;)V

    .line 284
    .line 285
    .line 286
    goto :goto_5

    .line 287
    :cond_9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->j(Landroid/view/View;)V

    .line 288
    .line 289
    .line 290
    :goto_5
    add-int/lit8 v4, v4, 0x1

    .line 291
    .line 292
    goto :goto_4

    .line 293
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 294
    .line 295
    .line 296
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-le v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->l:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;

    .line 23
    .line 24
    const-wide/16 v1, 0x7d0

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->l:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->g()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    move p3, p2

    .line 7
    :goto_0
    if-ge p3, p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    iget p5, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->f:I

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 16
    .line 17
    sub-int v1, p5, v0

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->d:I

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    sub-int/2addr p5, v2

    .line 23
    invoke-virtual {p4, v1, p2, p5, v0}, Landroid/view/View;->layout(IIII)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 p3, p3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->c:I

    .line 2
    .line 3
    iget p2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a:I

    .line 4
    .line 5
    mul-int v0, p1, p2

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->b:I

    .line 10
    .line 11
    mul-int/2addr p1, v1

    .line 12
    sub-int/2addr v0, p1

    .line 13
    iget p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->d:I

    .line 14
    .line 15
    add-int/2addr v0, p1

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->f:I

    .line 17
    .line 18
    invoke-virtual {p0, v0, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setImageUrlList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->k:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
