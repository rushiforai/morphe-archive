.class public final synthetic Ll/bhg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lag;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;


# direct methods
.method public synthetic constructor <init>(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bhg;->a:Ll/lag;

    iput-object p2, p0, Ll/bhg;->b:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bhg;->a:Ll/lag;

    iget-object p0, p0, Ll/bhg;->b:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h0(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;Landroid/view/View;)V

    return-void
.end method
