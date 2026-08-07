.class public final synthetic Ll/sr50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gs50;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;


# direct methods
.method public synthetic constructor <init>(Ll/gs50;Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sr50;->a:Ll/gs50;

    iput-object p2, p0, Ll/sr50;->b:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sr50;->a:Ll/gs50;

    iget-object p0, p0, Ll/sr50;->b:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/gs50;->l(Ll/gs50;Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Ljava/lang/String;)V

    return-void
.end method
