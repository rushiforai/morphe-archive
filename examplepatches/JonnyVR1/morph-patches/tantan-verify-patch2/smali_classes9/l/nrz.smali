.class public final synthetic Ll/nrz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/nrz;->a:I

    iput-boolean p2, p0, Ll/nrz;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/nrz;->a:I

    iget-boolean p0, p0, Ll/nrz;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Ll/tvz;->J7(IZLcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
