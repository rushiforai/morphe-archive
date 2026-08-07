.class public final synthetic Ll/xo1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xo1;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/xo1;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xo1;->a:Landroid/widget/TextView;

    iget-object p0, p0, Ll/xo1;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

    invoke-static {v0, p0}, Ll/yo1;->d(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;)V

    return-void
.end method
