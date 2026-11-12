.class public final Lekn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyp9;

.field public final b:Ldkn;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lyp9;

    const/4 v1, 0x1

    const/4 v2, 0x3

    const/4 v3, 0x4

    const/high16 v4, 0x3f400000    # 0.75f

    invoke-direct {v0, v3, v4, v1, v2}, Lyp9;-><init>(IFZB)V

    iput-object v0, p0, Lekn;->a:Lyp9;

    new-instance v0, Ldkn;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v2, "wallpaper_avg_color_cache.json"

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, p0, v1, p2}, Ldkn;-><init>(Lekn;Ljava/io/File;Lumi;)V

    invoke-virtual {v0}, Lldk;->h()V

    iput-object v0, p0, Lekn;->b:Ldkn;

    return-void
.end method
