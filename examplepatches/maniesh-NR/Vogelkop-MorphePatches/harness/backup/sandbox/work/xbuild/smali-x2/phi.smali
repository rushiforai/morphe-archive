.class public Lphi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;
.implements Lhh4;


# static fields
.field public static final c:Ljava/util/HashSet;


# instance fields
.field public final a:Lcom/opera/api/Callback;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lphi;->c:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Lcom/opera/api/Callback;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lphi;->a:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-boolean p1, p0, Lphi;->b:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    sget-object p1, Lphi;->c:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lphi;->a:Lcom/opera/api/Callback;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    sget-object p1, Lphi;->c:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 3

    iget-boolean p2, p0, Lphi;->b:Z

    if-eqz p2, :cond_5

    return-void

    :cond_5
    sget-object p2, Lphi;->c:Ljava/util/HashSet;

    invoke-virtual {p2, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lphi;->a:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final cancel()V
    .registers 2

    iget-boolean v0, p0, Lphi;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lphi;->b:Z

    sget-object v0, Lphi;->c:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method
