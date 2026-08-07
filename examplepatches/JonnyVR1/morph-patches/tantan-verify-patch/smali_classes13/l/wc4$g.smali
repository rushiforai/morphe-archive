.class Ll/wc4$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wc4;->E1(ILl/row;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/wc4;


# direct methods
.method public constructor <init>(Ll/wc4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4$g;->a:Ll/wc4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/wc4$g;->a:Ll/wc4;

    .line 2
    .line 3
    iget-object p2, p2, Ll/wc4;->m:Ll/q210$a;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x4100

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p2, v0, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
