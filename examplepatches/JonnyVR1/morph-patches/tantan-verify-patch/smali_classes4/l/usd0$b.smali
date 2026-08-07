.class public Ll/usd0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/usd0;->g(I)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/usd0$b;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    invoke-static {}, Ll/usd0;->b()Ll/vpl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p0, p0, Ll/usd0$b;->a:I

    .line 6
    .line 7
    const-string v1, "sc_logs"

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Ll/vpl;->a(Ljava/lang/String;I)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/te5;->a(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/usd0;->c()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {p0}, Ll/d3k0;->a(Ljava/util/List;)Lcom/google/gson/JsonArray;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "https://sc-report.tantanapp.com/v1/online/android"

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v2, v0, v3}, Ll/d3k0;->b(Ljava/lang/String;Lcom/google/gson/JsonArray;I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-static {}, Ll/usd0;->d()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "sc test network upload success"

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/wu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/usd0;->b()Ll/vpl;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, p0, v1}, Ll/vpl;->d(Ljava/util/List;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/usd0;->c()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-static {}, Ll/usd0;->d()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "sc test network upload fail"

    .line 64
    .line 65
    invoke-static {p0, v0}, Ll/wu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/usd0;->e()V

    .line 69
    .line 70
    .line 71
    return-void
.end method
