.class public final synthetic Ll/nxb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;


# instance fields
.field public final synthetic a:Ll/pxb;


# direct methods
.method public synthetic constructor <init>(Ll/pxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nxb;->a:Ll/pxb;

    return-void
.end method


# virtual methods
.method public final onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxb;->a:Ll/pxb;

    invoke-static {p0, p1}, Ll/pxb;->a(Ll/pxb;Ljava/lang/Throwable;)V

    return-void
.end method
