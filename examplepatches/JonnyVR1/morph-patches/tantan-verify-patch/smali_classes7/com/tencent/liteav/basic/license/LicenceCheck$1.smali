.class Lcom/tencent/liteav/basic/license/LicenceCheck$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/license/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

.field final synthetic b:Lcom/tencent/liteav/basic/license/LicenceCheck;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->b:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 68
    const-string v0, "LicenceCheck"

    const-string v1, "downloadLicense, onProcessEnd"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->f:Z

    return-void
.end method

.method public a(I)V
    .locals 0

    .line 67
    const-string p0, "LicenceCheck"

    const-string p1, "downloadLicense, onProgressUpdate"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/io/File;Ljava/lang/Exception;)V
    .locals 0

    .line 66
    const-string p0, "LicenceCheck"

    const-string p1, "downloadLicense, onSaveFailed"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/io/File;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "LicenceCheck"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "downloadLicense, license not modified"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->b:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 14
    .line 15
    invoke-static {p1, v1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "downloadLicense, onSaveSuccess"

    .line 19
    .line 20
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->b:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 26
    .line 27
    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    const-string p1, "downloadLicense, readDownloadTempLicence is empty!"

    .line 38
    .line 39
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->f:Z

    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->b:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 51
    .line 52
    invoke-static {p2, v0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iget-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->b:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$1;->a:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 61
    .line 62
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method
