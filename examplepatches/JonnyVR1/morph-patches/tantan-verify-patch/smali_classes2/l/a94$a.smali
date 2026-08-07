.class Ll/a94$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/a94;->t(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/ArrayList;

.field final synthetic b:Ll/a94;


# direct methods
.method public constructor <init>(Ll/a94;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/a94$a;->b:Ll/a94;

    .line 2
    .line 3
    iput-object p2, p0, Ll/a94$a;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a94$a;->b:Ll/a94;

    .line 2
    .line 3
    invoke-static {v0}, Ll/a94;->A(Ll/a94;)Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/a94$a;->b:Ll/a94;

    .line 10
    .line 11
    invoke-static {v0}, Ll/a94;->A(Ll/a94;)Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/a94$a;->b:Ll/a94;

    .line 22
    .line 23
    invoke-static {v0}, Ll/a94;->A(Ll/a94;)Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/u5e;

    .line 32
    .line 33
    iget-object p0, p0, Ll/a94$a;->a:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-interface {v0, p0}, Ll/u5e;->a(Ljava/util/ArrayList;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
