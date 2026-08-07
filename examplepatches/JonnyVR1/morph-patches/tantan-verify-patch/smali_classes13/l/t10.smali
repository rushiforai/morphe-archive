.class public final synthetic Ll/t10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/il50;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:[I

.field public final synthetic c:Z

.field public final synthetic d:Landroid/view/ViewGroup$LayoutParams;

.field public final synthetic e:Landroid/widget/FrameLayout;

.field public final synthetic f:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>([Z[IZLandroid/view/ViewGroup$LayoutParams;Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t10;->a:[Z

    iput-object p2, p0, Ll/t10;->b:[I

    iput-boolean p3, p0, Ll/t10;->c:Z

    iput-object p4, p0, Ll/t10;->d:Landroid/view/ViewGroup$LayoutParams;

    iput-object p5, p0, Ll/t10;->e:Landroid/widget/FrameLayout;

    iput-object p6, p0, Ll/t10;->f:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/t10;->a:[Z

    iget-object v1, p0, Ll/t10;->b:[I

    iget-boolean v2, p0, Ll/t10;->c:Z

    iget-object v3, p0, Ll/t10;->d:Landroid/view/ViewGroup$LayoutParams;

    iget-object v4, p0, Ll/t10;->e:Landroid/widget/FrameLayout;

    iget-object v5, p0, Ll/t10;->f:Landroid/view/View;

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/android/app/Act;->K0([Z[IZLandroid/view/ViewGroup$LayoutParams;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Ll/dgq0;)Ll/dgq0;

    move-result-object p0

    return-object p0
.end method
