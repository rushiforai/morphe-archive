.class public final Ll/qsu0;
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
    iput-object p1, p0, Ll/qsu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qsu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qsu0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qsu0;->c:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/z5u0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/o7w0;->o:Ll/x6w0;

    .line 10
    .line 11
    iget v0, v0, Ll/x6w0;->a:I

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/qsu0;->b:Ll/kqx0;

    .line 20
    .line 21
    check-cast p0, Ll/hjv0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hjv0;->a()Ll/ajv0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    iget-object p0, p0, Ll/qsu0;->a:Ll/kqx0;

    .line 29
    .line 30
    check-cast p0, Ll/hjv0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/hjv0;->a()Ll/ajv0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    throw p0
.end method
