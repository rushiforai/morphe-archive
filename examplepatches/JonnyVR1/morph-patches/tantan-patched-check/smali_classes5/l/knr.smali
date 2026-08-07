.class public final synthetic Ll/knr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vcj;


# instance fields
.field public final synthetic a:Ll/nnr;


# direct methods
.method public synthetic constructor <init>(Ll/nnr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/knr;->a:Ll/nnr;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/knr;->a:Ll/nnr;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    check-cast p2, Ljava/lang/CharSequence;

    check-cast p3, Ljava/lang/Integer;

    check-cast p4, Ljava/lang/Integer;

    check-cast p5, Ljava/lang/Integer;

    check-cast p6, Ljava/lang/Boolean;

    invoke-static/range {p0 .. p6}, Ll/nnr;->b(Ll/nnr;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
