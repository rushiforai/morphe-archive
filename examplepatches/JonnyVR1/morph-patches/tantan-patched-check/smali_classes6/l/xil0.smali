.class public final synthetic Ll/xil0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/camera/widget/VideoRecordProgressView$d;


# instance fields
.field public final synthetic a:Ll/yil0;


# direct methods
.method public synthetic constructor <init>(Ll/yil0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xil0;->a:Ll/yil0;

    return-void
.end method


# virtual methods
.method public final onProgress(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xil0;->a:Ll/yil0;

    invoke-static {p0, p1, p2}, Ll/yil0;->H(Ll/yil0;J)V

    return-void
.end method
