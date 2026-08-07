.class public final synthetic Ll/z6t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z6t;->a:Landroid/view/View;

    iput-object p2, p0, Ll/z6t;->b:Landroid/view/View;

    iput-object p3, p0, Ll/z6t;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z6t;->a:Landroid/view/View;

    iget-object v1, p0, Ll/z6t;->b:Landroid/view/View;

    iget-object p0, p0, Ll/z6t;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->b(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
