.class public final Ll/axv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/axv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/axv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/axv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/axv0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/axv0;->b:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/axv0;->c:Ll/kqx0;

    .line 10
    .line 11
    check-cast p0, Ll/szv0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/szv0;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 18
    .line 19
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/ywv0;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-direct {v2, v3, v0, p0, v1}, Ll/ywv0;-><init>(Ll/r4t0;Landroid/content/Context;Ljava/lang/String;Ll/xvw0;)V

    .line 26
    .line 27
    .line 28
    return-object v2
.end method
