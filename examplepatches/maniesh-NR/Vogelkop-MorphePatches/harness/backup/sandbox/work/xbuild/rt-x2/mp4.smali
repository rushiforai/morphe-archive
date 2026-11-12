.class public final Lmp4;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final e:Lywh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lga6;Ld93;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p3}, Lr22;-><init>(Landroid/content/Context;Lqtm;Ld93;)V

    iput-object p2, p0, Lmp4;->e:Lywh;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lywh;Lqtm;)V
    .registers 4

    .line 7
    invoke-direct {p0, p1, p3, p3}, Lr22;-><init>(Landroid/content/Context;Lqtm;Ld93;)V

    iput-object p2, p0, Lmp4;->e:Lywh;

    return-void
.end method


# virtual methods
.method public final Q(Llp4;)V
    .registers 5

    invoke-virtual {p0}, Lr22;->c()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "v1/category/manifestv2"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lz7;

    invoke-direct {v1, v0}, Lz7;-><init>(Ljava/lang/String;)V

    new-instance v0, Lkp4;

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2}, Lkp4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lmp4;->e:Lywh;

    invoke-interface {p0, v1, v0}, Lywh;->a(Lz7;Lz4o;)V

    return-void
.end method
