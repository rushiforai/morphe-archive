.class public final synthetic Ll/rwr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;

.field public final synthetic b:Ll/pwr$a;

.field public final synthetic c:Ll/d3q;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;Ll/pwr$a;Ll/d3q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rwr;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;

    iput-object p2, p0, Ll/rwr;->b:Ll/pwr$a;

    iput-object p3, p0, Ll/rwr;->c:Ll/d3q;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rwr;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;

    iget-object v1, p0, Ll/rwr;->b:Ll/pwr$a;

    iget-object p0, p0, Ll/rwr;->c:Ll/d3q;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;Ll/pwr$a;Ll/d3q;Landroid/view/View;)V

    return-void
.end method
