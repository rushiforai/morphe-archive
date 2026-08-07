.class public final synthetic Ll/pnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/snh;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/snh;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pnh;->a:Ll/snh;

    iput-object p2, p0, Ll/pnh;->b:Lcom/p1/mobile/putong/data/Media;

    iput-boolean p3, p0, Ll/pnh;->c:Z

    iput-object p4, p0, Ll/pnh;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/pnh;->e:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pnh;->a:Ll/snh;

    iget-object v1, p0, Ll/pnh;->b:Lcom/p1/mobile/putong/data/Media;

    iget-boolean v2, p0, Ll/pnh;->c:Z

    iget-object v3, p0, Ll/pnh;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/pnh;->e:Ljava/lang/StringBuilder;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v6, p2

    check-cast v6, Ljava/io/File;

    invoke-static/range {v0 .. v6}, Ll/snh;->a(Ll/snh;Lcom/p1/mobile/putong/data/Media;ZLcom/p1/mobile/android/app/Act;Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
