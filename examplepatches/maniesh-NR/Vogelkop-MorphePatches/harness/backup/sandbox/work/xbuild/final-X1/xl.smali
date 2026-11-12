.class public final Lxl;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lxl;->j:B

    .line 56
    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lxl;->k:Ljava/lang/Object;

    .line 58
    const-string p1, "ftouch_devs"

    iput-object p1, p0, Lxl;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Li16;Landroid/content/Context;Lumi;Lg16;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lxl;->j:B

    .line 47
    iput-object p1, p0, Lxl;->m:Ljava/lang/Object;

    .line 48
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 49
    const-string p1, "cc_never"

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    invoke-static {p2, p3, p1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lxl;->k:Ljava/lang/Object;

    .line 50
    iput-object p4, p0, Lxl;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Lk32;Ld4m;)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Lxl;->j:B

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    new-instance p1, Lg4m;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p1, v0, v1}, Lg4m;-><init>(Ljava/util/List;Ljava/util/List;)V

    iput-object p1, p0, Lxl;->k:Ljava/lang/Object;

    new-instance p1, Lnrl;

    const/16 v0, 0x1a

    invoke-direct {p1, v0}, Lnrl;-><init>(B)V

    iput-object p1, p0, Lxl;->l:Ljava/lang/Object;

    iput-object p2, p0, Lxl;->m:Ljava/lang/Object;

    new-instance p2, Lnpl;

    const/16 v0, 0xa

    invoke-direct {p2, p0, p3, v0}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Lyl;Landroid/content/Context;Lumi;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lxl;->j:B

    .line 51
    iput-object p1, p0, Lxl;->m:Ljava/lang/Object;

    .line 52
    sget-object p1, Lngh;->a:Lr16;

    .line 53
    invoke-direct {p0, p3}, Lldk;-><init>(Ltcl;)V

    .line 54
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lxl;->k:Ljava/lang/Object;

    .line 55
    new-instance p1, Lpa;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lxl;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lxl;->j:B

    const/4 v1, 0x0

    iget-object v2, p0, Lxl;->l:Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_112

    new-instance v0, Lg4m;

    iget-object p0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast p0, Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lo3m;

    iget-object v1, v1, Lo3m;->a:Ly5i;

    new-instance v2, Lqjl;

    const/16 v5, 0xa

    invoke-direct {v2, v5}, Lqjl;-><init>(B)V

    invoke-static {v1, v4, v3, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo3m;

    iget-object p0, p0, Lo3m;->a:Ly5i;

    new-instance v2, Lqjl;

    const/4 v5, 0x7

    invoke-direct {v2, v5}, Lqjl;-><init>(B)V

    invoke-static {p0, v4, v3, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-direct {v0, v1, p0}, Lg4m;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v0

    :pswitch_3d
    :try_start_3d
    iget-object p0, p0, Lxl;->k:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_3d .. :try_end_41} :catch_84
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_41} :catch_84
    .catchall {:try_start_3d .. :try_end_41} :catchall_7e

    :try_start_41
    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object p0
    :try_end_47
    .catch Lorg/json/JSONException; {:try_start_41 .. :try_end_47} :catch_84
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_47} :catch_84
    .catchall {:try_start_41 .. :try_end_47} :catchall_7c

    :try_start_47
    invoke-static {p0}, Lxvg;->z(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    :goto_59
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v3, v5, :cond_73

    new-instance v5, Lpwl;

    new-instance v6, Lorb;

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v6, v7}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6, v4}, Lpwl;-><init>(Lorb;B)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_70
    .catch Lorg/json/JSONException; {:try_start_47 .. :try_end_70} :catch_85
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_70} :catch_85
    .catchall {:try_start_47 .. :try_end_70} :catchall_7a

    add-int/lit8 v3, v3, 0x1

    goto :goto_59

    :cond_73
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    move-object v1, v0

    goto :goto_88

    :goto_78
    move-object v1, p0

    goto :goto_80

    :catchall_7a
    move-exception v0

    goto :goto_78

    :catchall_7c
    move-exception v0

    goto :goto_80

    :catchall_7e
    move-exception p0

    move-object v0, p0

    :goto_80
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :catch_84
    move-object p0, v1

    :catch_85
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_88
    return-object v1

    :pswitch_89
    iget-object p0, p0, Lxl;->k:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "set"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_a1

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    goto :goto_de

    :cond_a1
    :try_start_a1
    check-cast v2, Lg16;

    invoke-static {p0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    iget-object v0, v2, Lg16;->a:Lt1;

    invoke-virtual {v0}, Lt1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc36;

    invoke-virtual {v0, p0}, Lc36;->b([B)[B

    move-result-object p0

    if-nez p0, :cond_bb

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    goto :goto_de

    :cond_bb
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    const-string p0, "\\|"

    invoke-virtual {v0, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/util/HashSet;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    array-length v1, p0

    :goto_cd
    if-ge v3, v1, :cond_d7

    aget-object v2, p0, v3

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_d4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a1 .. :try_end_d4} :catch_d9

    add-int/lit8 v3, v3, 0x1

    goto :goto_cd

    :cond_d7
    move-object p0, v0

    goto :goto_de

    :catch_d9
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    :goto_de
    return-object p0

    :pswitch_df
    check-cast v2, Lzyk;

    :try_start_e1
    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_10e

    sget-object p0, Lrpb;->d:Lqpb;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Lx29;->c(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lk72;

    sget-object v2, Lwl;->Companion:Lvl;

    invoke-virtual {v2}, Lvl;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-direct {v1, v2, v3}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {p0, v0, v1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;
    :try_end_10d
    .catch Ljava/io/IOException; {:try_start_e1 .. :try_end_10d} :catch_10e
    .catch Loqb; {:try_start_e1 .. :try_end_10d} :catch_10e

    goto :goto_110

    :catch_10e
    :cond_10e
    sget-object p0, Ll08;->a:Ll08;

    :goto_110
    return-object p0

    nop

    :pswitch_data_112
    .packed-switch 0x0
        :pswitch_df
        :pswitch_89
        :pswitch_3d
    .end packed-switch
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 12

    iget-byte v0, p0, Lxl;->j:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    iget-object v3, p0, Lxl;->l:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_1ac

    check-cast p1, Lg4m;

    iget-object p0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast p0, Lk32;

    if-eqz p1, :cond_37

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo3m;

    iget-object v1, p1, Lg4m;->a:Ljava/util/List;

    iget-object v2, v0, Lo3m;->a:Ly5i;

    new-instance v3, Ln3m;

    invoke-direct {v3, v0, v1, v4}, Ln3m;-><init>(Lo3m;Ljava/util/List;B)V

    const/4 v0, 0x1

    invoke-static {v2, v4, v0, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo3m;

    iget-object p1, p1, Lg4m;->b:Ljava/util/List;

    iget-object v1, p0, Lo3m;->a:Ly5i;

    new-instance v2, Ln3m;

    invoke-direct {v2, p0, p1, v0}, Ln3m;-><init>(Lo3m;Ljava/util/List;B)V

    invoke-static {v1, v4, v0, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    :cond_37
    return-void

    :pswitch_38
    check-cast p1, Ljava/util/List;

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    if-eqz p1, :cond_bb

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_45
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bb

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lpwl;

    new-instance v6, Lorb;

    invoke-direct {v6}, Lorb;-><init>()V

    const-string v7, "id"

    iget-object v8, v5, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "group"

    iget-object v8, v5, Lpwl;->b:Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "name"

    iget-object v8, v5, Lpwl;->c:Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "version"

    iget-object v8, v5, Lpwl;->d:Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "kind"

    iget-object v8, v5, Lpwl;->e:Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v7, v5, Lpwl;->f:Ljava/security/PublicKey;

    invoke-interface {v7}, Ljava/security/Key;->getEncoded()[B

    move-result-object v7

    invoke-static {v7, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v7

    const-string v8, "public_key"

    invoke-virtual {v6, v7, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v7, v5, Lpwl;->g:Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    const-string v9, "last_seen"

    invoke-virtual {v6, v7, v8, v9}, Lorb;->o(JLjava/lang/String;)V

    iget-object v5, v5, Lpwl;->h:Lu1b;

    new-instance v7, Lvpb;

    invoke-direct {v7}, Lvpb;-><init>()V

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_9e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_ae

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_9e

    :cond_ae
    const-string v5, "capabilities"

    invoke-virtual {v6, v7, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v6}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_45

    :cond_bb
    :try_start_bb
    iget-object p0, p0, Lxl;->k:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_d0
    .catchall {:try_start_bb .. :try_end_d0} :catchall_d4

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :catchall_d4
    move-exception p0

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :pswitch_d9
    check-cast p1, Ljava/util/Set;

    iget-object p0, p0, Lxl;->k:Ljava/lang/Object;

    check-cast p0, Lb59;

    const-string v0, "set"

    if-eqz p1, :cond_117

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_117

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    check-cast v3, Lg16;

    const-string v1, "|"

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    iget-object v1, v3, Lg16;->a:Lt1;

    invoke-virtual {v1}, Lt1;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc36;

    invoke-virtual {v1, p1}, Lc36;->d([B)[B

    move-result-object p1

    invoke-static {p1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_120

    :cond_117
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :goto_120
    return-void

    :pswitch_121
    check-cast v3, Lzyk;

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_132

    :try_start_127
    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto/16 :goto_1ab

    :cond_132
    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    sget-object v0, Lrpb;->d:Lqpb;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lk72;

    sget-object v5, Lwl;->Companion:Lvl;

    invoke-virtual {v5}, Lvl;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v5

    invoke-direct {v2, v5, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {v0, p1, v2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lx29;->d(Ljava/io/File;Ljava/lang/String;)V
    :try_end_14f
    .catch Ljava/io/IOException; {:try_start_127 .. :try_end_14f} :catch_1ab
    .catch Ljava/lang/NullPointerException; {:try_start_127 .. :try_end_14f} :catch_150

    goto :goto_1ab

    :catch_150
    move-exception p0

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    if-eqz p1, :cond_19f

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_15e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v5, v4, 0x1

    if-ltz v4, :cond_19b

    check-cast v2, Lwl;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    iget-object v6, v2, Lwl;->b:Ljava/lang/String;

    iget-object v7, v2, Lwl;->c:Lyo;

    iget-object v2, v2, Lwl;->d:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "pid: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " p: "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " t: "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v4, v5

    goto :goto_15e

    :cond_19b
    invoke-static {}, Lj95;->n()V

    throw v1

    :cond_19f
    invoke-static {p0, v0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :catch_1ab
    :goto_1ab
    return-void

    :pswitch_data_1ac
    .packed-switch 0x0
        :pswitch_121
        :pswitch_d9
        :pswitch_38
    .end packed-switch
.end method

.method public final c()I
    .registers 1

    iget-byte p0, p0, Lxl;->j:B

    packed-switch p0, :pswitch_data_a

    :pswitch_5
    const/4 p0, 0x1

    return p0

    :pswitch_7
    const/4 p0, 0x2

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lxl;->j:B

    packed-switch v0, :pswitch_data_40

    check-cast p1, Lg4m;

    if-eqz p1, :cond_b

    iput-object p1, p0, Lxl;->k:Ljava/lang/Object;

    :cond_b
    iget-object p0, p0, Lxl;->l:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void

    :pswitch_13
    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_1d

    iput-object p1, p0, Lxl;->m:Ljava/lang/Object;

    :cond_1d
    return-void

    :pswitch_1e
    check-cast p1, Ljava/util/Set;

    if-nez p1, :cond_27

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    :cond_27
    iget-object p0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast p0, Li16;

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void

    :pswitch_2e
    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_3f

    iget-object p0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast p0, Lyl;

    iget-object p0, p0, Lyl;->d:Ljava/lang/Object;

    check-cast p0, Ljec;

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    :cond_3f
    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_1e
        :pswitch_13
    .end packed-switch
.end method

.method public final j(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lxl;->l:Ljava/lang/Object;

    check-cast v0, Lnrl;

    new-instance v1, Lnpl;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p1, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final k()Ljava/util/List;
    .registers 2

    iget-object v0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_b

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_b
    invoke-virtual {p0}, Lldk;->i()V

    iget-object v0, p0, Lxl;->m:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_18

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lxl;->m:Ljava/lang/Object;

    :cond_18
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
