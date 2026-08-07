.class public Ll/g01$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uce;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g01;->a(I)Ll/uce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/g01;


# direct methods
.method public constructor <init>(Ll/g01;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g01$a;->b:Ll/g01;

    .line 2
    .line 3
    iput p2, p0, Ll/g01$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public i()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g01$a;->b:Ll/g01;

    .line 2
    .line 3
    iget p0, p0, Ll/g01$a;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/g01;->b(I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public k(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g01$a;->b:Ll/g01;

    .line 2
    .line 3
    iget p0, p0, Ll/g01$a;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/g01;->e(ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
