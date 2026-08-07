.class public Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;->initSubscription()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct$a;->a:Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct$a;->a:Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;->c:Lv/VMaterialEdit;

    .line 4
    .line 5
    sget-object v1, Ll/bsj0;->j:Ll/qcj;

    .line 6
    .line 7
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct$a;->a:Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;->d2(Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct$a;->a:Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;->c2(Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
