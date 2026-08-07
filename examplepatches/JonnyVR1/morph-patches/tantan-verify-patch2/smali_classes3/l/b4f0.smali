.class public final Ll/b4f0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J!\u0010\u0017\u001a\u0014\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00060\u0016\u0012\u0004\u0012\u00020\u00060\u0015H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u001c\u001a\u00020\u00198\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001d"
    }
    d2 = {
        "Ll/b4f0;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "",
        "e",
        "(Landroid/content/Context;)V",
        "Lcom/tantanapp/sharedlibrary/loader/Abi;",
        "b",
        "(Landroid/content/Context;)Lcom/tantanapp/sharedlibrary/loader/Abi;",
        "",
        "g",
        "()Z",
        "Lcom/tantanapp/sharedlibrary/loader/a$a;",
        "c",
        "()Lcom/tantanapp/sharedlibrary/loader/a$a;",
        "Lcom/tantanapp/sharedlibrary/loader/a$b;",
        "d",
        "()Lcom/tantanapp/sharedlibrary/loader/a$b;",
        "Lkotlin/Function1;",
        "Lkotlin/Function0;",
        "f",
        "()Lkotlin/jvm/functions/Function1;",
        "",
        "a",
        "[B",
        "obbSalt",
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
.field public static final INSTANCE:Ll/b4f0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/b4f0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b4f0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/b4f0;->INSTANCE:Ll/b4f0;

    .line 7
    .line 8
    const/16 v0, 0x14

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/b4f0;->a:[B

    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
    :array_0
    .array-data 1
        0x12t
        0x16t
        -0x1ft
        -0xbt
        -0x36t
        0x12t
        -0x65t
        -0x20t
        0x2bt
        0x2t
        -0x8t
        -0x4t
        0x9t
        0x5t
        -0x6at
        -0x11t
        0x21t
        0x2ct
        0x3t
        0x1t
    .end array-data
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

.method public static a(Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static final e(Landroid/content/Context;)V
    .locals 10
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    sget-object v2, Ll/b4f0;->INSTANCE:Ll/b4f0;

    .line 14
    .line 15
    invoke-virtual {v2, p0}, Ll/b4f0;->b(Landroid/content/Context;)Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v2}, Ll/b4f0;->g()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    sget-object v4, Ll/b4f0;->a:[B

    .line 24
    .line 25
    invoke-static {}, Ll/v850;->b()Z

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {v2}, Ll/b4f0;->c()Lcom/tantanapp/sharedlibrary/loader/a$a;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {v2}, Ll/b4f0;->d()Lcom/tantanapp/sharedlibrary/loader/a$b;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    invoke-virtual {v2}, Ll/b4f0;->f()Lkotlin/jvm/functions/Function1;

    .line 38
    .line 39
    .line 40
    move-result-object v9

    .line 41
    const-string v5, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2dm1hLmK8aeC9bgNHPiN9IrgcW6i0GuGzvYaFlo+VHqWI4bY+yPzCipQgQCEGmQt7jrKXpBQtx9oAIoXA1XUFYUSY9ExCLDJog0vw1oYm7rI78JhlUaIjozR+SN579RzHRfW4OGknfoe3+PoeVOfcYsLDQeflXFKNHmzQ5qrCjfpE5Qvw3Ow2rY/qX8dGEO0VXfdRLWXxp8R4Zngc+muShISrd6+LrpRZogSd0OEz2XyC3xANEvepge8KBl5r8at/HbG7PPXsYvnD6LvCF+d/ZcoYmc6fyldY+YAV+S7oMxaT9/pbu2Bh1uXHX2ByCIEZzN6jmF5yG88Fm5Q9pbD8wIDAQAB"

    .line 42
    .line 43
    move-object v2, p0

    .line 44
    invoke-direct/range {v0 .. v9}, Lcom/tantanapp/sharedlibrary/loader/a;-><init>(Landroid/content/Context;Lcom/tantanapp/sharedlibrary/loader/Abi;Z[BLjava/lang/String;ZLcom/tantanapp/sharedlibrary/loader/a$a;Lcom/tantanapp/sharedlibrary/loader/a$b;Lkotlin/jvm/functions/Function1;)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->Companion:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;->b(Lcom/tantanapp/sharedlibrary/loader/a;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;)Lcom/tantanapp/sharedlibrary/loader/Abi;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/cu3;->a(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/Abi;->ARM_64:Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/Abi;->ARM_32:Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 11
    .line 12
    return-object p0
.end method

.method public final c()Lcom/tantanapp/sharedlibrary/loader/a$a;
    .locals 0

    .line 1
    new-instance p0, Ll/b4f0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/b4f0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final d()Lcom/tantanapp/sharedlibrary/loader/a$b;
    .locals 0

    .line 1
    new-instance p0, Ll/b4f0$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/b4f0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final f()Lkotlin/jvm/functions/Function1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/x3f0;

    invoke-direct {p0}, Ll/x3f0;-><init>()V

    return-object p0
.end method

.method public final g()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/ls4;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "googleplay"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
