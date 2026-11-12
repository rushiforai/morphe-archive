.class public final Lqzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le2m;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Integer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqzj;->a:Landroid/content/Context;

    new-instance p1, Ls4f;

    const/16 v0, 0x1a

    invoke-direct {p1, p2, p0, v0}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lqzj;->b:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 4

    iget-object v0, p0, Lqzj;->b:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/4 v1, -0x1

    iget-object p0, p0, Lqzj;->a:Landroid/content/Context;

    invoke-static {v0, v1, p0, p1}, Lcom/opera/android/webapps/ShortcutHelper;->c(IILandroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    if-eqz p0, :cond_19

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    return-object p0

    :cond_19
    return-object p1
.end method

.method public final key()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lqzj;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    const-string v0, "SpeedDialPrettifyTransformation"

    invoke-static {p0, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
