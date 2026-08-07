.class public Ll/ayw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ayw;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/vg60<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/ayw;


# direct methods
.method public constructor <init>(Ll/ayw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ayw$a;->a:Ll/ayw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ayw$a;->a:Ll/ayw;

    .line 4
    .line 5
    invoke-static {p0}, Ll/ayw;->f0(Ll/ayw;)Ll/iam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/byw;

    .line 10
    .line 11
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/byw;->e(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vg60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ayw$a;->a(Ll/vg60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
