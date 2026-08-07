.class public final synthetic Ll/pe80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Ll/re80;


# direct methods
.method public synthetic constructor <init>(Ll/re80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pe80;->a:Ll/re80;

    return-void
.end method


# virtual methods
.method public final onError(Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pe80;->a:Ll/re80;

    invoke-static {p0, p1, p2, p3}, Ll/re80;->j(Ll/re80;Landroid/media/MediaPlayer;II)Z

    move-result p0

    return p0
.end method
