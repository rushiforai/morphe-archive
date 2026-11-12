.class public final Lg8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldth;


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Ldfe;


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg8g;->a:Ljava/util/Set;

    new-instance p1, Ldfe;

    const/16 v0, 0x10

    new-array v0, v0, [Lzt9;

    invoke-direct {p1, v0}, Ldfe;-><init>([Ljava/lang/Object;)V

    iput-object p1, p0, Lg8g;->b:Ldfe;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lg8g;->b:Ldfe;

    iget-object v1, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v0, v0, Ldfe;->c:I

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_1a

    aget-object v3, v1, v2

    check-cast v3, Lzt9;

    iget-object v3, v3, Lzt9;->a:Ldth;

    iget-object v4, p0, Lg8g;->a:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {v3}, Ldth;->a()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_1a
    return-void
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method
