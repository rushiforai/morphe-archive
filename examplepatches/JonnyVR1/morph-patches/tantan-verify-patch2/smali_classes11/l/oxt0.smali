.class public final Ll/oxt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/bxt0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/bxt0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oxt0;->a:Ll/bxt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oxt0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/oxt0;->b:Ll/kqx0;

    .line 2
    .line 3
    check-cast p0, Ll/fzt0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fzt0;->a()Ll/r9u0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/yfu0;

    .line 10
    .line 11
    new-instance v1, Ll/axt0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/axt0;-><init>(Ll/r9u0;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 17
    .line 18
    invoke-direct {v0, v1, p0}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method
