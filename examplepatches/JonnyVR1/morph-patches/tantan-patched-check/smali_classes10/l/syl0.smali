.class public final synthetic Ll/syl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/SoundPool$OnLoadCompleteListener;


# instance fields
.field public final synthetic a:Ll/uyl0;


# direct methods
.method public synthetic constructor <init>(Ll/uyl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syl0;->a:Ll/uyl0;

    return-void
.end method


# virtual methods
.method public final onLoadComplete(Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syl0;->a:Ll/uyl0;

    invoke-static {p0, p1, p2, p3}, Ll/uyl0;->J3(Ll/uyl0;Landroid/media/SoundPool;II)V

    return-void
.end method
