.class public final synthetic Ll/aoi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/gcg0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aoi;->a:Ll/gcg0;

    iput-object p2, p0, Ll/aoi;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aoi;->a:Ll/gcg0;

    iget-object p0, p0, Ll/aoi;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1, p2}, Ll/coi;->d(Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
