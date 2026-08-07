.class Ll/voq$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->setLookupIntensity(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/voq$g;->b:Ll/voq;

    .line 2
    .line 3
    iput p2, p0, Ll/voq$g;->a:F

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq$g;->b:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/voq$g;->b:Ll/voq;

    .line 10
    .line 11
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget p0, p0, Ll/voq$g;->a:F

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setLookup0Intensity(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
