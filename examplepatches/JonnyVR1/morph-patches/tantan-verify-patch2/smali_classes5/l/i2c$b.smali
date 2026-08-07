.class public Ll/i2c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/i2c;->v()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/i2c;


# direct methods
.method public constructor <init>(Ll/i2c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

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
    .locals 2

    .line 1
    iget-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/i2c;->O(Ll/i2c;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {p1, v1}, Ll/i2c;->P(Ll/i2c;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 14
    .line 15
    iget-object p1, p1, Ll/sup0;->g:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 23
    .line 24
    iget-object p1, p1, Ll/sup0;->e:Landroid/widget/ProgressBar;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/i2c;->Q(Z)Z

    .line 32
    .line 33
    .line 34
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
    iget-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-static {p1, p2}, Ll/i2c;->O(Ll/i2c;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-static {p1, p2}, Ll/i2c;->P(Ll/i2c;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/i2c$b;->a:Ll/i2c;

    .line 14
    .line 15
    iget-object p0, p0, Ll/sup0;->g:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    const-string p0, "\u7f51\u7edc\u9519\u8bef"

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
