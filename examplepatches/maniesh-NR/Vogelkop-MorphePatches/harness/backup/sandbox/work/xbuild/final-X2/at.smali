.class public final synthetic Lat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lct;


# direct methods
.method public synthetic constructor <init>(Lct;B)V
    .registers 3

    iput-byte p2, p0, Lat;->a:B

    iput-object p1, p0, Lat;->b:Lct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lat;->a:B

    const-string v1, "speed_dial.large_icons"

    const/4 v2, 0x0

    iget-object p0, p0, Lat;->b:Lct;

    packed-switch v0, :pswitch_data_64

    iget-object p0, p0, Lct;->s:Lwk9;

    if-eqz p0, :cond_f

    move-object v2, p0

    :cond_f
    iget-object p0, v2, Lwk9;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lct;->s:Lwk9;

    if-eqz p0, :cond_19

    move-object v2, p0

    :cond_19
    iget-object p0, v2, Lwk9;->i:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    return-object p0

    :pswitch_1e
    iget-object p0, p0, Lct;->s:Lwk9;

    if-eqz p0, :cond_23

    move-object v2, p0

    :cond_23
    iget-object p0, v2, Lwk9;->f:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    return-object p0

    :pswitch_28
    iget-object p0, p0, Lct;->s:Lwk9;

    if-eqz p0, :cond_2d

    move-object v2, p0

    :cond_2d
    iget-object p0, v2, Lwk9;->e:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    return-object p0

    :pswitch_32
    iget-object p0, p0, Lct;->s:Lwk9;

    if-eqz p0, :cond_37

    move-object v2, p0

    :cond_37
    iget-object p0, v2, Lwk9;->h:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    return-object p0

    :pswitch_3c
    iget-object p0, p0, Lct;->s:Lwk9;

    if-eqz p0, :cond_41

    move-object v2, p0

    :cond_41
    iget-object p0, v2, Lwk9;->g:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    return-object p0

    :pswitch_46
    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object p0, p0, Lju;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_55
    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object p0, p0, Lju;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_55
        :pswitch_46
        :pswitch_3c
        :pswitch_32
        :pswitch_28
        :pswitch_1e
        :pswitch_14
    .end packed-switch
.end method
