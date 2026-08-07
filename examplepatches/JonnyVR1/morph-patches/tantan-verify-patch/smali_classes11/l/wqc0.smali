.class public Ll/wqc0;
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
    .locals 4

    .line 1
    sget-object v0, Ll/be00;->a:Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/be00;->a:Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->c()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, "3.0.3_030502"

    .line 14
    .line 15
    const/16 v3, 0x138b

    .line 16
    .line 17
    invoke-static {v2, v3, v0, v1}, Ll/zsd0;->f(Ljava/lang/String;ILjava/lang/String;I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method
