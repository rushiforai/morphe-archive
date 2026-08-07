.class public final synthetic Ll/ei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fi;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/CameraSticker;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ei;->a:Ll/fi;

    iput-object p2, p0, Ll/ei;->b:Lcom/p1/mobile/putong/account/data/CameraSticker;

    iput p3, p0, Ll/ei;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ei;->a:Ll/fi;

    iget-object v1, p0, Ll/ei;->b:Lcom/p1/mobile/putong/account/data/CameraSticker;

    iget p0, p0, Ll/ei;->c:I

    check-cast p1, Ljava/io/File;

    invoke-static {v0, v1, p0, p1}, Ll/fi;->E(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;ILjava/io/File;)V

    return-void
.end method
