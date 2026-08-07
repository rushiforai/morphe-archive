.class public final synthetic Ll/i3q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/data/WeChatToken;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/data/WeChatToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i3q0;->a:Lcom/p1/mobile/putong/account/data/WeChatToken;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i3q0;->a:Lcom/p1/mobile/putong/account/data/WeChatToken;

    check-cast p1, Lcom/p1/mobile/putong/account/data/ThirdPartVetify;

    invoke-static {p0, p1}, Ll/v3q0;->L0(Lcom/p1/mobile/putong/account/data/WeChatToken;Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
