.class public Ll/n5j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n5j$c;,
        Ll/n5j$b;,
        Ll/n5j$a;,
        Ll/n5j$d;,
        Ll/n5j$e;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:Ll/n5j$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/n5j$c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/n5j$c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/n5j;->a:Ll/n5j$e;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/app/Fragment;[Ljava/lang/String;I)V
    .locals 1
    .param p0    # Landroid/app/Fragment;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v0, Ll/n5j;->a:Ll/n5j$e;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1, p2}, Ll/n5j$e;->a(Landroid/app/Fragment;[Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
