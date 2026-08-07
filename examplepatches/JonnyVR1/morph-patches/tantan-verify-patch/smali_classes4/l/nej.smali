.class public final synthetic Ll/nej;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/utils/GLHepler;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/utils/GLHepler;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nej;->a:Lcom/ss/bytertc/engine/utils/GLHepler;

    iput p2, p0, Ll/nej;->b:I

    iput p3, p0, Ll/nej;->c:I

    iput p4, p0, Ll/nej;->d:I

    iput p5, p0, Ll/nej;->e:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nej;->a:Lcom/ss/bytertc/engine/utils/GLHepler;

    iget v1, p0, Ll/nej;->b:I

    iget v2, p0, Ll/nej;->c:I

    iget v3, p0, Ll/nej;->d:I

    iget p0, p0, Ll/nej;->e:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/ss/bytertc/engine/utils/GLHepler;->a(Lcom/ss/bytertc/engine/utils/GLHepler;IIII)V

    return-void
.end method
