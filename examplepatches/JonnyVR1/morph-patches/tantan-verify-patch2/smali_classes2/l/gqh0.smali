.class public final Ll/gqh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Ll/gqh0;",
        "",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/a;",
        "systemActionHandler",
        "",
        "Ll/c0c;",
        "a",
        "(Lcom/clevertap/android/sdk/inapp/a;)Ljava/util/Set;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/gqh0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/gqh0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gqh0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gqh0;->INSTANCE:Ll/gqh0;

    .line 7
    .line 8
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
.method public final a(Lcom/clevertap/android/sdk/inapp/a;)Ljava/util/Set;
    .locals 2
    .param p1    # Lcom/clevertap/android/sdk/inapp/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inapp/a;",
            ")",
            "Ljava/util/Set<",
            "Ll/c0c;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/ny50;->INSTANCE:Ll/ny50;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ny50;->c(Lcom/clevertap/android/sdk/inapp/a;)Ll/c0c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v0, Ll/zd80;->INSTANCE:Ll/zd80;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/zd80;->e(Lcom/clevertap/android/sdk/inapp/a;)Ll/c0c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ll/aob0;->INSTANCE:Ll/aob0;

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ll/aob0;->c(Lcom/clevertap/android/sdk/inapp/a;)Ll/c0c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p0, v0, p1}, [Ll/c0c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lkotlin/collections/SetsKt;->setOfNotNull([Ljava/lang/Object;)Ljava/util/Set;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
