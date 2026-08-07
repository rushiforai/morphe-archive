.class Lcom/immomo/momomediaext/b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/b;->e()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/b;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/b$b;->a:Lcom/immomo/momomediaext/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getRealBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/b$b;->a:Lcom/immomo/momomediaext/b;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/b;->c(Lcom/immomo/momomediaext/b;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
