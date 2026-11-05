.class public final Le/e/a/CommentFonts194$Picker;
.super Landroid/app/Fragment;
.source "CommentFonts194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentFonts194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Picker"
.end annotation


# instance fields
.field result:Le/e/a/CommentFonts194$Result;

.field started:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method finish(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V
    .registers 7

    .line 27
    iget-object v0, p0, Le/e/a/CommentFonts194$Picker;->result:Le/e/a/CommentFonts194$Result;

    const/4 v1, 0x0

    iput-object v1, p0, Le/e/a/CommentFonts194$Picker;->result:Le/e/a/CommentFonts194$Result;

    if-eqz v0, :cond_b

    invoke-interface {v0, p1, p2, p3, p4}, Le/e/a/CommentFonts194$Result;->loaded(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    goto :goto_10

    :cond_b
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_10
    :goto_10
    invoke-virtual {p0}, Le/e/a/CommentFonts194$Picker;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_2b

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p2

    if-nez p2, :cond_2b

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    :cond_2b
    return-void
.end method

.method synthetic lambda$0$e-e-a-CommentFonts194$Picker(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 12

    .line 26
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "\u30ab\u30b9\u30bf\u30e0\u30d5\u30a9\u30f3\u30c8"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_3} :catch_de

    :try_start_3
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    const-string v3, "_display_name"

    const/4 v8, 0x0

    aput-object v3, v4, v8

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v3, p2

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_d0

    if-eqz v2, :cond_2e

    :try_start_19
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_23
    .catchall {:try_start_19 .. :try_end_23} :catchall_24

    goto :goto_2e

    :catchall_24
    move-exception p1

    if-eqz v2, :cond_2a

    :try_start_27
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_2a
    throw p1
    :try_end_2b
    .catchall {:try_start_27 .. :try_end_2b} :catchall_2b

    :catchall_2b
    move-exception p2

    goto/16 :goto_d2

    :cond_2e
    :goto_2e
    if-eqz v2, :cond_33

    :try_start_30
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_33
    .catchall {:try_start_30 .. :try_end_33} :catchall_d0

    :cond_33
    :try_start_33
    new-instance v2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "comment-fonts"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_51

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-eqz v3, :cond_4b

    goto :goto_51

    :cond_4b
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    :cond_50
    :goto_50
    throw p1

    :cond_51
    :goto_51
    const-string v3, "font-"

    const-string v4, ".font"

    invoke-static {v3, v4, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v2
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_59} :catch_de

    :try_start_59
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_61
    .catchall {:try_start_59 .. :try_end_61} :catchall_c3

    :try_start_61
    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_66
    .catchall {:try_start_61 .. :try_end_66} :catchall_b3

    if-eqz p1, :cond_a9

    const/16 v3, 0x2000

    :try_start_6a
    new-array v3, v3, [B

    const/4 v4, 0x0

    :goto_6d
    invoke-virtual {p1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_71
    .catchall {:try_start_6a .. :try_end_71} :catchall_a7

    const/4 v6, -0x1

    if-ne v5, v6, :cond_96

    :try_start_74
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_77
    .catchall {:try_start_74 .. :try_end_77} :catchall_b3

    if-eqz p1, :cond_7c

    :try_start_79
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_7c
    .catchall {:try_start_79 .. :try_end_7c} :catchall_c3

    :cond_7c
    :try_start_7c
    invoke-static {v2}, Le/e/a/CommentFonts194;->validate(Ljava/io/File;)V

    invoke-static {v2}, Landroid/graphics/Typeface;->createFromFile(Ljava/io/File;)Landroid/graphics/Typeface;

    move-result-object p1

    new-instance p2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Le/e/a/CommentFonts194$Picker$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, v2, v1, p1}, Le/e/a/CommentFonts194$Picker$$ExternalSyntheticLambda0;-><init>(Le/e/a/CommentFonts194$Picker;Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_94
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_94} :catch_cd

    goto/16 :goto_f9

    :cond_96
    add-int/2addr v4, v5

    const/high16 v6, 0x1000000

    if-gt v4, v6, :cond_9f

    :try_start_9b
    invoke-virtual {p2, v3, v8, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_6d

    :cond_9f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u30d5\u30a9\u30f3\u30c8\u306f16MB\u4ee5\u4e0b\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_a6
    throw v0

    :catchall_a7
    move-exception v0

    goto :goto_af

    :cond_a9
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V
    :try_end_ae
    .catchall {:try_start_9b .. :try_end_ae} :catchall_a7

    goto :goto_a6

    :goto_af
    :try_start_af
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    throw v0
    :try_end_b3
    .catchall {:try_start_af .. :try_end_b3} :catchall_b3

    :catchall_b3
    move-exception p2

    if-nez v0, :cond_b8

    move-object v0, p2

    goto :goto_bd

    :cond_b8
    if-eq v0, p2, :cond_bd

    :try_start_ba
    invoke-virtual {v0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_bd
    :goto_bd
    if-eqz p1, :cond_c2

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_c2
    throw v0
    :try_end_c3
    .catchall {:try_start_ba .. :try_end_c3} :catchall_c3

    :catchall_c3
    move-exception p1

    if-eqz v0, :cond_cc

    if-eq v0, p1, :cond_cb

    :try_start_c8
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_cb
    move-object p1, v0

    :cond_cc
    throw p1
    :try_end_cd
    .catch Ljava/lang/Exception; {:try_start_c8 .. :try_end_cd} :catch_cd

    :catch_cd
    move-exception p1

    move-object v0, v2

    goto :goto_df

    :catchall_d0
    move-exception p2

    move-object p1, v0

    :goto_d2
    if-eqz p1, :cond_db

    if-eq p1, p2, :cond_50

    :try_start_d6
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_d9
    .catch Ljava/lang/Exception; {:try_start_d6 .. :try_end_d9} :catch_de

    goto/16 :goto_50

    :cond_db
    move-object p1, p2

    goto/16 :goto_50

    :catch_de
    move-exception p1

    :goto_df
    if-eqz v0, :cond_e4

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_e4
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Le/e/a/CommentFonts194$Picker$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Le/e/a/CommentFonts194$Picker$$ExternalSyntheticLambda1;-><init>(Le/e/a/CommentFonts194$Picker;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_f9
    return-void
.end method

.method synthetic lambda$1$e-e-a-CommentFonts194$Picker(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;)V
    .registers 5

    .line 26
    const-string v0, ""

    invoke-virtual {p0, p1, p2, p3, v0}, Le/e/a/CommentFonts194$Picker;->finish(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-CommentFonts194$Picker(Ljava/lang/String;)V
    .registers 4

    .line 26
    if-nez p1, :cond_4

    const-string p1, "\u30d5\u30a9\u30f3\u30c8\u3092\u8aad\u307f\u8fbc\u3081\u307e\u305b\u3093\u3067\u3057\u305f"

    :cond_4
    const/4 v0, 0x0

    const-string v1, ""

    invoke-virtual {p0, v0, v1, v0, p1}, Le/e/a/CommentFonts194$Picker;->finish(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 26
    const/16 v0, 0xc2

    if-eq p1, v0, :cond_5

    return-void

    :cond_5
    const/4 p1, -0x1

    if-ne p2, p1, :cond_2b

    if-eqz p3, :cond_2b

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_11

    goto :goto_2b

    :cond_11
    invoke-virtual {p0}, Le/e/a/CommentFonts194$Picker;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-nez p1, :cond_18

    return-void

    :cond_18
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    sget-object p3, Le/e/a/CommentFonts194;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Le/e/a/CommentFonts194$Picker$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/CommentFonts194$Picker$$ExternalSyntheticLambda2;-><init>(Le/e/a/CommentFonts194$Picker;Landroid/content/Context;Landroid/net/Uri;)V

    invoke-interface {p3, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_2b
    :goto_2b
    const/4 p1, 0x0

    const-string p2, ""

    invoke-virtual {p0, p1, p2, p1, p2}, Le/e/a/CommentFonts194$Picker;->finish(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 24
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/CommentFonts194$Picker;->setRetainInstance(Z)V

    return-void
.end method

.method public onResume()V
    .registers 4

    .line 25
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    iget-boolean v0, p0, Le/e/a/CommentFonts194$Picker;->started:Z

    if-nez v0, :cond_2c

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentFonts194$Picker;->started:Z

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0xc2

    :try_start_1f
    invoke-virtual {p0, v0, v1}, Le/e/a/CommentFonts194$Picker;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_22} :catch_23

    goto :goto_2c

    :catch_23
    move-exception v0

    const-string v0, ""

    const-string v1, "\u30d5\u30a1\u30a4\u30eb\u9078\u629e\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0, v2, v1}, Le/e/a/CommentFonts194$Picker;->finish(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    :cond_2c
    :goto_2c
    return-void
.end method
