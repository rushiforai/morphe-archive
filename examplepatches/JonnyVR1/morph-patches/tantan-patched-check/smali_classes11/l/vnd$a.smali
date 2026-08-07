.class public final Ll/vnd$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vnd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/g6c$a;

.field public c:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 13
    new-instance v0, Ll/kpd$b;

    invoke-direct {v0}, Ll/kpd$b;-><init>()V

    invoke-direct {p0, p1, v0}, Ll/vnd$a;-><init>(Landroid/content/Context;Ll/g6c$a;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/g6c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/vnd$a;->a:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Ll/vnd$a;->b:Ll/g6c$a;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ll/g6c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vnd$a;->b()Ll/vnd;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ll/vnd;
    .locals 3

    .line 1
    new-instance v0, Ll/vnd;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vnd$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Ll/vnd$a;->b:Ll/g6c$a;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/g6c$a;->a()Ll/g6c;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, v1, v2}, Ll/vnd;-><init>(Landroid/content/Context;Ll/g6c;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/vnd$a;->c:Ll/pgj0;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/vnd;->e(Ll/pgj0;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object v0
.end method
