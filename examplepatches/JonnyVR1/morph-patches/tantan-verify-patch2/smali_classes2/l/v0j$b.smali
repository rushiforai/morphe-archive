.class public Ll/v0j$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b16;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v0j;->d(Landroid/content/Context;Ll/t0j;ILjava/util/concurrent/Executor;Ll/c94;)Landroid/graphics/Typeface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/b16<",
        "Ll/v0j$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/c94;


# direct methods
.method public constructor <init>(Ll/c94;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v0j$b;->a:Ll/c94;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/v0j$e;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/v0j$e;

    .line 4
    .line 5
    const/4 v0, -0x3

    .line 6
    invoke-direct {p1, v0}, Ll/v0j$e;-><init>(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Ll/v0j$b;->a:Ll/c94;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/c94;->b(Ll/v0j$e;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v0j$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v0j$b;->a(Ll/v0j$e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
