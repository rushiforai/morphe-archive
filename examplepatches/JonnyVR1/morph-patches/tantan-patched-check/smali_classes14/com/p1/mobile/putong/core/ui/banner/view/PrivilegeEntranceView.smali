.class public final Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0001\u0013B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0015\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\r\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0011\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0019\u0010\u0019\u001a\u00020\n2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0015H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u0018\u0010\u001c\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u001bR\u0016\u0010\u001f\u001a\u00020\u001d8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u001eR\u0016\u0010\"\u001a\u00020 8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010!R\u0016\u0010\u0010\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010#\u00a8\u0006$"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;",
        "Landroid/widget/LinearLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "c",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "",
        "f",
        "()Z",
        "hidden",
        "d",
        "(Z)V",
        "a",
        "()V",
        "Ll/y4;",
        "b",
        "()Ll/y4;",
        "strategy",
        "e",
        "(Ll/y4;)V",
        "Ll/y4;",
        "currentStrategy",
        "Lcom/p1/mobile/putong/core/ui/banner/view/a;",
        "Lcom/p1/mobile/putong/core/ui/banner/view/a;",
        "strategyChain",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "privilegeEntranceInfo",
        "Z",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public a:Ll/y4;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/core/ui/banner/view/a;

.field public c:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->d:Z

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 15
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    return-void
.end method

.method public final b()Ll/y4;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->b:Lcom/p1/mobile/putong/core/ui/banner/view/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    const-string p0, "strategyChain"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object p0, v0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/banner/view/a;->a()Ljava/util/LinkedHashMap;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/util/Map$Entry;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ll/y4;

    .line 41
    .line 42
    invoke-interface {v2}, Ll/m3m;->a()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ll/y4;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    return-object v0
.end method

.method public final c(Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;-><init>(Landroid/view/ViewGroup;Lcom/p1/mobile/android/app/Act;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->c:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a()V

    .line 12
    .line 13
    .line 14
    new-instance p1, Lcom/p1/mobile/putong/core/ui/banner/view/a;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->c:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const-string v0, "privilegeEntranceInfo"

    .line 21
    .line 22
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    :cond_0
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/core/ui/banner/view/a;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->b:Lcom/p1/mobile/putong/core/ui/banner/view/a;

    .line 30
    .line 31
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->d:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a:Ll/y4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/y4;->d(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final e(Ll/y4;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->c:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "privilegeEntranceInfo"

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/y4;->release()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a:Ll/y4;

    .line 29
    .line 30
    return-void
.end method

.method public final f()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->b()Ll/y4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a:Ll/y4;

    .line 10
    .line 11
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a:Ll/y4;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->e(Ll/y4;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a:Ll/y4;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/m3m;->b()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->d:Z

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->a:Ll/y4;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/y4;->m()V

    .line 36
    .line 37
    .line 38
    :cond_2
    const/4 p0, 0x1

    .line 39
    return p0
.end method
