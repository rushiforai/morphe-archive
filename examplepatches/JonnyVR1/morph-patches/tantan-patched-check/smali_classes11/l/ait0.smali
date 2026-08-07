.class public final synthetic Ll/ait0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kdx0;


# instance fields
.field public final synthetic a:Ll/kdx0;

.field public final synthetic b:[B


# direct methods
.method public synthetic constructor <init>(Ll/kdx0;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ait0;->a:Ll/kdx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ait0;->b:[B

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()Ll/fex0;
    .locals 3

    .line 1
    sget v0, Ll/fit0;->w:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/ait0;->a:Ll/kdx0;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kdx0;->zza()Ll/fex0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/q9x0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ait0;->b:[B

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/q9x0;-><init>([B)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/tht0;

    .line 17
    .line 18
    array-length p0, p0

    .line 19
    invoke-direct {v2, v1, p0, v0}, Ll/tht0;-><init>(Ll/fex0;ILl/fex0;)V

    .line 20
    .line 21
    .line 22
    return-object v2
.end method
