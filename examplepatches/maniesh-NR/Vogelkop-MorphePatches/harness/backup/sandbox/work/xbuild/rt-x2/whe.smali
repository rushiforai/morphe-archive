.class public final synthetic Lwhe;
.super Ld6h;
.source "SourceFile"


# static fields
.field public static final b:Lwhe;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lwhe;

    const-string v1, "getIcon()Lcom/opera/ads/internal/assets/ImageAsset;"

    const/4 v2, 0x0

    const-class v3, Ly2p;

    const-string v4, "icon"

    invoke-direct {v0, v3, v4, v1, v2}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lwhe;->b:Lwhe;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ly2p;

    iget-object p0, p1, Ly2p;->E:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsro;

    return-object p0
.end method
