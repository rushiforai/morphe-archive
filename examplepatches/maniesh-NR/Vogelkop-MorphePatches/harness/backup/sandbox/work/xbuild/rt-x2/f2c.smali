.class public Lf2c;
.super Landroid/widget/FrameLayout$LayoutParams;
.source "SourceFile"

# interfaces
.implements Lm2c;


# instance fields
.field public final a:Ln2c;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, -0x1

    .line 13
    invoke-direct {p0, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    new-instance v0, Ln2c;

    invoke-direct {v0}, Ln2c;-><init>()V

    iput-object v0, p0, Lf2c;->a:Ln2c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    new-instance v0, Ln2c;

    invoke-direct {v0, p1, p2}, Ln2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lf2c;->a:Ln2c;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 2

    .line 15
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    new-instance p1, Ln2c;

    invoke-direct {p1}, Ln2c;-><init>()V

    iput-object p1, p0, Lf2c;->a:Ln2c;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 2

    .line 17
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 18
    new-instance p1, Ln2c;

    invoke-direct {p1}, Ln2c;-><init>()V

    iput-object p1, p0, Lf2c;->a:Ln2c;

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout$LayoutParams;)V
    .registers 2

    .line 19
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 20
    new-instance p1, Ln2c;

    invoke-direct {p1}, Ln2c;-><init>()V

    iput-object p1, p0, Lf2c;->a:Ln2c;

    return-void
.end method

.method public constructor <init>(Lf2c;)V
    .registers 3

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    new-instance v0, Ln2c;

    iget-object p1, p1, Lf2c;->a:Ln2c;

    invoke-direct {v0, p1}, Ln2c;-><init>(Ln2c;)V

    iput-object v0, p0, Lf2c;->a:Ln2c;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lk2c;)V
    .registers 3

    iget-object p0, p0, Lf2c;->a:Ln2c;

    invoke-virtual {p0, p1, p2}, Ln2c;->a(Landroid/view/View;Lk2c;)V

    return-void
.end method
