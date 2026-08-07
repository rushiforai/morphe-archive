.class public final synthetic Ll/rjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/rjc0;->a:I

    iput p2, p0, Ll/rjc0;->b:I

    iput p3, p0, Ll/rjc0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Ll/rjc0;->a:I

    iget v1, p0, Ll/rjc0;->b:I

    iget p0, p0, Ll/rjc0;->c:I

    invoke-static {v0, v1, p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->c(III)V

    return-void
.end method
