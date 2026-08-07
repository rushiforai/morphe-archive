.class public Ll/qk4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

.field public b:Landroid/view/View;

.field public c:Ll/em2;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/view/View;Ll/em2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qk4;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qk4;->c:Ll/em2;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/em2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk4;->c:Ll/em2;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk4;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/content/Context;Landroid/widget/FrameLayout;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qk4;->c:Ll/em2;

    .line 2
    .line 3
    iget-object v2, p0, Ll/qk4;->b:Landroid/view/View;

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move-object v5, p2

    .line 7
    move-object v3, p3

    .line 8
    move v4, p4

    .line 9
    invoke-virtual/range {v0 .. v5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/qk4;->f(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qk4;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
