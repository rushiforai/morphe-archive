.class public Lcn/shuzilm/core/AIClient$gid;
.super Lcn/shuzilm/core/AIClient$HII$OI;
.source "SourceFile"


# instance fields
.field final synthetic b:Lcn/shuzilm/core/AIClient;


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/AIClient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$gid;->b:Lcn/shuzilm/core/AIClient;

    .line 2
    .line 3
    invoke-direct {p0}, Lcn/shuzilm/core/AIClient$HII$OI;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public go(ILandroid/os/Bundle;)V
    .locals 1

    .line 1
    const/16 p1, 0xb

    .line 2
    .line 3
    :try_start_0
    new-array p1, p1, [I

    .line 4
    .line 5
    fill-array-data p1, :array_0

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcn/shuzilm/core/AIClient$gid;->b:Lcn/shuzilm/core/AIClient;

    .line 9
    .line 10
    invoke-static {v0, p1}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcn/shuzilm/core/AIClient$gid;->b:Lcn/shuzilm/core/AIClient;

    .line 19
    .line 20
    invoke-static {}, Lcn/shuzilm/core/AIClient;->d()[I

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {p0, p2}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;[I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/AIClient;->a(Lcn/shuzilm/core/AIClient;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :array_0
    .array-data 4
        0xee
        0xe8
        0xe5
        0xef
        0xd6
        0xed
        0xe0
        0xd6
        0xe8
        0xe6
        0x0
    .end array-data
.end method
