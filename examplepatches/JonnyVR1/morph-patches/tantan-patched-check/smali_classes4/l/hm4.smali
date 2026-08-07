.class public final synthetic Ll/hm4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hm4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hm4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->p(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
