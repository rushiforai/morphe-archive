.class public final synthetic Ll/es50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/gs50;

.field public final synthetic b:Ll/l4g0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;


# direct methods
.method public synthetic constructor <init>(Ll/gs50;Ll/l4g0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es50;->a:Ll/gs50;

    iput-object p2, p0, Ll/es50;->b:Ll/l4g0;

    iput-object p3, p0, Ll/es50;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/es50;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/es50;->e:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/es50;->a:Ll/gs50;

    iget-object v1, p0, Ll/es50;->b:Ll/l4g0;

    iget-object v2, p0, Ll/es50;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/es50;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/es50;->e:Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/gs50;->u(Ll/gs50;Ll/l4g0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;Landroid/content/DialogInterface;)V

    return-void
.end method
