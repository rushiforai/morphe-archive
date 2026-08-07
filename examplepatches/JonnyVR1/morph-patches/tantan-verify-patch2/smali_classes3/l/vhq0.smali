.class public final synthetic Ll/vhq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;

.field public final synthetic b:Ll/vx0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;Ll/vx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vhq0;->a:Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;

    iput-object p2, p0, Ll/vhq0;->b:Ll/vx0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vhq0;->a:Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;

    iget-object p0, p0, Ll/vhq0;->b:Ll/vx0;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;->L0(Lcom/p1/mobile/putong/safety/WizardUpgradeDialog;Ll/vx0;)V

    return-void
.end method
