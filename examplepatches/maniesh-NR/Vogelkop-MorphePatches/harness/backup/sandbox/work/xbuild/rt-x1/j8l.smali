.class public final Lj8l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lc8l;

.field public final b:Lk6l;

.field public final c:Ljava/util/LinkedHashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Likc;

    sget-object v1, Lg8l;->c:Lg8l;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Ltcc;Lc8l;Lk6l;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lj8l;->a:Lc8l;

    iput-object p3, p0, Lj8l;->b:Lk6l;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Lj8l;->c:Ljava/util/LinkedHashMap;

    new-instance p2, Lq6l;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lq6l;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Li8l;

    invoke-direct {v0, p0}, Li8l;-><init>(Lj8l;)V

    iget-object v1, p3, Lk6l;->w:Lxg;

    invoke-static {v1, p1, p2}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    invoke-static {p3, p1, v0}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    new-instance p1, Ld8l;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ld8l;-><init>(Lj8l;B)V

    const-wide/16 p2, 0x3e8

    invoke-static {p1, p2, p3}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method


# virtual methods
.method public final a(II)V
    .registers 4

    iget-object v0, p0, Lj8l;->b:Lk6l;

    invoke-virtual {v0, p1}, Lk6l;->r(I)Lb2l;

    move-result-object p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Lj8l;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le8l;

    if-eqz v0, :cond_14

    return-void

    :cond_14
    new-instance v0, Le8l;

    invoke-direct {v0, p0, p1, p2}, Le8l;-><init>(Lj8l;Lb2l;I)V

    return-void
.end method
