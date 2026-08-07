.class public final synthetic Ll/poi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:I

.field public final synthetic g:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/poi0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

    iput-object p2, p0, Ll/poi0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;

    iput-object p3, p0, Ll/poi0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iput-object p4, p0, Ll/poi0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/poi0;->e:Ljava/lang/String;

    iput p6, p0, Ll/poi0;->f:I

    iput-boolean p7, p0, Ll/poi0;->g:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/poi0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

    iget-object v1, p0, Ll/poi0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;

    iget-object v2, p0, Ll/poi0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iget-object v3, p0, Ll/poi0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/poi0;->e:Ljava/lang/String;

    iget v5, p0, Ll/poi0;->f:I

    iget-boolean v6, p0, Ll/poi0;->g:Z

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->e(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;IZLandroid/view/View;)V

    return-void
.end method
