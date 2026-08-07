.class public final synthetic Ll/kgl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lgl0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;


# direct methods
.method public synthetic constructor <init>(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kgl0;->a:Ll/lgl0;

    iput-object p2, p0, Ll/kgl0;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kgl0;->a:Ll/lgl0;

    iget-object p0, p0, Ll/kgl0;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    invoke-static {v0, p0, p1}, Ll/lgl0;->g(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V

    return-void
.end method
