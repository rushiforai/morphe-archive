.class public final synthetic Ll/o640;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o640;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o640;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->s1(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
