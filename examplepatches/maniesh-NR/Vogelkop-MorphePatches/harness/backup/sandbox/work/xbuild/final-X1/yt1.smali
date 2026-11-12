.class public final Lyt1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzt1;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lzyk;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyt1;->a:Ljava/lang/String;

    new-instance p1, Lxt1;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lxt1;-><init>(Lyt1;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyt1;->b:Lzyk;

    new-instance p1, Lxt1;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lxt1;-><init>(Lyt1;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyt1;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 9

    iget-object v0, p0, Lyt1;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object p0, p0, Lyt1;->a:Ljava/lang/String;

    if-eqz v0, :cond_12

    :goto_10
    move-object v1, p0

    goto :goto_19

    :cond_12
    const-string v0, "https://"

    invoke-static {v0, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_10

    :goto_19
    sget p0, Lvmj;->g:I

    const/4 v4, 0x0

    const/16 v5, 0x30

    move v3, p1

    move v2, p1

    move-object v0, p2

    invoke-static/range {v0 .. v5}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, v2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyt1;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final o()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyt1;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method
