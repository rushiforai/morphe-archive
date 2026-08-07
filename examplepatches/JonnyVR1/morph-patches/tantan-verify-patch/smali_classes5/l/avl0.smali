.class public final synthetic Ll/avl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qvl0;


# direct methods
.method public synthetic constructor <init>(Ll/qvl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/avl0;->a:Ll/qvl0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/avl0;->a:Ll/qvl0;

    invoke-static {p0}, Ll/qvl0;->g0(Ll/qvl0;)V

    return-void
.end method
