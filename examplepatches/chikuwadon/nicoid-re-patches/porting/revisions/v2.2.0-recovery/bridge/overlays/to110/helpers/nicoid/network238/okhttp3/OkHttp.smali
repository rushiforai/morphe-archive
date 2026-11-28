.class public final Lnicoid/network238/okhttp3/OkHttp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tR\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087D\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/OkHttp;",
        "",
        "<init>",
        "()V",
        "VERSION",
        "",
        "initialize",
        "",
        "applicationContext",
        "Landroid/content/Context;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/OkHttp;

.field public static final VERSION:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/OkHttp;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttp;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/OkHttp;->INSTANCE:Lnicoid/network238/okhttp3/OkHttp;

    .line 24
    const-string v0, "5.5.1"

    sput-object v0, Lnicoid/network238/okhttp3/OkHttp;->VERSION:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final initialize(Landroid/content/Context;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_0

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->setApplicationContext(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
