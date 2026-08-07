.class Ll/ib4$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ib4;->onData([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:Ll/ib4;


# direct methods
.method public constructor <init>(Ll/ib4;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ib4$f;->b:Ll/ib4;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ib4$f;->a:[B

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4$f;->b:Ll/ib4;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ib4$f;->a:[B

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/ib4;->V1(Ll/ib4;[B)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
