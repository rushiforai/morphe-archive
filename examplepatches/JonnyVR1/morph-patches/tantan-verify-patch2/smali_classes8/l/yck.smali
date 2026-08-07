.class public Ll/yck;
.super Ll/ldk;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ll/tul;",
        ">",
        "Ll/ldk;"
    }
.end annotation


# instance fields
.field public b:Ll/tul;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/c;Ll/tul;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/greet/c;",
            "TC;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ldk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/c;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/yck;->b:Ll/tul;

    .line 5
    .line 6
    return-void
.end method
