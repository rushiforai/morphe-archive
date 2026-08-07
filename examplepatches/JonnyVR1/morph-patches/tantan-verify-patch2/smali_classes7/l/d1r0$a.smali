.class Ll/d1r0$a;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d1r0;->Z()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/d1r0;


# direct methods
.method public constructor <init>(Ll/d1r0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d1r0$a;->a:Ll/d1r0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/d1r0$a;->a:Ll/d1r0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/d1r0;->V(Ll/d1r0;)Ll/y0r0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/y0r0;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception v0

    .line 12
    iget-object p0, p0, Ll/d1r0$a;->a:Ll/d1r0;

    .line 13
    .line 14
    const/16 v1, 0x9

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Ll/b2r0;->Q(ILjava/lang/Exception;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
