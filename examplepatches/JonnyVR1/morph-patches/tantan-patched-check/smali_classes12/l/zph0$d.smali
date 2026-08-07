.class Ll/zph0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zph0;->d(Ll/rxl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/rxl;

.field final synthetic b:Ll/zph0;


# direct methods
.method public constructor <init>(Ll/zph0;Ll/rxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zph0$d;->b:Ll/zph0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zph0$d;->a:Ll/rxl;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zph0$d;->a:Ll/rxl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zph0$d;->b:Ll/zph0;

    .line 4
    .line 5
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-interface {p1, p0, p2, p3}, Ll/rxl;->c(Ll/txl;ILjava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
