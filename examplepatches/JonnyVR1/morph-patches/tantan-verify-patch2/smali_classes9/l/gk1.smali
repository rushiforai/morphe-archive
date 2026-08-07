.class public final synthetic Ll/gk1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iput-object p2, p0, Ll/gk1;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iget-object p0, p0, Ll/gk1;->b:Ll/l4g0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->V(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
