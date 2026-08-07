.class public final Lcom/vivo/push/b/y;
.super Lcom/vivo/push/o;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x7d8

    .line 9
    invoke-direct {p0, v0}, Lcom/vivo/push/o;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/16 v0, 0x7d8

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/vivo/push/o;-><init>(I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/vivo/push/b/y;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c(Lcom/vivo/push/a;)V
    .locals 1

    .line 1
    const-string v0, "package_name"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/vivo/push/b/y;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d(Lcom/vivo/push/a;)V
    .locals 1

    .line 1
    const-string v0, "package_name"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/vivo/push/b/y;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "StopServiceCommand"

    .line 2
    .line 3
    return-object p0
.end method
