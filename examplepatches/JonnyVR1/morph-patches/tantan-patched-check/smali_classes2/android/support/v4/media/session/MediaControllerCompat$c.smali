.class public final Landroid/support/v4/media/session/MediaControllerCompat$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:Landroidx/media/AudioAttributesCompat;

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(ILandroidx/media/AudioAttributesCompat;III)V
    .locals 0
    .param p2    # Landroidx/media/AudioAttributesCompat;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Landroid/support/v4/media/session/MediaControllerCompat$c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Landroid/support/v4/media/session/MediaControllerCompat$c;->b:Landroidx/media/AudioAttributesCompat;

    .line 7
    .line 8
    iput p3, p0, Landroid/support/v4/media/session/MediaControllerCompat$c;->c:I

    .line 9
    .line 10
    iput p4, p0, Landroid/support/v4/media/session/MediaControllerCompat$c;->d:I

    .line 11
    .line 12
    iput p5, p0, Landroid/support/v4/media/session/MediaControllerCompat$c;->e:I

    .line 13
    .line 14
    return-void
.end method
