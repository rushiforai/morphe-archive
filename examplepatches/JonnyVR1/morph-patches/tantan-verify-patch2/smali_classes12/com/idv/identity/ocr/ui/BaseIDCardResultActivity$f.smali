.class Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

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
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->L0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)I

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->O0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 26
    .line 27
    sget-object p1, Ll/dfm;->A:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->P0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->Q0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V

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
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->N0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)I

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->w1()V

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
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->N0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)I

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y1()V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    const/4 p1, 0x1

    .line 78
    if-ne p1, v0, :cond_6

    .line 79
    .line 80
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t1(Z)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_6
    if-nez v0, :cond_7

    .line 87
    .line 88
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$f;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t1(Z)V

    .line 91
    .line 92
    .line 93
    :cond_7
    :goto_0
    return v1
.end method
