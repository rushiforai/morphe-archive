.class public final synthetic Ll/qm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qm;->a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    iput-object p2, p0, Ll/qm;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/qm;->c:Lcom/p1/mobile/android/app/Dialog;

    iput-object p4, p0, Ll/qm;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qm;->a:Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    iget-object v1, p0, Ll/qm;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/qm;->c:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/qm;->d:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/account/data/CaptchaData;

    invoke-static {v0, v1, v2, p0, p1}, Ll/sm;->z(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/y20;Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    return-void
.end method
