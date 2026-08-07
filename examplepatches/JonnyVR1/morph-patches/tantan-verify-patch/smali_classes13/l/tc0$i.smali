.class Ll/tc0$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->O6(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tc0$i;->b:Ll/tc0;

    .line 2
    .line 3
    iput p2, p0, Ll/tc0$i;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tc0$i;->b:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->y3(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "old handleVideoRenderStart"

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tc0$i;->b:Ll/tc0;

    .line 17
    .line 18
    iget p0, p0, Ll/tc0$i;->a:I

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/tc0;->z3(Ll/tc0;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
