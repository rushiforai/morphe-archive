.class public final Ll/t5u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/s5u0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/s5u0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t5u0;->a:Ll/s5u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/t5u0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t5u0;->b:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/t5u0;->a:Ll/s5u0;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/s5u0;->e(Ljava/lang/String;)Ll/tcv0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
