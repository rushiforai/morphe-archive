.class public final synthetic Ll/k3c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/i1c0;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/i1c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k3c0;->a:Ll/y20;

    iput-object p2, p0, Ll/k3c0;->b:Ll/i1c0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k3c0;->a:Ll/y20;

    iget-object p0, p0, Ll/k3c0;->b:Ll/i1c0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/secondfloor/item/QuickChatLoftChatItem;->c(Ll/y20;Ll/i1c0;Landroid/view/View;)V

    return-void
.end method
