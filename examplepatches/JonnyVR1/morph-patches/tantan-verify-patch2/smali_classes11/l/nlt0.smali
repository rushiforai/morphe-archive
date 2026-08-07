.class public final Ll/nlt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/glt0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/glt0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nlt0;->a:Ll/glt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nlt0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nlt0;->b:Ll/kqx0;

    .line 2
    .line 3
    check-cast p0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/p8w0;->d(Landroid/content/Context;)Ll/p8w0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/p8w0;->e()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/nlt0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
