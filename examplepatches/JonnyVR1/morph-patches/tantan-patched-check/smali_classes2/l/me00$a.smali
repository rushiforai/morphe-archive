.class Ll/me00$a;
.super Ll/wgw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/me00;-><init>(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wgw<",
        "Ll/me00$b<",
        "TA;>;TB;>;"
    }
.end annotation


# instance fields
.field final synthetic e:Ll/me00;


# direct methods
.method public constructor <init>(Ll/me00;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/me00$a;->e:Ll/me00;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/wgw;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/me00$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/me00$a;->n(Ll/me00$b;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Ll/me00$b;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ll/me00$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/me00$b<",
            "TA;>;TB;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/me00$b;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
