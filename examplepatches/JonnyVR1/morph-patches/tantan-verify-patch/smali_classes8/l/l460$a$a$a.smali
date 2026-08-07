.class public Ll/l460$a$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l460$a$a;->f(Ll/vk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vk90;

.field public final synthetic b:Ll/l460$a$a;


# direct methods
.method public constructor <init>(Ll/l460$a$a;Ll/vk90;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l460$a$a$a;->b:Ll/l460$a$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/l460$a$a$a;->a:Ll/vk90;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l460$a$a$a;->b:Ll/l460$a$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l460$a$a;->e:Ljava/lang/Thread;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/l460$a$a$a;->a:Ll/vk90;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/vk90;->request(J)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Ll/l460$a$a$a;->b:Ll/l460$a$a;

    .line 18
    .line 19
    iget-object v0, v0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 20
    .line 21
    iget-object v0, v0, Ll/l460$a;->b:Ll/f2e0$a;

    .line 22
    .line 23
    new-instance v1, Ll/l460$a$a$a$a;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1, p2}, Ll/l460$a$a$a$a;-><init>(Ll/l460$a$a$a;J)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method
