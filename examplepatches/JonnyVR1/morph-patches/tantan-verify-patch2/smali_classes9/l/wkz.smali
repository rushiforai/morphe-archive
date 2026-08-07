.class public final synthetic Ll/wkz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/AudioText;


# direct methods
.method public synthetic constructor <init>(Ll/clz;Lcom/p1/mobile/putong/core/data/AudioText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wkz;->a:Ll/clz;

    iput-object p2, p0, Ll/wkz;->b:Lcom/p1/mobile/putong/core/data/AudioText;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wkz;->a:Ll/clz;

    iget-object p0, p0, Ll/wkz;->b:Lcom/p1/mobile/putong/core/data/AudioText;

    invoke-static {v0, p0}, Ll/clz;->H1(Ll/clz;Lcom/p1/mobile/putong/core/data/AudioText;)V

    return-void
.end method
