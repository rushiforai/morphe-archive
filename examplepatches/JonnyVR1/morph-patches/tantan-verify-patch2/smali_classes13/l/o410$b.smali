.class Ll/o410$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o410;->h(Ll/g510;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/g510;

.field final synthetic b:Ll/o410;


# direct methods
.method public constructor <init>(Ll/o410;Ll/g510;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/o410$b;->b:Ll/o410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o410$b;->a:Ll/g510;

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

    .line 1
    iget-object v0, p0, Ll/o410$b;->b:Ll/o410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/o410;->y(Ll/o410;)Ll/o410$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/o410$b;->a:Ll/g510;

    .line 10
    .line 11
    iget-object p0, p0, Ll/o410$b;->b:Ll/o410;

    .line 12
    .line 13
    iget-object v1, p0, Ll/o410;->k:Ll/g510;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ll/o410;->y(Ll/o410;)Ll/o410$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ll/o410$d;->a()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
