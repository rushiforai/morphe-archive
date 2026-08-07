.class public final synthetic Ll/jd20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kd20;


# direct methods
.method public synthetic constructor <init>(Ll/kd20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jd20;->a:Ll/kd20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jd20;->a:Ll/kd20;

    invoke-static {p0}, Ll/kd20;->f(Ll/kd20;)V

    return-void
.end method
