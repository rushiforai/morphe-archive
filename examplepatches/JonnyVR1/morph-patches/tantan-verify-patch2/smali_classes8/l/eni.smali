.class public final synthetic Ll/eni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:[Lv/VCheckBox;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

.field public final synthetic c:[Ll/jl80;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>([Lv/VCheckBox;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;[Ll/jl80;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eni;->a:[Lv/VCheckBox;

    iput-object p2, p0, Ll/eni;->b:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    iput-object p3, p0, Ll/eni;->c:[Ll/jl80;

    iput-object p4, p0, Ll/eni;->d:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eni;->a:[Lv/VCheckBox;

    iget-object v1, p0, Ll/eni;->b:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    iget-object v2, p0, Ll/eni;->c:[Ll/jl80;

    iget-object p0, p0, Ll/eni;->d:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->x([Lv/VCheckBox;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;[Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
