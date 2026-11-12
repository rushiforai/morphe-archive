.class public final Leyi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcyi;
.implements Lzkj;
.implements Liqk;
.implements Lrr9;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 148
    iput-byte p1, p0, Leyi;->a:B

    iput-boolean p4, p0, Leyi;->b:Z

    iput-object p2, p0, Leyi;->c:Ljava/lang/Object;

    iput-object p3, p0, Leyi;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/app/RemoteAction;Landroid/app/RemoteAction;)V
    .registers 4

    const/16 v0, 0xb

    iput-byte v0, p0, Leyi;->a:B

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    iput-object p1, p0, Leyi;->c:Ljava/lang/Object;

    .line 168
    iput-object p2, p0, Leyi;->d:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 169
    iput-boolean p1, p0, Leyi;->b:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwa;Landroid/view/View;Ljava/util/ArrayList;[IZIDLorg/chromium/content_public/browser/WebContents;)V
    .registers 20

    const/4 v0, 0x0

    iput-byte v0, p0, Leyi;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leyi;->c:Ljava/lang/Object;

    new-instance p2, Lga6;

    invoke-direct {p2, p1, p3}, Lga6;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object p2, p0, Leyi;->d:Ljava/lang/Object;

    iget-object p2, p2, Lga6;->b:Ljava/lang/Object;

    check-cast p2, Lu85;

    iget-object p3, p2, Lu85;->h:Ljava/lang/Object;

    check-cast p3, Li21;

    iget-object p3, p3, Li21;->h:Leq1;

    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    invoke-virtual {p3}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-virtual {p3}, Landroid/widget/PopupWindow;->update()V

    :cond_26
    iget-object p3, p2, Lu85;->j:Ljava/lang/Object;

    check-cast p3, Landroid/widget/ListView;

    const v2, 0x106000d

    invoke-virtual {p3, v2}, Landroid/widget/AbsListView;->setSelector(I)V

    new-instance p3, Llq1;

    const/4 v2, 0x3

    invoke-direct {p3, p0, v2}, Llq1;-><init>(Ljava/lang/Object;B)V

    iget-object v3, p2, Lu85;->j:Ljava/lang/Object;

    check-cast v3, Landroid/widget/ListView;

    invoke-virtual {v3, p3}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    array-length p3, p5

    if-lez p3, :cond_43

    aget p3, p5, v0

    goto :goto_44

    :cond_43
    const/4 p3, -0x1

    :goto_44
    iput p3, p2, Lu85;->b:I

    new-instance v3, Ltm7;

    move-object v4, p1

    move-object v5, p4

    move/from16 v6, p7

    move-wide/from16 v7, p8

    invoke-direct/range {v3 .. v8}, Ltm7;-><init>(Landroid/content/Context;Ljava/util/ArrayList;ID)V

    iput-object v3, p2, Lu85;->i:Ljava/lang/Object;

    iget-object p1, p2, Lu85;->j:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ListView;

    invoke-virtual {p1, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p2, Lu85;->h:Ljava/lang/Object;

    check-cast p1, Li21;

    invoke-virtual {p1}, Li21;->f()V

    move p1, p6

    iput-boolean p1, p2, Lu85;->a:Z

    new-instance p1, Lc21;

    invoke-direct {p1, p0, v2}, Lc21;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p2, Lu85;->h:Ljava/lang/Object;

    check-cast p2, Li21;

    iget-object p2, p2, Li21;->l:Lh7f;

    invoke-virtual {p2, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    sget-object p1, Lorg/chromium/content/browser/GestureListenerManagerImpl;->n:Landroid/util/LongSparseArray;

    const-class p1, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    sget-object p2, Lmkh;->d:Ls49;

    move-object/from16 p3, p10

    invoke-interface {p3, p1, p2}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    new-instance p2, Ltz4;

    invoke-direct {p2, p0, v1}, Ltz4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->b(Ljw9;I)V

    return-void
.end method

.method public constructor <init>(Ldil;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Leyi;->a:B

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    iput-object p1, p0, Leyi;->d:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 172
    iput-boolean p1, p0, Leyi;->b:Z

    return-void
.end method

.method public constructor <init>(Li32;Llld;Lepk;)V
    .registers 4

    const/4 p2, 0x4

    iput-byte p2, p0, Leyi;->a:B

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x1

    .line 154
    iput-boolean p2, p0, Leyi;->b:Z

    .line 155
    iput-object p1, p0, Leyi;->c:Ljava/lang/Object;

    .line 156
    iput-object p3, p0, Leyi;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lnml;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Leyi;->a:B

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-object p1, p0, Leyi;->c:Ljava/lang/Object;

    .line 165
    iput-object p2, p0, Leyi;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5

    const/16 v0, 0xd

    iput-byte v0, p0, Leyi;->a:B

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p1, p0, Leyi;->c:Ljava/lang/Object;

    .line 151
    iput-object p2, p0, Leyi;->d:Ljava/lang/Object;

    .line 152
    iput-boolean p3, p0, Leyi;->b:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Leyi;->a:B

    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    iput-object p1, p0, Leyi;->c:Ljava/lang/Object;

    .line 159
    new-instance v1, Lomj;

    invoke-direct {v1, v0}, Lomj;-><init>(B)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 160
    iput-object p2, p0, Leyi;->d:Ljava/lang/Object;

    .line 161
    new-instance p1, Lomj;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Lomj;-><init>(B)V

    invoke-static {p2, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 162
    iput-boolean p3, p0, Leyi;->b:Z

    return-void
.end method

.method public constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Leyi;->a:B

    packed-switch p2, :pswitch_data_1a

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leyi;->d:Ljava/lang/Object;

    .line 174
    new-instance p1, Lqlk;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Leyi;->c:Ljava/lang/Object;

    return-void

    .line 175
    :pswitch_13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leyi;->d:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x6
        :pswitch_13
    .end packed-switch
.end method

.method public constructor <init>(Ly2n;Lo94;Z)V
    .registers 5

    const/16 v0, 0xa

    iput-byte v0, p0, Leyi;->a:B

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leyi;->d:Ljava/lang/Object;

    iput-object p2, p0, Leyi;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Leyi;->b:Z

    return-void
.end method

.method public constructor <init>(Lz9p;Lr9p;)V
    .registers 4

    const/16 v0, 0xe

    iput-byte v0, p0, Leyi;->a:B

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leyi;->d:Ljava/lang/Object;

    iput-object p2, p0, Leyi;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ZLcom/opera/android/settings/SettingsManager;)V
    .registers 4

    const/16 v0, 0xc

    iput-byte v0, p0, Leyi;->a:B

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    iput-boolean p1, p0, Leyi;->b:Z

    .line 140
    iput-object p2, p0, Leyi;->c:Ljava/lang/Object;

    .line 141
    new-instance v0, Lkze;

    if-eqz p1, :cond_12

    .line 142
    const-string p1, "ofa-private-mode"

    goto :goto_1e

    .line 143
    :cond_12
    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p1

    .line 144
    iget-object p1, p1, Lg7j;->d:Ljava/lang/String;

    .line 145
    const-string p2, "ofa-"

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 146
    :goto_1e
    invoke-direct {v0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 147
    iput-object v0, p0, Leyi;->d:Ljava/lang/Object;

    return-void
.end method

.method public static f(Ljava/lang/String;)Leyi;
    .registers 7

    const/4 v0, 0x0

    if-eqz p0, :cond_62

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_62

    const-string v1, "[*.]"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1d

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Leyi;

    invoke-direct {v1, v0, p0, v2}, Leyi;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v1

    :cond_1d
    const-string v1, "://"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_5c

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v4, 0x0

    if-eqz v1, :cond_37

    invoke-static {v2, v4, p0}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_37
    const-string v1, "http"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v1

    if-eq v1, v3, :cond_52

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v1

    const/16 v3, 0x50

    if-eq v1, v3, :cond_52

    :cond_51
    move v2, v4

    :cond_52
    new-instance v1, Leyi;

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0, v2}, Leyi;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v1

    :cond_5c
    new-instance v1, Leyi;

    invoke-direct {v1, v0, p0, v2}, Leyi;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v1

    :cond_62
    return-object v0
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lga6;

    const/4 v1, 0x1

    if-eqz p1, :cond_22

    iget-object p1, v0, Lga6;->b:Ljava/lang/Object;

    check-cast p1, Lu85;

    iget-object p1, p1, Lu85;->h:Ljava/lang/Object;

    check-cast p1, Li21;

    invoke-virtual {p1}, Li21;->a()V

    iget-boolean p1, p0, Leyi;->b:Z

    if-eqz p1, :cond_17

    return-void

    :cond_17
    iget-object p1, p0, Leyi;->c:Ljava/lang/Object;

    check-cast p1, Lwa;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lwa;->onResult(Ljava/lang/Object;)V

    iput-boolean v1, p0, Leyi;->b:Z

    return-void

    :cond_22
    iput-boolean v1, p0, Leyi;->b:Z

    iget-object p0, v0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lu85;

    iget-object p0, p0, Lu85;->h:Ljava/lang/Object;

    check-cast p0, Li21;

    invoke-virtual {p0}, Li21;->a()V

    return-void
.end method

.method public final b()Lm9p;
    .registers 6

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lz9p;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v1, Lr9p;

    iget-object v1, v1, Lr9p;->d:Leyi;

    if-ne v1, p0, :cond_22

    new-instance v1, Lm9p;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v3, Lr9p;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lr9p;->c(I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, p0, v2}, Lm9p;-><init>(Leyi;Ljava/io/FileOutputStream;)V

    monitor-exit v0

    return-object v1

    :cond_22
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    :goto_28
    monitor-exit v0
    :try_end_29
    .catchall {:try_start_5 .. :try_end_29} :catchall_2a

    throw p0

    :catchall_2a
    move-exception p0

    goto :goto_28
.end method

.method public final c()Ljava/util/List;
    .registers 2

    iget-boolean p0, p0, Leyi;->b:Z

    if-eqz p0, :cond_11

    sget-object p0, Lr7j;->b:Lr7j;

    sget-object v0, Lr7j;->c:Lr7j;

    filled-new-array {p0, v0}, [Lr7j;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_11
    sget-object p0, Lf8j;->a:Lh58;

    return-object p0
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lz9p;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lz9p;->m(Leyi;Z)V

    return-void
.end method

.method public final e()V
    .registers 3

    iget-boolean v0, p0, Leyi;->b:Z

    iget-object v1, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Lz9p;

    if-eqz v0, :cond_16

    const/4 v0, 0x0

    invoke-virtual {v1, p0, v0}, Lz9p;->m(Leyi;Z)V

    iget-object p0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast p0, Lr9p;

    iget-object p0, p0, Lr9p;->a:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lz9p;->D(Ljava/lang/String;)V

    return-void

    :cond_16
    const/4 v0, 0x1

    invoke-virtual {v1, p0, v0}, Lz9p;->m(Leyi;Z)V

    return-void
.end method

.method public final g()Ln26;
    .registers 2

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lr05;

    iget v0, p0, Lr05;->b:I

    iget p0, p0, Lr05;->c:I

    if-ge v0, p0, :cond_d

    sget-object p0, Ln26;->b:Ln26;

    return-object p0

    :cond_d
    if-le v0, p0, :cond_12

    sget-object p0, Ln26;->a:Ln26;

    return-object p0

    :cond_12
    sget-object p0, Ln26;->c:Ln26;

    return-object p0
.end method

.method public final h(II)Ljava/util/List;
    .registers 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v3, v0, Leyi;->b:Z

    move/from16 v4, p2

    if-le v1, v4, :cond_12

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0

    :cond_12
    iget-object v5, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v9, 0x0

    :cond_20
    :goto_20
    if-ge v9, v7, :cond_45

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lfqj;

    iget v11, v10, Lfqj;->a:I

    if-lt v11, v1, :cond_20

    if-gt v11, v4, :cond_45

    if-nez v3, :cond_34

    if-eq v11, v4, :cond_45

    :cond_34
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    iget-object v10, v10, Lfqj;->b:Luo;

    new-instance v12, Llyf;

    invoke-direct {v12, v11, v10}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_20

    :cond_45
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    :cond_5b
    invoke-virtual {v7}, Ljava/util/HashSet;->size()I

    move-result v9

    add-int/2addr v9, v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v11, 0x0

    :cond_65
    :goto_65
    if-ge v11, v10, :cond_a1

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lgqj;

    iget v13, v12, Lgqj;->a:I

    invoke-virtual {v7}, Ljava/util/HashSet;->size()I

    move-result v14

    add-int/2addr v14, v4

    if-gt v13, v14, :cond_a1

    iget v13, v12, Lgqj;->a:I

    :cond_7a
    if-lt v13, v9, :cond_91

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iget-object v15, v12, Lgqj;->c:Luo;

    new-instance v8, Llyf;

    invoke-direct {v8, v14, v15}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v6, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_91
    iget v8, v12, Lgqj;->b:I

    add-int/2addr v13, v8

    invoke-virtual {v7}, Ljava/util/HashSet;->size()I

    move-result v8

    sub-int v8, v13, v8

    if-gt v8, v4, :cond_65

    if-nez v3, :cond_7a

    if-ne v8, v4, :cond_7a

    goto :goto_65

    :cond_a1
    invoke-interface {v5, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    move-result v8

    if-nez v8, :cond_5b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Lomj;

    const/4 v3, 0x5

    invoke-direct {v1, v3}, Lomj;-><init>(B)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c1

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0

    :cond_c1
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llyf;

    iget-object v3, v1, Llyf;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v1, Llyf;->b:Ljava/lang/Object;

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Llyf;

    invoke-direct {v5, v3, v4}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v2, v4, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_138

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llyf;

    iget-object v4, v1, Llyf;->a:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    iget-object v6, v3, Llyf;->a:Ljava/lang/Object;

    invoke-virtual {v4, v6}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11b

    iget-object v4, v5, Llyf;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    iget-object v3, v3, Llyf;->b:Ljava/lang/Object;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f9

    :cond_11b
    iget-object v1, v3, Llyf;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v3, Llyf;->b:Ljava/lang/Object;

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Llyf;

    invoke-direct {v5, v1, v4}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v1, v3

    goto :goto_f9

    :cond_138
    return-object v0
.end method

.method public final i()V
    .registers 2

    iget-boolean v0, p0, Leyi;->b:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Ldil;

    iget-object p0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast p0, Lxjl;

    invoke-virtual {v0, p0}, Ldil;->n(Lxjl;)V

    :cond_f
    return-void
.end method

.method public final j()V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v2, v1, Lmrk;->y:Lw6j;

    iget-object v2, v2, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->M0(Landroidx/recyclerview/widget/d;Z)V

    iget-object v2, v1, Lmrk;->E:Lflb;

    invoke-virtual {v2}, Lflb;->i()V

    iput-object v3, v1, Lmrk;->P:Lc1f;

    iget-boolean v2, v0, Leyi;->b:Z

    const/4 v5, 0x0

    if-nez v2, :cond_168

    iput-boolean v4, v0, Leyi;->b:Z

    iget-object v2, v1, Lmrk;->c:Lfbf;

    iget-object v6, v1, Lmrk;->h:Liv7;

    iget-object v7, v2, Lfbf;->a:Lgbf;

    iget-object v8, v1, Lmrk;->n:Lyz9;

    iget-object v9, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v9, Lcom/opera/android/suggestion/Suggestion;

    if-nez v9, :cond_2f

    move v9, v4

    goto :goto_30

    :cond_2f
    move v9, v5

    :goto_30
    iget-object v2, v2, Lfbf;->a:Lgbf;

    invoke-virtual {v2, v9}, Lgbf;->m(Z)V

    iget-object v0, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_168

    iget v2, v0, Lcom/opera/android/suggestion/Suggestion;->a:I

    invoke-virtual {v0}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v10

    const/16 v9, 0xd

    if-eq v2, v9, :cond_49

    const/16 v9, 0xc

    if-ne v2, v9, :cond_64

    :cond_49
    invoke-static {v10}, Lcom/opera/android/browser/UrlMangler;->e(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_64

    iget-boolean v12, v7, Lgbf;->x:Z

    iget-object v0, v6, Liv7;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Leri;

    iget-object v9, v8, Lyz9;->a:Lwth;

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v11, 0x6

    invoke-virtual/range {v9 .. v15}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    goto/16 :goto_168

    :cond_64
    sget-object v9, Llqm;->b:Llqm;

    sget-object v11, Llqm;->a:Llqm;

    packed-switch v2, :pswitch_data_186

    :pswitch_6b
    goto/16 :goto_168

    :pswitch_6d
    new-instance v0, Lbgf;

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x4

    invoke-direct {v0, v2, v11, v3}, Lbgf;-><init>(Landroid/net/Uri;Llqm;I)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    iget-object v0, v7, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v2

    if-nez v2, :cond_168

    invoke-virtual {v0}, Lvbf;->l()V

    goto/16 :goto_168

    :pswitch_87
    iput-boolean v4, v1, Lmrk;->U:Z

    iget-object v0, v1, Lmrk;->G:Lrv7;

    sget-object v2, Llbf;->c:Llbf;

    invoke-virtual {v0, v2, v3}, Lrv7;->b(Llbf;Ljava/lang/Integer;)V

    iget-object v0, v6, Liv7;->g:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Leri;

    iget-object v9, v8, Lyz9;->a:Lwth;

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v11, 0x5

    const/4 v12, 0x0

    invoke-virtual/range {v9 .. v15}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    goto/16 :goto_168

    :pswitch_a4
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v9, v5}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput-byte v4, v0, Lvx3;->o:B

    iput-boolean v5, v0, Lvx3;->m:Z

    iput-boolean v5, v0, Lvx3;->n:Z

    iput-boolean v4, v0, Lvx3;->q:Z

    :goto_b3
    invoke-static {v0}, Lam2;->v(Lvx3;)V

    goto/16 :goto_168

    :pswitch_b8
    iget-boolean v12, v7, Lgbf;->x:Z

    iget-object v9, v8, Lyz9;->a:Lwth;

    const/4 v15, 0x0

    const/4 v14, 0x1

    const/4 v11, 0x6

    const/4 v13, 0x1

    invoke-virtual/range {v9 .. v15}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    goto/16 :goto_168

    :pswitch_c5
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "label"

    const-string v3, "obs_app"

    invoke-static {v0, v2, v3}, Lwqm;->E(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v0, "com.booking"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.opera.android.extra.DO_NOT_INTERCEPT"

    invoke-virtual {v2, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :try_start_e2
    iget-object v0, v1, Lmrk;->d:Lnwf;

    iget-object v0, v0, Lnwf;->c:Ljava/lang/Object;

    check-cast v0, Lpt3;

    iget-object v0, v0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    sget v3, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    iget-object v0, v7, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v2

    if-nez v2, :cond_168

    invoke-virtual {v0}, Lvbf;->l()V
    :try_end_fa
    .catch Landroid/content/ActivityNotFoundException; {:try_start_e2 .. :try_end_fa} :catch_fb

    goto :goto_168

    :catch_fb
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v11, v5}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput-byte v4, v0, Lvx3;->o:B

    iput-boolean v4, v0, Lvx3;->m:Z

    iput-boolean v5, v0, Lvx3;->n:Z

    goto :goto_b3

    :pswitch_109
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_127

    iget-object v12, v0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    iget-boolean v14, v7, Lgbf;->x:Z

    iget-object v0, v6, Liv7;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v17, v0

    check-cast v17, Leri;

    iget-object v11, v8, Lyz9;->a:Lwth;

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/4 v13, 0x6

    invoke-virtual/range {v11 .. v17}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    goto :goto_168

    :cond_127
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v9, v5}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput-byte v4, v0, Lvx3;->o:B

    iput-boolean v4, v0, Lvx3;->m:Z

    iput-boolean v5, v0, Lvx3;->n:Z

    goto/16 :goto_b3

    :pswitch_136
    iget-boolean v12, v7, Lgbf;->x:Z

    iget-object v0, v6, Liv7;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Leri;

    iget-object v9, v8, Lyz9;->a:Lwth;

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v11, 0x6

    invoke-virtual/range {v9 .. v15}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    goto :goto_168

    :pswitch_14a
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v9, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput-byte v4, v0, Lvx3;->o:B

    iput-boolean v5, v0, Lvx3;->m:Z

    iput-boolean v5, v0, Lvx3;->n:Z

    goto/16 :goto_b3

    :pswitch_159
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v11, v5}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput-byte v4, v0, Lvx3;->o:B

    iput-boolean v4, v0, Lvx3;->m:Z

    iput-boolean v5, v0, Lvx3;->n:Z

    goto/16 :goto_b3

    :cond_168
    :goto_168
    iget-object v0, v1, Lmrk;->C:Lhqk;

    iget-object v0, v0, Lhqk;->u:Lnv6;

    iget-object v0, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    :goto_174
    if-ge v5, v1, :cond_185

    invoke-virtual {v0, v5}, Landroid/util/SparseArray;->keyAt(I)I

    invoke-virtual {v0, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lodb;

    invoke-interface {v2}, Lodb;->reset()V

    add-int/lit8 v5, v5, 0x1

    goto :goto_174

    :cond_185
    return-void

    :pswitch_data_186
    .packed-switch 0x0
        :pswitch_159
        :pswitch_159
        :pswitch_159
        :pswitch_159
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
        :pswitch_136
        :pswitch_159
        :pswitch_109
        :pswitch_136
        :pswitch_159
        :pswitch_159
        :pswitch_159
        :pswitch_159
        :pswitch_c5
        :pswitch_159
        :pswitch_b8
        :pswitch_136
        :pswitch_6b
        :pswitch_159
        :pswitch_159
        :pswitch_14a
        :pswitch_14a
        :pswitch_136
        :pswitch_a4
        :pswitch_136
        :pswitch_87
        :pswitch_6b
        :pswitch_136
        :pswitch_136
        :pswitch_159
        :pswitch_159
        :pswitch_6d
    .end packed-switch
.end method

.method public final k(Ljava/lang/String;Ljava/util/List;Z)Z
    .registers 31

    move-object/from16 v0, p0

    iget-object v0, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lmrk;

    iget-object v1, v0, Lmrk;->C:Lhqk;

    iget-object v2, v1, Lhqk;->r:Ll5b;

    new-instance v3, Ljava/util/HashSet;

    move-object/from16 v4, p2

    check-cast v4, Ljava/util/Collection;

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sget-object v3, Laik;->a:[Ljava/lang/String;

    if-nez p1, :cond_1a

    const-string v3, ""

    goto :goto_1c

    :cond_1a
    move-object/from16 v3, p1

    :goto_1c
    iput-object v3, v1, Lhqk;->q:Ljava/lang/String;

    iget-object v3, v1, Lhqk;->y:Ljava/util/List;

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2d
    :goto_2d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_84

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/opera/android/suggestion/Suggestion;

    sget-object v9, Lxpk;->b:Ltmj;

    iget v10, v7, Lcom/opera/android/suggestion/Suggestion;->a:I

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lxpk;->l:Lh58;

    invoke-virtual {v9}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_46
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_61

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    move-object v12, v11

    check-cast v12, Lxpk;

    iget-object v12, v12, Lxpk;->a:Lu1b;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v12, v13}, Lx0b;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_46

    move-object v8, v11

    goto :goto_62

    :cond_61
    const/4 v8, 0x0

    :goto_62
    check-cast v8, Lxpk;

    if-eqz v8, :cond_2d

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lypk;

    if-nez v9, :cond_80

    sget-object v9, Lxpk;->i:Lxpk;

    if-ne v8, v9, :cond_78

    new-instance v9, Lcqk;

    invoke-direct {v9, v5}, Lcqk;-><init>(Z)V

    goto :goto_7d

    :cond_78
    new-instance v9, Lypk;

    invoke-direct {v9}, Lypk;-><init>()V

    :goto_7d
    invoke-interface {v4, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_80
    invoke-virtual {v9, v7}, Lypk;->a(Lcom/opera/android/suggestion/Suggestion;)V

    goto :goto_2d

    :cond_84
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v6, v2, Ll5b;->b:Z

    iget-boolean v2, v2, Ll5b;->b:Z

    sget-object v7, Lxpk;->l:Lh58;

    if-eqz v6, :cond_95

    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->Y(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v7

    :cond_95
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_99
    :goto_99
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eqz v9, :cond_2a3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lxpk;

    invoke-virtual {v4, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lypk;

    if-nez v12, :cond_b4

    new-instance v12, Lypk;

    invoke-direct {v12}, Lypk;-><init>()V

    :cond_b4
    iget-object v12, v12, Lypk;->a:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_99

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    const/4 v14, 0x3

    const/16 v15, 0x10

    packed-switch v13, :pswitch_data_364

    goto :goto_99

    :pswitch_c7
    sget-object v13, Lxpk;->e:Lxpk;

    invoke-virtual {v4, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lypk;

    if-nez v13, :cond_d6

    new-instance v13, Lypk;

    invoke-direct {v13}, Lypk;-><init>()V

    :cond_d6
    iget-object v13, v13, Lypk;->a:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_99

    if-eqz v6, :cond_e4

    invoke-static {v12}, Lnb6;->R(Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    :cond_e4
    move-object v13, v12

    check-cast v13, Ljava/util/Collection;

    check-cast v13, Ljava/lang/Iterable;

    instance-of v14, v13, Ljava/util/Collection;

    if-eqz v14, :cond_f6

    move-object v14, v13

    check-cast v14, Ljava/util/Collection;

    invoke-interface {v14}, Ljava/util/Collection;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_10b

    :cond_f6
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_fa
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_10b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/opera/android/suggestion/Suggestion;

    iget v14, v14, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-ne v14, v15, :cond_fa

    goto :goto_10c

    :cond_10b
    move v11, v10

    :goto_10c
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_110
    :goto_110
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_99

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/opera/android/suggestion/Suggestion;

    if-eqz v11, :cond_12a

    const/16 v14, 0x11

    filled-new-array {v14}, [I

    move-result-object v14

    aget v14, v14, v10

    iget v15, v13, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-eq v15, v14, :cond_110

    :cond_12a
    invoke-static {v13}, Llah;->p(Lcom/opera/android/suggestion/Suggestion;)I

    move-result v14

    invoke-static {v13, v14, v9}, Llah;->i(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Lfqk;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_110

    :pswitch_136
    new-instance v10, Laqk;

    sget-object v11, Lxpk;->h:Lxpk;

    new-instance v13, Lrxh;

    const v14, 0x7f140da3

    invoke-direct {v13, v14}, Lrxh;-><init>(I)V

    new-instance v14, Lrxh;

    const v15, 0x7f14051c

    invoke-direct {v14, v15}, Lrxh;-><init>(I)V

    invoke-direct {v10, v11, v13, v14}, Laqk;-><init>(Lxpk;Lrxh;Lrxh;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v6, :cond_156

    invoke-static {v12}, Lnb6;->R(Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    :cond_156
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_15a
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_99

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/opera/android/suggestion/Suggestion;

    invoke-static {v11}, Llah;->p(Lcom/opera/android/suggestion/Suggestion;)I

    move-result v12

    invoke-static {v11, v12, v9}, Llah;->i(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Lfqk;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15a

    :pswitch_172
    new-instance v11, Lzpk;

    sget-object v13, Lxpk;->g:Lxpk;

    new-instance v14, Lrxh;

    const v8, 0x7f140166

    invoke-direct {v14, v8}, Lrxh;-><init>(I)V

    invoke-direct {v11, v13, v14}, Lzpk;-><init>(Lxpk;Lrxh;)V

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v8, Lfqk;

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/opera/android/suggestion/Suggestion;

    invoke-direct {v8, v10, v15, v9}, Lfqk;-><init>(Lcom/opera/android/suggestion/Suggestion;ILxpk;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_194
    new-instance v8, Lbqk;

    const/16 v10, 0x12

    invoke-direct {v8, v10, v9, v12}, Lbqk;-><init>(ILxpk;Ljava/util/ArrayList;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_1a0
    new-instance v8, Lzpk;

    sget-object v10, Lxpk;->f:Lxpk;

    new-instance v11, Lrxh;

    const v13, 0x7f1412df

    invoke-direct {v11, v13}, Lrxh;-><init>(I)V

    invoke-direct {v8, v10, v11}, Lzpk;-><init>(Lxpk;Lrxh;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v8, Lbqk;

    const/4 v10, 0x2

    invoke-direct {v8, v10, v9, v12}, Lbqk;-><init>(ILxpk;Ljava/util/ArrayList;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_1bd
    if-eqz v6, :cond_1c3

    invoke-static {v12}, Lnb6;->R(Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    :cond_1c3
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1c7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1df

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/opera/android/suggestion/Suggestion;

    invoke-static {v11}, Llah;->p(Lcom/opera/android/suggestion/Suggestion;)I

    move-result v13

    invoke-static {v11, v13, v9}, Llah;->i(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Lfqk;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c7

    :cond_1df
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-eqz v6, :cond_1e9

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v10

    :cond_1e9
    sub-int/2addr v8, v10

    new-instance v10, Leqk;

    new-instance v15, Lcom/opera/android/suggestion/Suggestion;

    const/16 v24, 0x0

    const/16 v16, 0x1d

    const-string v17, ""

    const-string v18, ""

    const-string v19, ""

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v25, -0x1

    const/16 v26, 0x0

    move-object/from16 v23, v18

    invoke-direct/range {v15 .. v26}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    new-instance v11, Lrxh;

    const v12, 0x7f140da4

    invoke-direct {v11, v12}, Lrxh;-><init>(I)V

    new-instance v12, Lz4k;

    invoke-direct {v12, v1, v14}, Lz4k;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v10, v15, v11, v12, v9}, Leqk;-><init>(Lcom/opera/android/suggestion/Suggestion;Lrxh;Lz4k;Lxpk;)V

    invoke-virtual {v5, v8, v10}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto/16 :goto_99

    :pswitch_21c
    sget-object v8, Lxpk;->f:Lxpk;

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lypk;

    if-nez v8, :cond_22b

    new-instance v8, Lypk;

    invoke-direct {v8}, Lypk;-><init>()V

    :cond_22b
    iget-object v8, v8, Lypk;->a:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_99

    new-instance v8, Lbqk;

    invoke-direct {v8, v11, v9, v12}, Lbqk;-><init>(ILxpk;Ljava/util/ArrayList;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_23d
    iget-object v8, v1, Lhqk;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v11, "enable_frequently_visited_sites"

    invoke-virtual {v8, v11}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_99

    iget-boolean v8, v1, Lhqk;->B:Z

    if-eqz v8, :cond_99

    new-instance v8, Lfqk;

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/opera/android/suggestion/Suggestion;

    const/4 v11, 0x7

    invoke-direct {v8, v10, v11, v9}, Lfqk;-><init>(Lcom/opera/android/suggestion/Suggestion;ILxpk;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_25c
    new-instance v8, Lbqk;

    const/16 v10, 0x16

    invoke-direct {v8, v10, v9, v12}, Lbqk;-><init>(ILxpk;Ljava/util/ArrayList;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_268
    sget-object v8, Lxpk;->c:Lxpk;

    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lypk;

    if-nez v8, :cond_277

    new-instance v8, Lypk;

    invoke-direct {v8}, Lypk;-><init>()V

    :cond_277
    iget-object v8, v8, Lypk;->a:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_99

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/opera/android/suggestion/Suggestion;

    new-instance v10, Lfqk;

    invoke-static {v8}, Llah;->p(Lcom/opera/android/suggestion/Suggestion;)I

    move-result v11

    invoke-direct {v10, v8, v11, v9}, Lfqk;-><init>(Lcom/opera/android/suggestion/Suggestion;ILxpk;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :pswitch_293
    new-instance v8, Lfqk;

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/opera/android/suggestion/Suggestion;

    invoke-direct {v8, v10, v14, v9}, Lfqk;-><init>(Lcom/opera/android/suggestion/Suggestion;ILxpk;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_99

    :cond_2a3
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v7, 0x14

    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-eqz v6, :cond_2bd

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v5, v6, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    goto :goto_2c1

    :cond_2bd
    invoke-virtual {v5, v10, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    :goto_2c1
    if-eqz v2, :cond_2c5

    move v5, v10

    goto :goto_2c9

    :cond_2c5
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    :goto_2c9
    new-instance v6, Ldqk;

    const/16 v7, 0xc

    sget-object v8, Lxpk;->j:Lxpk;

    invoke-direct {v6, v7, v8}, Lgqk;-><init>(ILxpk;)V

    invoke-interface {v4, v5, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget-object v5, v1, Lhqk;->k:Lwjh;

    iget-object v5, v5, Lwjh;->f:Ljava/lang/Object;

    check-cast v5, Lkze;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eq v6, v11, :cond_2ec

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5, v6}, Lekc;->r(Ljava/lang/Object;)V

    :cond_2ec
    iput-object v4, v1, Lhqk;->y:Ljava/util/List;

    move/from16 v4, p3

    iput-boolean v4, v1, Lhqk;->z:Z

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v10}, Lhqk;->H(Lpvb;Z)V

    iget-object v4, v1, Lhqk;->y:Ljava/util/List;

    sget-object v5, Lq9n;->c:Ll5b;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-le v5, v6, :cond_31b

    invoke-interface {v3, v10, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-static {v4, v3}, Lq9n;->k(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_313

    invoke-virtual {v1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :goto_311
    move v10, v11

    goto :goto_343

    :cond_313
    invoke-virtual {v1, v10, v6}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    sub-int/2addr v5, v6

    invoke-virtual {v1, v6, v5}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    goto :goto_311

    :cond_31b
    if-ge v5, v6, :cond_333

    invoke-interface {v4, v10, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-static {v3, v4}, Lq9n;->k(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_32b

    invoke-virtual {v1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_311

    :cond_32b
    invoke-virtual {v1, v10, v5}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    sub-int/2addr v6, v5

    invoke-virtual {v1, v5, v6}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    goto :goto_311

    :cond_333
    if-eqz v6, :cond_343

    invoke-static {v3, v4}, Lq9n;->k(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_33f

    invoke-virtual {v1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_311

    :cond_33f
    invoke-virtual {v1, v10, v5}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    goto :goto_311

    :cond_343
    :goto_343
    if-eqz v10, :cond_353

    if-eqz v2, :cond_353

    iget-object v2, v1, Lhqk;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v3, v1, Lhqk;->y:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v11

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_353
    if-eqz v10, :cond_363

    iget-object v0, v0, Lmrk;->c:Lfbf;

    iget-object v1, v1, Lhqk;->y:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    iget-object v0, v0, Lfbf;->a:Lgbf;

    iget-object v0, v0, Lgbf;->b:Lz43;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_363
    return v10

    :pswitch_data_364
    .packed-switch 0x0
        :pswitch_293
        :pswitch_268
        :pswitch_25c
        :pswitch_23d
        :pswitch_21c
        :pswitch_1bd
        :pswitch_1a0
        :pswitch_194
        :pswitch_172
        :pswitch_136
        :pswitch_c7
    .end packed-switch
.end method

.method public final l(Lpvb;Z)V
    .registers 5

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lmrk;

    iput-object p1, p0, Lmrk;->Q:Lpvb;

    iget-object v0, p0, Lmrk;->c:Lfbf;

    iget-object v1, v0, Lfbf;->a:Lgbf;

    iget-object v1, v1, Lgbf;->t:Lbpd;

    invoke-virtual {v1}, Lbpd;->y()Lupm;

    move-result-object v1

    invoke-interface {v1, p1}, Lupm;->j(Lpvb;)V

    if-nez p2, :cond_16

    return-void

    :cond_16
    iget-object p1, p0, Lmrk;->Q:Lpvb;

    if-eqz p1, :cond_21

    invoke-interface {p1}, Lpvb;->getView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lp37;->h0(Landroid/view/View;)V

    :cond_21
    const/4 p1, 0x1

    iput-boolean p1, p0, Lmrk;->T:Z

    iget-object p1, p0, Lmrk;->Q:Lpvb;

    if-eqz p1, :cond_47

    invoke-interface {p1}, Lpvb;->a()Z

    move-result p2

    if-nez p2, :cond_3f

    iget-object p2, p0, Lmrk;->h:Liv7;

    iget-object p2, p2, Liv7;->k:Lpde;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_3f

    const/4 p1, 0x0

    :cond_3f
    if-eqz p1, :cond_47

    invoke-interface {p1}, Lpvb;->c()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4b

    :cond_47
    iget-object p1, p0, Lmrk;->I:Lirk;

    iget-object p1, p1, Lirk;->b:Ljava/lang/String;

    :cond_4b
    iget-object p2, v0, Lfbf;->a:Lgbf;

    invoke-virtual {p2, p1}, Lgbf;->k(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lmrk;->T:Z

    return-void
.end method

.method public final m(Lmil;JZLhai;)J
    .registers 16

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ldil;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    move-wide v3, p2

    move v5, p4

    move-object v7, p5

    invoke-virtual/range {v1 .. v9}, Ldil;->v(Lmil;JZZLhai;ZLk7a;)J

    move-result-wide p1

    iget-object p3, p0, Leyi;->c:Ljava/lang/Object;

    check-cast p3, Lxjl;

    invoke-static {p1, p2, p3}, Lxjl;->a(JLjava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_1d

    const/4 p3, 0x0

    iput-boolean p3, p0, Leyi;->b:Z

    :cond_1d
    invoke-static {p1, p2}, Lxjl;->c(J)Z

    move-result p0

    if-eqz p0, :cond_26

    sget-object p0, Lb7a;->c:Lb7a;

    goto :goto_28

    :cond_26
    sget-object p0, Lb7a;->b:Lb7a;

    :goto_28
    invoke-virtual {v1, p0}, Ldil;->r(Lb7a;)V

    return-wide p1
.end method

.method public final o(Llrf;)V
    .registers 2

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lcv1;

    check-cast p1, Lr7j;

    invoke-virtual {p0, p1}, Lcv1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 2

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Leyi;->c:Ljava/lang/Object;

    check-cast p1, Lo94;

    iget-object v0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Ly2n;

    iget-object v1, v0, Ly2n;->w:Lo94;

    if-ne p1, v1, :cond_25

    iget p1, v0, Ly2n;->y:I

    const/4 v1, 0x3

    if-eq p1, v1, :cond_25

    iget-boolean p0, p0, Leyi;->b:Z

    if-eqz p0, :cond_19

    const/4 p0, 0x1

    goto :goto_1a

    :cond_19
    const/4 p0, 0x2

    :goto_1a
    if-eq p0, p1, :cond_25

    iput p0, v0, Ly2n;->y:I

    invoke-virtual {v0}, Ly2n;->P()Lk4n;

    move-result-object p1

    invoke-interface {p1, p0}, Lk4n;->h(I)V

    :cond_25
    return-void
.end method

.method public final q(Lcom/opera/android/suggestion/Suggestion;Z)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v2, Lmrk;

    iget-object v3, v2, Lmrk;->c:Lfbf;

    iget-object v4, v2, Lmrk;->N:Lzyk;

    sget-object v6, Lqk0;->Q:Lqk0;

    const/16 v7, 0xb

    const/16 v8, 0x1f

    const/16 v9, 0x1e

    const/16 v10, 0x1c

    const/16 v11, 0x1b

    const/16 v12, 0x8

    if-eqz p2, :cond_c0

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loqk;

    iget-object v13, v4, Loqk;->a:Lx5f;

    iget-object v14, v13, Lx5f;->d:Lzpa;

    iget-object v15, v4, Loqk;->c:Ldbf;

    sget-object v5, Lcl0;->i:Lcl0;

    iput-object v5, v4, Loqk;->d:Lcl0;

    invoke-static {v1}, Loqk;->b(Lcom/opera/android/suggestion/Suggestion;)Lbl0;

    move-result-object v4

    if-eqz v4, :cond_37

    sget-object v4, Lqk0;->L:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    :cond_37
    iget v4, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/4 v5, 0x2

    if-eq v4, v12, :cond_a7

    const/16 v12, 0x12

    if-eq v4, v12, :cond_9d

    const/16 v12, 0x13

    if-eq v4, v12, :cond_93

    if-eq v4, v11, :cond_8e

    if-eq v4, v10, :cond_8e

    if-eq v4, v9, :cond_8e

    if-eq v4, v8, :cond_8e

    packed-switch v4, :pswitch_data_16a

    goto/16 :goto_100

    :pswitch_51
    sget-object v4, Lqk0;->H:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    goto/16 :goto_100

    :pswitch_58
    sget-object v4, Lqk0;->I:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    goto/16 :goto_100

    :pswitch_5f
    sget-object v4, Lqk0;->G:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    goto/16 :goto_100

    :pswitch_66
    sget-object v4, Lqk0;->J:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    iget-boolean v4, v13, Lx5f;->h:Z

    if-eqz v4, :cond_100

    invoke-virtual {v13, v7}, Lx5f;->o(I)V

    goto/16 :goto_100

    :pswitch_74
    sget-object v4, Lqk0;->O:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    iget-boolean v4, v13, Lx5f;->h:Z

    if-eqz v4, :cond_100

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v14}, Lx56;->G(Lzpa;)Lok0;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v5, v7}, Ljf0;->d(II)V

    invoke-virtual {v13, v4}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_100

    :cond_8e
    invoke-virtual {v15, v6}, Ldbf;->A(Lqk0;)V

    goto/16 :goto_100

    :cond_93
    iget-boolean v4, v13, Lx5f;->h:Z

    if-eqz v4, :cond_100

    const/16 v4, 0x11

    invoke-virtual {v13, v4}, Lx5f;->o(I)V

    goto :goto_100

    :cond_9d
    iget-boolean v4, v13, Lx5f;->h:Z

    if-eqz v4, :cond_100

    const/16 v4, 0x10

    invoke-virtual {v13, v4}, Lx5f;->o(I)V

    goto :goto_100

    :cond_a7
    sget-object v4, Lqk0;->E:Lqk0;

    invoke-virtual {v15, v4}, Ldbf;->A(Lqk0;)V

    iget-boolean v4, v13, Lx5f;->h:Z

    if-eqz v4, :cond_100

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v14}, Lx56;->G(Lzpa;)Lok0;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v5, v7}, Ljf0;->d(II)V

    invoke-virtual {v13, v4}, Lx5f;->U0(Lx56;)V

    goto :goto_100

    :cond_c0
    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loqk;

    iget-object v5, v4, Loqk;->c:Ldbf;

    sget-object v13, Lcl0;->h:Lcl0;

    invoke-virtual {v4, v1, v13}, Loqk;->a(Lcom/opera/android/suggestion/Suggestion;Lcl0;)V

    invoke-static {v1}, Loqk;->b(Lcom/opera/android/suggestion/Suggestion;)Lbl0;

    move-result-object v13

    if-eqz v13, :cond_d8

    sget-object v13, Lqk0;->M:Lqk0;

    invoke-virtual {v5, v13}, Ldbf;->A(Lqk0;)V

    :cond_d8
    iget v13, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-eq v13, v12, :cond_fb

    if-eq v13, v7, :cond_ea

    if-eq v13, v11, :cond_e6

    if-eq v13, v10, :cond_e6

    if-eq v13, v9, :cond_e6

    if-ne v13, v8, :cond_100

    :cond_e6
    invoke-virtual {v5, v6}, Ldbf;->A(Lqk0;)V

    goto :goto_100

    :cond_ea
    sget-object v6, Lqk0;->K:Lqk0;

    invoke-virtual {v5, v6}, Ldbf;->A(Lqk0;)V

    iget-object v4, v4, Loqk;->a:Lx5f;

    iget-boolean v5, v4, Lx5f;->h:Z

    if-eqz v5, :cond_100

    const/16 v5, 0xc

    invoke-virtual {v4, v5}, Lx5f;->o(I)V

    goto :goto_100

    :cond_fb
    sget-object v4, Lqk0;->D:Lqk0;

    invoke-virtual {v5, v4}, Ldbf;->A(Lqk0;)V

    :cond_100
    :goto_100
    iget v4, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v5, 0x17

    if-ne v4, v5, :cond_129

    if-nez p2, :cond_129

    iget-object v4, v1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_129

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    iget-object v5, v3, Lfbf;->a:Lgbf;

    iget-object v5, v5, Lgbf;->h:Lk6l;

    invoke-virtual {v5, v4}, Lk6l;->r(I)Lb2l;

    move-result-object v4

    if-eqz v4, :cond_129

    move-object v6, v4

    check-cast v6, Ld7l;

    iget-boolean v6, v6, Ld7l;->m:Z

    if-nez v6, :cond_129

    const/4 v6, 0x3

    invoke-virtual {v5, v4, v6}, Lk6l;->C(Lb2l;I)V

    :cond_129
    iget v4, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v5, 0xe

    const/4 v6, 0x0

    if-ne v4, v5, :cond_14a

    iget-object v0, v2, Lmrk;->K:Lj55;

    iget-object v2, v0, Lj55;->e:Landroid/content/Context;

    invoke-virtual {v1}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v6}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    const/4 v7, 0x1

    iput-boolean v7, v0, Lj55;->l:Z

    iget-object v1, v0, Lj55;->p:Li55;

    iget-object v1, v1, Li55;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lj55;->h(Ljava/lang/String;)Li55;

    move-result-object v1

    invoke-virtual {v0, v1, v7}, Lj55;->j(Li55;Z)V

    return-void

    :cond_14a
    const/4 v7, 0x1

    if-nez p2, :cond_161

    iput-boolean v7, v2, Lmrk;->R:Z

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v2, Lmrk;->S:Ljava/lang/Integer;

    invoke-virtual {v1}, Lcom/opera/android/suggestion/Suggestion;->a()Ljava/lang/String;

    move-result-object v0

    iget-object v1, v3, Lfbf;->a:Lgbf;

    invoke-virtual {v1, v0}, Lgbf;->k(Ljava/lang/String;)V

    iput-boolean v6, v2, Lmrk;->R:Z

    return-void

    :cond_161
    iput-boolean v7, v2, Lmrk;->U:Z

    iput-object v1, v0, Leyi;->c:Ljava/lang/Object;

    invoke-virtual {v2}, Lmrk;->b()V

    return-void

    nop

    :pswitch_data_16a
    .packed-switch 0xa
        :pswitch_74
        :pswitch_66
        :pswitch_5f
        :pswitch_58
        :pswitch_51
    .end packed-switch
.end method

.method public final show()V
    .registers 1

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lu85;

    iget-object p0, p0, Lu85;->h:Ljava/lang/Object;

    check-cast p0, Li21;

    invoke-virtual {p0}, Li21;->d()V

    return-void
.end method

.method public final t()Llrf;
    .registers 1

    iget-object p0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast p0, Lr7j;

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Leyi;->a:B

    packed-switch v0, :pswitch_data_38

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-boolean v0, p0, Leyi;->b:Z

    invoke-virtual {p0}, Leyi;->g()Ln26;

    move-result-object v1

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lr05;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SingleSelectionLayout(isStartHandle="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", crossed="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", info=\n\t"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_38
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method
