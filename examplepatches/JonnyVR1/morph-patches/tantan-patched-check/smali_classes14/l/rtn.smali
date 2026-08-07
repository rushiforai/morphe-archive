.class public final synthetic Ll/rtn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rtn;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

    iput p2, p0, Ll/rtn;->b:I

    iput p3, p0, Ll/rtn;->c:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rtn;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

    iget v1, p0, Ll/rtn;->b:I

    iget p0, p0, Ll/rtn;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;->P(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;IILandroid/animation/ValueAnimator;)V

    return-void
.end method
