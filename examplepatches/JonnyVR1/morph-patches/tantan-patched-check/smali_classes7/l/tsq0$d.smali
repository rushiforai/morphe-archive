.class Ll/tsq0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tsq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field a:Ll/tsq0$c;


# direct methods
.method public constructor <init>(Ll/tsq0$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tsq0$d;->a:Ll/tsq0$c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public run()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tsq0$d;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tsq0$d;->a:Ll/tsq0$c;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/tsq0$d;->b()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
