.class public final synthetic Ll/ue70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hf70;


# direct methods
.method public synthetic constructor <init>(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ue70;->a:Ll/hf70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ue70;->a:Ll/hf70;

    invoke-static {p0}, Ll/hf70;->s(Ll/hf70;)V

    return-void
.end method
