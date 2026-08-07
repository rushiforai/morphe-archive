.class public final synthetic Ll/lgu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mgu;


# direct methods
.method public synthetic constructor <init>(Ll/mgu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lgu;->a:Ll/mgu;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lgu;->a:Ll/mgu;

    invoke-static {p0}, Ll/mgu;->X2(Ll/mgu;)V

    return-void
.end method
