.class public final synthetic Ll/k1x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;


# instance fields
.field public final synthetic a:Ll/p1x;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/p1x;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1x;->a:Ll/p1x;

    iput-object p2, p0, Ll/k1x;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k1x;->a:Ll/p1x;

    iget-object p0, p0, Ll/k1x;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1, p2, p3}, Ll/p1x;->j(Ll/p1x;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method
