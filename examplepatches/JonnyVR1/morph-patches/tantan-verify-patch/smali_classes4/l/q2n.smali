.class public final synthetic Ll/q2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q2n;->a:Ljava/lang/String;

    iput p2, p0, Ll/q2n;->b:I

    iput-boolean p3, p0, Ll/q2n;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q2n;->a:Ljava/lang/String;

    iget v1, p0, Ll/q2n;->b:I

    iget-boolean p0, p0, Ll/q2n;->c:Z

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0, p1}, Ll/u2n;->d(Ljava/lang/String;IZLandroid/graphics/Bitmap;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
