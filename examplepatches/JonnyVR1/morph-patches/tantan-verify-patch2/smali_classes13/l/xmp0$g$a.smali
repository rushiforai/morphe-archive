.class Ll/xmp0$g$a;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xmp0$g;->onRoomStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0$g;


# direct methods
.method public constructor <init>(Ll/xmp0$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$g$a;->a:Ll/xmp0$g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xmp0$g$a;->a:Ll/xmp0$g;

    .line 2
    .line 3
    iget-object v0, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/xmp0;->a5(Ll/xmp0;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/xmp0$g$a;->a:Ll/xmp0$g;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v1, Ll/xmp0$g;->a:Ll/xmp0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/xmp0;->b5(Ll/xmp0;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/xmp0$g$a;->a:Ll/xmp0$g;

    .line 26
    .line 27
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 28
    .line 29
    invoke-static {p0}, Ll/xmp0;->b5(Ll/xmp0;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/xmp0;->k2(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, v1, Ll/xmp0$g;->a:Ll/xmp0;

    .line 38
    .line 39
    invoke-static {v0}, Ll/xmp0;->c5(Ll/xmp0;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Ll/xmp0$g$a;->a:Ll/xmp0$g;

    .line 50
    .line 51
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 52
    .line 53
    invoke-static {p0}, Ll/xmp0;->c5(Ll/xmp0;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/xmp0;->k2(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method
