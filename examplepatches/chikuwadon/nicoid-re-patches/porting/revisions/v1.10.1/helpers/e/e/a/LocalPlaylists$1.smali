.class Le/e/a/LocalPlaylists$1;
.super Ljava/lang/Object;
.source "LocalPlaylists.java"

# interfaces
.implements Le/e/a/PlaylistStorage$Persistence;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$prefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;)V
    .registers 2

    .line 13
    iput-object p1, p0, Le/e/a/LocalPlaylists$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public read()Ljava/lang/String;
    .registers 4

    .line 13
    iget-object v0, p0, Le/e/a/LocalPlaylists$1;->val$prefs:Landroid/content/SharedPreferences;

    const-string v1, "nicoid_local_playlists_v1"

    const-string v2, "{}"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public restore(Ljava/lang/String;)V
    .registers 4

    .line 13
    iget-object v0, p0, Le/e/a/LocalPlaylists$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "nicoid_local_playlists_v1"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public write(Ljava/lang/String;)Z
    .registers 4

    .line 13
    iget-object v0, p0, Le/e/a/LocalPlaylists$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "nicoid_local_playlists_v1"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p1

    return p1
.end method
