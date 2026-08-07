.class public final synthetic Ll/hwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bwj;


# direct methods
.method public synthetic constructor <init>(Ll/bwj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hwj;->a:Ll/bwj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwj;->a:Ll/bwj;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->s(Ll/bwj;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
