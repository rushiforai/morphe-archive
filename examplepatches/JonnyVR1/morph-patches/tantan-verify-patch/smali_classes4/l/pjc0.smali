.class public final synthetic Ll/pjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/pjc0;->a:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget p0, p0, Ll/pjc0;->a:I

    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->g(I)V

    return-void
.end method
