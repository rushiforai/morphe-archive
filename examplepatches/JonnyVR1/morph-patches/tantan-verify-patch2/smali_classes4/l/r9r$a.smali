.class public Ll/r9r$a;
.super Ll/r9r;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r9r;->c(Ll/pcj;)Ll/r9r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r9r<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final synthetic c:Ll/pcj;


# direct methods
.method public constructor <init>(Ll/pcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r9r$a;->c:Ll/pcj;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Ll/r9r;-><init>(Ll/r9r$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/r9r$a;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
