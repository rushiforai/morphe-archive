.class public final Ll/ndw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ndw0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ndw0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Ll/jdw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jdw0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ndw0;->b:Ll/kqx0;

    .line 7
    .line 8
    check-cast p0, Ll/idw0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/idw0;->a()Ll/hdw0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v1, Ll/mdw0;

    .line 15
    .line 16
    invoke-direct {v1, v0, p0}, Ll/mdw0;-><init>(Ll/jdw0;Ll/hdw0;)V

    .line 17
    .line 18
    .line 19
    return-object v1
.end method
