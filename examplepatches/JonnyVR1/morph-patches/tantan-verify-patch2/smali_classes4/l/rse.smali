.class public final synthetic Ll/rse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/EglRenderer;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/EglRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rse;->a:Lcom/ss/bytertc/base/media/EglRenderer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rse;->a:Lcom/ss/bytertc/base/media/EglRenderer;

    invoke-static {p0}, Lcom/ss/bytertc/base/media/EglRenderer;->c(Lcom/ss/bytertc/base/media/EglRenderer;)V

    return-void
.end method
