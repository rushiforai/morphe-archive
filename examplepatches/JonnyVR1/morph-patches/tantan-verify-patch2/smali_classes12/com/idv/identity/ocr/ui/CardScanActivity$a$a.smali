.class Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity$a;->b(Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/net/Uri;

.field final synthetic b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity$a;Landroid/net/Uri;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->a:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->a1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->a:Landroid/net/Uri;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/idv/identity/ocr/compress/CompressConfig$b;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/idv/identity/ocr/compress/CompressConfig$b;-><init>()V

    .line 24
    .line 25
    .line 26
    const v1, 0x7d000

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/compress/CompressConfig$b;->b(I)Lcom/idv/identity/ocr/compress/CompressConfig$b;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/idv/identity/ocr/compress/CompressConfig$b;->a()Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 44
    .line 45
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->a:Landroid/net/Uri;

    .line 46
    .line 47
    invoke-static {v3, v4}, Lcom/idv/identity/ocr/ui/CardScanActivity;->d1(Lcom/idv/identity/ocr/ui/CardScanActivity;Landroid/net/Uri;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    new-instance v5, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;

    .line 52
    .line 53
    invoke-direct {v5, p0, v1, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;J)V

    .line 54
    .line 55
    .line 56
    invoke-static {v3, v0, v4, v5}, Ll/kt5;->e(Landroid/content/Context;Lcom/idv/identity/ocr/compress/CompressConfig;Ljava/lang/String;Ll/jt5$a;)Ll/jt5;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p0}, Ll/jt5;->a()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    const-string v0, "PhotoPicker"

    .line 65
    .line 66
    const-string v3, "No media selected"

    .line 67
    .line 68
    invoke-static {v0, v3}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 81
    .line 82
    invoke-static {p0, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->j1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
