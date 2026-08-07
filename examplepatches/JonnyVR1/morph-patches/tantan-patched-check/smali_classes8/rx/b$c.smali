.class public Lrx/b$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/b;->i()Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mu10;

.field public final synthetic b:Lrx/b;


# direct methods
.method public constructor <init>(Lrx/b;Ll/mu10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/b$c;->b:Lrx/b;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/b$c;->a:Ll/mu10;

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
    iget-object p0, p0, Lrx/b$c;->a:Ll/mu10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mu10;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lrx/b$c;->a:Ll/mu10;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/mu10;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lrx/b;->a(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onSubscribe(Ll/kcg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/b$c;->a:Ll/mu10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mu10;->a(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
