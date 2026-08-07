.class Ll/voq$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->removeSticker(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/voq$p;->b:Ll/voq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/voq$p;->a:Ljava/lang/String;

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
    iget-object v0, p0, Ll/voq$p;->b:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->X1(Ll/voq;)Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/voq$p;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->removeSticker(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
