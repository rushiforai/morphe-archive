.class public Ll/l8l$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l8l;->F()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l8l;


# direct methods
.method public constructor <init>(Ll/l8l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l8l$a;->a:Ll/l8l;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p3, p0, Ll/l8l$a;->a:Ll/l8l;

    .line 9
    .line 10
    iget-object p3, p3, Ll/l8l;->h:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    new-array v0, v0, [Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    aput-object p3, v0, v1

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/l8l$a;->a:Ll/l8l;

    .line 22
    .line 23
    iget-object p0, p0, Ll/l8l;->h:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
