.class public final synthetic Ll/gbq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gbq;->a:Ll/clz;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gbq;->a:Ll/clz;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;->H0(Ll/clz;)V

    return-void
.end method
