.class Ll/zph0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zph0;->a(Ll/uxl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/uxl;

.field final synthetic b:Ll/zph0;


# direct methods
.method public constructor <init>(Ll/zph0;Ll/uxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zph0$c;->b:Ll/zph0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zph0$c;->a:Ll/uxl;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zph0$c;->a:Ll/uxl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zph0$c;->b:Ll/zph0;

    .line 4
    .line 5
    invoke-interface {p1, p0, p2, p3}, Ll/uxl;->e(Ll/txl;II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
