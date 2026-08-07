.class public final synthetic Ll/j2i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l2i0;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/l2i0;ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j2i0;->a:Ll/l2i0;

    iput p2, p0, Ll/j2i0;->b:I

    iput-object p3, p0, Ll/j2i0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j2i0;->a:Ll/l2i0;

    iget v1, p0, Ll/j2i0;->b:I

    iget-object p0, p0, Ll/j2i0;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0}, Ll/l2i0;->a(Ll/l2i0;ILcom/p1/mobile/putong/data/User;)V

    return-void
.end method
