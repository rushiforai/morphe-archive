.class public final Lcom/hellogroup/fep/grey/internal/FepGreyContext;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\"\u0010\n\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0005\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u0017\u0010\u0010\u001a\u00020\u000b8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000fR\"\u0010\u0017\u001a\u00020\u00118\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u000c\u0010\u0014\"\u0004\u0008\u0015\u0010\u0016R\u001b\u0010\u001d\u001a\u00020\u00188FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001cR\u001b\u0010!\u001a\u00020\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001b\u0010\u001a\u001a\u0004\u0008\u001f\u0010 R!\u0010%\u001a\u0008\u0012\u0004\u0012\u00020#0\"8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001f\u0010\u001a\u001a\u0004\u0008\u0019\u0010$R\u001b\u0010(\u001a\u00020&8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u001a\u001a\u0004\u0008\u0012\u0010\'\u00a8\u0006)"
    }
    d2 = {
        "Lcom/hellogroup/fep/grey/internal/FepGreyContext;",
        "",
        "<init>",
        "()V",
        "",
        "a",
        "Z",
        "()Z",
        "h",
        "(Z)V",
        "debugMode",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "b",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "g",
        "()Ljava/util/concurrent/atomic/AtomicBoolean;",
        "isSetup",
        "Ll/jgi;",
        "c",
        "Ll/jgi;",
        "()Ll/jgi;",
        "i",
        "(Ll/jgi;)V",
        "greyProvider",
        "Ll/mgi;",
        "d",
        "Lkotlin/Lazy;",
        "e",
        "()Ll/mgi;",
        "ruleModule",
        "Ll/kgi;",
        "f",
        "()Ll/kgi;",
        "urlModule",
        "Ll/tl5;",
        "Ll/igi;",
        "()Ll/tl5;",
        "observerManager",
        "Ll/pgi;",
        "()Ll/pgi;",
        "logModule",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

.field private static a:Z

.field private static final b:Ljava/util/concurrent/atomic/AtomicBoolean;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static c:Ll/jgi;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final f:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final g:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    .line 16
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$ruleModule$2;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$ruleModule$2;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->d:Lkotlin/Lazy;

    .line 23
    .line 24
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$urlModule$2;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$urlModule$2;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->e:Lkotlin/Lazy;

    .line 31
    .line 32
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$observerManager$2;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$observerManager$2;

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->f:Lkotlin/Lazy;

    .line 39
    .line 40
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext$logModule$2;

    .line 41
    .line 42
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->g:Lkotlin/Lazy;

    .line 47
    .line 48
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final b()Ll/jgi;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c:Ll/jgi;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string v0, "greyProvider"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public final c()Ll/pgi;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->g:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/pgi;

    .line 8
    .line 9
    return-object p0
.end method

.method public final d()Ll/tl5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/tl5<",
            "Ll/igi;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->f:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tl5;

    .line 8
    .line 9
    return-object p0
.end method

.method public final e()Ll/mgi;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->d:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/mgi;

    .line 8
    .line 9
    return-object p0
.end method

.method public final f()Ll/kgi;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->e:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/kgi;

    .line 8
    .line 9
    return-object p0
.end method

.method public final g()Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public final i(Ll/jgi;)V
    .locals 0
    .param p1    # Ll/jgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c:Ll/jgi;

    .line 5
    .line 6
    return-void
.end method
