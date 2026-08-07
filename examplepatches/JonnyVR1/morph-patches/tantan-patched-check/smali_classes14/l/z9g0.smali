.class public final synthetic Ll/z9g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

.field public final synthetic b:Lrx/c;

.field public final synthetic c:Lv/VDraweeView;

.field public final synthetic d:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field public final synthetic e:I

.field public final synthetic f:Lv/VText;

.field public final synthetic g:Ll/q1e;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Lrx/c;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z9g0;->a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    iput-object p2, p0, Ll/z9g0;->b:Lrx/c;

    iput-object p3, p0, Ll/z9g0;->c:Lv/VDraweeView;

    iput-object p4, p0, Ll/z9g0;->d:Landroid/view/animation/AccelerateDecelerateInterpolator;

    iput p5, p0, Ll/z9g0;->e:I

    iput-object p6, p0, Ll/z9g0;->f:Lv/VText;

    iput-object p7, p0, Ll/z9g0;->g:Ll/q1e;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/z9g0;->a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    iget-object v1, p0, Ll/z9g0;->b:Lrx/c;

    iget-object v2, p0, Ll/z9g0;->c:Lv/VDraweeView;

    iget-object v3, p0, Ll/z9g0;->d:Landroid/view/animation/AccelerateDecelerateInterpolator;

    iget v4, p0, Ll/z9g0;->e:I

    iget-object v5, p0, Ll/z9g0;->f:Lv/VText;

    iget-object v6, p0, Ll/z9g0;->g:Ll/q1e;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->q(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Lrx/c;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Landroid/content/DialogInterface;)V

    return-void
.end method
