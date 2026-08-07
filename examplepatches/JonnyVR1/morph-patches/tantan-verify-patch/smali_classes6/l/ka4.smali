.class public final synthetic Ll/ka4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public final synthetic b:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ka4;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    iput-object p2, p0, Ll/ka4;->b:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ka4;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    iget-object p0, p0, Ll/ka4;->b:Landroid/view/View$OnClickListener;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
