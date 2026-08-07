.class public final Ll/diu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/lhu0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/lhu0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/diu0;->a:Ll/lhu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/diu0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/diu0;->b:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/u3u0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/diu0;->a:Ll/lhu0;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/lhu0;->f(Ll/u3u0;)Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-object p0
.end method
