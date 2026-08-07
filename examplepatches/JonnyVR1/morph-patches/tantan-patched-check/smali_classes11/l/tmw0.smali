.class public final Ll/tmw0;
.super Ll/tlw0;
.source "SourceFile"


# instance fields
.field public final a:Ll/zmw0;

.field public final synthetic b:Ll/umw0;


# direct methods
.method public constructor <init>(Ll/umw0;Ll/zmw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tmw0;->b:Ll/umw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tlw0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/tmw0;->a:Ll/zmw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final M3(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const/16 v0, 0x1fd6

    .line 2
    .line 3
    const-string v1, "statusCode"

    .line 4
    .line 5
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "sessionToken"

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Ll/ymw0;->c()Ll/xmw0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Ll/xmw0;->b(I)Ll/xmw0;

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ll/xmw0;->a(Ljava/lang/String;)Ll/xmw0;

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/tmw0;->a:Ll/zmw0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/xmw0;->c()Ll/ymw0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {p1, v1}, Ll/zmw0;->a(Ll/ymw0;)V

    .line 34
    .line 35
    .line 36
    const/16 p1, 0x1fdd

    .line 37
    .line 38
    if-ne v0, p1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/tmw0;->b:Ll/umw0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/umw0;->c()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
