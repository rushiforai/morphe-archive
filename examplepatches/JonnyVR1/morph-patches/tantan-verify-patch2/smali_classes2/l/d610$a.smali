.class Ll/d610$a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d610;->g(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Ll/d610;


# direct methods
.method public constructor <init>(Ll/d610;ZLandroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d610$a;->c:Ll/d610;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/d610$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/d610$a;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d610$a;->c:Ll/d610;

    .line 2
    .line 3
    invoke-static {v0}, Ll/d610;->a(Ll/d610;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/f4r0;->e()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/f4r0;->f()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/d610$a;->c:Ll/d610;

    .line 20
    .line 21
    iget-object v0, v0, Ll/d610;->d:Ll/d610$c;

    .line 22
    .line 23
    iget-object v0, v0, Ll/d610$c;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Ll/j0r0;->n(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    :goto_0
    return-void

    .line 32
    :cond_2
    iget-object v0, p0, Ll/d610$a;->c:Ll/d610;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/d610;->b(Ll/d610;Z)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/d610$a;->c:Ll/d610;

    .line 39
    .line 40
    iget-object v1, v0, Ll/d610;->e:Ll/puq0;

    .line 41
    .line 42
    if-nez v1, :cond_3

    .line 43
    .line 44
    new-instance v1, Ll/puq0;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/puq0;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v1, v0, Ll/d610;->e:Ll/puq0;

    .line 50
    .line 51
    :cond_3
    iget-boolean v0, p0, Ll/d610$a;->a:Z

    .line 52
    .line 53
    if-nez v0, :cond_4

    .line 54
    .line 55
    invoke-static {}, Ll/cyq0;->a()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/vuq0;->b(Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v2, "host_app_id"

    .line 69
    .line 70
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/d610$a;->c:Ll/d610;

    .line 74
    .line 75
    iget-object v0, v0, Ll/d610;->d:Ll/d610$c;

    .line 76
    .line 77
    iget-object v0, v0, Ll/d610$c;->e:Ljava/lang/String;

    .line 78
    .line 79
    const-string v2, "sdk_version"

    .line 80
    .line 81
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    const/4 v1, 0x0

    .line 86
    :goto_1
    iget-object v0, p0, Ll/d610$a;->c:Ll/d610;

    .line 87
    .line 88
    iget-object v2, v0, Ll/d610;->e:Ll/puq0;

    .line 89
    .line 90
    iget-object v3, p0, Ll/d610$a;->b:Landroid/content/Context;

    .line 91
    .line 92
    iget-object v0, v0, Ll/d610;->d:Ll/d610$c;

    .line 93
    .line 94
    invoke-virtual {v2, v3, v0, v1}, Ll/puq0;->d(Landroid/content/Context;Ll/d610$c;Ljava/util/Map;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/d610$a;->c:Ll/d610;

    .line 98
    .line 99
    iget-object v0, p0, Ll/d610;->d:Ll/d610$c;

    .line 100
    .line 101
    iget-object p0, p0, Ll/d610;->e:Ll/puq0;

    .line 102
    .line 103
    iput-object p0, v0, Ll/d610$c;->j:Ll/puq0;

    .line 104
    .line 105
    return-void
.end method
