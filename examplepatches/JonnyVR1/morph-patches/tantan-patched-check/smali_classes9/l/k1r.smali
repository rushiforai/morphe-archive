.class public final synthetic Ll/k1r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w0r$l;

.field public final synthetic b:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Ll/w0r$l;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1r;->a:Ll/w0r$l;

    iput-object p2, p0, Ll/k1r;->b:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k1r;->a:Ll/w0r$l;

    iget-object p0, p0, Ll/k1r;->b:Landroid/widget/FrameLayout;

    invoke-static {v0, p0, p1}, Ll/w0r$l;->D(Ll/w0r$l;Landroid/widget/FrameLayout;Landroid/view/View;)V

    return-void
.end method
