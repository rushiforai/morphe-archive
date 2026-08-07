.class public final Lcom/hellogroup/fep/base/FepContext;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001b\u0010\t\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u001b\u0010\u000c\u001a\u00020\n8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\u0006\u001a\u0004\u0008\u0005\u0010\u000bR\u001b\u0010\u0010\u001a\u00020\r8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u0006\u001a\u0004\u0008\u000e\u0010\u000fR\u001d\u0010\u0014\u001a\u0004\u0018\u00010\u00118FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0006\u001a\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/hellogroup/fep/base/FepContext;",
        "",
        "<init>",
        "()V",
        "Ll/po5;",
        "a",
        "Lkotlin/Lazy;",
        "b",
        "()Ll/po5;",
        "job",
        "Ll/drb;",
        "()Ll/drb;",
        "fepScope",
        "Lcom/hellogroup/common/timer/ControllableTimer;",
        "c",
        "()Lcom/hellogroup/common/timer/ControllableTimer;",
        "pollTimer",
        "Landroid/content/SharedPreferences;",
        "d",
        "()Landroid/content/SharedPreferences;",
        "sharedPreferences",
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
.field public static final INSTANCE:Lcom/hellogroup/fep/base/FepContext;

.field private static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final b:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/fep/base/FepContext;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/fep/base/FepContext;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 7
    .line 8
    sget-object v0, Lcom/hellogroup/fep/base/FepContext$job$2;->INSTANCE:Lcom/hellogroup/fep/base/FepContext$job$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/hellogroup/fep/base/FepContext;->a:Lkotlin/Lazy;

    .line 15
    .line 16
    sget-object v0, Lcom/hellogroup/fep/base/FepContext$fepScope$2;->INSTANCE:Lcom/hellogroup/fep/base/FepContext$fepScope$2;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/hellogroup/fep/base/FepContext;->b:Lkotlin/Lazy;

    .line 23
    .line 24
    sget-object v0, Lcom/hellogroup/fep/base/FepContext$pollTimer$2;->INSTANCE:Lcom/hellogroup/fep/base/FepContext$pollTimer$2;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/hellogroup/fep/base/FepContext;->c:Lkotlin/Lazy;

    .line 31
    .line 32
    sget-object v0, Lcom/hellogroup/fep/base/FepContext$sharedPreferences$2;->INSTANCE:Lcom/hellogroup/fep/base/FepContext$sharedPreferences$2;

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/hellogroup/fep/base/FepContext;->d:Lkotlin/Lazy;

    .line 39
    .line 40
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
.method public final a()Ll/drb;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->b:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/drb;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b()Ll/po5;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/po5;

    .line 8
    .line 9
    return-object p0
.end method

.method public final c()Lcom/hellogroup/common/timer/ControllableTimer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->c:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/common/timer/ControllableTimer;

    return-object p0
.end method

.method public final d()Landroid/content/SharedPreferences;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->d:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    return-object p0
.end method
