.class public Ll/g360$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g360$a;->onError(Ljava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/Throwable;

.field public final synthetic b:Ll/g360$a;


# direct methods
.method public constructor <init>(Ll/g360$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g360$a$b;->b:Ll/g360$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g360$a$b;->a:Ljava/lang/Throwable;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g360$a$b;->b:Ll/g360$a;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/g360$a;->e:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, v0, Ll/g360$a;->e:Z

    .line 9
    .line 10
    iget-object v0, v0, Ll/g360$a;->g:Ll/gcg0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/g360$a$b;->a:Ljava/lang/Throwable;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/g360$a$b;->b:Ll/g360$a;

    .line 18
    .line 19
    iget-object p0, p0, Ll/g360$a;->f:Ll/f2e0$a;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
