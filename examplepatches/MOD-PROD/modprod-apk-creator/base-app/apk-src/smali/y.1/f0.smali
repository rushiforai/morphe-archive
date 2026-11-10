.class public final Ly/f0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ly/f0;


# instance fields
.field public final a:Ly/d0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    sget-object v0, Ly/c0;->q:Ly/f0;

    sput-object v0, Ly/f0;->b:Ly/f0;

    return-void

    :cond_0
    sget-object v0, Ly/d0;->b:Ly/f0;

    sput-object v0, Ly/f0;->b:Ly/f0;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ly/d0;

    invoke-direct {v0, p0}, Ly/d0;-><init>(Ly/f0;)V

    iput-object v0, p0, Ly/f0;->a:Ly/d0;

    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsets;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    new-instance v0, Ly/c0;

    invoke-direct {v0, p0, p1}, Ly/c0;-><init>(Ly/f0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ly/f0;->a:Ly/d0;

    return-void

    :cond_0
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    new-instance v0, Ly/b0;

    invoke-direct {v0, p0, p1}, Ly/b0;-><init>(Ly/f0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ly/f0;->a:Ly/d0;

    return-void

    :cond_1
    const/16 v1, 0x1c

    if-lt v0, v1, :cond_2

    new-instance v0, Ly/a0;

    invoke-direct {v0, p0, p1}, Ly/a0;-><init>(Ly/f0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ly/f0;->a:Ly/d0;

    return-void

    :cond_2
    new-instance v0, Ly/Z;

    invoke-direct {v0, p0, p1}, Ly/Z;-><init>(Ly/f0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Ly/f0;->a:Ly/d0;

    return-void
.end method

.method public static a(Lr/c;IIII)Lr/c;
    .locals 5

    iget v0, p0, Lr/c;->a:I

    sub-int/2addr v0, p1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v2, p0, Lr/c;->b:I

    sub-int/2addr v2, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, p0, Lr/c;->c:I

    sub-int/2addr v3, p3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, p0, Lr/c;->d:I

    sub-int/2addr v4, p4

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-ne v0, p1, :cond_0

    if-ne v2, p2, :cond_0

    if-ne v3, p3, :cond_0

    if-ne v1, p4, :cond_0

    return-object p0

    :cond_0
    invoke-static {v0, v2, v3, v1}, Lr/c;->a(IIII)Lr/c;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/view/WindowInsets;Landroid/view/View;)Ly/f0;
    .locals 2

    new-instance v0, Ly/f0;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p0}, Ly/f0;-><init>(Landroid/view/WindowInsets;)V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {p1}, Ly/B;->a(Landroid/view/View;)Ly/f0;

    move-result-object p0

    iget-object v1, v0, Ly/f0;->a:Ly/d0;

    invoke-virtual {v1, p0}, Ly/d0;->p(Ly/f0;)V

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {v1, p0}, Ly/d0;->d(Landroid/view/View;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public final b()Landroid/view/WindowInsets;
    .locals 2

    iget-object v0, p0, Ly/f0;->a:Ly/d0;

    instance-of v1, v0, Ly/Y;

    if-eqz v1, :cond_0

    check-cast v0, Ly/Y;

    iget-object v0, v0, Ly/Y;->c:Landroid/view/WindowInsets;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    instance-of v0, p1, Ly/f0;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    check-cast p1, Ly/f0;

    iget-object p1, p1, Ly/f0;->a:Ly/d0;

    iget-object v0, p0, Ly/f0;->a:Ly/d0;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Ly/f0;->a:Ly/d0;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Ly/d0;->hashCode()I

    move-result v0

    return v0
.end method
