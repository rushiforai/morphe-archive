.class public final Lamg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldmg;


# static fields
.field public static final d:Landroid/graphics/Rect;


# instance fields
.field public final a:Lx5f;

.field public final b:Luqe;

.field public final c:Ljava/util/LinkedHashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lamg;->d:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Lx5f;Luqe;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lamg;->a:Lx5f;

    iput-object p2, p0, Lamg;->b:Luqe;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lamg;->c:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final c(Lj82;Lov0;Lcmg;II)V
    .registers 8

    const/16 p5, 0x64

    const/4 v0, 0x0

    if-eqz p4, :cond_1c

    iget-object p2, p2, Lov0;->b:Landroid/view/View;

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p4

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v1

    mul-int/2addr v1, p4

    if-eqz v1, :cond_1c

    sget-object p4, Lamg;->d:Landroid/graphics/Rect;

    invoke-virtual {p2, p4}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p2

    if-nez p2, :cond_1e

    :cond_1c
    move p4, v0

    goto :goto_29

    :cond_1e
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    move-result p2

    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    move-result p4

    mul-int/2addr p4, p2

    mul-int/2addr p4, p5

    div-int/2addr p4, v1

    :goto_29
    iget-object p2, p0, Lamg;->c:Ljava/util/LinkedHashSet;

    if-lt p4, p5, :cond_9a

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_99

    iget-object p2, p3, Lcmg;->a:Lf90;

    iget-object p4, p0, Lamg;->a:Lx5f;

    iget-boolean p5, p4, Lx5f;->h:Z

    if-eqz p5, :cond_3e

    invoke-virtual {p4, p2, v0}, Lx5f;->w(Lf90;I)V

    :cond_3e
    instance-of p2, p1, Lpue;

    if-eqz p2, :cond_4f

    check-cast p1, Lpue;

    iget-object p1, p1, Lj82;->c:Loqe;

    instance-of p2, p1, Lmsh;

    if-eqz p2, :cond_4f

    check-cast p1, Lmsh;

    iget-object p1, p1, Lmsh;->v:Lp12;

    goto :goto_50

    :cond_4f
    const/4 p1, 0x0

    :goto_50
    if-eqz p1, :cond_99

    iget-object p1, p1, Lp12;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object p2, p3, Lcmg;->a:Lf90;

    iget-object p0, p0, Lamg;->b:Luqe;

    iget-object p0, p0, Luqe;->h:Luy8;

    sget-object p3, Lf90;->e:Lf90;

    const/4 p4, 0x1

    if-ne p2, p3, :cond_6f

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lsy8;

    const-string p3, "podcast_in_article_card"

    invoke-direct {p2, p3, p1, p4}, Lsy8;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p0, p2}, Luy8;->c(Ldy8;)V

    return-void

    :cond_6f
    sget-object p3, Lf90;->f:Lf90;

    if-ne p2, p3, :cond_81

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lsy8;

    const-string p3, "podcast_in_article_detail"

    invoke-direct {p2, p3, p1, p4}, Lsy8;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p0, p2}, Luy8;->c(Ldy8;)V

    return-void

    :cond_81
    sget-object p3, Lf90;->b:Lf90;

    if-ne p2, p3, :cond_89

    invoke-virtual {p0, v0, p1}, Luy8;->m(ILjava/lang/String;)V

    return-void

    :cond_89
    sget-object p3, Lf90;->c:Lf90;

    if-ne p2, p3, :cond_91

    invoke-virtual {p0, p4, p1}, Luy8;->m(ILjava/lang/String;)V

    return-void

    :cond_91
    sget-object p3, Lf90;->d:Lf90;

    if-ne p2, p3, :cond_99

    const/4 p2, 0x2

    invoke-virtual {p0, p2, p1}, Luy8;->m(ILjava/lang/String;)V

    :cond_99
    return-void

    :cond_9a
    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
