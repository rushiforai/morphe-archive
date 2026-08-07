.class public final synthetic Ll/pig0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/klg0;

.field public final synthetic b:J

.field public final synthetic c:J

.field public final synthetic d:Ltech/sud/gip/core/PkgDownloadStatus;


# direct methods
.method public synthetic constructor <init>(Ll/klg0;JJLtech/sud/gip/core/PkgDownloadStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pig0;->a:Ll/klg0;

    iput-wide p2, p0, Ll/pig0;->b:J

    iput-wide p4, p0, Ll/pig0;->c:J

    iput-object p6, p0, Ll/pig0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pig0;->a:Ll/klg0;

    iget-wide v1, p0, Ll/pig0;->b:J

    iget-wide v3, p0, Ll/pig0;->c:J

    iget-object v5, p0, Ll/pig0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    invoke-static/range {v0 .. v5}, Ll/llg0;->k(Ll/klg0;JJLtech/sud/gip/core/PkgDownloadStatus;)V

    return-void
.end method
