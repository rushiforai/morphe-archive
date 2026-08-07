.class public final synthetic Ll/p0s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/p0s;->a:Z

    iput-object p2, p0, Ll/p0s;->b:Ljava/lang/String;

    iput p3, p0, Ll/p0s;->c:I

    iput p4, p0, Ll/p0s;->d:I

    iput p5, p0, Ll/p0s;->e:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/p0s;->a:Z

    iget-object v1, p0, Ll/p0s;->b:Ljava/lang/String;

    iget v2, p0, Ll/p0s;->c:I

    iget v3, p0, Ll/p0s;->d:I

    iget p0, p0, Ll/p0s;->e:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->f(ZLjava/lang/String;III)V

    return-void
.end method
