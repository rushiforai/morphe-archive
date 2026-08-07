.class public final synthetic Ll/hxk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hxk0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    iput-object p2, p0, Ll/hxk0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hxk0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    iget-object p0, p0, Ll/hxk0;->b:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/account/data/CaptchaData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;->h0(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Ll/y20;Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    return-void
.end method
