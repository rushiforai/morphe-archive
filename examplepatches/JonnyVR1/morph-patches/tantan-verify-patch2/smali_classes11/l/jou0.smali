.class public final Ll/jou0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/rxs0;

.field public final b:Ll/oxs0;

.field public final c:Ll/nxs0;


# direct methods
.method public constructor <init>(Ll/oxs0;Ll/nxs0;Ll/rxs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jou0;->b:Ll/oxs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jou0;->c:Ll/nxs0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jou0;->a:Ll/rxs0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ll/rxs0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jou0;->a:Ll/rxs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/nxs0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jou0;->c:Ll/nxs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/oxs0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jou0;->b:Ll/oxs0;

    .line 2
    .line 3
    return-object p0
.end method
