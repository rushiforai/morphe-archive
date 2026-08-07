.class Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/wxapi/WXEntryActivity;->sendResult(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/wxapi/WXEntryActivity;

.field final synthetic val$code:I

.field final synthetic val$thirdCode:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/wxapi/WXEntryActivity;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;->this$0:Lcom/p1/mobile/putong/wxapi/WXEntryActivity;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;->val$code:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;->val$thirdCode:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 11
    check-cast p1, Ll/uxj0;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;->call(Ll/uxj0;)V

    return-void
.end method

.method public call(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;->val$code:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/wxapi/WXEntryActivity$1;->val$thirdCode:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, v0, p0}, Ll/bn5;->sendThirdPartLoginResult(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
