.class public final synthetic Leb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Leb;->a:B

    iput-object p1, p0, Leb;->b:Ljava/lang/Object;

    iput-object p2, p0, Leb;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljb;Lorg/chromium/components/signin/base/CoreAccountInfo;Ljava/lang/String;Lhp2;)V
    .registers 5

    .line 11
    const/4 p2, 0x0

    iput-byte p2, p0, Leb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leb;->b:Ljava/lang/Object;

    iput-object p4, p0, Leb;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljb;Lorg/chromium/components/signin/base/CoreAccountInfo;Ls14;)V
    .registers 4

    const/4 p3, 0x1

    iput-byte p3, p0, Leb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leb;->b:Ljava/lang/Object;

    iput-object p2, p0, Leb;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 13

    iget-byte v0, p0, Leb;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x2

    iget-object v4, p0, Leb;->c:Ljava/lang/Object;

    iget-object p0, p0, Leb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f6

    check-cast p0, Lvsi;

    check-cast v4, Lcom/opera/android/browser/SimpleUrlLoader;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    if-ne p1, v4, :cond_4c

    iput-object v2, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    iget p1, p0, Lvsi;->b:I

    if-ne p1, v3, :cond_21

    iput v1, p0, Lvsi;->b:I

    :cond_21
    iget p1, p0, Lvsi;->f:I

    const/4 v0, 0x1

    if-nez p1, :cond_2b

    const-wide/16 v3, 0xc8

    iput-wide v3, p0, Lvsi;->g:J

    goto :goto_39

    :cond_2b
    iget-wide v3, p0, Lvsi;->g:J

    const-wide v5, 0x3fffffffffffffffL    # 1.9999999999999998

    cmp-long v1, v3, v5

    if-gez v1, :cond_39

    shl-long/2addr v3, v0

    iput-wide v3, p0, Lvsi;->g:J

    :cond_39
    :goto_39
    add-int/2addr p1, v0

    iput p1, p0, Lvsi;->f:I

    iget-object p1, p0, Lvsi;->d:Ltsi;

    if-eqz p1, :cond_47

    iget-object p1, p1, Ltsi;->c:Ltn;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p1, v1}, Ltn;->L(Ljava/util/List;)V

    :cond_47
    iput-object v2, p0, Lvsi;->d:Ltsi;

    invoke-virtual {p0, v0}, Lvsi;->c(Z)V

    :cond_4c
    return-void

    :pswitch_4d
    check-cast p0, Lx77;

    check-cast v4, Lnid;

    check-cast p1, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p1, :cond_5c

    invoke-virtual {v4, v2}, Lnid;->onResult(Ljava/lang/Object;)V

    goto :goto_81

    :cond_5c
    new-instance v0, Lzid;

    iget-object v5, p1, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->a:[B

    iget-object v6, p1, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->b:[B

    invoke-direct {v0, v5, v2, v6}, Lzid;-><init>([B[B[B)V

    new-instance v2, Lajd;

    iget-object v6, p1, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->c:Ljava/lang/String;

    iget p1, p1, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;->d:I

    if-eq p1, v3, :cond_6f

    if-ne p1, v1, :cond_70

    :cond_6f
    move v3, p1

    :cond_70
    invoke-direct {v2, v0, v6, v3}, Lajd;-><init>(Lzid;Ljava/lang/String;I)V

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v4, v0}, Lnid;->onResult(Ljava/lang/Object;)V

    :goto_81
    return-void

    :pswitch_82
    check-cast p0, Lcom/opera/android/history/e;

    check-cast v4, Ljava/util/ArrayList;

    check-cast p1, [Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    iget-object v0, p0, Lcom/opera/android/history/e;->j:Lesi;

    if-eqz v0, :cond_96

    iget-object v0, p0, Lcom/opera/android/history/e;->f:Lode;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/opera/android/history/e;->h:Lode;

    invoke-virtual {p0, v4}, Lekc;->r(Ljava/lang/Object;)V

    :cond_96
    return-void

    :pswitch_97
    check-cast p0, Ltt2;

    check-cast v4, Lcom/opera/android/BrowserActivity;

    check-cast p1, Ljava/lang/Boolean;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_b3

    if-eqz p0, :cond_b3

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->o()V

    :cond_b3
    return-void

    :pswitch_b4
    check-cast p0, Landroid/content/Context;

    check-cast v4, Lcom/opera/api/Callback;

    check-cast p1, [B

    new-instance v0, Lj12;

    const/4 v1, 0x0

    invoke-direct {v0, v4, v1}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    new-instance v2, Lldj;

    const-string v3, ".png"

    invoke-direct {v2, p0, v3, p1, v0}, Lldj;-><init>(Landroid/content/Context;Ljava/lang/String;[BLcom/opera/api/Callback;)V

    new-array p0, v1, [Ljava/lang/Void;

    invoke-virtual {v2, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    :pswitch_cd
    check-cast p0, Ljb;

    check-cast v4, Lorg/chromium/components/signin/base/CoreAccountInfo;

    check-cast p1, Ljava/util/List;

    iget-object p1, v4, Lorg/chromium/components/signin/base/CoreAccountInfo;->c:Lorg/chromium/google_apis/gaia/GaiaId;

    invoke-virtual {p0}, Ljb;->c()V

    return-void

    :pswitch_d9
    check-cast p0, Ljb;

    check-cast v4, Lhp2;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ljb;->c()V

    new-instance v8, Lorg/chromium/google_apis/gaia/GoogleServiceAuthError;

    invoke-direct {v8, v3}, Lorg/chromium/google_apis/gaia/GoogleServiceAuthError;-><init>(I)V

    const-wide/16 v6, 0x0

    iget-wide v9, v4, Lhp2;->b:J

    const/4 v5, 0x0

    invoke-static/range {v5 .. v10}, LJ/N;->MTN9MD0o(Ljava/lang/Object;JLjava/lang/Object;J)V

    invoke-virtual {p0}, Ljb;->e()V

    return-void

    :pswitch_data_f6
    .packed-switch 0x0
        :pswitch_d9
        :pswitch_cd
        :pswitch_b4
        :pswitch_97
        :pswitch_82
        :pswitch_4d
    .end packed-switch
.end method
