.class public final synthetic Ll/lh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/lh7;->b:Ljava/lang/String;

    iput p3, p0, Ll/lh7;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/lh7;->b:Ljava/lang/String;

    iget p0, p0, Ll/lh7;->c:I

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->X3(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;ILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
