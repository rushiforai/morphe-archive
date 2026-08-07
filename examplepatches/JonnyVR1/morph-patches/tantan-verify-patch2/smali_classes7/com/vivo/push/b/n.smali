.class public final Lcom/vivo/push/b/n;
.super Lcom/vivo/push/b/s;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:I

.field private c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-direct {p0, v0}, Lcom/vivo/push/b/s;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/vivo/push/b/n;->b:I

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/vivo/push/b/n;->c:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/vivo/push/b/n;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public final a(Z)V
    .locals 0

    .line 4
    iput-boolean p1, p0, Lcom/vivo/push/b/n;->c:Z

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/b/n;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final c(Lcom/vivo/push/a;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/vivo/push/b/s;->c(Lcom/vivo/push/a;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "content"

    .line 5
    .line 6
    iget-object v1, p0, Lcom/vivo/push/b/n;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "log_level"

    .line 12
    .line 13
    iget v1, p0, Lcom/vivo/push/b/n;->b:I

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    const-string v0, "is_server_log"

    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/vivo/push/b/n;->c:Z

    .line 21
    .line 22
    invoke-virtual {p1, v0, p0}, Lcom/vivo/push/a;->a(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/vivo/push/b/n;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final d(Lcom/vivo/push/a;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/vivo/push/b/s;->d(Lcom/vivo/push/a;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "content"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/vivo/push/b/n;->a:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "log_level"

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->b(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/vivo/push/b/n;->b:I

    .line 20
    .line 21
    const-string v0, "is_server_log"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->e(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput-boolean p1, p0, Lcom/vivo/push/b/n;->c:Z

    .line 28
    .line 29
    return-void
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/b/n;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/vivo/push/b/n;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "OnLogCommand"

    .line 2
    .line 3
    return-object p0
.end method
