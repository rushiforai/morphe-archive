.class public Lcom/p1/mobile/putong/account/ui/accountnew/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/account/ui/accountnew/a;->J(Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyData;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/accountnew/a;->l:Lv/VCheckBox;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/v6l0;->o:Ll/x20;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->B(Lcom/p1/mobile/putong/account/ui/accountnew/a;)Ll/bm5;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
