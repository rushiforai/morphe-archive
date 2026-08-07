.class final Ll/mwd0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mxf$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mwd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field final a:Ljava/security/MessageDigest;

.field private final b:Ll/x3g0;


# direct methods
.method public constructor <init>(Ljava/security/MessageDigest;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/x3g0;->a()Ll/x3g0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/mwd0$b;->b:Ll/x3g0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/mwd0$b;->a:Ljava/security/MessageDigest;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public b()Ll/x3g0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mwd0$b;->b:Ll/x3g0;

    .line 2
    .line 3
    return-object p0
.end method
