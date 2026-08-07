.class public final synthetic Ll/fgg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hgg;

.field public final synthetic b:Z

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/hgg;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fgg;->a:Ll/hgg;

    iput-boolean p2, p0, Ll/fgg;->b:Z

    iput p3, p0, Ll/fgg;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fgg;->a:Ll/hgg;

    iget-boolean v1, p0, Ll/fgg;->b:Z

    iget p0, p0, Ll/fgg;->c:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    invoke-static {v0, v1, p0, p1}, Ll/hgg;->e0(Ll/hgg;ZILcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method
