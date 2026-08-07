.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final c:I


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x43000000    # 128.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;->c:I

    .line 8
    .line 9
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

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sx2;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;->show:Z

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;->b:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;->icon:Ljava/lang/String;

    .line 11
    .line 12
    sget v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;->c:I

    .line 13
    .line 14
    const-string v1, "context_livingAct"

    .line 15
    .line 16
    invoke-static {v1, p0, p1, v0, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/BigMedal;->a:Lv/VDraweeView;

    .line 8
    .line 9
    sget-object v0, Ll/zft;->h:Ljava/lang/String;

    .line 10
    .line 11
    const/high16 v1, 0x43260000    # 166.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v3, "context_livingAct"

    .line 22
    .line 23
    invoke-static {v3, p0, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
