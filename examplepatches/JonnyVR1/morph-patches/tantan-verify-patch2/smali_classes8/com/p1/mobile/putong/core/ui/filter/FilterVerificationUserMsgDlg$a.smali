.class public Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/jl80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bm5;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

.field public final synthetic d:[Lv/VCheckBox;


# direct methods
.method public constructor <init>(Ll/bm5;ZLcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;[Lv/VCheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->a:Ll/bm5;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->b:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->c:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->d:[Lv/VCheckBox;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->a:Ll/bm5;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bm5;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->b:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->c:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_PAGE:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$a;->d:[Lv/VCheckBox;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    aget-object p0, p0, p1

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
