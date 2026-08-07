.class public Ll/t660$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t660;->h(I)Ljava/lang/Runnable;
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
    iput p1, p0, Ll/t660$c;->a:I

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
    invoke-static {}, Ll/t660;->b()Ll/vpl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Ll/t660$c;->a:I

    .line 6
    .line 7
    const-string v2, "at_once_logs"

    .line 8
    .line 9
    invoke-interface {v0, v2, v1}, Ll/vpl;->a(Ljava/lang/String;I)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/te5;->a(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/t660;->b()Ll/vpl;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget p0, p0, Ll/t660$c;->a:I

    .line 24
    .line 25
    const-string v2, "normal_logs"

    .line 26
    .line 27
    invoke-interface {v0, v2, p0}, Ll/vpl;->a(Ljava/lang/String;I)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    invoke-static {v0}, Ll/te5;->a(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/t660;->c()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-static {v0}, Ll/d3k0;->a(Ljava/util/List;)Lcom/google/gson/JsonArray;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v1, "https://report.tantanapp.com/v1/online/android"

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-static {v1, p0, v3}, Ll/d3k0;->b(Ljava/lang/String;Lcom/google/gson/JsonArray;I)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    invoke-static {}, Ll/t660;->d()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v1, "test network upload success"

    .line 62
    .line 63
    invoke-static {p0, v1}, Ll/wu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/t660;->b()Ll/vpl;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0, v0, v2}, Ll/vpl;->d(Ljava/util/List;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/t660;->c()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-static {}, Ll/t660;->d()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string v0, "test network upload fail"

    .line 82
    .line 83
    invoke-static {p0, v0}, Ll/wu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/t660;->e()V

    .line 87
    .line 88
    .line 89
    return-void
.end method
