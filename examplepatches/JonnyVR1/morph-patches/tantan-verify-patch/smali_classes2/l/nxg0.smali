.class public final Ll/nxg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/rg50;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    sget-object v0, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    new-instance v0, Ljava/io/File;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v1, "sud-picasso-cache"

    .line 14
    .line 15
    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {v0}, Ll/yuq0;->c(Ljava/io/File;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    new-instance p1, Ll/rg50$b;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/rg50$b;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v3, Ll/tx3;

    .line 37
    .line 38
    invoke-direct {v3, v0, v1, v2}, Ll/tx3;-><init>(Ljava/io/File;J)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v3}, Ll/rg50$b;->d(Ll/tx3;)Ll/rg50$b;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/h0h0;

    .line 46
    .line 47
    const-string v1, "PicassoIpv4PreferredDns"

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ll/h0h0;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Ll/nxg0;->a:Ll/rg50;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/rg50;->c()Ll/tx3;

    .line 66
    .line 67
    .line 68
    return-void
.end method
