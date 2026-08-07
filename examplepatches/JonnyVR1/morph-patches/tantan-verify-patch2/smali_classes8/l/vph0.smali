.class public final synthetic Ll/vph0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Ll/a30;


# direct methods
.method public synthetic constructor <init>(Ll/a30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vph0;->a:Ll/a30;

    return-void
.end method


# virtual methods
.method public final onError(Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vph0;->a:Ll/a30;

    invoke-static {p0, p1, p2, p3}, Ll/aqh0;->g(Ll/a30;Landroid/media/MediaPlayer;II)Z

    move-result p0

    return p0
.end method
