.class public final Ll/xzu0;
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
    iput-object p1, p0, Ll/xzu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xzu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xzu0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzu0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/j0v0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/xzu0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/z5u0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/z5u0;->a()Ll/o7w0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Ll/xzu0;->c:Ll/kqx0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/lang/String;

    .line 24
    .line 25
    new-instance v2, Ll/tzu0;

    .line 26
    .line 27
    invoke-direct {v2, v0, v1, p0}, Ll/tzu0;-><init>(Ll/j0v0;Ll/o7w0;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method
