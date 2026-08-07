.class Lcom/idv/identity/platform/SystemLoadingActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/platform/SystemLoadingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/SystemLoadingActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/SystemLoadingActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/SystemLoadingActivity$a;->a:Lcom/idv/identity/platform/SystemLoadingActivity;

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
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x3e9

    .line 4
    .line 5
    if-ne v1, v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/SystemLoadingActivity$a;->a:Lcom/idv/identity/platform/SystemLoadingActivity;

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->L0(Lcom/idv/identity/platform/SystemLoadingActivity;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/16 p1, 0x3ea

    .line 18
    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/idv/identity/platform/SystemLoadingActivity$a;->a:Lcom/idv/identity/platform/SystemLoadingActivity;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->N0(Lcom/idv/identity/platform/SystemLoadingActivity;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method
