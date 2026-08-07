.class public final Ll/byt0;
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
    iput-object p1, p0, Ll/byt0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/byt0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/byt0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/byt0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/hyt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hyt0;->a()Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/byt0;->b:Ll/kqx0;

    .line 14
    .line 15
    check-cast v1, Ll/xgv0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/xgv0;->a()Ll/qgv0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Ll/byt0;->c:Ll/kqx0;

    .line 22
    .line 23
    check-cast p0, Ll/hjv0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/hjv0;->a()Ll/ajv0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_0
    return-object p0
.end method
