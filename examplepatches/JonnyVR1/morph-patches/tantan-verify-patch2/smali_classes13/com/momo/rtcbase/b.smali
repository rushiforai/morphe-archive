.class public final synthetic Lcom/momo/rtcbase/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/Camera1Session$2;

.field public final synthetic b:[B


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/Camera1Session$2;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/rtcbase/b;->a:Lcom/momo/rtcbase/Camera1Session$2;

    iput-object p2, p0, Lcom/momo/rtcbase/b;->b:[B

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/b;->a:Lcom/momo/rtcbase/Camera1Session$2;

    iget-object p0, p0, Lcom/momo/rtcbase/b;->b:[B

    invoke-static {v0, p0}, Lcom/momo/rtcbase/Camera1Session$2;->b(Lcom/momo/rtcbase/Camera1Session$2;[B)V

    return-void
.end method
