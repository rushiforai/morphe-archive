.class public final synthetic Ll/gy2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hy2;

.field public final synthetic b:Lcom/p1/mobile/putong/data/CommonData;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;


# direct methods
.method public synthetic constructor <init>(Ll/hy2;Lcom/p1/mobile/putong/data/CommonData;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gy2;->a:Ll/hy2;

    iput-object p2, p0, Ll/gy2;->b:Lcom/p1/mobile/putong/data/CommonData;

    iput-object p3, p0, Ll/gy2;->c:Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gy2;->a:Ll/hy2;

    iget-object v1, p0, Ll/gy2;->b:Lcom/p1/mobile/putong/data/CommonData;

    iget-object p0, p0, Ll/gy2;->c:Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;

    invoke-static {v0, v1, p0, p1}, Ll/hy2;->i(Ll/hy2;Lcom/p1/mobile/putong/data/CommonData;Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Landroid/view/View;)V

    return-void
.end method
