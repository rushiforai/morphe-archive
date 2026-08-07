.class Ll/ob4$s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4;->z1(ILl/qow;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$s;->a:Ll/ob4;

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
    .locals 1

    .line 1
    iget-object p2, p0, Ll/ob4$s;->a:Ll/ob4;

    .line 2
    .line 3
    const/16 v0, -0x12f

    .line 4
    .line 5
    invoke-static {p2, v0, p1}, Ll/ob4;->Z0(Ll/ob4;II)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ob4$s;->a:Ll/ob4;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p0, p1}, Ll/ob4;->b1(Ll/ob4;Z)Z

    .line 12
    .line 13
    .line 14
    const-string p0, "media"

    .line 15
    .line 16
    const-string p1, "The camera process failed !!! "

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
