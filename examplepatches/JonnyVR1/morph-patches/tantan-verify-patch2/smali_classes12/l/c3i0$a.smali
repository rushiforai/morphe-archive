.class Ll/c3i0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/c3i0;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/Exception;

.field final synthetic c:Ll/c3i0;


# direct methods
.method public constructor <init>(Ll/c3i0;ILjava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c3i0$a;->c:Ll/c3i0;

    .line 2
    .line 3
    iput p2, p0, Ll/c3i0$a;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/c3i0$a;->b:Ljava/lang/Exception;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c3i0$a;->c:Ll/c3i0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/c3i0;->i:Ll/qpw;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v1, p0, Ll/c3i0$a;->a:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/c3i0$a;->b:Ljava/lang/Exception;

    .line 10
    .line 11
    invoke-interface {v0, v1, p0}, Ll/qpw;->a(ILjava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
