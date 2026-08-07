.class public final synthetic Ll/oz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pz2;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;

.field public final synthetic c:Lcom/p1/mobile/putong/data/CommonData;


# direct methods
.method public synthetic constructor <init>(Ll/pz2;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oz2;->a:Ll/pz2;

    iput-object p2, p0, Ll/oz2;->b:Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;

    iput-object p3, p0, Ll/oz2;->c:Lcom/p1/mobile/putong/data/CommonData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oz2;->a:Ll/pz2;

    iget-object v1, p0, Ll/oz2;->b:Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;

    iget-object p0, p0, Ll/oz2;->c:Lcom/p1/mobile/putong/data/CommonData;

    invoke-static {v0, v1, p0, p1}, Ll/pz2;->i(Ll/pz2;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;Landroid/view/View;)V

    return-void
.end method
