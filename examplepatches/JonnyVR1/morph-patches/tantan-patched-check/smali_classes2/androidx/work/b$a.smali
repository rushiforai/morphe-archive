.class public abstract Landroidx/work/b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/b$a$c;,
        Landroidx/work/b$a$b;,
        Landroidx/work/b$a$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Landroidx/work/b$a;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroidx/work/b$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/work/b$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b()Landroidx/work/b$a;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroidx/work/b$a$b;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/work/b$a$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c()Landroidx/work/b$a;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroidx/work/b$a$c;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/work/b$a$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static d(Landroidx/work/Data;)Landroidx/work/b$a;
    .locals 1
    .param p0    # Landroidx/work/Data;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroidx/work/b$a$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroidx/work/b$a$c;-><init>(Landroidx/work/Data;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
