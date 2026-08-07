.class public final Ll/ocw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ocw0;->a:Ll/kqx0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Ll/kcw0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ocw0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast p0, Ll/iqx0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/iqx0;->b()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/kcw0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/kcw0;-><init>(Ljava/util/Set;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ocw0;->a()Ll/kcw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
