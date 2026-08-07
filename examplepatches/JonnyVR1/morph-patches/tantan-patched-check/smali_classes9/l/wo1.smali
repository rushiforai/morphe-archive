.class public final synthetic Ll/wo1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

.field public final synthetic b:I

.field public final synthetic c:Landroid/widget/TextView;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;ILandroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wo1;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

    iput p2, p0, Ll/wo1;->b:I

    iput-object p3, p0, Ll/wo1;->c:Landroid/widget/TextView;

    iput-object p4, p0, Ll/wo1;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wo1;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;

    iget v1, p0, Ll/wo1;->b:I

    iget-object v2, p0, Ll/wo1;->c:Landroid/widget/TextView;

    iget-object p0, p0, Ll/wo1;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/yo1;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;ILandroid/widget/TextView;Ljava/lang/String;)V

    return-void
.end method
