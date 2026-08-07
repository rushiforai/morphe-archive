.class public final Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;
.super Lcom/p1/mobile/account_core/request_data/RequestData;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;",
        "Lcom/p1/mobile/account_core/request_data/RequestData;",
        "tttToken",
        "",
        "<init>",
        "(Ljava/lang/String;)V",
        "getTttToken",
        "()Ljava/lang/String;",
        "b_account_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final tttToken:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;->tttToken:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getTttToken()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;->tttToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
