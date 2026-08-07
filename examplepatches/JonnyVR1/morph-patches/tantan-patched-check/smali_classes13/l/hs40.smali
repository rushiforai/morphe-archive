.class public Ll/hs40;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hs40$a;
    }
.end annotation


# instance fields
.field public final a:Ll/hs40$a;

.field public b:Z

.field public c:Landroid/graphics/ColorFilter;


# direct methods
.method public constructor <init>(Ll/hs40$a;)V
    .locals 1
    .param p1    # Ll/hs40$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hs40;->b:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/hs40;->a:Ll/hs40$a;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/hs40;->c:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/hs40;->b:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/hs40;->a:Ll/hs40$a;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/android/ui/UIModeHelper;->b:Landroid/graphics/ColorFilter;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/hs40$a;->c(Landroid/graphics/ColorFilter;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    invoke-interface {p0, p1}, Ll/hs40$a;->c(Landroid/graphics/ColorFilter;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p0, p0, Ll/hs40;->a:Ll/hs40$a;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/hs40$a;->c(Landroid/graphics/ColorFilter;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hs40;->b:Z

    .line 2
    .line 3
    iget-object p1, p0, Ll/hs40;->c:Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hs40;->a(Landroid/graphics/ColorFilter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
