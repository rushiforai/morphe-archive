.class public final synthetic Ll/bh3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/b;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/b;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bh3;->a:Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/b;

    iput p2, p0, Ll/bh3;->b:I

    iput p3, p0, Ll/bh3;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bh3;->a:Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/b;

    iget v1, p0, Ll/bh3;->b:I

    iget p0, p0, Ll/bh3;->c:I

    invoke-static {v0, v1, p0}, Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/b;->a(Lcom/facebook/fresco/animation/bitmap/preparation/ondemandanimation/b;II)V

    return-void
.end method
