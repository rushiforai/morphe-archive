.class public final Lcom/vivo/push/b/h;
.super Lcom/vivo/push/o;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/16 v0, 0x7dd

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/vivo/push/o;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/vivo/push/b/h;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/vivo/push/b/h;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final c(Lcom/vivo/push/a;)V
    .locals 1

    .line 1
    const-string v0, "MsgArriveCommand.MSG_TAG"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/vivo/push/b/h;->a:Ljava/lang/String;

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
    const-string v0, "MsgArriveCommand.MSG_TAG"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/vivo/push/b/h;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method
