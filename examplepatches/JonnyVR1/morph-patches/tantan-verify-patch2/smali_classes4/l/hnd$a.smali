.class public Ll/hnd$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e3i0$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hnd;->p(Ll/e3i0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

.field public final synthetic b:Ll/hnd;


# direct methods
.method public constructor <init>(Ll/hnd;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hnd$a;->b:Ll/hnd;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hnd$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-boolean p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/hnd$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getDes()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p2, Ll/qk4;

    .line 11
    .line 12
    iget-object p3, p0, Ll/hnd$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/hnd$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->l(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)Ll/em2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-direct {p2, p3, p1, p0}, Ll/qk4;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/view/View;Ll/em2;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->f(Landroid/content/Context;Ll/qk4;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
