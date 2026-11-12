.class public final synthetic Lzhe;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lzhe;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lzhe;

    const-string v1, "getMainImage()Lcom/opera/ads/internal/assets/ImageAsset;"

    const/4 v2, 0x0

    const-class v3, Ly2p;

    const-string v4, "mainImage"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lzhe;->b:Lzhe;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ly2p;

    iget-object p0, p1, Ly2p;->D:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsro;

    return-object p0
.end method
