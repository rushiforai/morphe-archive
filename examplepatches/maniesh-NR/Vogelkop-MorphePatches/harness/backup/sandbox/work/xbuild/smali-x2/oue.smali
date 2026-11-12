.class public final Loue;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:J


# instance fields
.field public final a:Lnv6;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x7

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Loue;->b:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnv6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lpd7;

    invoke-direct {v1, p1, p2}, Lpd7;-><init>(Landroid/content/Context;Lumi;)V

    iput-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    invoke-virtual {v1}, Lldk;->h()V

    iput-object v0, p0, Loue;->a:Lnv6;

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/url/GURL;)Z
    .registers 8

    iget-boolean v0, p1, Lorg/chromium/url/GURL;->b:Z

    if-nez v0, :cond_6

    const/4 p1, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {p1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p1

    :goto_a
    const/4 v0, 0x0

    if-eqz p1, :cond_24

    iget-object p0, p0, Loue;->a:Lnv6;

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Lpd7;

    iget-object v1, p0, Lpd7;->n:Ljava/util/Map;

    if-nez v1, :cond_1c

    invoke-virtual {p0}, Lldk;->i()V

    iget-object v1, p0, Lpd7;->n:Ljava/util/Map;

    :cond_1c
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lod7;

    if-nez p0, :cond_25

    :cond_24
    return v0

    :cond_25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lod7;->a:J

    cmp-long p0, v4, v2

    if-gtz p0, :cond_33

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v0

    :cond_33
    const/4 p0, 0x1

    return p0
.end method
