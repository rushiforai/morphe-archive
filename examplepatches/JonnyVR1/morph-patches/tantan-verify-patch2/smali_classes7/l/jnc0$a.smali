.class public Ll/jnc0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jnc0;->i(Ll/rg50;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x1d0;

.field public final synthetic b:Ll/jnc0;


# direct methods
.method public constructor <init>(Ll/jnc0;Ll/x1d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jnc0$a;->a:Ll/x1d0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p2, p1}, Ll/jnc0;->j(Ljava/lang/Exception;Ll/i5d0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 2

    .line 1
    const-string p1, "OkHttp WebSocket "

    .line 2
    .line 3
    sget-object v0, Ll/kzm;->a:Ll/kzm;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/kzm;->f(Ll/i5d0;)Ll/n6f;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :try_start_0
    iget-object v1, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 10
    .line 11
    invoke-virtual {v1, p2, v0}, Ll/jnc0;->g(Ll/i5d0;Ll/n6f;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/n6f;->i()Ll/jnc0$f;

    .line 15
    .line 16
    .line 17
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 18
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/jnc0$a;->a:Ll/x1d0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/rnl;->G()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v1, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 41
    .line 42
    invoke-virtual {v1, p1, v0}, Ll/jnc0;->k(Ljava/lang/String;Ll/jnc0$f;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 46
    .line 47
    iget-object v0, p1, Ll/jnc0;->b:Ll/ksp0;

    .line 48
    .line 49
    invoke-virtual {v0, p1, p2}, Ll/ksp0;->f(Ll/hsp0;Ll/i5d0;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/jnc0;->l()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception p1

    .line 59
    iget-object p0, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 60
    .line 61
    const/4 p2, 0x0

    .line 62
    invoke-virtual {p0, p1, p2}, Ll/jnc0;->j(Ljava/lang/Exception;Ll/i5d0;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :catch_1
    move-exception p1

    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/n6f;->q()V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object p0, p0, Ll/jnc0$a;->b:Ll/jnc0;

    .line 73
    .line 74
    invoke-virtual {p0, p1, p2}, Ll/jnc0;->j(Ljava/lang/Exception;Ll/i5d0;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p2}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
