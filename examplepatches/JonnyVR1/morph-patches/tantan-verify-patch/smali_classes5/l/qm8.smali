.class public final synthetic Ll/qm8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qm8;->a:Ll/x20;

    iput-object p2, p0, Ll/qm8;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qm8;->a:Ll/x20;

    iget-object p0, p0, Ll/qm8;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->e1(Ll/x20;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
