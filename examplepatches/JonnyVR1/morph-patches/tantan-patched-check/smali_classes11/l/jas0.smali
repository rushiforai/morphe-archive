.class public final Ll/jas0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ll/jas0;


# instance fields
.field public final a:Ll/egs0;

.field public final b:Ll/fgs0;

.field public final c:Ll/qgs0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jas0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jas0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jas0;->d:Ll/jas0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    new-instance v0, Ll/egs0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/egs0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/fgs0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/fgs0;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/qgs0;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/qgs0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/jas0;->a:Ll/egs0;

    .line 20
    .line 21
    iput-object v1, p0, Ll/jas0;->b:Ll/fgs0;

    .line 22
    .line 23
    iput-object v2, p0, Ll/jas0;->c:Ll/qgs0;

    .line 24
    .line 25
    return-void
.end method

.method public static a()Ll/egs0;
    .locals 1

    .line 1
    sget-object v0, Ll/jas0;->d:Ll/jas0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jas0;->a:Ll/egs0;

    .line 4
    .line 5
    return-object v0
.end method

.method public static b()Ll/fgs0;
    .locals 1

    .line 1
    sget-object v0, Ll/jas0;->d:Ll/jas0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jas0;->b:Ll/fgs0;

    .line 4
    .line 5
    return-object v0
.end method

.method public static c()Ll/qgs0;
    .locals 1

    .line 1
    sget-object v0, Ll/jas0;->d:Ll/jas0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jas0;->c:Ll/qgs0;

    .line 4
    .line 5
    return-object v0
.end method
