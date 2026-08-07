.class public final Ll/zdo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001d\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\r\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\r\u0010\u0010\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0010\u0010\u000eR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u0011R\u0014\u0010\u0014\u001a\u00020\u00128\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Ll/zdo;",
        "",
        "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V",
        "Landroid/widget/LinearLayout;",
        "parent",
        "Landroid/view/View;",
        "insertBefore",
        "",
        "a",
        "(Landroid/widget/LinearLayout;Landroid/view/View;)V",
        "c",
        "()V",
        "d",
        "b",
        "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
        "Ll/n3n;",
        "Ll/n3n;",
        "delegate",
        "b_core_intlGmsRelease"
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
.field public final a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/n3n;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/zdo;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 8
    .line 9
    new-instance v0, Ll/n3n;

    .line 10
    .line 11
    sget-object v1, Ll/p3n;->INSTANCE:Ll/p3n;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/p3n;->c()Ll/o3n;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/16 v5, 0x8

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    move-object v1, p1

    .line 23
    invoke-direct/range {v0 .. v6}, Ll/n3n;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ll/o3n;ZLl/x20;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/zdo;->b:Ll/n3n;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/widget/LinearLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/zdo;->b:Ll/n3n;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/n3n;->i(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zdo;->b:Ll/n3n;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n3n;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zdo;->b:Ll/n3n;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n3n;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zdo;->b:Ll/n3n;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n3n;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
