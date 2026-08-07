.class public final synthetic Ll/fhy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ze00;

.field public final synthetic b:Ll/gg4;

.field public final synthetic c:Ll/ig4;

.field public final synthetic d:Ljava/util/concurrent/Callable;

.field public final synthetic e:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Ll/ze00;Ll/gg4;Ll/ig4;Ljava/util/concurrent/Callable;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fhy0;->a:Ll/ze00;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fhy0;->b:Ll/gg4;

    .line 7
    .line 8
    iput-object p3, p0, Ll/fhy0;->c:Ll/ig4;

    .line 9
    .line 10
    iput-object p4, p0, Ll/fhy0;->d:Ljava/util/concurrent/Callable;

    .line 11
    .line 12
    iput-object p5, p0, Ll/fhy0;->e:Ll/sni0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fhy0;->a:Ll/ze00;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fhy0;->b:Ll/gg4;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fhy0;->c:Ll/ig4;

    .line 6
    .line 7
    iget-object v3, p0, Ll/fhy0;->d:Ljava/util/concurrent/Callable;

    .line 8
    .line 9
    iget-object p0, p0, Ll/fhy0;->e:Ll/sni0;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/ze00;->h(Ll/gg4;Ll/ig4;Ljava/util/concurrent/Callable;Ll/sni0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
