.class public final Ll/zd80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Ll/zd80;",
        "",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/a;",
        "systemActionHandler",
        "Ll/c0c;",
        "e",
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
.field public static final INSTANCE:Ll/zd80;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/zd80;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zd80;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/zd80;->INSTANCE:Ll/zd80;

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

.method public static a(Lcom/clevertap/android/sdk/inapp/a;Ll/c0c$b;)Lkotlin/Unit;
    .locals 1

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
    const-string v0, "ctsystem_apprating"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/c0c$a;->f(Ljava/lang/String;)Ll/c0c$a;

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/wd80;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/wd80;-><init>(Lcom/clevertap/android/sdk/inapp/a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/c0c$a;->g(Ll/e0c;)Ll/c0c$a;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 25
    .line 26
    return-object p0
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/a;Ll/d0c$c;)V
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
    new-instance v0, Ll/xd80;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/xd80;-><init>(Ll/d0c$c;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/yd80;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Ll/yd80;-><init>(Ll/d0c$c;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/clevertap/android/sdk/inapp/a;->d(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static c(Ll/d0c$c;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/d0c;->h()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/d0c;->g()V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 11
    .line 12
    return-object p0
.end method

.method public static d(Ll/d0c$c;Ljava/lang/Exception;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/d0c;->g()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final e(Lcom/clevertap/android/sdk/inapp/a;)Ll/c0c;
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inapp/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/a;->c()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ll/vd80;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/vd80;-><init>(Lcom/clevertap/android/sdk/inapp/a;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p1, p0}, Ll/f0c;->a(ZLkotlin/jvm/functions/Function1;)Ll/c0c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
