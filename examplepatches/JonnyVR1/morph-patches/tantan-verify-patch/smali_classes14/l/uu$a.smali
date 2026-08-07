.class public Ll/uu$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uu;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uu;


# direct methods
.method public constructor <init>(Ll/uu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uu$a;->a:Ll/uu;

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
    .locals 3

    .line 1
    iget-object p1, p0, Ll/uu$a;->a:Ll/uu;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/pf60;

    .line 12
    .line 13
    const-string v1, "select_click_type"

    .line 14
    .line 15
    const-string v2, "policy"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_delete_account_interact_block_button"

    .line 25
    .line 26
    invoke-static {v1, p1, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/uu$a;->a:Ll/uu;

    .line 30
    .line 31
    iget-object p1, p1, Ll/uu;->g:Lv/VCheckBox;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/uu$a;->a:Ll/uu;

    .line 38
    .line 39
    invoke-static {p0}, Ll/uu;->f(Ll/uu;)Ll/bm5;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 44
    .line 45
    .line 46
    return-void
.end method
