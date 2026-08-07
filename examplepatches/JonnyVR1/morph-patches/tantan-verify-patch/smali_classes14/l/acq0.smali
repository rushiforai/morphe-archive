.class public final synthetic Ll/acq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ccq0;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/y20;

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/acq0;->a:Ll/ccq0;

    iput-object p2, p0, Ll/acq0;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/acq0;->c:Ll/y20;

    iput-object p4, p0, Ll/acq0;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/acq0;->a:Ll/ccq0;

    iget-object v1, p0, Ll/acq0;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/acq0;->c:Ll/y20;

    iget-object p0, p0, Ll/acq0;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0}, Ll/ccq0;->Q2(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    return-void
.end method
