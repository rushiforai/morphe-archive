.class public final synthetic Ll/nti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/utils/TextureHelper;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/utils/TextureHelper;III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nti0;->a:Lcom/ss/bytertc/engine/utils/TextureHelper;

    iput p2, p0, Ll/nti0;->b:I

    iput p3, p0, Ll/nti0;->c:I

    iput p4, p0, Ll/nti0;->d:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nti0;->a:Lcom/ss/bytertc/engine/utils/TextureHelper;

    iget v1, p0, Ll/nti0;->b:I

    iget v2, p0, Ll/nti0;->c:I

    iget p0, p0, Ll/nti0;->d:I

    invoke-static {v0, v1, v2, p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->f(Lcom/ss/bytertc/engine/utils/TextureHelper;III)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
