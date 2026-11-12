.class public final synthetic Lich;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/PushedContentHandler;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/PushedContentHandler;B)V
    .registers 3

    iput-byte p2, p0, Lich;->a:B

    iput-object p1, p0, Lich;->b:Lcom/opera/android/PushedContentHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 15

    iget-byte v0, p0, Lich;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lich;->b:Lcom/opera/android/PushedContentHandler;

    packed-switch v0, :pswitch_data_a0

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    iget-object v2, p0, Lcom/opera/android/PushedContentHandler;->d:Landroid/util/SparseArray;

    iget-boolean v3, p0, Lcom/opera/android/PushedContentHandler;->b:Z

    if-nez v3, :cond_61

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v4, "version"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    xor-int/2addr v5, v1

    const/4 v6, 0x0

    move v7, v6

    :goto_1f
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v8

    if-ge v7, v8, :cond_5f

    invoke-virtual {v2, v7}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v8

    invoke-static {}, Lio7;->values()[Lio7;

    move-result-object v9

    array-length v10, v9

    move v11, v6

    :goto_2f
    if-ge v11, v10, :cond_3a

    aget-object v12, v9, v11

    iget-byte v13, v12, Lio7;->a:B

    if-eq v13, v8, :cond_3b

    add-int/lit8 v11, v11, 0x1

    goto :goto_2f

    :cond_3a
    const/4 v12, 0x0

    :cond_3b
    if-eqz v12, :cond_5c

    invoke-virtual {v2, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lmch;

    invoke-virtual {p0, v12, v8}, Lcom/opera/android/PushedContentHandler;->c(Lio7;Lmch;)I

    move-result v8

    if-eqz v5, :cond_5c

    if-eqz v8, :cond_5c

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const/4 v8, 0x2

    invoke-interface {v5, v4, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v5, 0x4

    invoke-static {v5}, Lcak;->a(I)V

    move v5, v6

    :cond_5c
    add-int/lit8 v7, v7, 0x1

    goto :goto_1f

    :cond_5f
    iput-boolean v1, p0, Lcom/opera/android/PushedContentHandler;->b:Z

    :cond_61
    iget-object v1, p0, Lcom/opera/android/PushedContentHandler;->o:Lcom/opera/android/PushedContentHandler$Request;

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_6d

    iget-wide v4, v1, Lcom/opera/android/PushedContentHandler$Request;->d:J

    cmp-long v1, v4, v2

    if-nez v1, :cond_92

    :cond_6d
    iget-boolean v1, p0, Lcom/opera/android/PushedContentHandler;->c:Z

    if-nez v1, :cond_92

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "timer"

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_92

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->f()V

    new-instance v0, Lcom/opera/android/PushedContentHandler$Request;

    invoke-direct {v0, p0}, Lcom/opera/android/PushedContentHandler$Request;-><init>(Lcom/opera/android/PushedContentHandler;)V

    iput-object v0, p0, Lcom/opera/android/PushedContentHandler;->o:Lcom/opera/android/PushedContentHandler$Request;

    invoke-virtual {v0}, Lcom/opera/android/PushedContentHandler$Request;->a()V

    :cond_92
    return-void

    :pswitch_93
    new-instance v0, Lich;

    invoke-direct {v0, p0, v1}, Lich;-><init>(Lcom/opera/android/PushedContentHandler;B)V

    sget-object p0, Lcak;->d:Lavj;

    const/16 p0, 0x9

    invoke-static {p0, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_93
    .end packed-switch
.end method
