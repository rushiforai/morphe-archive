.class public Ll/chh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/chh$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ygh;",
        ">;"
    }
.end annotation


# static fields
.field public static final m:I

.field public static final n:I

.field public static final o:I

.field public static final p:I

.field public static final q:I

.field public static final r:I

.field public static final s:I

.field public static final t:I

.field public static final u:I

.field public static final v:I

.field public static final w:I


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Lv/VRelative;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Landroidx/recyclerview/widget/RecyclerView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Ll/ygh;

.field public j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

.field public k:Ll/rzh;

.field public l:Ll/h80;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sput v1, Ll/chh;->m:I

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Ll/chh;->n:I

    .line 14
    .line 15
    const/high16 v2, 0x41b00000    # 22.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sput v2, Ll/chh;->o:I

    .line 22
    .line 23
    const/high16 v3, 0x41300000    # 11.0f

    .line 24
    .line 25
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    sput v3, Ll/chh;->p:I

    .line 30
    .line 31
    const/high16 v4, 0x41a00000    # 20.0f

    .line 32
    .line 33
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    sput v4, Ll/chh;->q:I

    .line 38
    .line 39
    div-int/lit8 v5, v0, 0x2

    .line 40
    .line 41
    sub-int/2addr v4, v5

    .line 42
    sput v4, Ll/chh;->r:I

    .line 43
    .line 44
    const/high16 v4, 0x42500000    # 52.0f

    .line 45
    .line 46
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    sput v4, Ll/chh;->s:I

    .line 51
    .line 52
    div-int/lit8 v1, v1, 0x2

    .line 53
    .line 54
    sput v1, Ll/chh;->t:I

    .line 55
    .line 56
    div-int/lit8 v0, v0, 0x2

    .line 57
    .line 58
    sput v0, Ll/chh;->u:I

    .line 59
    .line 60
    sub-int/2addr v2, v1

    .line 61
    sput v2, Ll/chh;->v:I

    .line 62
    .line 63
    sub-int/2addr v3, v1

    .line 64
    sput v3, Ll/chh;->w:I

    .line 65
    .line 66
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/chh$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/chh$a;-><init>(Ll/chh;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/chh;->l:Ll/h80;

    .line 10
    .line 11
    iput-object p1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/chh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/chh;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/chh;Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/chh;->u(Lcom/p1/mobile/putong/data/Emotion;)V

    return-void
.end method

.method public static synthetic c(Ll/chh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/chh;->s(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/chh;)Ll/rzh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/chh;->k:Ll/rzh;

    return-object p0
.end method

.method public static bridge synthetic e()I
    .locals 1

    .line 1
    sget v0, Ll/chh;->u:I

    return v0
.end method

.method public static bridge synthetic f()I
    .locals 1

    .line 1
    sget v0, Ll/chh;->t:I

    return v0
.end method

.method public static bridge synthetic i()I
    .locals 1

    .line 1
    sget v0, Ll/chh;->w:I

    return v0
.end method

.method public static bridge synthetic j()I
    .locals 1

    .line 1
    sget v0, Ll/chh;->v:I

    return v0
.end method

.method private n()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->i:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 9
    .line 10
    const-string v2, "userState"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 16
    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->finish()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private p()V
    .locals 4

    .line 1
    new-instance v0, Ll/rzh;

    .line 2
    .line 3
    iget-object v1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 4
    .line 5
    const-string v2, "p_moment_fast_state_post"

    .line 6
    .line 7
    iget-object v3, p0, Ll/chh;->l:Ll/h80;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/rzh;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/h80;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/chh;->k:Ll/rzh;

    .line 13
    .line 14
    new-instance v1, Ll/bhh;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/bhh;-><init>(Ll/chh;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/rzh;->N(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/chh;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/chh;->k:Ll/rzh;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/chh;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    new-instance v1, Ll/chh$c;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/chh$c;-><init>(Ll/chh;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/chh;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    sget v1, Ll/chh;->r:I

    .line 42
    .line 43
    sget v2, Ll/chh;->s:I

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 50
    .line 51
    iget-object v1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/chh$b;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/chh$b;-><init>(Ll/chh;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/chh;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/chh;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/chh;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_state_clear"

    .line 2
    .line 3
    const-string v0, "p_moment_fast_state_post"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->i:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 12
    .line 13
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/chh;->n()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ygh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/chh;->l(Ll/ygh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/chh;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/chh;->e:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const/4 v0, 0x1

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p2, p0, Ll/chh;->g:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-direct {p0}, Ll/chh;->p()V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/chh;->e:Lv/VText;

    .line 32
    .line 33
    const-string v0, "\u6b64\u523b\u72b6\u6001"

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Ll/chh;->h:Lv/VText;

    .line 39
    .line 40
    new-instance v0, Ll/zgh;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/zgh;-><init>(Ll/chh;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/chh;->g:Lv/VText;

    .line 49
    .line 50
    new-instance v0, Ll/ahh;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/ahh;-><init>(Ll/chh;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-object p1
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dhh;->b(Ll/chh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/ygh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/chh;->i:Ll/ygh;

    .line 2
    .line 3
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/chh;->k:Ll/rzh;

    .line 2
    .line 3
    iget-object p0, p0, Ll/chh;->i:Ll/ygh;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ygh;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/rzh;->M(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v1, "state_id"

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    filled-new-array {v0}, [Ll/tfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "e_confirm"

    .line 21
    .line 22
    const-string v2, "p_moment_fast_state_post"

    .line 23
    .line 24
    invoke-static {v1, v2, v0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 37
    .line 38
    new-instance v1, Lcom/p1/mobile/putong/data/TextTheme;

    .line 39
    .line 40
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 48
    .line 49
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {}, Ll/cmg;->E()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 62
    .line 63
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 64
    .line 65
    :cond_1
    iput-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 66
    .line 67
    iget-object v1, p0, Ll/chh;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 68
    .line 69
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->i:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 70
    .line 71
    invoke-direct {p0}, Ll/chh;->n()V

    .line 72
    .line 73
    .line 74
    return-void
.end method
