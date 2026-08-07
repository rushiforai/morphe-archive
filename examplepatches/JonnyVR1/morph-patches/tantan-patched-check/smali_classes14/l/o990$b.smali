.class public final Ll/o990$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o990;->C(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "l/o990$b",
        "Lcom/tantan/library/svga/AnimListener;",
        "",
        "onFinished",
        "()V",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/o990;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

.field public final synthetic c:Z


# direct methods
.method public constructor <init>(Ll/o990;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o990$b;->a:Ll/o990;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o990$b;->b:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/o990$b;->c:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static a(Ll/o990;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/o990;->u(Ll/o990;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o990$b;->a:Ll/o990;

    .line 2
    .line 3
    invoke-static {v0}, Ll/o990;->t(Ll/o990;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/o990$b;->a:Ll/o990;

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/o990$b;->c:Z

    .line 12
    .line 13
    new-instance v2, Ll/p990;

    .line 14
    .line 15
    invoke-direct {v2, v0, v1}, Ll/p990;-><init>(Ll/o990;Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v2}, Ll/o990;->v(Ll/o990;Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/o990$b;->a:Ll/o990;

    .line 22
    .line 23
    invoke-static {v0}, Ll/o990;->t(Ll/o990;)Ljava/lang/Runnable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/o990$b;->b:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Ll/o990$b;->a:Ll/o990;

    .line 37
    .line 38
    invoke-static {p0}, Ll/o990;->t(Ll/o990;)Ljava/lang/Runnable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-wide/16 v1, 0x1770

    .line 43
    .line 44
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
