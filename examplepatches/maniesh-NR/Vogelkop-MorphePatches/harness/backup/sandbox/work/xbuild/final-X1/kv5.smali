.class public final Lkv5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/chromium/url/GURL;


# direct methods
.method public constructor <init>(Lorg/chromium/url/GURL;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkv5;->a:Lorg/chromium/url/GURL;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lkv5;

    if-eqz v1, :cond_15

    check-cast p1, Lkv5;

    iget-object p0, p0, Lkv5;->a:Lorg/chromium/url/GURL;

    iget-object p1, p1, Lkv5;->a:Lorg/chromium/url/GURL;

    invoke-virtual {p0, p1}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_15

    return v0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object p0, p0, Lkv5;->a:Lorg/chromium/url/GURL;

    iget-object p0, p0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    const/4 v0, 0x0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    xor-int/2addr p0, v0

    return p0
.end method
