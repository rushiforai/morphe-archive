.class public final Lcom/opera/android/browser/SessionStore;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# static fields
.field public static final h:Li4j;

.field public static final i:Lj4j;

.field public static j:Lcom/opera/android/browser/SessionStore;


# instance fields
.field public final a:J

.field public final b:Ljava/util/HashMap;

.field public final c:Ljava/util/HashMap;

.field public final d:Lqz;

.field public final e:Lnrl;

.field public f:Lk6l;

.field public g:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Li4j;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/browser/SessionStore;->h:Li4j;

    new-instance v0, Lj4j;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lj4j;-><init>(II)V

    sput-object v0, Lcom/opera/android/browser/SessionStore;->i:Lj4j;

    return-void
.end method

.method public constructor <init>(J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/SessionStore;->c:Ljava/util/HashMap;

    new-instance v0, Lqz;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/browser/SessionStore;->d:Lqz;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/browser/SessionStore;->e:Lnrl;

    iput-wide p1, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {p1, p2, p0}, LJ/N;->MsCkLV0r(JLjava/lang/Object;)V

    return-void
.end method

.method public static addRecentlyClosedTab(Ljava/util/List;IILjava/lang/String;Ljava/lang/String;Z)V
    .registers 12
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lenh;",
            ">;II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    new-instance v0, Lenh;

    xor-int/lit8 v5, p5, 0x1

    move v3, p1

    move v4, p2

    move-object v2, p3

    move-object v1, p4

    invoke-direct/range {v0 .. v5}, Lenh;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static addToIdMap(Ljava/util/Map;II)V
    .registers 3
    .param p0    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static createBrowserActivityInstance(J)V
    .registers 3

    new-instance v0, Lcom/opera/android/browser/SessionStore;

    invoke-direct {v0, p0, p1}, Lcom/opera/android/browser/SessionStore;-><init>(J)V

    sput-object v0, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    return-void
.end method

.method public static getIsOverridingUserAgent(Lcom/opera/android/browser/BrowserTabState;I)Z
    .registers 2
    .param p0    # Lcom/opera/android/browser/BrowserTabState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    iget-boolean p0, p0, Lzy3;->e:Z

    return p0
.end method

.method private getNativePointer()J
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    return-wide v0
.end method

.method public static getPageState(Lcom/opera/android/browser/BrowserTabState;I)[B
    .registers 2
    .param p0    # Lcom/opera/android/browser/BrowserTabState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    iget-object p0, p0, Lzy3;->f:[B

    return-object p0
.end method

.method public static getTabInfoClass()Ljava/lang/Class;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/opera/android/browser/TabInfo;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/opera/android/browser/TabInfo;

    return-object v0
.end method

.method public static getTitle(Lcom/opera/android/browser/BrowserTabState;I)Ljava/lang/String;
    .registers 2
    .param p0    # Lcom/opera/android/browser/BrowserTabState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    iget-object p0, p0, Lzy3;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static getUrl(Lcom/opera/android/browser/BrowserTabState;I)Ljava/lang/String;
    .registers 2
    .param p0    # Lcom/opera/android/browser/BrowserTabState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    iget-object p0, p0, Lzy3;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static getUserData(Lcom/opera/android/browser/BrowserTabState;I)[B
    .registers 2
    .param p0    # Lcom/opera/android/browser/BrowserTabState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    iget-object p0, p0, Lzy3;->g:[B

    return-object p0
.end method

.method public static getVirtualUrl(Lcom/opera/android/browser/BrowserTabState;I)Ljava/lang/String;
    .registers 2
    .param p0    # Lcom/opera/android/browser/BrowserTabState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    iget-object p0, p0, Lzy3;->d:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 6

    move-object p1, p2

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    if-eqz p1, :cond_11

    invoke-static {v0, v1}, LJ/N;->MGVFxWjx(J)V

    return-void

    :cond_11
    check-cast p2, Ld7l;

    iget-object p0, p2, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-static {v0, v1, p0}, LJ/N;->MvqRhr_p(JI)V

    return-void
.end method

.method public final L(Lb2l;Z)V
    .registers 5

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_c

    return-void

    :cond_c
    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    if-nez p2, :cond_23

    move-object p0, p1

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->J()Z

    move-result p2

    if-eqz p2, :cond_23

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-static {v0, v1, p0}, LJ/N;->MC2F5Efx(JI)V

    return-void

    :cond_23
    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-static {v0, v1, p0}, LJ/N;->MKH2wY$N(JI)V

    return-void
.end method

.method public final a(Z)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/browser/SessionStore;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MoPqae2N(JZ)V

    if-nez p1, :cond_14

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/browser/SessionStore;->g:Z

    :cond_14
    return-void
.end method

.method public final b(I)Lj4j;
    .registers 6

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj4j;

    if-eqz v0, :cond_f

    return-object v0

    :cond_f
    iget-wide v2, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v2, v3, p1}, LJ/N;->MAgWVLVE(JI)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj4j;

    if-nez p0, :cond_22

    sget-object p0, Lcom/opera/android/browser/SessionStore;->i:Lj4j;

    :cond_22
    return-object p0
.end method

.method public final c(Lcom/opera/android/browser/BrowserTabState;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v3, v1, Lcom/opera/android/browser/BrowserTabState;->a:I

    iget v12, v1, Lcom/opera/android/browser/BrowserTabState;->b:I

    iget-wide v4, v0, Lcom/opera/android/browser/SessionStore;->a:J

    const/4 v13, 0x0

    invoke-static {v4, v5, v3, v13}, LJ/N;->MCfyeHpi(JII)V

    iget-object v14, v1, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v15

    move v1, v13

    move v4, v1

    :goto_16
    if-ge v1, v15, :cond_3c

    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v16, v1, 0x1

    check-cast v2, Lzy3;

    iget-object v5, v2, Lzy3;->b:Ljava/lang/String;

    iget-object v6, v2, Lzy3;->d:Ljava/lang/String;

    iget-object v7, v2, Lzy3;->c:Ljava/lang/String;

    iget-boolean v8, v2, Lzy3;->e:Z

    iget-object v9, v2, Lzy3;->f:[B

    iget-object v10, v2, Lzy3;->g:[B

    if-ne v4, v12, :cond_31

    const/4 v1, 0x1

    move v11, v1

    goto :goto_32

    :cond_31
    move v11, v13

    :goto_32
    iget-wide v1, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static/range {v1 .. v11}, LJ/N;->ME167Gpi(JIILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;Z)V

    add-int/lit8 v4, v4, 0x1

    move/from16 v1, v16

    goto :goto_16

    :cond_3c
    return-void
.end method

.method public final createInfo(JJII)Lcom/opera/android/browser/TabInfo;
    .registers 9
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance p0, Lcom/opera/android/browser/TabInfo;

    move-wide v0, p1

    move p1, p5

    move p2, p6

    move-wide p5, p3

    move-wide p3, v0

    invoke-direct/range {p0 .. p6}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    return-object p0
.end method

.method public final createInfoForMigratedTab()Lcom/opera/android/browser/TabInfo;
    .registers 8
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    return-object v0
.end method

.method public final createRestoredSession([I[Lcom/opera/android/browser/TabInfo;IJ)Lcom/opera/android/browser/SessionRestore$State;
    .registers 11
    .param p1    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/opera/android/browser/TabInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    array-length v0, p1

    if-nez v0, :cond_8

    invoke-static {}, Lcom/opera/android/browser/SessionRestore$State;->b()Lcom/opera/android/browser/SessionRestore$State;

    move-result-object p0

    return-object p0

    :cond_8
    array-length v0, p2

    array-length v1, p1

    if-eq v0, v1, :cond_11

    invoke-static {}, Lcom/opera/android/browser/SessionRestore$State;->b()Lcom/opera/android/browser/SessionRestore$State;

    move-result-object p0

    return-object p0

    :cond_11
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_18
    array-length v2, p1

    if-ge v1, v2, :cond_2a

    new-instance v2, Lk4j;

    aget v3, p1, v1

    aget-object v4, p2, v1

    invoke-direct {v2, p0, v3, v4}, Lk4j;-><init>(Lcom/opera/android/browser/SessionStore;ILcom/opera/android/browser/TabInfo;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_2a
    new-instance p0, Lcom/opera/android/browser/SessionRestore$State;

    new-instance p1, Ln9g;

    invoke-direct {p1, p3, v0}, Ln9g;-><init>(ILjava/util/List;)V

    invoke-direct {p0, p1, p4, p5}, Lcom/opera/android/browser/SessionRestore$State;-><init>(Ln9g;J)V

    return-object p0
.end method

.method public final h(Lb2l;I)V
    .registers 5

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_c

    return-void

    :cond_c
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1, p1, p2}, LJ/N;->MP5454nI(JII)V

    return-void
.end method

.method public final initializeNextTabId(Lcom/opera/android/Lazy;)V
    .registers 6
    .param p1    # Lcom/opera/android/Lazy;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/android/Lazy;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const v0, -0x7fffffff

    const-string v1, "next_tab_id"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-wide v2, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v2, v3, v0}, LJ/N;->M0NWz$2e(JI)V

    invoke-interface {p1, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-static {v2, v3}, LJ/N;->Ml0K9PX$(J)V

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_27
    return-void
.end method

.method public final injectNavigationEntry(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)V
    .registers 19
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/browser/SessionStore;->c:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_1a

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-instance v1, Lgke;

    neg-int p1, p2

    add-int/lit8 v2, p1, -0x1

    const/4 v9, 0x1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v1 .. v9}, Lgke;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[BB)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final injectNavigationHistory(III)V
    .registers 5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance v0, Lj4j;

    invoke-direct {v0, p2, p3}, Lj4j;-><init>(II)V

    iget-object p0, p0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final invalidate(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/browser/SessionStore;->c:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 13

    if-nez p3, :cond_30

    check-cast p1, Ld7l;

    iget-object p3, p1, Ld7l;->j:Le7l;

    invoke-interface {p3}, Lb9l;->m()Z

    move-result p3

    if-nez p3, :cond_30

    iget-object p3, p1, Ld7l;->j:Le7l;

    invoke-interface {p3}, Lb9l;->getId()I

    move-result p3

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1, p3, p2}, LJ/N;->MT62gZM7(JII)V

    iget-object p2, p1, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p2

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result v2

    iget-wide v3, p2, Lcom/opera/android/browser/TabInfo;->a:J

    iget-wide v5, p2, Lcom/opera/android/browser/TabInfo;->b:J

    iget v7, p2, Lcom/opera/android/browser/TabInfo;->c:I

    iget v8, p2, Lcom/opera/android/browser/TabInfo;->d:I

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static/range {v0 .. v8}, LJ/N;->Mbsb$YyE(JIJJII)V

    :cond_30
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/browser/SessionStore;->f:Lk6l;

    return-void
.end method

.method public final onSessionLoaded()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/SessionStore;->e:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void
.end method
