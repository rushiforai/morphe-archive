.class public final Lcom/vivo/push/b/w;
.super Lcom/vivo/push/o;
.source "SourceFile"


# instance fields
.field private a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/16 v0, 0x7db

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/vivo/push/o;-><init>(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/vivo/push/b/w;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final c(Lcom/vivo/push/a;)V
    .locals 1

    .line 1
    const-string v0, "com.bbk.push.ikey.MODE_TYPE"

    .line 2
    .line 3
    iget p0, p0, Lcom/vivo/push/b/w;->a:I

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/vivo/push/a;->a(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c()Z
    .locals 0

    .line 9
    const/4 p0, 0x1

    return p0
.end method

.method public final d()I
    .locals 0

    .line 11
    iget p0, p0, Lcom/vivo/push/b/w;->a:I

    return p0
.end method

.method public final d(Lcom/vivo/push/a;)V
    .locals 2

    .line 1
    const-string v0, "com.bbk.push.ikey.MODE_TYPE"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->b(Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/vivo/push/b/w;->a:I

    .line 9
    .line 10
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "PushModeCommand"

    .line 2
    .line 3
    return-object p0
.end method
