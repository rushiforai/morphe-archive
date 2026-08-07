.class public final Lrx/b$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lrx/b$j;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Lrx/b$j;->onSubscribe(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/b$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/b$e;->a(Lrx/b$j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
