.class public final synthetic Lb6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf6g;


# direct methods
.method public synthetic constructor <init>(Lf6g;B)V
    .registers 3

    iput-byte p2, p0, Lb6g;->a:B

    iput-object p1, p0, Lb6g;->b:Lf6g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lb6g;->a:B

    iget-object p0, p0, Lb6g;->b:Lf6g;

    packed-switch v0, :pswitch_data_2e

    invoke-virtual {p0}, Lf6g;->H0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d
    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-object p0, p0, Lm6g;->l:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "no_lock_screen_password_manager_dialog"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
