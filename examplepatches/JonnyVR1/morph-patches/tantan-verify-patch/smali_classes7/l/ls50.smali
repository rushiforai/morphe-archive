.class public final synthetic Ll/ls50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ls50;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

    iput-object p2, p0, Ll/ls50;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ls50;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

    iget-object p0, p0, Ll/ls50;->b:Ll/x20;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->Q(Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Ll/x20;Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method
