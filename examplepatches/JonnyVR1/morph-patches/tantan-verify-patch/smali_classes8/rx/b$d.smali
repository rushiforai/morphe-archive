.class public Lrx/b$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/b;->m(Ll/gcg0;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Lrx/b;


# direct methods
.method public constructor <init>(Lrx/b;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/b$d;->b:Lrx/b;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/b$d;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/b$d;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/b$d;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSubscribe(Ll/kcg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/b$d;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
