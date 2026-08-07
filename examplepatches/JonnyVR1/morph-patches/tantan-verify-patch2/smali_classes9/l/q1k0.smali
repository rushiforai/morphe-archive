.class public final synthetic Ll/q1k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p2k0;


# direct methods
.method public synthetic constructor <init>(Ll/p2k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q1k0;->a:Ll/p2k0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1k0;->a:Ll/p2k0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h0(Ll/p2k0;Landroid/view/View;)V

    return-void
.end method
