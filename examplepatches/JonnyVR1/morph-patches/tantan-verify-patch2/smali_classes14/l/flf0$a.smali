.class public final Ll/flf0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/slf0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/flf0;->s(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001d\u0010\u0006\u001a\u00020\u00052\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0016\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "l/flf0$a",
        "Ll/slf0$a;",
        "",
        "",
        "selectedList",
        "",
        "a",
        "(Ljava/util/List;)V",
        "b_account_intlGmsRelease"
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
.field public final synthetic a:Ll/flf0;

.field public final synthetic b:Z


# direct methods
.method public constructor <init>(Ll/flf0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/flf0$a;->a:Ll/flf0;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/flf0$a;->b:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/flf0$a;->a:Ll/flf0;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/flf0$a;->b:Z

    .line 7
    .line 8
    invoke-static {v0, p1, p0}, Ll/flf0;->d(Ll/flf0;Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
