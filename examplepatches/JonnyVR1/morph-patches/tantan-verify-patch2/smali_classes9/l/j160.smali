.class public final synthetic Ll/j160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jk20;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/jk20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j160;->a:Ll/jk20;

    iput-object p2, p0, Ll/j160;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j160;->a:Ll/jk20;

    iget-object p0, p0, Ll/j160;->b:Ll/x20;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/t160;->Y3(Ll/jk20;Ll/x20;Landroid/graphics/Bitmap;)V

    return-void
.end method
