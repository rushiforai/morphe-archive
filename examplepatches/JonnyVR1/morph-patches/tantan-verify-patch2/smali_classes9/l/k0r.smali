.class public final synthetic Ll/k0r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/h0r;


# direct methods
.method public synthetic constructor <init>(Ll/h0r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0r;->a:Ll/h0r;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0r;->a:Ll/h0r;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->b(Ll/h0r;Landroid/view/View;)V

    return-void
.end method
