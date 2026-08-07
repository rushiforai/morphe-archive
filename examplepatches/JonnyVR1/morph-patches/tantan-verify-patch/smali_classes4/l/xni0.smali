.class public Ll/xni0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/yni0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xni0;->a:Ljava/util/HashMap;

    .line 7
    .line 8
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

.method public static a()Ll/yni0;
    .locals 1

    .line 1
    const-string v0, "beatles_apm"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xni0;->e(Ljava/lang/String;)Ll/yni0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static b()Ll/yni0;
    .locals 1

    .line 1
    const-string v0, "beatles_emergency_thread"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xni0;->e(Ljava/lang/String;)Ll/yni0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static c()Ll/yni0;
    .locals 1

    .line 1
    const-string v0, "generate-logcat-file"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xni0;->e(Ljava/lang/String;)Ll/yni0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static d()Ll/yni0;
    .locals 1

    .line 1
    const-string v0, "beatles_report_thread"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xni0;->e(Ljava/lang/String;)Ll/yni0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static e(Ljava/lang/String;)Ll/yni0;
    .locals 2

    .line 1
    sget-object v0, Ll/xni0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/yni0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    new-instance v0, Ll/yni0;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/yni0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 18
    .line 19
    .line 20
    sget-object v1, Ll/xni0;->a:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-object v0
.end method
