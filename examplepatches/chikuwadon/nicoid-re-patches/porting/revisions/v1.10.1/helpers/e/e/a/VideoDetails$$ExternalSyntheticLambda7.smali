.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field public final synthetic f$0:Le/e/a/VideoDetails$LikeIcon;


# direct methods
.method public synthetic constructor <init>(Le/e/a/VideoDetails$LikeIcon;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$0:Le/e/a/VideoDetails$LikeIcon;

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;->f$0:Le/e/a/VideoDetails$LikeIcon;

    invoke-static {v0}, Le/e/a/VideoDetails;->lambda$11(Le/e/a/VideoDetails$LikeIcon;)Z

    move-result v0

    return v0
.end method
