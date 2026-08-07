.class public Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/utl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/utl<",
        "Ll/m4j;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->a:Ljava/util/HashMap;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;-><init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 1
    check-cast p1, Ll/m4j;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->c(Ll/m4j;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/m4j;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->t(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p1, Ll/m4j;->a:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->u(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Ll/i4j;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/i4j;->e()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-gt v0, v1, :cond_3

    .line 23
    .line 24
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->a:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    new-instance v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 44
    .line 45
    invoke-direct {v0, v1, p2}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;-><init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->a:Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-virtual {v1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    :cond_2
    iget p1, p1, Ll/m4j;->a:I

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->a(I)V

    .line 56
    .line 57
    .line 58
    iget-wide v1, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->b:J

    .line 59
    .line 60
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->u(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Ll/i4j;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ll/i4j;->f()J

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    cmp-long p1, v1, v3

    .line 71
    .line 72
    if-ltz p1, :cond_3

    .line 73
    .line 74
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->a:Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;->b()V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->b:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/ioi0;->o()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_3

    .line 89
    .line 90
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;->a:Ljava/util/HashMap;

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 93
    .line 94
    .line 95
    :cond_3
    :goto_0
    return-void
.end method
