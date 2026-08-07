.class public final synthetic Ll/tse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/EglRenderer;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:F


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/EglRenderer;FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tse;->a:Lcom/momo/rtcbase/EglRenderer;

    iput p2, p0, Ll/tse;->b:F

    iput p3, p0, Ll/tse;->c:F

    iput p4, p0, Ll/tse;->d:F

    iput p5, p0, Ll/tse;->e:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tse;->a:Lcom/momo/rtcbase/EglRenderer;

    iget v1, p0, Ll/tse;->b:F

    iget v2, p0, Ll/tse;->c:F

    iget v3, p0, Ll/tse;->d:F

    iget p0, p0, Ll/tse;->e:F

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/rtcbase/EglRenderer;->e(Lcom/momo/rtcbase/EglRenderer;FFFF)V

    return-void
.end method
