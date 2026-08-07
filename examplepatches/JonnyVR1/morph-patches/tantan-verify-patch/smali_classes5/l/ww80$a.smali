.class public Ll/ww80$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ww80;->X()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ww80;


# direct methods
.method public constructor <init>(Ll/ww80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ww80$a;->a:Ll/ww80;

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
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ww80$a;->a:Ll/ww80;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ww80;->s(Ll/ww80;)Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->aiPictureEnable()Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "0"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "1"

    .line 21
    .line 22
    :goto_0
    const-string v0, "switch_config_type"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "e_paip_choose_avatar"

    .line 33
    .line 34
    const-string v1, "p_privacy_and_permission_settings_view"

    .line 35
    .line 36
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ww80$a;->a:Ll/ww80;

    .line 40
    .line 41
    invoke-static {p1}, Ll/ww80;->u(Ll/ww80;)Ll/hw80;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/ww80$a;->a:Ll/ww80;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ww80;->v:Lv/VFrame;

    .line 48
    .line 49
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {p1, p0}, Ll/hw80;->Y0(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
