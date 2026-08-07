.class public final synthetic Ll/rti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/utils/TextureHelper;

.field public final synthetic b:[I


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/utils/TextureHelper;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rti0;->a:Lcom/ss/bytertc/engine/utils/TextureHelper;

    iput-object p2, p0, Ll/rti0;->b:[I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rti0;->a:Lcom/ss/bytertc/engine/utils/TextureHelper;

    iget-object p0, p0, Ll/rti0;->b:[I

    invoke-static {v0, p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->h(Lcom/ss/bytertc/engine/utils/TextureHelper;[I)V

    return-void
.end method
