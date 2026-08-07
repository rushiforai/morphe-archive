.class public Ll/snl$b;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/snl;->i(Ll/snl$c;Ll/vj20$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/Future;

.field public final synthetic b:Ll/vj20$a;

.field public final synthetic c:Ll/snl;


# direct methods
.method public constructor <init>(Ll/snl;Ljava/util/concurrent/Future;Ll/vj20$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snl$b;->c:Ll/snl;

    .line 2
    .line 3
    iput-object p2, p0, Ll/snl$b;->a:Ljava/util/concurrent/Future;

    .line 4
    .line 5
    iput-object p3, p0, Ll/snl$b;->b:Ll/vj20$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/snl$b;->a:Ljava/util/concurrent/Future;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/snl$b;->b:Ll/vj20$a;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/vj20$a;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
