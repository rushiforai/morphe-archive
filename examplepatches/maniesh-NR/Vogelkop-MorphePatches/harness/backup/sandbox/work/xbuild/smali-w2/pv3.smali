.class public final synthetic Lpv3;
.super Lb6h;
.source "SourceFile"


# instance fields
.field public final synthetic b:B


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 15

    iput-byte p2, p0, Lpv3;->b:B

    packed-switch p2, :pswitch_data_e2

    const-string v4, "getUnfilteredUsageReporter()Lcom/opera/android/analytics/UnfilteredUsageReporter;"

    const/4 v5, 0x0

    const-class v2, Lcom/opera/android/OperaApplication;

    const-string v3, "unfilteredUsageReporter"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_12
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getContinueOnBooking()Lcom/opera/android/continue_on_booking/ContinueOnBookingController;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "continueOnBooking"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_1f
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getPushedContentHandler()Lcom/opera/android/PushedContentHandler;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "pushedContentHandler"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_2c
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getDefaultBrowserForHttp()Lcom/opera/android/defaultbrowser/DefaultBrowser;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "defaultBrowserForHttp"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_39
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getFavoriteManager()Lcom/opera/android/favorites/FavoriteManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "favoriteManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_46
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getAccountManager()Lcom/opera/android/account/AccountManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "accountManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_53
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "usageReporter"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_60
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "usageReporter"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_6d
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getUnfilteredUsageReporter()Lcom/opera/android/analytics/UnfilteredUsageReporter;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "unfilteredUsageReporter"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_7a
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getPushedContentHandler()Lcom/opera/android/PushedContentHandler;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "pushedContentHandler"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_87
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getAccountManager()Lcom/opera/android/account/AccountManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "accountManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_94
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getFavoriteManager()Lcom/opera/android/favorites/FavoriteManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "favoriteManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_a1
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getAccountManager()Lcom/opera/android/account/AccountManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "accountManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_ae
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getReadingListContent()Lcom/opera/android/readlater/ReadingListContent;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "readingListContent"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_bb
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getAccountManager()Lcom/opera/android/account/AccountManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "accountManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_c8
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getSyncManager()Lcom/opera/android/sync/SyncManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "syncManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_d5
    move-object v6, p0

    move-object v7, p1

    const-string v10, "getAccountManager()Lcom/opera/android/account/AccountManager;"

    const/4 v11, 0x0

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "accountManager"

    invoke-direct/range {v6 .. v11}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void

    :pswitch_data_e2
    .packed-switch 0x6
        :pswitch_d5
        :pswitch_c8
        :pswitch_bb
        :pswitch_ae
        :pswitch_a1
        :pswitch_94
        :pswitch_87
        :pswitch_7a
        :pswitch_6d
        :pswitch_60
        :pswitch_53
        :pswitch_46
        :pswitch_39
        :pswitch_2c
        :pswitch_1f
        :pswitch_12
    .end packed-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 7

    .line 226
    iput-byte p6, p0, Lpv3;->b:B

    invoke-direct/range {p0 .. p5}, Lg6h;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lpv3;->b:B

    packed-switch v0, :pswitch_data_136

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_10
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->G0()Lebh;

    move-result-object p0

    return-object p0

    :pswitch_19
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->a()Lxb;

    move-result-object p0

    return-object p0

    :pswitch_24
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->a()Lxb;

    move-result-object p0

    return-object p0

    :pswitch_2f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_3a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object p0

    return-object p0

    :pswitch_43
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->a()Lxb;

    move-result-object p0

    return-object p0

    :pswitch_4e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0

    :pswitch_57
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->j()Lku5;

    move-result-object p0

    return-object p0

    :pswitch_60
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p0

    return-object p0

    :pswitch_69
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object p0

    return-object p0

    :pswitch_72
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    return-object p0

    :pswitch_7b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_84
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_8f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_9a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_a5
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p0

    return-object p0

    :pswitch_ae
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_b7
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    return-object p0

    :pswitch_c0
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_c9
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object p0

    return-object p0

    :pswitch_d2
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_db
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p0

    return-object p0

    :pswitch_e4
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    return-object p0

    :pswitch_ed
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    return-object p0

    :pswitch_f8
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    return-object p0

    :pswitch_101
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p0

    return-object p0

    :pswitch_10a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lxv3;

    check-cast p0, Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->a()Lxb;

    move-result-object p0

    return-object p0

    :pswitch_117
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->U0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzzj;

    return-object p0

    :pswitch_126
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->A0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqdh;

    return-object p0

    nop

    :pswitch_data_136
    .packed-switch 0x0
        :pswitch_126
        :pswitch_117
        :pswitch_10a
        :pswitch_101
        :pswitch_f8
        :pswitch_ed
        :pswitch_e4
        :pswitch_db
        :pswitch_d2
        :pswitch_c9
        :pswitch_c0
        :pswitch_b7
        :pswitch_ae
        :pswitch_a5
        :pswitch_9a
        :pswitch_8f
        :pswitch_84
        :pswitch_7b
        :pswitch_72
        :pswitch_69
        :pswitch_60
        :pswitch_57
        :pswitch_4e
        :pswitch_43
        :pswitch_3a
        :pswitch_2f
        :pswitch_24
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method
