.class public final Ldln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf94;
.implements Lgln;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lgln;

.field public final synthetic c:Lvq8;


# direct methods
.method public constructor <init>(Lvq8;Lgln;Z)V
    .registers 4

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldln;->b:Lgln;

    iput-boolean p3, p0, Ldln;->a:Z

    iput-object p1, p0, Ldln;->c:Lvq8;

    return-void
.end method

.method public constructor <init>(Lvq8;ZLgln;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Ldln;->a:Z

    iput-object p3, p0, Ldln;->b:Lgln;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ldln;->c:Lvq8;

    return-void
.end method


# virtual methods
.method public final e(Ljava/util/ArrayList;)V
    .registers 3

    iget-boolean v0, p0, Ldln;->a:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Ldln;->c:Lvq8;

    iget-object v0, v0, Lvq8;->j:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_d
    iget-object p0, p0, Ldln;->b:Lgln;

    invoke-interface {p0, p1}, Lgln;->e(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final onFailure()V
    .registers 1

    .line 27
    iget-object p0, p0, Ldln;->b:Lgln;

    invoke-interface {p0}, Lgln;->onFailure()V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 4

    iget-object p1, p0, Ldln;->c:Lvq8;

    iget-object p1, p1, Lvq8;->g:Ljava/lang/Object;

    check-cast p1, Lumi;

    iget-object p0, p0, Ldln;->b:Lgln;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Ly1n;

    const/16 v0, 0x17

    invoke-direct {p2, p0, v0}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, p2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 11

    iget-object p1, p0, Ldln;->c:Lvq8;

    iget-object v0, p1, Lvq8;->g:Ljava/lang/Object;

    check-cast v0, Lumi;

    iget-boolean v1, p2, Lpzh;->q:Z

    const/16 v2, 0x17

    const/4 v3, 0x0

    iget-object v4, p0, Ldln;->b:Lgln;

    if-eqz v1, :cond_65

    :try_start_f
    iget-object p2, p2, Lpzh;->g:Lvzh;
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_11} :catch_55
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_11} :catch_55

    :try_start_11
    invoke-virtual {p2}, Lvzh;->string()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lvq8;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v6, Lnpl;

    const/16 v7, 0x19

    invoke-direct {v6, v4, v5, v7}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v6}, Lvml;->c(Ljava/lang/Runnable;)V

    iget-boolean p0, p0, Ldln;->a:Z

    if-eqz p0, :cond_45

    iget-object p0, p1, Lvq8;->f:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    iget-object p1, p1, Lvq8;->b:Ljava/lang/Object;

    check-cast p1, Ljava/io/File;
    :try_end_2f
    .catchall {:try_start_11 .. :try_end_2f} :catchall_49

    :try_start_2f
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_38

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    :cond_38
    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p0, p1}, Ls29;->j(Ljava/io/File;[B)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_41} :catch_42
    .catchall {:try_start_2f .. :try_end_41} :catchall_49

    goto :goto_45

    :catch_42
    :try_start_42
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_49

    :cond_45
    :goto_45
    :try_start_45
    invoke-virtual {p2}, Lvzh;->close()V
    :try_end_48
    .catch Lorg/json/JSONException; {:try_start_45 .. :try_end_48} :catch_55
    .catch Ljava/lang/IllegalArgumentException; {:try_start_45 .. :try_end_48} :catch_55

    goto :goto_64

    :catchall_49
    move-exception p0

    if-eqz p2, :cond_54

    :try_start_4c
    invoke-virtual {p2}, Lvzh;->close()V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_50

    goto :goto_54

    :catchall_50
    move-exception p1

    :try_start_51
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_54
    :goto_54
    throw p0
    :try_end_55
    .catch Lorg/json/JSONException; {:try_start_51 .. :try_end_55} :catch_55
    .catch Ljava/lang/IllegalArgumentException; {:try_start_51 .. :try_end_55} :catch_55

    :catch_55
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ly1n;

    invoke-direct {p0, v4, v2}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, p0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    :goto_64
    return-void

    :cond_65
    invoke-virtual {p2}, Lpzh;->close()V

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ly1n;

    invoke-direct {p0, v4, v2}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, p0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
