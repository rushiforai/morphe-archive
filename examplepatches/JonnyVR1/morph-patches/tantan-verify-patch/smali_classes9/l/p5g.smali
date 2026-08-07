.class public final synthetic Ll/p5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nxp;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/nxp;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5g;->a:Ll/nxp;

    iput-object p2, p0, Ll/p5g;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/p5g;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p5g;->a:Ll/nxp;

    iget-object v1, p0, Ll/p5g;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/p5g;->c:Ljava/lang/String;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0, p1}, Ll/s5g;->c(Ll/nxp;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)Ll/ruf0;

    move-result-object p0

    return-object p0
.end method
