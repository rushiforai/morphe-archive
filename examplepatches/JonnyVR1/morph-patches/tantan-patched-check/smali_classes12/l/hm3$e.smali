.class final Ll/hm3$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hm3;->p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/hm3;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ll/hm3;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hm3$e;->a:Ll/hm3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hm3$e;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hm3$e;->a:Ll/hm3;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hm3;->w(Ll/hm3;)Ll/hul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/hul;->getWebContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    instance-of v0, v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Ll/hm3$e;->a:Ll/hm3;

    .line 20
    .line 21
    invoke-static {v0}, Ll/hm3;->w(Ll/hm3;)Ll/hul;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ll/hul;->getWebContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    check-cast v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 35
    .line 36
    iget-object v1, p0, Ll/hm3$e;->b:Lorg/json/JSONObject;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    const/4 v3, 0x1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    const-string v4, "isShow"

    .line 43
    .line 44
    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-ne v1, v3, :cond_1

    .line 49
    .line 50
    move v2, v3

    .line 51
    :cond_1
    const-string v1, "JSBridge"

    .line 52
    .line 53
    invoke-virtual {v0, v2, v3, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D2(ZZLjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/hm3$e;->b:Lorg/json/JSONObject;

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    iget-object p0, p0, Ll/hm3$e;->a:Ll/hm3;

    .line 61
    .line 62
    invoke-static {v0}, Ll/glw;->d(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "1"

    .line 67
    .line 68
    invoke-static {p0, v0, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    const-string p0, "null cannot be cast to non-null type com.hellogroup.mk.business.ui.BaseMKProxyActivity"

    .line 73
    .line 74
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method
