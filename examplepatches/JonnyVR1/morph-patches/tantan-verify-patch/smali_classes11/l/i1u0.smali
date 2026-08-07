.class public final Ll/i1u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i1u0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/i1u0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/i1u0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i1u0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/gms/common/util/Clock;

    .line 8
    .line 9
    iget-object v1, p0, Ll/i1u0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/fmt0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/fmt0;->a()Ll/ibt0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Ll/i1u0;->c:Ll/kqx0;

    .line 18
    .line 19
    check-cast p0, Ll/z5u0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/z5u0;->a()Ll/o7w0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Ll/o7w0;->f:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v0, p0}, Ll/ibt0;->c(Lcom/google/android/gms/common/util/Clock;Ljava/lang/String;)Ll/xat0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
