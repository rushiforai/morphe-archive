.class public final synthetic Ll/bha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bha0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    iput-object p2, p0, Ll/bha0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/bha0;->c:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bha0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    iget-object v1, p0, Ll/bha0;->b:Landroid/view/View;

    iget-object p0, p0, Ll/bha0;->c:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->T4(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
