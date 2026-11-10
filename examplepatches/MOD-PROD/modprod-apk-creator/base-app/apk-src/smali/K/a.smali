.class public final synthetic LK/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:LK/b;

.field public final synthetic b:I

.field public final synthetic c:Ljava/io/Serializable;


# direct methods
.method public synthetic constructor <init>(LK/b;ILjava/io/Serializable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LK/a;->a:LK/b;

    iput p2, p0, LK/a;->b:I

    iput-object p3, p0, LK/a;->c:Ljava/io/Serializable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, LK/a;->a:LK/b;

    iget-object v0, v0, LK/b;->b:LK/f;

    iget v1, p0, LK/a;->b:I

    iget-object v2, p0, LK/a;->c:Ljava/io/Serializable;

    invoke-interface {v0, v1, v2}, LK/f;->l(ILjava/io/Serializable;)V

    return-void
.end method
