.class public Le/e/a/g0;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/h0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lorg/apache/http/client/CookieStore;

.field public c:Ljava/util/concurrent/ExecutorService;

.field public d:Landroid/os/Handler;

.field public e:Z

.field public f:Le/e/a/v;

.field public g:Le/e/a/l3/f;

.field public h:Landroid/content/SharedPreferences;

.field public i:Landroid/content/SharedPreferences$Editor;

.field public j:Le/e/a/i0;

.field public k:Landroid/widget/ListView;

.field public l:Le/e/a/r;

.field public m:Landroid/widget/ListView;


# virtual methods
.method public a(Le/e/a/q;Le/e/a/h0;)V
    .registers 11

    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput v3, v2, v3

    iget-object v4, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    const v5, 0x7f0b002c

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f080086

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setInputType(I)V

    if-eqz p2, :cond_0

    iget-object v1, p2, Le/e/a/h0;->b:Ljava/lang/String;

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    new-instance v1, Landroid/widget/ArrayAdapter;

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x1090008

    invoke-direct {v1, v6, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v6, 0x1090009

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x7f0f0038

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x7f0f0037

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x7f0f01d6

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v6, 0x7f080187

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Spinner;

    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v1, Le/e/a/g0$a;

    invoke-direct {v1, p0, v2, p1, v5}, Le/e/a/g0$a;-><init>(Le/e/a/g0;[ILe/e/a/q;Landroid/widget/EditText;)V

    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    if-eqz p2, :cond_1

    iget p1, p2, Le/e/a/h0;->a:I

    invoke-virtual {v6, p1}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v6, v3}, Landroid/widget/Spinner;->setSelection(I)V

    :goto_0
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v1, 0x7f0f009e

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/g0$b;

    invoke-direct {v1, p0, v5, p2, v2}, Le/e/a/g0$b;-><init>(Le/e/a/g0;Landroid/widget/EditText;Le/e/a/h0;[I)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const p2, 0x7f0f002d

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Le/e/a/g0$c;

    invoke-direct {p2, p0}, Le/e/a/g0$c;-><init>(Le/e/a/g0;)V

    invoke-virtual {v0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    const/4 v0, 0x2

    invoke-virtual {p2, v3, v0}, Landroid/view/Window;->setFlags(II)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method

.method public declared-synchronized a(ILjava/lang/String;Z)Z
    .registers 11

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    const-string v1, ""

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz p1, :cond_2

    if-eq p1, v3, :cond_1

    if-eq p1, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "id"

    goto :goto_0

    :cond_1
    const-string v1, "command"

    goto :goto_0

    :cond_2
    const-string v1, "word"

    :goto_0
    iget-object v4, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const-string v5, "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

    iget-object v6, p0, Le/e/a/g0;->b:Lorg/apache/http/client/CookieStore;

    invoke-static {v4, v5, p2, v1, v6}, Lnicoid/network238/MutationStatus280;->postNg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v4, 0xc8

    if-ne p1, v4, :cond_4

    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/String;

    aput-object v1, p1, v0

    aput-object p2, p1, v3

    const-string p2, "0"

    aput-object p2, p1, v2

    sget-object p2, Le/e/a/g0;->n:Ljava/util/ArrayList;

    new-instance v1, Le/e/a/h0;

    invoke-direct {v1, p1}, Le/e/a/h0;-><init>([Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p3, :cond_3

    monitor-exit p0

    return v3

    :cond_3
    :try_start_1
    iget-object p1, p0, Le/e/a/g0;->d:Landroid/os/Handler;

    new-instance p2, Le/e/a/g0$d;

    invoke-direct {p2, p0}, Le/e/a/g0$d;-><init>(Le/e/a/g0;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v3

    :cond_4
    :try_start_2
    iget-object p1, p0, Le/e/a/g0;->d:Landroid/os/Handler;

    new-instance p2, Le/e/a/g0$e;

    invoke-direct {p2, p0}, Le/e/a/g0$e;-><init>(Le/e/a/g0;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v0

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Le/e/a/h0;)Z
    .registers 8

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    const-string v1, ""

    iget v2, p1, Le/e/a/h0;->a:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-eq v2, v3, :cond_1

    const/4 v4, 0x2

    if-eq v2, v4, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "id"

    goto :goto_0

    :cond_1
    const-string v1, "command"

    goto :goto_0

    :cond_2
    const-string v1, "word"

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client?type="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&source="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Le/e/a/h0;->b:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le/e/a/g0;->a:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/g0;->b:Lorg/apache/http/client/CookieStore;

    invoke-static {v2, v1, v4}, Lnicoid/network238/MutationStatus280;->deleteExplicit(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_3

    sget-object v1, Le/e/a/g0;->n:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Le/e/a/g0;->d:Landroid/os/Handler;

    new-instance v1, Le/e/a/g0$g;

    invoke-direct {v1, p0}, Le/e/a/g0$g;-><init>(Le/e/a/g0;)V

    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v3

    :cond_3
    :try_start_1
    iget-object p1, p0, Le/e/a/g0;->d:Landroid/os/Handler;

    new-instance v1, Le/e/a/g0$h;

    invoke-direct {v1, p0}, Le/e/a/g0$h;-><init>(Le/e/a/g0;)V

    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method public b(Le/e/a/h0;)V
    .registers 5

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v2, 0x7f0f00a3

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v2, 0x7f0f00a1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/g0$k;

    invoke-direct {v2, p0, p1}, Le/e/a/g0$k;-><init>(Le/e/a/g0;Le/e/a/h0;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v1, 0x7f0f002d

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/g0$l;

    invoke-direct {v1, p0}, Le/e/a/g0$l;-><init>(Le/e/a/g0;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
