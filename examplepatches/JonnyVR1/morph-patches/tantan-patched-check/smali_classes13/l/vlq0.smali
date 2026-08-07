.class public final synthetic Ll/vlq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/xnative/XETouchDispatcher;

.field public final synthetic b:I

.field public final synthetic c:[I

.field public final synthetic d:[F

.field public final synthetic e:[F


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vlq0;->a:Lcom/momo/xeengine/xnative/XETouchDispatcher;

    iput p2, p0, Ll/vlq0;->b:I

    iput-object p3, p0, Ll/vlq0;->c:[I

    iput-object p4, p0, Ll/vlq0;->d:[F

    iput-object p5, p0, Ll/vlq0;->e:[F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vlq0;->a:Lcom/momo/xeengine/xnative/XETouchDispatcher;

    iget v1, p0, Ll/vlq0;->b:I

    iget-object v2, p0, Ll/vlq0;->c:[I

    iget-object v3, p0, Ll/vlq0;->d:[F

    iget-object p0, p0, Ll/vlq0;->e:[F

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/xeengine/xnative/XETouchDispatcher;->a(Lcom/momo/xeengine/xnative/XETouchDispatcher;I[I[F[F)V

    return-void
.end method
