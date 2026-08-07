.class public final Landroidx/lifecycle/q;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a7\u0010\n\u001a\u00020\t2\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u000e\u0010\u0008\u001a\n\u0018\u00010\u0006j\u0004\u0018\u0001`\u0007H\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000b\u001a\u0013\u0010\r\u001a\u00020\t*\u00020\u000cH\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000e\"\u001a\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00000\u000f8\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u0010\"\u001a\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u000f8\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u0010\"\u001e\u0010\u0014\u001a\u000c\u0012\u0008\u0012\u00060\u0006j\u0002`\u00070\u000f8\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0010\"\u0018\u0010\u0018\u001a\u00020\u0015*\u00020\u00028@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0017\"\u0018\u0010\u001b\u001a\u00020\u0019*\u00020\u00008@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u001a\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/ryd0;",
        "savedStateRegistryOwner",
        "Ll/tll0;",
        "viewModelStoreOwner",
        "",
        "key",
        "Landroid/os/Bundle;",
        "Landroidx/savedstate/SavedState;",
        "defaultArgs",
        "Landroidx/lifecycle/p;",
        "b",
        "(Ll/ryd0;Ll/tll0;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/lifecycle/p;",
        "Ll/cvb;",
        "a",
        "(Ll/cvb;)Landroidx/lifecycle/p;",
        "Ll/cvb$c;",
        "Ll/cvb$c;",
        "SAVED_STATE_REGISTRY_OWNER_KEY",
        "VIEW_MODEL_STORE_OWNER_KEY",
        "c",
        "DEFAULT_ARGS_KEY",
        "Landroidx/lifecycle/SavedStateHandlesVM;",
        "d",
        "(Ll/tll0;)Landroidx/lifecycle/SavedStateHandlesVM;",
        "savedStateHandlesVM",
        "Ll/jyd0;",
        "(Ll/ryd0;)Ll/jyd0;",
        "savedStateHandlesProvider",
        "lifecycle-viewmodel-savedstate_release"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/JvmName;
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final a:Ll/cvb$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cvb$c<",
            "Ll/ryd0;",
            ">;"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Ll/cvb$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cvb$c<",
            "Ll/tll0;",
            ">;"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:Ll/cvb$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cvb$c<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/cvb;->Companion:Ll/cvb$a;

    .line 2
    .line 3
    new-instance v0, Landroidx/lifecycle/q$b;

    .line 4
    .line 5
    invoke-direct {v0}, Landroidx/lifecycle/q$b;-><init>()V

    .line 6
    .line 7
    .line 8
    sput-object v0, Landroidx/lifecycle/q;->a:Ll/cvb$c;

    .line 9
    .line 10
    new-instance v0, Landroidx/lifecycle/q$c;

    .line 11
    .line 12
    invoke-direct {v0}, Landroidx/lifecycle/q$c;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Landroidx/lifecycle/q;->b:Ll/cvb$c;

    .line 16
    .line 17
    new-instance v0, Landroidx/lifecycle/q$d;

    .line 18
    .line 19
    invoke-direct {v0}, Landroidx/lifecycle/q$d;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v0, Landroidx/lifecycle/q;->c:Ll/cvb$c;

    .line 23
    .line 24
    return-void
.end method

.method public static final a(Ll/cvb;)Landroidx/lifecycle/p;
    .locals 5
    .param p0    # Ll/cvb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroidx/lifecycle/q;->a:Ll/cvb$c;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/cvb;->a(Ll/cvb$c;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/ryd0;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    sget-object v2, Landroidx/lifecycle/q;->b:Ll/cvb$c;

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ll/cvb;->a(Ll/cvb$c;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/tll0;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    sget-object v3, Landroidx/lifecycle/q;->c:Ll/cvb$c;

    .line 26
    .line 27
    invoke-virtual {p0, v3}, Ll/cvb;->a(Ll/cvb$c;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Landroid/os/Bundle;

    .line 32
    .line 33
    sget-object v4, Landroidx/lifecycle/t;->b:Ll/cvb$c;

    .line 34
    .line 35
    invoke-virtual {p0, v4}, Ll/cvb;->a(Ll/cvb$c;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-static {v0, v2, p0, v3}, Landroidx/lifecycle/q;->b(Ll/ryd0;Ll/tll0;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/lifecycle/p;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_0
    const-string p0, "CreationExtras must have a value by `VIEW_MODEL_KEY`"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object v1

    .line 54
    :cond_1
    const-string p0, "CreationExtras must have a value by `VIEW_MODEL_STORE_OWNER_KEY`"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_2
    const-string p0, "CreationExtras must have a value by `SAVED_STATE_REGISTRY_OWNER_KEY`"

    .line 61
    .line 62
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-object v1
.end method

.method public static final b(Ll/ryd0;Ll/tll0;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/lifecycle/p;
    .locals 1

    .line 1
    invoke-static {p0}, Landroidx/lifecycle/q;->c(Ll/ryd0;)Ll/jyd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Landroidx/lifecycle/q;->d(Ll/tll0;)Landroidx/lifecycle/SavedStateHandlesVM;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroidx/lifecycle/SavedStateHandlesVM;->a()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroidx/lifecycle/p;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Landroidx/lifecycle/p;->Companion:Landroidx/lifecycle/p$a;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/jyd0;->b(Ljava/lang/String;)Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0, p3}, Landroidx/lifecycle/p$a;->a(Landroid/os/Bundle;Landroid/os/Bundle;)Landroidx/lifecycle/p;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1}, Landroidx/lifecycle/SavedStateHandlesVM;->a()Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    return-object v0
.end method

.method public static final c(Ll/ryd0;)Ll/jyd0;
    .locals 1
    .param p0    # Ll/ryd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/ryd0;->getSavedStateRegistry()Landroidx/savedstate/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "androidx.lifecycle.internal.SavedStateHandlesProvider"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/savedstate/a;->b(Ljava/lang/String;)Landroidx/savedstate/a$b;

    .line 11
    .line 12
    .line 13
    const-string p0, "enableSavedStateHandles() wasn\'t called prior to createSavedStateHandle() call"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public static final d(Ll/tll0;)Landroidx/lifecycle/SavedStateHandlesVM;
    .locals 6
    .param p0    # Ll/tll0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroidx/lifecycle/t;->Companion:Landroidx/lifecycle/t$b;

    .line 5
    .line 6
    new-instance v2, Landroidx/lifecycle/q$a;

    .line 7
    .line 8
    invoke-direct {v2}, Landroidx/lifecycle/q$a;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x4

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    move-object v1, p0

    .line 15
    invoke-static/range {v0 .. v5}, Landroidx/lifecycle/t$b;->b(Landroidx/lifecycle/t$b;Ll/tll0;Landroidx/lifecycle/t$c;Ll/cvb;ILjava/lang/Object;)Landroidx/lifecycle/t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-class v0, Landroidx/lifecycle/SavedStateHandlesVM;

    .line 20
    .line 21
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "androidx.lifecycle.internal.SavedStateHandlesVM"

    .line 26
    .line 27
    invoke-virtual {p0, v1, v0}, Landroidx/lifecycle/t;->b(Ljava/lang/String;Lkotlin/reflect/KClass;)Ll/nll0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Landroidx/lifecycle/SavedStateHandlesVM;

    .line 32
    .line 33
    return-object p0
.end method
