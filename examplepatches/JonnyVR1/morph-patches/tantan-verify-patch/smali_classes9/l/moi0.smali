.class public final synthetic Ll/moi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/moi0;->a:Z

    iput-object p2, p0, Ll/moi0;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iput-object p3, p0, Ll/moi0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    iput p4, p0, Ll/moi0;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/moi0;->a:Z

    iget-object v1, p0, Ll/moi0;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iget-object v2, p0, Ll/moi0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    iget p0, p0, Ll/moi0;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->d(ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;ILandroid/view/View;)V

    return-void
.end method
