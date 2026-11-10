.class public final Ly/c0;
.super Ly/b0;
.source "SourceFile"


# static fields
.field public static final q:Ly/f0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, LS/e;->c()Landroid/view/WindowInsets;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ly/f0;->c(Landroid/view/WindowInsets;Landroid/view/View;)Ly/f0;

    move-result-object v0

    sput-object v0, Ly/c0;->q:Ly/f0;

    return-void
.end method

.method public constructor <init>(Ly/f0;Landroid/view/WindowInsets;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ly/b0;-><init>(Ly/f0;Landroid/view/WindowInsets;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public f(I)Lr/c;
    .locals 1

    iget-object v0, p0, Ly/Y;->c:Landroid/view/WindowInsets;

    invoke-static {p1}, Ly/e0;->a(I)I

    move-result p1

    invoke-static {v0, p1}, LS/e;->b(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object p1

    invoke-static {p1}, Lr/c;->b(Landroid/graphics/Insets;)Lr/c;

    move-result-object p1

    return-object p1
.end method
