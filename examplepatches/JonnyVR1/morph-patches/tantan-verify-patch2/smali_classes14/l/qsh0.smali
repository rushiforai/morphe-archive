.class public final Ll/qsh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qsh0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u00072\u00020\u0001:\u0001\u0008B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\t"
    }
    d2 = {
        "Ll/qsh0;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/data/AdConfiguration;",
        "c",
        "()Lcom/p1/mobile/putong/data/AdConfiguration;",
        "Companion",
        "a",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/qsh0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static volatile a:Ll/qsh0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/qsh0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/qsh0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/qsh0;->Companion:Ll/qsh0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic a()Ll/qsh0;
    .locals 1

    .line 1
    sget-object v0, Ll/qsh0;->a:Ll/qsh0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b(Ll/qsh0;)V
    .locals 0

    .line 1
    sput-object p0, Ll/qsh0;->a:Ll/qsh0;

    .line 2
    .line 3
    return-void
.end method

.method public static final d()Ll/qsh0;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/qsh0;->Companion:Ll/qsh0$a;

    invoke-virtual {v0}, Ll/qsh0$a;->a()Ll/qsh0;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final c()Lcom/p1/mobile/putong/data/AdConfiguration;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
