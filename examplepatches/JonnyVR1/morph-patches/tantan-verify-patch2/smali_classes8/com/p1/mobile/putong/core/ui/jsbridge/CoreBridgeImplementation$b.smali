.class public Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->inviteFriendCompletion(Ll/aqq;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->d:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->b:Ll/aqq;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ll/aqq;)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_invitefriends_share_button_again"

    .line 11
    .line 12
    const-string v2, "p_invitefriends"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1, p0}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->b:Ll/aqq;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "\u518d\u6b21\u5206\u4eab\uff0c\u89e3\u9501\u66f4\u591a\u7279\u6743"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "\u5206\u4eab\u5230\u591a\u4e2a\u7fa4\u53ef\u4ee5\u5feb\u901f\u89e3\u9501"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->b:Ll/aqq;

    .line 26
    .line 27
    new-instance v3, Ll/i87;

    .line 28
    .line 29
    invoke-direct {v3, v1, v2}, Ll/i87;-><init>(Ljava/lang/String;Ll/aqq;)V

    .line 30
    .line 31
    .line 32
    const-string v1, "\u7ee7\u7eed\u5206\u4eab"

    .line 33
    .line 34
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "\u7a0d\u540e\u518d\u8bf4"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$b;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    new-array p0, p0, [Ll/sfj0$a;

    .line 55
    .line 56
    const-string v0, "e_invitefriends_share_button_again"

    .line 57
    .line 58
    const-string v1, "p_invitefriends"

    .line 59
    .line 60
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
