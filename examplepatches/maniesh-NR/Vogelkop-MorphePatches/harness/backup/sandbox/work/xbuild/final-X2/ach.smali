.class public final Lach;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final a:Lstm;

.field public b:Lqtm;

.field public c:I


# direct methods
.method public constructor <init>(Lstm;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lach;->a:Lstm;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lach;->a:Lstm;

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lqtm;

    iget v0, p0, Lach;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lach;->c:I

    iput-object p1, p0, Lach;->b:Lqtm;

    return-void
.end method
