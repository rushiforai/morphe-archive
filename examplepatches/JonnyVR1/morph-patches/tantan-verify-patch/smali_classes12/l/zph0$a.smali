.class Ll/zph0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zph0;->c(Ll/sxl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/sxl;

.field final synthetic b:Ll/zph0;


# direct methods
.method public constructor <init>(Ll/zph0;Ll/sxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zph0$a;->b:Ll/zph0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zph0$a;->a:Ll/sxl;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zph0$a;->a:Ll/sxl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zph0$a;->b:Ll/zph0;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/sxl;->g(Ll/txl;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
