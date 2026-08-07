.class public final synthetic Ll/g25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g25;->a:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g25;->a:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    invoke-static {p0, p1}, Ll/i25;->b(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;Landroid/content/DialogInterface;)V

    return-void
.end method
