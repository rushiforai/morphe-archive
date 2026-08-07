.class public final synthetic Ll/hzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(ILandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/hzs;->a:I

    iput-object p2, p0, Ll/hzs;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/hzs;->a:I

    iget-object p0, p0, Ll/hzs;->b:Landroid/content/Context;

    invoke-static {v0, p0, p1}, Ll/izs;->b(ILandroid/content/Context;[Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method
