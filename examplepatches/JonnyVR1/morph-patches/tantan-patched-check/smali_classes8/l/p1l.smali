.class public final synthetic Ll/p1l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

.field public final synthetic b:I

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p1l;->a:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

    iput p2, p0, Ll/p1l;->b:I

    iput-object p3, p0, Ll/p1l;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p1l;->a:Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;

    iget v1, p0, Ll/p1l;->b:I

    iget-object p0, p0, Ll/p1l;->c:Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;->s(Lcom/p1/mobile/putong/core/ui/helpcenter/HelpCenterFrag$c;ILandroid/view/View;Landroid/view/View;)V

    return-void
.end method
