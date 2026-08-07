.class Lcom/idv/identity/platform/FinalVerifyActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/platform/FinalVerifyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/FinalVerifyActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/FinalVerifyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/FinalVerifyActivity$a;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

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
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    .line 6
    .line 7
    const/16 v2, 0x3e9

    .line 8
    .line 9
    if-ne v2, v1, :cond_1

    .line 10
    .line 11
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$a;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/idv/identity/platform/FinalVerifyActivity;->L0(Lcom/idv/identity/platform/FinalVerifyActivity;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/16 p1, 0x3eb

    .line 22
    .line 23
    if-ne p1, v1, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$a;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p1}, Lcom/idv/identity/platform/FinalVerifyActivity;->N0(Lcom/idv/identity/platform/FinalVerifyActivity;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/16 p1, 0x3ea

    .line 33
    .line 34
    if-ne p1, v1, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$a;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 37
    .line 38
    invoke-static {p0, v0}, Lcom/idv/identity/platform/FinalVerifyActivity;->N0(Lcom/idv/identity/platform/FinalVerifyActivity;Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    const/16 p1, 0x3ec

    .line 43
    .line 44
    if-ne p1, v1, :cond_4

    .line 45
    .line 46
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$a;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/idv/identity/platform/FinalVerifyActivity;->O0(Lcom/idv/identity/platform/FinalVerifyActivity;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    :goto_0
    return v0
.end method
