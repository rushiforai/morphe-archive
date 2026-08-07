.class Ll/fde0$c;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fde0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field final synthetic c:Ll/fde0;


# direct methods
.method public constructor <init>(Ll/fde0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fde0$c;->c:Ll/fde0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/fde0$c;->a:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/fde0$c;->b:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/fde0$c;->a:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 5
    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/fde0$c;->a:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Ll/fde0$c;->c:Ll/fde0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/fde0;->R1(Ll/fde0;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x3e8

    .line 18
    .line 19
    div-int/2addr v1, v0

    .line 20
    int-to-long v0, v1

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fde0$c;->c:Ll/fde0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/fde0;->S1(Ll/fde0;)Ll/g510;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-boolean v0, p0, Ll/fde0$c;->b:Z

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/fde0$c;->c:Ll/fde0;

    .line 37
    .line 38
    invoke-static {v0}, Ll/fde0;->S1(Ll/fde0;)Ll/g510;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Ll/g510;->z(Ll/omw;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method
