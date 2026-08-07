.class public final Lcom/clevertap/android/sdk/i$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J#\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00080\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0014\u0010\u000f\u001a\u00020\u000e8\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/i$a;",
        "",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
        "config",
        "Lkotlin/Function1;",
        "Landroid/content/Context;",
        "Lcom/clevertap/android/sdk/f;",
        "d",
        "(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Lkotlin/jvm/functions/Function1;",
        "Lcom/clevertap/android/sdk/i$d;",
        "e",
        "()Lcom/clevertap/android/sdk/i$d;",
        "",
        "ANDROID_PERMISSION_STRING",
        "Ljava/lang/String;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/i$a;-><init>()V

    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Landroid/content/Context;)Lcom/clevertap/android/sdk/f;
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
    sget-object v0, Lcom/clevertap/android/sdk/f;->Companion:Lcom/clevertap/android/sdk/f$a;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/clevertap/android/sdk/f$a;->c(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Lcom/clevertap/android/sdk/f;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static final synthetic b(Lcom/clevertap/android/sdk/i$a;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Lkotlin/jvm/functions/Function1;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/i$a;->d(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic c(Lcom/clevertap/android/sdk/i$a;)Lcom/clevertap/android/sdk/i$d;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/i$a;->e()Lcom/clevertap/android/sdk/i$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final d(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Lkotlin/jvm/functions/Function1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
            ")",
            "Lkotlin/jvm/functions/Function1<",
            "Landroid/content/Context;",
            "Lcom/clevertap/android/sdk/f;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/wnb0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/wnb0;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method private final e()Lcom/clevertap/android/sdk/i$d;
    .locals 0

    .line 1
    new-instance p0, Lcom/clevertap/android/sdk/i$a$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/clevertap/android/sdk/i$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
