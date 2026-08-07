.class public final synthetic Ll/yu00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/yu00;->a:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/yu00;->a:J

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/feed/ui/moments/a;->p(JLl/uxj0;)V

    return-void
.end method
