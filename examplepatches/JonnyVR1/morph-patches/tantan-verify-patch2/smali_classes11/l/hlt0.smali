.class public final Ll/hlt0;
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
    iput-object p1, p0, Ll/hlt0;->a:Ll/glt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hlt0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/grw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hlt0;->b:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ebt0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ebt0;->i()Ll/grw0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hlt0;->a()Ll/grw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
