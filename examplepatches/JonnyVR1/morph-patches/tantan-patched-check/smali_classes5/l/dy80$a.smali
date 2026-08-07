.class public Ll/dy80$a;
.super Lv/VSlider$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dy80;->A(Lcom/p1/mobile/putong/data/Settings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/dy80;


# direct methods
.method public constructor <init>(Ll/dy80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dy80$a;->a:Ll/dy80;

    .line 2
    .line 3
    invoke-direct {p0}, Lv/VSlider$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;ZF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/dy80$a;->c(Lv/VSlider;ZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;ZFF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dy80$a;->d(Lv/VSlider;ZFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VSlider;ZF)V
    .locals 0
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/dy80$a;->a:Ll/dy80;

    .line 2
    .line 3
    float-to-int p2, p3

    .line 4
    invoke-static {p1, p2}, Ll/dy80;->f(Ll/dy80;I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/dy80$a;->a:Ll/dy80;

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Ll/dy80;->l(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(Lv/VSlider;ZFF)V
    .locals 0
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lv/VSlider$a;->d(Lv/VSlider;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
