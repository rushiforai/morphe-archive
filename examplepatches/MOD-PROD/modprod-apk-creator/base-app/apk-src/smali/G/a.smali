.class public final LG/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ/o;
.implements Landroidx/emoji2/text/p;


# instance fields
.field public a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LF/d;)V
    .locals 1

    new-instance v0, LR/b;

    invoke-direct {v0}, LR/b;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LG/a;->a:Ljava/lang/Object;

    iput-object v0, p0, LG/a;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LG/a;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-object p1, p0, LG/a;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LG/a;->a:Ljava/lang/Object;

    new-instance v0, LG/j;

    invoke-direct {v0, p1}, LG/j;-><init>(Landroid/widget/EditText;)V

    iput-object v0, p0, LG/a;->b:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    sget-object v0, LG/b;->b:LG/b;

    if-nez v0, :cond_1

    sget-object v0, LG/b;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, LG/b;->b:LG/b;

    if-nez v1, :cond_0

    new-instance v1, LG/b;

    invoke-direct {v1}, Landroid/text/Editable$Factory;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string v2, "android.text.DynamicLayout$ChangeWatcher"

    const-class v3, LG/b;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v4, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, LG/b;->c:Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    :try_start_2
    sput-object v1, LG/b;->b:LG/b;

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :cond_1
    :goto_2
    sget-object v0, LG/b;->b:LG/b;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEditableFactory(Landroid/text/Editable$Factory;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, LG/a;->a:Ljava/lang/Object;

    iput-object p2, p0, LG/a;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .locals 0

    iput-object p1, p0, LG/a;->b:Ljava/lang/Object;

    iput-object p2, p0, LG/a;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ljava/io/File;
    .locals 3

    iget-object v0, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, LG/a;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "volley"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, LG/a;->a:Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    return-object v0
.end method

.method public b(Lg/a;)V
    .locals 3

    iget-object v0, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v0, LQ/t;

    invoke-virtual {v0, p1}, LQ/t;->b(Lg/a;)Lg/e;

    move-result-object p1

    iget-object v0, v0, LQ/t;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    iget-object p1, p0, LG/a;->b:Ljava/lang/Object;

    check-cast p1, Le/B;

    iget-object v0, p1, Le/B;->w:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p1, Le/B;->l:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p1, Le/B;->x:Le/p;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    iget-object v0, p1, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v0, :cond_2

    iget-object v0, p1, Le/B;->y:Ly/Q;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ly/Q;->b()V

    :cond_1
    iget-object v0, p1, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-static {v0}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ly/Q;->a(F)V

    iput-object v0, p1, Le/B;->y:Ly/Q;

    new-instance v1, Le/r;

    const/4 v2, 0x2

    invoke-direct {v1, v2, p0}, Le/r;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Ly/Q;->d(Ly/S;)V

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p1, Le/B;->u:Lg/a;

    iget-object v0, p1, Le/B;->A:Landroid/view/ViewGroup;

    sget-object v1, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {v0}, Ly/y;->c(Landroid/view/View;)V

    invoke-virtual {p1}, Le/B;->H()V

    return-void
.end method

.method public c(Ljava/lang/CharSequence;IILandroidx/emoji2/text/w;)Z
    .locals 3

    iget v0, p4, Landroidx/emoji2/text/w;->c:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x1

    if-lez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/emoji2/text/z;

    if-nez v0, :cond_2

    new-instance v0, Landroidx/emoji2/text/z;

    instance-of v2, p1, Landroid/text/Spannable;

    if-eqz v2, :cond_1

    check-cast p1, Landroid/text/Spannable;

    goto :goto_0

    :cond_1
    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    move-object p1, v2

    :goto_0
    invoke-direct {v0, p1}, Landroidx/emoji2/text/z;-><init>(Landroid/text/Spannable;)V

    iput-object v0, p0, LG/a;->a:Ljava/lang/Object;

    :cond_2
    iget-object p1, p0, LG/a;->b:Ljava/lang/Object;

    check-cast p1, LF/d;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Landroidx/emoji2/text/x;

    invoke-direct {p1, p4}, Landroidx/emoji2/text/x;-><init>(Landroidx/emoji2/text/w;)V

    iget-object p4, p0, LG/a;->a:Ljava/lang/Object;

    check-cast p4, Landroidx/emoji2/text/z;

    const/16 v0, 0x21

    invoke-virtual {p4, p1, p2, p3, v0}, Landroidx/emoji2/text/z;->setSpan(Ljava/lang/Object;III)V

    return v1
.end method

.method public d(Lg/a;Lh/n;)Z
    .locals 4

    iget-object v0, p0, LG/a;->b:Ljava/lang/Object;

    check-cast v0, Le/B;

    iget-object v0, v0, Le/B;->A:Landroid/view/ViewGroup;

    sget-object v1, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {v0}, Ly/y;->c(Landroid/view/View;)V

    iget-object v0, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v0, LQ/t;

    invoke-virtual {v0, p1}, LQ/t;->b(Lg/a;)Lg/e;

    move-result-object p1

    iget-object v1, v0, LQ/t;->d:Ljava/lang/Object;

    check-cast v1, Ll/k;

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Ll/k;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/Menu;

    if-nez v2, :cond_0

    new-instance v2, Lh/C;

    iget-object v3, v0, LQ/t;->b:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    invoke-direct {v2, v3, p2}, Lh/C;-><init>(Landroid/content/Context;Lh/n;)V

    invoke-virtual {v1, p2, v2}, Ll/k;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object p2, v0, LQ/t;->a:Ljava/lang/Object;

    check-cast p2, Landroid/view/ActionMode$Callback;

    invoke-interface {p2, p1, v2}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public e(Lv/e;)V
    .locals 4

    iget v0, p1, Lv/e;->b:I

    iget-object v1, p0, LG/a;->b:Ljava/lang/Object;

    check-cast v1, Landroid/os/Handler;

    iget-object v2, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v2, LC/j;

    if-nez v0, :cond_0

    new-instance v0, LQ/c;

    iget-object p1, p1, Lv/e;->a:Landroid/graphics/Typeface;

    const/4 v3, 0x4

    invoke-direct {v0, v2, v3, p1}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    new-instance p1, LD/b;

    invoke-direct {p1, v2, v0}, LD/b;-><init>(LC/j;I)V

    invoke-virtual {v1, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public f(LR/h;)LQ/k;
    .locals 13

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    :goto_0
    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p1, LR/h;->l:LQ/b;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    if-nez v3, :cond_0

    :try_start_1
    sget-object v3, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_1

    :catch_0
    move-exception v3

    goto/16 :goto_6

    :cond_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iget-object v5, v3, LQ/b;->b:Ljava/lang/String;

    if-eqz v5, :cond_1

    const-string v6, "If-None-Match"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-wide v5, v3, LQ/b;->d:J

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    const-string v3, "EEE, dd MMM yyyy HH:mm:ss \'GMT\'"

    new-instance v7, Ljava/text/SimpleDateFormat;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, v3, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v3, "GMT"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v7, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "If-Modified-Since"

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_2
    move-object v3, v4

    :goto_1
    :try_start_2
    iget-object v4, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v4, LF/d;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :try_start_3
    invoke-virtual {v4, p1, v3}, LF/d;->d(LR/h;Ljava/util/Map;)LR/b;

    move-result-object v3
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    :try_start_4
    iget v4, v3, LR/b;->a:I

    iget-object v5, v3, LR/b;->b:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    const/16 v6, 0x130

    if-ne v4, v6, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    invoke-static {p1, v5}, LD/g;->w(LR/h;Ljava/util/List;)LQ/k;

    move-result-object p1

    return-object p1

    :catch_1
    move-exception v4

    move-object v12, v3

    move-object v3, v2

    move-object v2, v12

    goto/16 :goto_7

    :cond_3
    iget-object v6, v3, LR/b;->d:Ljava/lang/Object;

    check-cast v6, Ljava/io/InputStream;

    if-eqz v6, :cond_4

    goto :goto_2

    :cond_4
    move-object v6, v2

    :goto_2
    const/4 v7, 0x0

    if-eqz v6, :cond_5

    iget v8, v3, LR/b;->c:I

    iget-object v9, p0, LG/a;->b:Ljava/lang/Object;

    check-cast v9, LR/b;

    invoke-static {v6, v8, v9}, LD/g;->z(Ljava/io/InputStream;ILR/b;)[B

    move-result-object v2

    goto :goto_3

    :cond_5
    new-array v2, v7, [B

    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long/2addr v8, v0

    sget-boolean v6, LQ/s;->a:Z

    if-nez v6, :cond_6

    const-wide/16 v10, 0xbb8

    cmp-long v6, v8, v10

    if-lez v6, :cond_8

    :cond_6
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    if-eqz v2, :cond_7

    array-length v8, v2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_4

    :cond_7
    const-string v8, "null"

    :goto_4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget-object v10, p1, LR/h;->k:LQ/f;

    iget v10, v10, LQ/f;->b:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {p1, v6, v8, v9, v10}, [Ljava/lang/Object;

    move-result-object v6

    const-string v8, "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]"

    invoke-static {v8, v6}, LQ/s;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_8
    const/16 v6, 0xc8

    if-lt v4, v6, :cond_9

    const/16 v6, 0x12b

    if-gt v4, v6, :cond_9

    new-instance v4, LQ/k;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    invoke-direct {v4, v2, v7, v5}, LQ/k;-><init>([BZLjava/util/List;)V

    return-object v4

    :cond_9
    new-instance v4, Ljava/io/IOException;

    invoke-direct {v4}, Ljava/io/IOException;-><init>()V

    throw v4
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :catch_2
    move-exception v4

    :goto_5
    move-object v3, v2

    goto :goto_7

    :catch_3
    move-exception v3

    :goto_6
    move-object v4, v3

    goto :goto_5

    :goto_7
    instance-of v5, v4, Ljava/net/SocketTimeoutException;

    if-eqz v5, :cond_a

    new-instance v2, LG/a;

    new-instance v3, LQ/a;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    const-string v4, "socket"

    invoke-direct {v2, v4, v3}, LG/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_d

    :cond_a
    instance-of v5, v4, Ljava/net/MalformedURLException;

    iget-object v6, p1, LR/h;->c:Ljava/lang/String;

    if-nez v5, :cond_16

    if-eqz v2, :cond_15

    iget v4, v2, LR/b;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "Unexpected response code %d for %s"

    invoke-static {v6, v5}, LQ/s;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v3, :cond_13

    iget-object v2, v2, LR/b;->b:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    if-nez v2, :cond_b

    goto :goto_9

    :cond_b
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_c

    sget-object v3, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_9

    :cond_c
    new-instance v3, Ljava/util/TreeMap;

    sget-object v5, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v3, v5}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, LQ/i;

    iget-object v7, v6, LQ/i;->a:Ljava/lang/String;

    iget-object v6, v6, LQ/i;->b:Ljava/lang/String;

    invoke-virtual {v3, v7, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    :cond_d
    :goto_9
    if-nez v2, :cond_e

    goto :goto_a

    :cond_e
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    :goto_a
    const/16 v2, 0x191

    if-eq v4, v2, :cond_12

    const/16 v2, 0x193

    if-ne v4, v2, :cond_f

    goto :goto_c

    :cond_f
    const/16 p1, 0x190

    if-lt v4, p1, :cond_11

    const/16 p1, 0x1f3

    if-le v4, p1, :cond_10

    goto :goto_b

    :cond_10
    new-instance p1, LQ/e;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    throw p1

    :cond_11
    :goto_b
    new-instance p1, LQ/a;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    throw p1

    :cond_12
    :goto_c
    new-instance v2, LG/a;

    new-instance v3, LQ/a;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    const-string v4, "auth"

    invoke-direct {v2, v4, v3}, LG/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_d

    :cond_13
    new-instance v2, LG/a;

    new-instance v3, LQ/a;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    const-string v4, "network"

    invoke-direct {v2, v4, v3}, LG/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_d
    iget-object v3, v2, LG/a;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const-string v4, "]"

    iget-object v5, p1, LR/h;->k:LQ/f;

    iget v6, v5, LQ/f;->a:I

    :try_start_5
    iget-object v2, v2, LG/a;->b:Ljava/lang/Object;

    check-cast v2, LQ/p;

    iget v7, v5, LQ/f;->b:I

    const/4 v8, 0x1

    add-int/2addr v7, v8

    iput v7, v5, LQ/f;->b:I

    int-to-float v9, v6

    const/high16 v10, 0x3f800000    # 1.0f

    mul-float/2addr v9, v10

    float-to-int v9, v9

    add-int/2addr v9, v6

    iput v9, v5, LQ/f;->a:I
    :try_end_5
    .catch LQ/p; {:try_start_5 .. :try_end_5} :catch_4

    if-gt v7, v8, :cond_14

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "-retry [timeout="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, LR/h;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_14
    :try_start_6
    throw v2
    :try_end_6
    .catch LQ/p; {:try_start_6 .. :try_end_6} :catch_4

    :catch_4
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-timeout-giveup [timeout="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, LR/h;->a(Ljava/lang/String;)V

    throw v0

    :cond_15
    new-instance p1, LQ/l;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_16
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bad URL "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public i()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, LG/a;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/emoji2/text/z;

    return-object v0
.end method

.method public u(Ljava/lang/String;)V
    .locals 26

    move-object/from16 v1, p0

    const-string v0, "ad_button_text_color"

    const-string v2, "ad_text_color"

    const-string v3, "ad_button_text"

    const-string v4, "ad_price"

    const-string v5, "ad_rating_color"

    const-string v6, "ad_rating"

    const-string v7, "ad_url"

    const-string v8, "ad_icon"

    const-string v9, "ad_desc"

    const-string v10, "ad_title"

    const-string v11, "request_id"

    const-string v12, "ad_display"

    const-string v13, "ad_button_background_color"

    :try_start_0
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v15, p1

    invoke-direct {v14, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v15, "0"

    const-string v16, ""

    const-string v17, ""

    const-string v18, ""

    const-string v19, ""

    const-string v20, "5"

    const-string v21, "#fdcc0d"

    const-string v22, ""

    const-string v23, "#ffffff"

    const-string v24, ""

    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v25
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 p1, v15

    const-string v15, "true"

    if-eqz v25, :cond_0

    :try_start_1
    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v25

    if-nez v25, :cond_0

    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    goto :goto_0

    :catch_0
    move-exception v0

    goto/16 :goto_3

    :cond_0
    move-object v12, v15

    :goto_0
    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    iget-object v15, v1, LG/a;->a:Ljava/lang/Object;

    check-cast v15, Lstart/MainActivity;

    if-nez v12, :cond_1

    :try_start_2
    invoke-virtual {v15}, Landroid/app/Activity;->finish()V

    return-void

    :cond_1
    invoke-virtual {v14, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v14, v11}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    invoke-virtual {v14, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    :cond_2
    move-object/from16 v11, p1

    :goto_1
    invoke-virtual {v14, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-virtual {v14, v10}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_3

    invoke-virtual {v14, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    :cond_3
    move-object/from16 v10, v16

    invoke-virtual {v14, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-virtual {v14, v9}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    invoke-virtual {v14, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    :cond_4
    move-object/from16 v9, v17

    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_5

    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    :cond_5
    invoke-virtual {v14, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-virtual {v14, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6

    invoke-virtual {v14, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    :cond_6
    move-object/from16 v7, v19

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_7

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    :cond_7
    invoke-virtual {v14, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-virtual {v14, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_8

    invoke-virtual {v14, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    :cond_8
    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    :cond_9
    move-object/from16 v4, v22

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    :cond_a
    move-object/from16 v3, v24

    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    const-string v6, "#000000"

    if-eqz v5, :cond_b

    :try_start_3
    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_b

    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_b
    move-object v2, v6

    :goto_2
    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_c
    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    :cond_d
    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    :cond_e
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, v15}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0b001f

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->setContentView(I)V

    invoke-virtual {v0, v10}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    const v5, 0x7f080046

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    const v5, 0x7f080042

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    const v5, 0x7f080044

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const v2, 0x7f080041

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const v3, 0x7f07005a

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-static/range {v23 .. v23}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const v3, 0x7f080045

    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/AppCompatRatingBar;

    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/RatingBar;->setRating(F)V

    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/LayerDrawable;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static/range {v21 .. v21}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const v8, -0x777778

    invoke-virtual {v5, v8, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static/range {v21 .. v21}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    new-instance v3, LT/l;

    const v5, 0x7f080040

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    invoke-direct {v3}, Landroid/os/AsyncTask;-><init>()V

    iput-object v5, v3, LT/l;->a:Landroid/widget/ImageView;

    filled-new-array/range {v18 .. v18}, [Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    new-instance v3, LT/h;

    invoke-direct {v3, v1, v7, v11, v0}, LT/h;-><init>(LG/a;Ljava/lang/String;Ljava/lang/String;Landroid/app/Dialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, LT/i;

    invoke-direct {v2, v1}, LT/i;-><init>(LG/a;)V

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    new-instance v2, LT/j;

    invoke-direct {v2, v1}, LT/j;-><init>(LG/a;)V

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, -0x1

    const/4 v5, -0x2

    invoke-virtual {v2, v3, v5}, Landroid/view/Window;->setLayout(II)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const v2, 0x7f08004e

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    new-instance v3, LT/k;

    invoke-direct {v3, v1, v0}, LT/k;-><init>(LG/a;Landroid/app/Dialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method
