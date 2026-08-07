.class Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/ocr/ui/IDCardResultProActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

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
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->L0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->O0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    return v1

    .line 19
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 20
    .line 21
    const/16 v2, 0x3e8

    .line 22
    .line 23
    if-ne v2, v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 26
    .line 27
    sget-object p1, Ll/dfm;->A:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->P0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/16 v2, 0x3e9

    .line 34
    .line 35
    if-ne v2, v0, :cond_3

    .line 36
    .line 37
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p1, Ljava/lang/String;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->Q0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    const/16 p1, 0x3ea

    .line 48
    .line 49
    if-ne p1, v0, :cond_4

    .line 50
    .line 51
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->N0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)I

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->q1()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    const/16 p1, 0x3eb

    .line 63
    .line 64
    if-ne p1, v0, :cond_5

    .line 65
    .line 66
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->N0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)I

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$d;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->r1()V

    .line 74
    .line 75
    .line 76
    :cond_5
    :goto_0
    return v1
.end method
