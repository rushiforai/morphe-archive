.class public final synthetic Ll/fyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyg0;

.field public final synthetic b:Ll/dpg0;

.field public final synthetic c:Ll/yug0;


# direct methods
.method public synthetic constructor <init>(Ll/uyg0;Ll/dpg0;Ll/yug0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fyg0;->a:Ll/uyg0;

    iput-object p2, p0, Ll/fyg0;->b:Ll/dpg0;

    iput-object p3, p0, Ll/fyg0;->c:Ll/yug0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fyg0;->a:Ll/uyg0;

    iget-object v1, p0, Ll/fyg0;->b:Ll/dpg0;

    iget-object p0, p0, Ll/fyg0;->c:Ll/yug0;

    invoke-virtual {v0, v1, p0}, Ll/uyg0;->v(Ll/dpg0;Ll/yug0;)V

    return-void
.end method
