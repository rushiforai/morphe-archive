.class public Landroidx/core/content/FileProvider$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroidx/core/content/FileProvider$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/content/FileProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public a(Landroid/net/Uri;)Ljava/io/File;
    .registers 3

    iget-object v0, p0, Landroidx/core/content/FileProvider$b;->a:Ljava/util/HashMap;

    invoke-static {v0, p1}, Lnicoid/core107/FileProviderPath107;->resolve(Ljava/util/Map;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method
