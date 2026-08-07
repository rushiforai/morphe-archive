.class public final Ll/l8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o7h0$c;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Ll/l8j;",
        "Ll/o7h0$c;",
        "<init>",
        "()V",
        "Ll/o7h0$b;",
        "configuration",
        "Ll/o7h0;",
        "a",
        "(Ll/o7h0$b;)Ll/o7h0;",
        "sqlite-framework_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
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
.method public a(Ll/o7h0$b;)Ll/o7h0;
    .locals 6
    .param p1    # Ll/o7h0$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroidx/sqlite/db/framework/FrameworkSQLiteOpenHelper;

    .line 5
    .line 6
    iget-object v1, p1, Ll/o7h0$b;->a:Landroid/content/Context;

    .line 7
    .line 8
    iget-object v2, p1, Ll/o7h0$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p1, Ll/o7h0$b;->c:Ll/o7h0$a;

    .line 11
    .line 12
    iget-boolean v4, p1, Ll/o7h0$b;->d:Z

    .line 13
    .line 14
    iget-boolean v5, p1, Ll/o7h0$b;->e:Z

    .line 15
    .line 16
    invoke-direct/range {v0 .. v5}, Landroidx/sqlite/db/framework/FrameworkSQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Ll/o7h0$a;ZZ)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method
