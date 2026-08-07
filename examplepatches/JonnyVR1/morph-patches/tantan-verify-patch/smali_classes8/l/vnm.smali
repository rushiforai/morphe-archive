.class public final synthetic Ll/vnm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public final synthetic d:Ll/snm;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vnm;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    iput-object p2, p0, Ll/vnm;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/vnm;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    iput-object p4, p0, Ll/vnm;->d:Ll/snm;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vnm;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    iget-object v1, p0, Ll/vnm;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/vnm;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    iget-object p0, p0, Ll/vnm;->d:Ll/snm;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->j(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/snm;Landroid/view/View;)V

    return-void
.end method
