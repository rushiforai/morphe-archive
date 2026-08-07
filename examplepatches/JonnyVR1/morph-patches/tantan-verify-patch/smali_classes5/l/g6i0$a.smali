.class public Ll/g6i0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g6i0;->i()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g6i0;


# direct methods
.method public constructor <init>(Ll/g6i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6i0$a;->a:Ll/g6i0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/g6i0$a;->a:Ll/g6i0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/g6i0;->f:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/g6i0$a;->a:Ll/g6i0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/g6i0;->e:Landroid/widget/ProgressBar;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/g6i0$a;->a:Ll/g6i0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/g6i0;->f:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/g6i0$a;->a:Ll/g6i0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/g6i0;->e:Landroid/widget/ProgressBar;

    .line 12
    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
