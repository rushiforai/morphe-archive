.class public final Lcom/vivo/push/b/l;
.super Lcom/vivo/push/b/s;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/16 v0, 0x7e0

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/vivo/push/b/s;-><init>(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lcom/vivo/push/b/l;->a:I

    .line 8
    .line 9
    iput v0, p0, Lcom/vivo/push/b/l;->b:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final c(Lcom/vivo/push/a;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/vivo/push/b/s;->c(Lcom/vivo/push/a;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "key_dispatch_environment"

    .line 5
    .line 6
    iget v1, p0, Lcom/vivo/push/b/l;->a:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    const-string v0, "key_dispatch_area"

    .line 12
    .line 13
    iget p0, p0, Lcom/vivo/push/b/l;->b:I

    .line 14
    .line 15
    invoke-virtual {p1, v0, p0}, Lcom/vivo/push/a;->a(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final d()I
    .locals 0

    .line 22
    iget p0, p0, Lcom/vivo/push/b/l;->a:I

    return p0
.end method

.method public final d(Lcom/vivo/push/a;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/vivo/push/b/s;->d(Lcom/vivo/push/a;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "key_dispatch_environment"

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->b(Ljava/lang/String;I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/vivo/push/b/l;->a:I

    .line 12
    .line 13
    const-string v0, "key_dispatch_area"

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->b(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lcom/vivo/push/b/l;->b:I

    .line 20
    .line 21
    return-void
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/b/l;->b:I

    .line 2
    .line 3
    return p0
.end method
