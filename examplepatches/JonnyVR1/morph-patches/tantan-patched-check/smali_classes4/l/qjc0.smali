.class public final synthetic Ll/qjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qjc0;->a:Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;

    iput p2, p0, Ll/qjc0;->b:I

    iput p3, p0, Ll/qjc0;->c:I

    iput p4, p0, Ll/qjc0;->d:I

    iput p5, p0, Ll/qjc0;->e:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qjc0;->a:Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;

    iget v1, p0, Ll/qjc0;->b:I

    iget v2, p0, Ll/qjc0;->c:I

    iget v3, p0, Ll/qjc0;->d:I

    iget p0, p0, Ll/qjc0;->e:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->f(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;IIII)V

    return-void
.end method
