.class public final synthetic Ll/n1j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/graphics/drawable/Drawable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n1j0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/n1j0;->b:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n1j0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/n1j0;->b:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p0}, Ll/o1j0;->d(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
