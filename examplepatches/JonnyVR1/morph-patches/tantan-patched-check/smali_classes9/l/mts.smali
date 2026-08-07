.class public final synthetic Ll/mts;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;

.field public final synthetic b:Ll/lsw$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;Ll/lsw$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mts;->a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;

    iput-object p2, p0, Ll/mts;->b:Ll/lsw$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mts;->a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;

    iget-object p0, p0, Ll/mts;->b:Ll/lsw$a;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->Q(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;Ll/lsw$a;)V

    return-void
.end method
