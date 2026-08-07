.class Ll/q7k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v7k;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q7k;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/q7k;


# direct methods
.method public constructor <init>(Ll/q7k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q7k$a;->a:Ll/q7k;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getRenderTime(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7k$a;->a:Ll/q7k;

    .line 2
    .line 3
    invoke-static {p0}, Ll/q7k;->a(Ll/q7k;)Ll/s7k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2}, Ll/s7k;->getGpuBenmark(D)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
