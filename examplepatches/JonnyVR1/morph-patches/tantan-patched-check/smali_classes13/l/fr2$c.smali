.class Ll/fr2$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s23$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fr2;->p2(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/t23;

.field final synthetic c:Ll/fr2;


# direct methods
.method public constructor <init>(Ll/fr2;Ljava/lang/String;Ll/t23;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fr2$c;->c:Ll/fr2;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fr2$c;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/fr2$c;->b:Ll/t23;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fr2$c;->c:Ll/fr2;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/fr2;->o2(Ll/fr2;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/fr2$c;->c:Ll/fr2;

    .line 7
    .line 8
    invoke-static {p1}, Ll/fr2;->n2(Ll/fr2;)Landroid/os/Handler;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/16 v0, 0x2021

    .line 17
    .line 18
    iput v0, p1, Landroid/os/Message;->what:I

    .line 19
    .line 20
    new-instance v0, Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "RecordDesc"

    .line 26
    .line 27
    const-string v2, "\u622a\u56fe\u6210\u529f"

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v1, "imagePath"

    .line 33
    .line 34
    iget-object v2, p0, Ll/fr2$c;->a:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/fr2$c;->c:Ll/fr2;

    .line 43
    .line 44
    invoke-static {v0}, Ll/fr2;->n2(Ll/fr2;)Landroid/os/Handler;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 49
    .line 50
    .line 51
    :try_start_0
    iget-object p1, p0, Ll/fr2$c;->c:Ll/fr2;

    .line 52
    .line 53
    iget-object v0, p1, Ll/fr2;->a:Ll/c410;

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    iget-object p1, p1, Ll/fr2;->b:Ll/z5m;

    .line 58
    .line 59
    iget-object v1, p0, Ll/fr2$c;->b:Ll/t23;

    .line 60
    .line 61
    invoke-interface {v0, p1, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->X(Ll/z5m;Ll/dfj;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/fr2$c;->c:Ll/fr2;

    .line 65
    .line 66
    iget-object p1, p1, Ll/fr2;->a:Ll/c410;

    .line 67
    .line 68
    iget-object p0, p0, Ll/fr2$c;->b:Ll/t23;

    .line 69
    .line 70
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ll/g510;->m()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {p1, p0, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->I(Ll/wej;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    :catch_0
    :cond_0
    return-void
.end method
