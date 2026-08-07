.class public final synthetic Ll/d8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f8i;


# direct methods
.method public synthetic constructor <init>(Ll/f8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d8i;->a:Ll/f8i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d8i;->a:Ll/f8i;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/f8i;->q(Ll/f8i;Landroid/graphics/Bitmap;)V

    return-void
.end method
