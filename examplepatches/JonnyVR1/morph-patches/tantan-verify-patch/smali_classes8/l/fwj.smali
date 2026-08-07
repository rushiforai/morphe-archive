.class public final synthetic Ll/fwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/bwj;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/bwj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fwj;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/fwj;->b:Ll/bwj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fwj;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/fwj;->b:Ll/bwj;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->p(Ljava/lang/String;Ll/bwj;Landroid/view/View;)V

    return-void
.end method
