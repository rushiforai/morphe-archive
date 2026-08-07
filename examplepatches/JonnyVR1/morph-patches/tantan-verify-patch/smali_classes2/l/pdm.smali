.class public final synthetic Ll/pdm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/qdm;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/qdm;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pdm;->a:Ll/qdm;

    iput p2, p0, Ll/pdm;->b:I

    iput p3, p0, Ll/pdm;->c:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pdm;->a:Ll/qdm;

    iget v1, p0, Ll/pdm;->b:I

    iget p0, p0, Ll/pdm;->c:I

    invoke-static {v0, v1, p0}, Ll/qdm;->a(Ll/qdm;II)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
