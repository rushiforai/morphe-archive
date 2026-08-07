.class public final Ll/cjt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/net/Uri;

.field public final synthetic d:Ll/gjt0;


# direct methods
.method public constructor <init>(Ll/gjt0;Ljava/util/List;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/cjt0;->a:Ljava/util/List;

    .line 2
    .line 3
    iput-object p3, p0, Ll/cjt0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/cjt0;->c:Landroid/net/Uri;

    .line 6
    .line 7
    iput-object p1, p0, Ll/cjt0;->d:Ll/gjt0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjt0;->c:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "Failed to parse gmsg params for: "

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ljava/util/Map;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cjt0;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p0, Ll/cjt0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cjt0;->d:Ll/gjt0;

    .line 8
    .line 9
    invoke-static {p0, p1, v0, v1}, Ll/gjt0;->zze(Ll/gjt0;Ljava/util/Map;Ljava/util/List;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
