.class public final synthetic Ll/amq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/xnative/XWindowImpl;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:F


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/xnative/XWindowImpl;FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/amq0;->a:Lcom/momo/xeengine/xnative/XWindowImpl;

    iput p2, p0, Ll/amq0;->b:F

    iput p3, p0, Ll/amq0;->c:F

    iput p4, p0, Ll/amq0;->d:F

    iput p5, p0, Ll/amq0;->e:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/amq0;->a:Lcom/momo/xeengine/xnative/XWindowImpl;

    iget v1, p0, Ll/amq0;->b:F

    iget v2, p0, Ll/amq0;->c:F

    iget v3, p0, Ll/amq0;->d:F

    iget p0, p0, Ll/amq0;->e:F

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/xeengine/xnative/XWindowImpl;->a(Lcom/momo/xeengine/xnative/XWindowImpl;FFFF)V

    return-void
.end method
