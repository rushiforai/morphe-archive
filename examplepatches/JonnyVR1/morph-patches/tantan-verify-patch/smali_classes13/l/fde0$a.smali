.class Ll/fde0$a;
.super Landroid/media/projection/MediaProjection$Callback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fde0;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/fde0;


# direct methods
.method public constructor <init>(Ll/fde0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fde0$a;->a:Ll/fde0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/projection/MediaProjection$Callback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStop()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "MediaProjection stopped by user"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/fde0$a;->a:Ll/fde0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/fde0;->Q1(Ll/fde0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
