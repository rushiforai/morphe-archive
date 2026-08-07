.class public Lcom/hihonor/push/sdk/e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/f0;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/f0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/e0;->a:Lcom/hihonor/push/sdk/f0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p1, Landroid/os/Message;->what:I

    .line 4
    .line 5
    const/16 v0, 0x3e9

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/hihonor/push/sdk/e0;->a:Lcom/hihonor/push/sdk/f0;

    .line 10
    .line 11
    const p1, 0x7a19d3

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/f0;->a(I)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
