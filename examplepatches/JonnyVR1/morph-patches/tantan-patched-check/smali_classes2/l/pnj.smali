.class public final synthetic Ll/pnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/snj;


# direct methods
.method public synthetic constructor <init>(Ll/snj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pnj;->a:Ll/snj;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pnj;->a:Ll/snj;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/snj;->l(Ll/snj;Landroid/graphics/Bitmap;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
