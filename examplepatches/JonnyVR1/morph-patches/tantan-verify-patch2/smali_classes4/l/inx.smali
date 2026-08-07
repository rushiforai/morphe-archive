.class public final synthetic Ll/inx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xnx;


# direct methods
.method public synthetic constructor <init>(Ll/xnx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/inx;->a:Ll/xnx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/inx;->a:Ll/xnx;

    invoke-static {p0}, Ll/xnx;->v(Ll/xnx;)V

    return-void
.end method
