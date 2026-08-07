.class public Ll/u0j;
.super Ll/iye$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u0j$a;,
        Ll/u0j$b;,
        Ll/u0j$c;
    }
.end annotation


# static fields
.field public static final i:Ll/u0j$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/u0j$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u0j$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/u0j;->i:Ll/u0j$a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/t0j;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/t0j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/u0j$b;

    .line 2
    .line 3
    sget-object v1, Ll/u0j;->i:Ll/u0j$a;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, v1}, Ll/u0j$b;-><init>(Landroid/content/Context;Ll/t0j;Ll/u0j$a;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Ll/iye$c;-><init>(Ll/iye$f;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
