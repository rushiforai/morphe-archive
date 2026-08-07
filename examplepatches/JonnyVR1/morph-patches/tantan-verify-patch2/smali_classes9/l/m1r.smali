.class public final synthetic Ll/m1r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/w0r$l;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1r;->a:Ll/w0r$l;

    iput-object p2, p0, Ll/m1r;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p3, p0, Ll/m1r;->c:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m1r;->a:Ll/w0r$l;

    iget-object v1, p0, Ll/m1r;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/m1r;->c:Landroid/widget/FrameLayout;

    invoke-static {v0, v1, p0, p1}, Ll/w0r$l;->y(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/FrameLayout;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
