.class public final synthetic Ll/obf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/obf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iput-object p2, p0, Ll/obf0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/obf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iget-object p0, p0, Ll/obf0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Landroid/view/View;)V

    return-void
.end method
