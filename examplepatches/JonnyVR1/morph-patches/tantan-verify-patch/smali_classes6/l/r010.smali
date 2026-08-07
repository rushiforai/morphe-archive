.class public final synthetic Ll/r010;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c110;

.field public final synthetic b:[I


# direct methods
.method public synthetic constructor <init>(Ll/c110;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r010;->a:Ll/c110;

    iput-object p2, p0, Ll/r010;->b:[I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r010;->a:Ll/c110;

    iget-object p0, p0, Ll/r010;->b:[I

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/c110;->i(Ll/c110;[ILandroid/graphics/Bitmap;)V

    return-void
.end method
