.class public final synthetic Ll/exk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/account/data/CaptchaData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Ll/y20;Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/exk0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    iput-object p2, p0, Ll/exk0;->b:Ll/y20;

    iput-object p3, p0, Ll/exk0;->c:Lcom/p1/mobile/putong/account/data/CaptchaData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/exk0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    iget-object v1, p0, Ll/exk0;->b:Ll/y20;

    iget-object p0, p0, Ll/exk0;->c:Lcom/p1/mobile/putong/account/data/CaptchaData;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;->k0(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Ll/y20;Lcom/p1/mobile/putong/account/data/CaptchaData;Ll/uxj0;)V

    return-void
.end method
