.class public Ll/a9m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ram;


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

.field public c:Z

.field public d:Ll/z20;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLandroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/a9m0;->c:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/a9m0;->a:Landroid/view/ViewGroup;

    .line 7
    .line 8
    iput-object p3, p0, Ll/a9m0;->b:Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 9
    .line 10
    return-void
.end method
