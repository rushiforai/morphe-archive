.class public final synthetic Ll/ko70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ko70;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ko70;->b:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ko70;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/ko70;->b:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;->h0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;Landroid/view/View;)V

    return-void
.end method
