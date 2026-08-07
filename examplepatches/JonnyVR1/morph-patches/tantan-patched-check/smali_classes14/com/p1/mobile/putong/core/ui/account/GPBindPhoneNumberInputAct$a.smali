.class public Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->onResumeLifecycle()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct$a;->a:Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct$a;->a:Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct$a;->a:Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindPhoneNumberInputAct;->g:Lv/VMaterialEdit;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method
