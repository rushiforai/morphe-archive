.class public final Ll/rsu0;
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
    iput-object p1, p0, Ll/rsu0;->a:Ll/kqx0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rsu0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/mfu0;

    .line 8
    .line 9
    new-instance v0, Ll/yfu0;

    .line 10
    .line 11
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
