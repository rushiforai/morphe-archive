.class public final synthetic Ll/xry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/xry;->a:I

    iput-boolean p2, p0, Ll/xry;->b:Z

    iput-boolean p3, p0, Ll/xry;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Ll/xry;->a:I

    iget-boolean v1, p0, Ll/xry;->b:Z

    iget-boolean p0, p0, Ll/xry;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {v0, v1, p0, p1}, Ll/zry$a;->b(IZZLcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
