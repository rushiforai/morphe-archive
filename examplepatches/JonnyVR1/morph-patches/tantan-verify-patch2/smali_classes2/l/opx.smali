.class public final synthetic Ll/opx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rpx;

.field public final synthetic b:Landroid/widget/ImageButton;

.field public final synthetic c:Landroid/widget/ImageButton;


# direct methods
.method public synthetic constructor <init>(Ll/rpx;Landroid/widget/ImageButton;Landroid/widget/ImageButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opx;->a:Ll/rpx;

    iput-object p2, p0, Ll/opx;->b:Landroid/widget/ImageButton;

    iput-object p3, p0, Ll/opx;->c:Landroid/widget/ImageButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/opx;->a:Ll/rpx;

    iget-object v1, p0, Ll/opx;->b:Landroid/widget/ImageButton;

    iget-object p0, p0, Ll/opx;->c:Landroid/widget/ImageButton;

    invoke-static {v0, v1, p0, p1}, Ll/rpx;->k(Ll/rpx;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/view/View;)V

    return-void
.end method
