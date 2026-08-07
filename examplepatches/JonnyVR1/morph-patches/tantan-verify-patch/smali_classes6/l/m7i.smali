.class public final synthetic Ll/m7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o7i;


# direct methods
.method public synthetic constructor <init>(Ll/o7i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m7i;->a:Ll/o7i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m7i;->a:Ll/o7i;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/o7i;->n(Ll/o7i;Landroid/graphics/Bitmap;)V

    return-void
.end method
