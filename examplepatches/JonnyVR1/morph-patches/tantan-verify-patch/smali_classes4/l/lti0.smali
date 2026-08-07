.class public final synthetic Ll/lti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/utils/TextureHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/utils/TextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lti0;->a:Lcom/ss/bytertc/engine/utils/TextureHelper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lti0;->a:Lcom/ss/bytertc/engine/utils/TextureHelper;

    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->d(Lcom/ss/bytertc/engine/utils/TextureHelper;)V

    return-void
.end method
