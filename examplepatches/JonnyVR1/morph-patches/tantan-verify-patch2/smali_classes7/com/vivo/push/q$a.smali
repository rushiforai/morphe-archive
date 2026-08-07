.class final Lcom/vivo/push/q$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vivo/push/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/vivo/push/q;


# direct methods
.method public constructor <init>(Lcom/vivo/push/q;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/q$a;->a:Lcom/vivo/push/q;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/q$a;->a:Lcom/vivo/push/q;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/vivo/push/q;->b(Landroid/os/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
