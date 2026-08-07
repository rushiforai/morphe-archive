.class public final synthetic Ll/nmu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jjs;


# direct methods
.method public synthetic constructor <init>(Ll/jjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nmu;->a:Ll/jjs;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmu;->a:Ll/jjs;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->j0(Ll/jjs;)V

    return-void
.end method
