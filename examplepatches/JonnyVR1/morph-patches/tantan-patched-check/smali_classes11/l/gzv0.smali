.class public final Ll/gzv0;
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
    iput-object p1, p0, Ll/gzv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gzv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gzv0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    new-instance v0, Ll/jat0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jat0;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/gzv0;->c:Ll/kqx0;

    .line 12
    .line 13
    check-cast p0, Ll/szv0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/szv0;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v2, Ll/ezv0;

    .line 20
    .line 21
    invoke-direct {v2, v0, v1, p0}, Ll/ezv0;-><init>(Ll/jat0;Ll/xvw0;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v2
.end method
