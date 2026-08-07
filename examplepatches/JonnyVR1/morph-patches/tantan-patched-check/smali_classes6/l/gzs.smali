.class public final synthetic Ll/gzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gzs;->a:Ljava/lang/String;

    iput p2, p0, Ll/gzs;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gzs;->a:Ljava/lang/String;

    iget p0, p0, Ll/gzs;->b:I

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/izs;->a(Ljava/lang/String;ILandroid/graphics/Bitmap;)V

    return-void
.end method
