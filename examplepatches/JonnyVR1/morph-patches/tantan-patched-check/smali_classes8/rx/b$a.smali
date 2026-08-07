.class public final Lrx/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/b;->f(Lrx/c;)Lrx/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/c;


# direct methods
.method public constructor <init>(Lrx/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/b$a;->a:Lrx/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lrx/b$j;)V
    .locals 1

    .line 1
    new-instance v0, Lrx/b$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/b$a$a;-><init>(Lrx/b$a;Lrx/b$j;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Lrx/b$j;->onSubscribe(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lrx/b$a;->a:Lrx/c;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/b$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/b$a;->a(Lrx/b$j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
