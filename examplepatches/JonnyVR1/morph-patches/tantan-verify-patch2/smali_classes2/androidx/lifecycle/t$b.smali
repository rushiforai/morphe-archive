.class public final Landroidx/lifecycle/t$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r8\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Landroidx/lifecycle/t$b;",
        "",
        "<init>",
        "()V",
        "Ll/tll0;",
        "owner",
        "Landroidx/lifecycle/t$c;",
        "factory",
        "Ll/cvb;",
        "extras",
        "Landroidx/lifecycle/t;",
        "a",
        "(Ll/tll0;Landroidx/lifecycle/t$c;Ll/cvb;)Landroidx/lifecycle/t;",
        "Ll/cvb$c;",
        "",
        "VIEW_MODEL_KEY",
        "Ll/cvb$c;",
        "lifecycle-viewmodel_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/lifecycle/t$b;-><init>()V

    return-void
.end method

.method public static synthetic b(Landroidx/lifecycle/t$b;Ll/tll0;Landroidx/lifecycle/t$c;Ll/cvb;ILjava/lang/Object;)Landroidx/lifecycle/t;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x2

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    sget-object p2, Ll/rll0;->INSTANCE:Ll/rll0;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Ll/rll0;->b(Ll/tll0;)Landroidx/lifecycle/t$c;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 12
    .line 13
    if-eqz p4, :cond_1

    .line 14
    .line 15
    sget-object p3, Ll/rll0;->INSTANCE:Ll/rll0;

    .line 16
    .line 17
    invoke-virtual {p3, p1}, Ll/rll0;->a(Ll/tll0;)Ll/cvb;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Landroidx/lifecycle/t$b;->a(Ll/tll0;Landroidx/lifecycle/t$c;Ll/cvb;)Landroidx/lifecycle/t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method


# virtual methods
.method public final a(Ll/tll0;Landroidx/lifecycle/t$c;Ll/cvb;)Landroidx/lifecycle/t;
    .locals 0
    .param p1    # Ll/tll0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/lifecycle/t$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/cvb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroidx/lifecycle/t;

    .line 11
    .line 12
    invoke-interface {p1}, Ll/tll0;->getViewModelStore()Ll/sll0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroidx/lifecycle/t;-><init>(Ll/sll0;Landroidx/lifecycle/t$c;Ll/cvb;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method
