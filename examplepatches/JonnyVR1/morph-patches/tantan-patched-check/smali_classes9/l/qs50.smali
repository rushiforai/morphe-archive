.class public Ll/qs50;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "\u6bcf\u5929%s\u6b21\u548c\u5728\u7ebf\u5c0f\u54e5\u54e5\u804a\u5929\u673a\u4f1a\uff0c\u9644\u8fd1\u9ad8\u989c\u503c\uff0c\u65e0\u9700\u914d\u5bf9\uff0c\u7acb\u5373\u5f00\u804a"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, "\u6bcf\u5929%s\u6b21\u548c\u5728\u7ebf\u5c0f\u59d0\u59d0\u804a\u5929\u673a\u4f1a\uff0c\u9644\u8fd1\u9ad8\u989c\u503c\uff0c\u65e0\u9700\u914d\u5bf9\uff0c\u7acb\u5373\u5f00\u804a"

    .line 11
    .line 12
    return-object v0
.end method

.method public static b()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->L1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/qs50;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 13
    .line 14
    invoke-static {}, Ll/c17;->u0()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    sget v1, Lcom/p1/mobile/putong/core/R$string;->s3:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget v1, Lcom/p1/mobile/putong/core/R$string;->r3:I

    .line 24
    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Nl:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "\u5fc3\u52a8\u548c\u5728\u7ebf\u95ea\u804a"

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->L1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/upm;->T()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string v0, "3"

    .line 17
    .line 18
    return-object v0
.end method
