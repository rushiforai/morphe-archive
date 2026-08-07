.class public final synthetic Ll/x7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a8i;


# direct methods
.method public synthetic constructor <init>(Ll/a8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x7i;->a:Ll/a8i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7i;->a:Ll/a8i;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/a8i;->p(Ll/a8i;Landroid/graphics/Bitmap;)V

    return-void
.end method
