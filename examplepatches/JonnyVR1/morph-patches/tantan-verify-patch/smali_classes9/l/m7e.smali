.class public final synthetic Ll/m7e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r7e;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;


# direct methods
.method public synthetic constructor <init>(Ll/r7e;ZLcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m7e;->a:Ll/r7e;

    iput-boolean p2, p0, Ll/m7e;->b:Z

    iput-object p3, p0, Ll/m7e;->c:Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m7e;->a:Ll/r7e;

    iget-boolean v1, p0, Ll/m7e;->b:Z

    iget-object p0, p0, Ll/m7e;->c:Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;

    invoke-static {v0, v1, p0, p1}, Ll/r7e;->I(Ll/r7e;ZLcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;Landroid/view/View;)V

    return-void
.end method
