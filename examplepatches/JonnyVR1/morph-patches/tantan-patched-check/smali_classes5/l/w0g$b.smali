.class public final Ll/w0g$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l0g$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0g;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/w0g$b",
        "Ll/l0g$b;",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "",
        "pos",
        "",
        "a",
        "(Lcom/p1/mobile/putong/data/User;I)V",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/w0g;


# direct methods
.method public constructor <init>(Ll/w0g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0g$b;->a:Ll/w0g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/w0g$b;->a:Ll/w0g;

    .line 5
    .line 6
    invoke-static {p0}, Ll/w0g;->d(Ll/w0g;)Ll/t0g;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t0g;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
