.class Ll/fr2$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gb1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fr2;->z2(Ljava/lang/String;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/fr2;


# direct methods
.method public constructor <init>(Ll/fr2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fr2$b;->a:Ll/fr2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;II)V
    .locals 3

    .line 1
    new-instance p1, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p3, -0x1

    .line 7
    const-string v0, "BasePusherPipline_RecordFile"

    .line 8
    .line 9
    const-string v1, "RecordDesc"

    .line 10
    .line 11
    if-eq p2, p3, :cond_2

    .line 12
    .line 13
    const/4 p3, 0x1

    .line 14
    if-eq p2, p3, :cond_1

    .line 15
    .line 16
    const/4 p3, 0x2

    .line 17
    if-eq p2, p3, :cond_0

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p2, "\u64ad\u653e\u4f34\u594f\u5b8c\u6210"

    .line 22
    .line 23
    invoke-virtual {p1, v1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p3, p0, Ll/fr2$b;->a:Ll/fr2;

    .line 27
    .line 28
    invoke-static {p3}, Ll/fr2;->n2(Ll/fr2;)Landroid/os/Handler;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    const/16 v1, 0x2009

    .line 37
    .line 38
    iput v1, p3, Landroid/os/Message;->what:I

    .line 39
    .line 40
    invoke-virtual {p3, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/fr2$b;->a:Ll/fr2;

    .line 44
    .line 45
    invoke-static {v2}, Ll/fr2;->n2(Ll/fr2;)Landroid/os/Handler;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2, p3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    move p2, v1

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const-string p2, "\u64ad\u653e\u4f34\u594f\u64ad\u653e\u5668Prepared"

    .line 58
    .line 59
    invoke-virtual {p1, v1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/16 p2, 0x2008

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    const-string p2, "\u64ad\u653e\u4f34\u594f\u64ad\u653e\u5668\u5931\u8d25"

    .line 69
    .line 70
    invoke-virtual {p1, v1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const/16 p2, -0x2006

    .line 77
    .line 78
    :goto_0
    iget-object p3, p0, Ll/fr2$b;->a:Ll/fr2;

    .line 79
    .line 80
    invoke-static {p3}, Ll/fr2;->C(Ll/fr2;)Ll/l6m$a;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    if-eqz p3, :cond_3

    .line 85
    .line 86
    iget-object p0, p0, Ll/fr2$b;->a:Ll/fr2;

    .line 87
    .line 88
    invoke-static {p0}, Ll/fr2;->C(Ll/fr2;)Ll/l6m$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0, p2, p1}, Ll/l6m$a;->a(ILandroid/os/Bundle;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    return-void
.end method
