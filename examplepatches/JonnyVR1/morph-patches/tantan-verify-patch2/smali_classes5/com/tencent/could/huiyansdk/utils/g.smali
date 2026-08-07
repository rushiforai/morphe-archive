.class public Lcom/tencent/could/huiyansdk/utils/g;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/utils/h;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/utils/h;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/utils/g;->a:Lcom/tencent/could/huiyansdk/utils/h;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/utils/g;->a:Lcom/tencent/could/huiyansdk/utils/h;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/utils/h;->a()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/g;->a:Lcom/tencent/could/huiyansdk/utils/h;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/utils/h;->b()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
