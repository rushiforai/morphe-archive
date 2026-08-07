.class Lio/agora/utils2/internal/CommonUtility$7;
.super Landroid/view/OrientationEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/utils2/internal/CommonUtility;->setupGravityMonitor()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/utils2/internal/CommonUtility;


# direct methods
.method public constructor <init>(Lio/agora/utils2/internal/CommonUtility;Landroid/content/Context;I)V
    .locals 0

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility$7;->this$0:Lio/agora/utils2/internal/CommonUtility;

    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$7;->this$0:Lio/agora/utils2/internal/CommonUtility;

    invoke-virtual {p0, p1}, Lio/agora/utils2/internal/CommonUtility;->checkOrientation(I)I

    return-void
.end method
