.class public final Lofh;
.super Lan8;
.source "SourceFile"


# instance fields
.field public final b:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lzcj;Landroid/content/Intent;)V
    .registers 3

    invoke-direct {p0, p1}, Lan8;-><init>(Lzcj;)V

    iput-object p2, p0, Lofh;->b:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .registers 11

    iget-object v0, p0, Lan8;->a:Lzcj;

    const-string v1, ".qr_share"

    invoke-virtual {v0, v1}, Lzcj;->e(Ljava/lang/String;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    const-class v4, Lgcj;

    invoke-direct {v2, v1, v4, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v1, Lgcj;->y:Landroid/graphics/Bitmap$CompressFormat;

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v1, "share_intent"

    iget-object p0, p0, Lofh;->b:Landroid/content/Intent;

    invoke-virtual {v3, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v4, 0x1

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v1, p1}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f0805c8

    invoke-static {p0, p1}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f140d6b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e(Landroid/content/Context;)Landroid/graphics/drawable/Icon;
    .registers 2

    const p0, 0x7f0805c8

    invoke-static {p1, p0}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object p0

    return-object p0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    const-string p0, ".qr_share"

    return-object p0
.end method
