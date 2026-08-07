.class public final synthetic Ll/bze0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VRangeSeekBar$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/b;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/b;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bze0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    iput-object p2, p0, Ll/bze0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a(Lv/VRangeSeekBar;Ljava/lang/Object;Ljava/lang/Object;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bze0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    iget-object v1, p0, Ll/bze0;->b:Ljava/lang/Runnable;

    move-object v3, p2

    check-cast v3, Ljava/lang/Integer;

    move-object v4, p3

    check-cast v4, Ljava/lang/Integer;

    move-object v2, p1

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/settings/b;->b(Lcom/p1/mobile/putong/core/ui/settings/b;Ljava/lang/Runnable;Lv/VRangeSeekBar;Ljava/lang/Integer;Ljava/lang/Integer;Z)V

    return-void
.end method
