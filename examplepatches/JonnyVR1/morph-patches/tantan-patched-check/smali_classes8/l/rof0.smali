.class public Ll/rof0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xde0;


# instance fields
.field public a:Landroid/graphics/PointF;

.field public b:Ll/xde0;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/rof0;->c:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rof0;->b:Ll/xde0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/xde0;->a(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/rof0;->a:Landroid/graphics/PointF;

    .line 11
    .line 12
    iget-boolean p0, p0, Ll/rof0;->c:Z

    .line 13
    .line 14
    invoke-static {p1, v0, p0}, Ll/rsf0;->a(Landroid/view/View;Landroid/graphics/PointF;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public b(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rof0;->b:Ll/xde0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/xde0;->b(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/rof0;->a:Landroid/graphics/PointF;

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/rsf0;->b(Landroid/view/View;Landroid/graphics/PointF;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method
