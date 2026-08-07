.class public Ll/gb5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/fb5$c;


# direct methods
.method public constructor <init>(Ll/hb5;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gb5$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/gb5$a;-><init>(Ll/gb5;Ll/hb5;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gb5;->a:Ll/fb5$c;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic a(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/gb5;->d(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static d(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public b(Ljava/io/Closeable;)Ll/fb5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U::",
            "Ljava/io/Closeable;",
            ">(TU;)",
            "Ll/fb5<",
            "TU;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gb5;->a:Ll/fb5$c;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/fb5;->U(Ljava/io/Closeable;Ll/fb5$c;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ll/w4d0<",
            "TT;>;)",
            "Ll/fb5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gb5;->a:Ll/fb5$c;

    .line 2
    .line 3
    invoke-static {p1, p2, p0}, Ll/fb5;->a0(Ljava/lang/Object;Ll/w4d0;Ll/fb5$c;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
