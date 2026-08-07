.class public final Ll/ny50;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Ll/ny50;",
        "",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/a;",
        "systemActionHandler",
        "Ll/c0c;",
        "c",
        "(Lcom/clevertap/android/sdk/inapp/a;)Ll/c0c;",
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
.field public static final INSTANCE:Ll/ny50;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ny50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ny50;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ny50;->INSTANCE:Ll/ny50;

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

.method public static a(Lcom/clevertap/android/sdk/inapp/a;Ll/d0c$c;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string v0, "Android"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/d0c;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/kx3;->p(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {p0, v0, v2, v1, v2}, Lcom/clevertap/android/sdk/inapp/a;->j(Lcom/clevertap/android/sdk/inapp/a;Ljava/lang/String;Landroid/content/Context;ILjava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/d0c;->h()V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p1}, Ll/d0c;->g()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/a;Ll/c0c$b;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Ll/c0c$a;->h(Z)V

    .line 9
    .line 10
    .line 11
    const-string v0, "ctsystem_openurl"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/c0c$a;->f(Ljava/lang/String;)Ll/c0c$a;

    .line 14
    .line 15
    .line 16
    const-string v0, "Android"

    .line 17
    .line 18
    const-string v1, ""

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Ll/c0c$a;->i(Ljava/lang/String;Ljava/lang/String;)Ll/c0c$a;

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/my50;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/my50;-><init>(Lcom/clevertap/android/sdk/inapp/a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/c0c$a;->g(Ll/e0c;)Ll/c0c$a;

    .line 29
    .line 30
    .line 31
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 32
    .line 33
    return-object p0
.end method


# virtual methods
.method public final c(Lcom/clevertap/android/sdk/inapp/a;)Ll/c0c;
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inapp/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/ly50;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/ly50;-><init>(Lcom/clevertap/android/sdk/inapp/a;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-static {p1, p0}, Ll/f0c;->a(ZLkotlin/jvm/functions/Function1;)Ll/c0c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
