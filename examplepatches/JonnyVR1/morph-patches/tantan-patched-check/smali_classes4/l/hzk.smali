.class public final synthetic Ll/hzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pzk;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/UserLiveState;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pzk;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hzk;->a:Ll/pzk;

    iput-object p2, p0, Ll/hzk;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/hzk;->c:Lcom/p1/mobile/putong/data/UserLiveState;

    iput-object p4, p0, Ll/hzk;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hzk;->a:Ll/pzk;

    iget-object v1, p0, Ll/hzk;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/hzk;->c:Lcom/p1/mobile/putong/data/UserLiveState;

    iget-object p0, p0, Ll/hzk;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pzk;->M(Ll/pzk;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
